source("dataloader.R")

# function
complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        df = data.frame(id=id)
        files = sprintf("%s/%03d.csv", directory, id)
        data.list = lapply(files, read.csv)
        data.list.cc = lapply(data.list, complete.cases)
        df$nobs = sapply(data.list.cc, sum)
        df
        }