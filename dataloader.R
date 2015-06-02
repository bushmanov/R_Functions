# download data if necessary

if (!file.exists("specdata")) {
        url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
        download.file(url, 
                      destfile="specdata.zip",
                      method="curl")
        unzip("specdata.zip")      
}