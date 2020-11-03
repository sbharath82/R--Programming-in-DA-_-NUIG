##Student Id -  19230456  
##Assignment 2

##write three functions to extract elements of the linear model solution (mod).

  mod<-lm( eruptions ~ waiting, data=faithful)
  mod
  
  
  get_data<-function (m1,v1){
    len<-length(unique(row.names(m1$model)))
    dat<-vector(mode="numeric",length=len)
    colnum<-length(names(m1[[12]]))
    for (n1 in 1:colnum) {
    if(v1==names(mod[[12]][n1])){
        dat<-as.vector(mod[[12]][,n1])
      }
    }
    return(dat)
    
  }
  
  d <- get_data(mod,"waiting")
  d[1:20]
  
  
  get_coefficient<-function(m1,v1){
    
    colnum<-length(names(mod[[1]]))
    for (n1 in 1:colnum) {
      if(v1==names(mod[[1]][n1])){
        dat<-mod[[1]][n1]
      }
    }
    return(dat)
    
  }
  
  c <- get_coefficient(mod,"waiting")
  c
  
  
  mod_summary<-function(m1){
    res1<-summary(m1)
    colnum<-length(names(m1[[12]]))
    rownum<-length(row.names(m1[[12]]))
    c1<-c(Rows=rownum,Cols=colnum)
    res<-list(call=res1[[1]],coeff=res1[[4]][1:2,0:1],DataSize=c1)
    
  }
  
  s <- mod_summary(mod)
  s