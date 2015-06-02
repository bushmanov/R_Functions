rankall <- function(outcome, num = "best") {
        ## Read outcome data
        ## Check that state and outcome are valid
        out <- read.csv("./outcome-of-care-measures.csv",
                        colClasses="character",
                        na.strings="Not Available")
        ## Check that state and outcome are valid
        if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
                stop("invalid outcome")
        }
        
#         if (!(state %in% out$State )) {
#                 stop("invalid state")
#         }
        searchPhrase <- make.names(paste("Hospital 30-Day Death (Mortality) Rates from",
                                         outcome, sep = " "))
        position <- grep(paste0("^", searchPhrase),
                         colnames(out),
                         ignore.case = TRUE)
        out[,position] <- as.numeric(out[,position])
        df <- data.frame(out$State, out[,position], out$Hospital.Name)
        colnames(df) = c("state", "deathrate", "hospital")
        rankIndex <- order(df$state, df$deathrate, df$hospital)
        rankedHospitals <- df[rankIndex, ]
        splitByState <- split(rankedHospitals, rankedHospitals$state)
        rankedInState <- function(dat) {
                if (is.numeric(num)) rank <- num
                if (num == "best")   rank <- 1
                if (num == "worst")  rank <- max(which(!is.na(dat[,"deathrate"])))
                dat[rank, c("hospital", "state")]
        }
        rank <- NULL
        results <- lapply(splitByState, rankedInState)
        df1 <- as.data.frame(do.call(rbind, results))
        df2 <- data.frame(hospital = df1[,1], state=rownames(df1))
        rownames(df2) <- rownames(df1)
        df2
 
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
}
