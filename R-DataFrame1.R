sb<-subset(mtcars,cyl == 6, select=c("mpg","cyl"))

ans<-sapply(sb,function(col){
  browser()
  })

type col
type sb


ans<-sapply(sb,function(col){
  min(col)
  })
ans