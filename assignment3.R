if (!file.exists("./instructions.pdf")) {
        download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2FProgAssignment3.pdf",
                      destfile="./instructions.pdf",
                      method="curl")
}


if (!file.exists("./data.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip",
                      destfile="./data.zip",
                      method="curl")
}

if (!all(file.exists(c("hospital-data.csv",
                       "outcome-of-care-measures.csv")))) {
        unzip("data.zip")
}
