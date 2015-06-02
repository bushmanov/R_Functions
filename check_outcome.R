source("best.R")
class(best("TX", "heart attack"))
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")


source("rankhospital.R")
rankhospital("TX","heart failure")
class(rankhospital("TX","heart failure"))
rankhospital("TX","heart failure", 1)
rankhospital("TX","heart failure", 2)
rankhospital("TX","heart failure", 3)
rankhospital("TX","heart failure", 4)
rankhospital("TX","heart failure", 5)
rankhospital("TX","heart failure", 6)
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MD", "het attack", "worst")
rankhospital("M", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


source("rankall.R")
head(rankall("heart attack", 20), 10)
class(rankall("heart attack", 20))
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
rankall("hrt failure", 10)














