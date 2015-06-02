rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        out <- read.csv("./outcome-of-care-measures.csv",
                        colClasses="character",
                        na.strings="Not Available")
        ## Check that state and outcome are valid
        if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
                stop("invalid outcome")
        }
        
        if (!(state %in% out$State )) {
                stop("invalid state")
        }
        searchPhrase <- make.names(paste("Hospital 30-Day Death (Mortality) Rates from",
                                         outcome, sep = " "))
        position <- grep(paste0("^", searchPhrase),
                         colnames(out),
                         ignore.case = TRUE)
        subsetState <- out[out$State == state,]
        subsetState[,position] <- as.numeric(subsetState[,position])
        rankIndex <- order(subsetState[,position], subsetState$Hospital.Name)
        rankedHospitals <- subsetState[rankIndex, ]
        rank <- NULL
        if (is.numeric(num)) rank <- num
        if (num == "best") rank <- 1
        if (num == "worst") {
                rank <- max(which(!is.na(rankedHospitals[,position])))
        }
        rankedHospitals[rank, "Hospital.Name"]
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
}
