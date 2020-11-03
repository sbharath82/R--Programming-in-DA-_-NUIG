set.seed(1000)
x<-1:6
dice1<-sample(x,1000,replace = TRUE)
table(dice1)

dice2<-sample(x,1000,replace = TRUE)
table(dice2)

total<-dice1+dice2
table(total)



t1_table <- function(dice){
  z<-vector(mode="integer",length = length(unique(dice))+1)
  names(z)<-c("1",sort(unique(dice)))
  
  for(i in dice){
    for(j in seq_along(z)){
      if(i == j) {
        z[j] = z[j] + 1
        break
        
      }
    }
  }
  
  return(z[-1])
  
}


ans<-t1_table(dice1)
ans
#ans<-t1_table(dice2)
#ans
ans<-t1_table(total)
ans
names(ans)