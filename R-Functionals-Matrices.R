time<-seq(-10,10,by=0.1)

y<- sapply(time,function(x,a,b,c)a*x^2+*b*x+c,a=2,b=-2,c=10)
m<-matrix(nrow=length(time),ncol = 2)
colnames(m)<-c("Time","Y")
m[,1]<-time
m[,2]<-y
m[1:5,]
ggplot(data.frame(m),aes=)



set.seed(100)
sampledata<-sample(c(0,1),100,replace=T)
mat1<-matrix(sampledata,nrow=10, ncol=10)
rownames(mat1)<-c("A","B","c","D","E","F","G","H","I","J")
#rownames(mat1)<- LETTERS[1:10]
colnames(mat1)<-c("A","B","c","D","E","F","G","H","I","J")
diag(mat1)<-0


getNumFollower<-function(mat,person){
  for(i in seq_along(rownames(mat1))){
    if(i == person)
      sum<-apply(mat1,i,sum)
  }
     sum
}

getNumFollower(mat1,"A")

getFollowers<-function(person){
  
  
}
