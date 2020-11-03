custData=data.frame(name=c("Tom","Sally","Sue"),
                    age=c(43,28,35),
                    stringsAsFactors=F)

dim(custData)
recordMark=data.frame(name="Mark",age=33)
custData=rbind(custData,recordMark)
custData
debt=c(0,25.5,36,48.19)
custData=cbind(custData,debt)
custData$debt

owesMoney=custData[custData$debt>0,]
owesMoney