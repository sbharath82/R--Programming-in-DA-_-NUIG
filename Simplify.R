Simplify<-function(x)
{ 
  sort(x[!duplicated(x,fromLast=FALSE)])
}  
  