source("dataloader.R")

corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        n.files = length(list.files(directory))
        df = complete(directory,
                      id=1:n.files)
        df.subset = df[df$nobs > threshold,]
        files = sprintf("%s/%03d.csv", directory, df.subset$id)
        data.list = lapply(files, read.csv)
        data.df = do.call(rbind.data.frame, data.list)
        require(plyr)
        data.corr = ddply(data.df,
                          "ID",
                          summarize,
                          corr=cor(sulfate, 
                                   nitrate, 
                                   use="complete.obs"))
        data.corr$corr
}

