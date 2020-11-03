#Assignment - 3 CT5102 
#Functionals and Matrices

set.seed(100)

#Create a matrix from this raw data which was provided in assignment paper,
res<-matrix(0,nrow=20,ncol=0)

CX101 <- rnorm(20,45,8)
CX102 <- rnorm(20,65,8)
CX103 <- rnorm(20,85,10)
CX104 <- rnorm(20,45,10)
CX105 <- rnorm(20,60,5)

res<-cbind(res,CX101)
res<-cbind(res,CX102)
res<-cbind(res,CX103)
res<-cbind(res,CX104)
res<-cbind(res,CX105)

rownames(res)<-sprintf("Student_%d",seq(1:20))
 
#confirm that it has the following summaries, and also that the row names related to a student 
#(Student_1 through to Student_20) 

summary(res)

res[c(1,2,20),]

#Notice that subject CX103 has two invalid values (> 100)

res[res[,"CX103"] > 100,]

#Using the apply() functional to iterate through each column, convert any outliers (< 0 or > 100) to the
#symbol NA. A subset of results is shown below.

a<-apply(res,2,function(x){ifelse(x<0|x>100,NA,x)})
a<-apply(res,2,function(x){ifelse(is.na(x),mean(x,na.rm=TRUE),x)})

cleanData<-function(x){
  
  for (i in 1:length(x)) {
    if(x[i]<0){
      `is.na<-`(x[i])
    }else if(x[i]>100){
      x[i] <- NA
    }
  }
  return(x)
}

res2<-apply(res,2,cleanData)
res2
# Execute following to match the subset of data shown in assignment paper
res2[14:20,]


#Use apply() to replace the NA values with mean of all other results for that subject (simple imputation)
imputeData<-function(x){
  print(colnames(x))
  for (i in 1:length(x)) {
    if(is.na(x[i])){
         x[i]<- mean(x,na.rm = TRUE)
    }
  }
  return(x)
}

res3<-apply(res2,2,imputeData)
res3
# Execute following to match the subset of data shown in assignment paper
res3[14:20,]

#For each student, calculate the average and the range, and bind these to new columns into the matrix

res4<-cbind(res3,apply(res3, 1, mean))
colnames(res4)[6]<-"Mean"
#res4[1:7,]

res5<-cbind(res4,apply(res3, 1, function(x) { max(range(x))-min(range(x))}))
colnames(res5)[7]<-"Range"
res5

# Execute following to match the subset of data shown in assignment paper
res5[1:7,]

#Write a filter query to display the student with the highest average. 
#Note that the student number (row name) should also be displayed.
res5[res5[,"Mean"] == max(res5[,c("Mean")]),,drop=FALSE]
