
time<-seq(-10,10,by=0.1)
y<-sapply(time, function(x,a,b,c)a*x^2+b*x+c,a= 2,b=-2, c = 20)
m<-matrix(nrow=length(time), ncol=2)
m[,1]<-time
m[,2]<-y




colnames(m)<-c("Time","Y")
m[1:10,]
ggplot(data=data.frame(m),aes(x=Time,y=Y))
ggplot(data=data.frame(m),aes(x=Time,y=Y))+geom_point()
> 