library(mtcars)

v1 <- c(1L, T, FALSE)
v1
typeof(v1)
v2 <- c(1L, T, FALSE, 2)
v2
typeof(v2)
v3 <- c(T, FALSE, 2, "FALSE")
v3
typeof(v3)
v4 <- c(2L, "FALSE")
v4
typeof(v4)
v5 <- c(0L, 1L, 2.11)
v5
typeof(v5)
s <- sample(c("Y","N"), size=5, repl=T, prob= c(.2 , .8))
s
x<-list(el1=1:3,el2=c(T,F,T))
x
$el1
x$el1
x$el2

































v <- (1:10)^2
v

v<-1:6
evensss <- function(x){
  x[x%%2==0]
}

evensss(v)


v<-c(1,2,2,3,4,5,1,3)

nodup<-function(va){
  va[!duplicated(va)]
}

nodup(v)




l1<-list(1:4,list(2:4,c(T,F,T)),1:10)
l1
l1[[2]]
l1[[2]][1]
l1[[2]][[1]]
sum(l1[[2]][[1]])
unlist(l1[[2]])

x<-1:5

`second<-` <- function(x,value){
  x[2]<-value
  x
  }

second(x) <- 78
x

apply(subset(mtcars,cyl==6,select=c("mpg","cyl")),1,
      function(row){max(row)})


d <- data.frame(x=1:3, y=LETTERS[1:3],z=letters[1:3])
d
complete.cases(d)
d[2,3]<-NA
d[complete.cases(d),]


length(subset(mtcars,select=mpg:disp))
mtcars1<- subset(mtcars,select=mpg:disp)
complete.cases(mtcars1)
sum(complete.cases(mtcars1))
length(complete.cases(mtcars1))


library(ggplot2)
d<-ggplot2::mpg
d
mpg

time<-seq(-10,10,by=0.1)
y<-sapply(time,function(x,a,b,c)a*x^2+b*x+c,a=2,b=-2,c=20)
m<-matrix(nrow=length(time),ncol=2)
colnames(m)<-c("time","y")
m[,1] <- time
m[,2] <- y
m
ggplot(data=data.frame(m),aes(x=time,y=y))+geom_point()

m<-matrix(1:6,nrow=2,ncol=3)
m
m<-rbind(m,7:9)


args <- list(c(1:10,NA), na.rm = TRUE)
ans <- do.call(sum,args)
args
ans


`rev_names<-` <- function(x, value){
  names(x) <- rev(value)
  x
}
rev_names<- 1:6


mtcars1 <- subset(mtcars,select = mpg:disp)
complete.cases(mtcars1)
length(complete.cases(mtcars1))
sum(complete.cases(mtcars1))
mtcars1


mtcars1[!complete.cases(mtcars1),]


%>% 
