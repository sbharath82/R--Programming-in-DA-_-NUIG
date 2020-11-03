set.seed(1000)
x<-1:6
dice1<-sample(x,1000,replace = TRUE)
table(dice1)

dice2<-sample(x,1000,replace = TRUE)
table(dice2)

total<-dice1+dice2
table(total)


#z<-vector(mode="integer", length = length(x))
#names(z)<-c("1","2","3","4","5","6")

z<-vector(mode="integer",length = length(unique(total)))
z
names(z)<-c(sort(unique(total)))
names(z)
#names(z)<-c("1","2","3","4","5","6","7","8","9","10","11","12")

z

t1_table <- function(p1){
  
  for(i in p1){
    for(j in seq(length(z))){
      if(i == j) {
        z[j] = z[j] + 1
        break
        
      }
    }
  }
  names(z)
  return(z)
  
}


#ans<-t1_table(dice1)
#ans
#ans<-t1_table(dice2)
#ans
ans<-t1_table(total)
ans
names(ans)