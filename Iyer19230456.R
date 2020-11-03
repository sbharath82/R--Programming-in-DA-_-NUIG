
## With a seed of 1000, and the sample() function, roll dice 1 1000 times, and then roll dice 2 1000 times. The
## following summaries should be generated.
set.seed(1000)
x<-1:6
dice1<-sample(x,1000,replace = TRUE)
table(dice1)


dice2<-sample(x,1000,replace = TRUE)
table(dice2)


## Add the outcomes from each dice throw, so as to model the throwing of two dice. The following data should
## be generated.


total<-dice1+dice2
table(total)

## Write code to replicate the table function in R. It should involve a loop, and the output vector (ans) should
## be created outside of the loop.

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

## The following results should be generated.

ans<-t1_table(total)
ans
names(ans)

## Next, use a recyling approach with logical vectors to display all the even number rolls.


evenfunc<-function(table_output){
  
  even_storage<-vector(mode="integer",length = length(table_output))
  even_storage<-table_output[c(T,F)]
    
#  for (v1 in seq(1,length(table_output))){
#    
#    if(!(v1 %% 2 == 0)){
#      even_storage<-c(even_storage,table_output[v1])
#    }
# }
#  lx<-even_storage>0
  return(even_storage)
}

evens<-evenfunc(ans)
evens

##Finally, filter the vector based on the element names in order to show the values for the odd number rolls.


oddfunc<-function(table_output){
  odd_str_names<-names(table_output)
  odd_storage<-vector(mode="integer",length = length(table_output))
  names(odd_storage)<-odd_str_names
  for (v1 in seq_along(odd_str_names)){

    if(as.numeric(v1) %% 2 == 0){
      odd_storage[v1]<-table_output[v1] 
      
    }
  }
  lx<-odd_storage>0
  return(odd_storage[lx])
}

odds<-oddfunc(ans)
odds
