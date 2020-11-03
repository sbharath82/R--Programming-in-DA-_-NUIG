options(tibble.print_max = Inf)
options(tibble.width = Inf)
mtcars
str(mtcars)
nrow(mtcars)
ncol(mtcars)

##Setting the seed to 100 and Selecting 10 random row no.s from tota no. of rows in mpg using sample() 
set.seed(100)
rowNos<-sample(nrow(ggplot2::mpg),10,replace=FALSE)
rowNos

##Copying the entire ggplot2::mpg dataset as a dataframe in our local variable
copyDataset<-data.frame(ggplot2::mpg)
str(copyDataset)

dim(copyDataset[rowNos,])
dim(copyDataset)

##Filtering dataframe using selected 10 random rows of observations
copyDataset[rowNos,]
dim(copyDataset)

##Setting the cty variable to -999 for randomly selected observations
copyDataset[rowNos,]$cty <- -999
copyDataset[rowNos,]


##Setting the cty variable to NA in the dataframe for the cty entries which are negative
copyDataset$cty <- lapply(copyDataset$cty,function(x)  ifelse(x < 0, NA, x ))
copyDataset[rowNos,]

df <- data.frame(ggplot2::mpg)
df$cty[rowNos] <- -999
class(df[rowNos,]) 
class(df$cty)
str(df[cty])
<-subset(df,,colnames(df))

str(as.data.frame(lapply(copyDataset$cty,function(x)  ifelse(x < 0, NA, x ))))

copyDataset$cty 

subset(copyDataset,cty<0,select = c("cty"))


str(out)

sapply(subset(mtcars,cyl==6,select=c("mpg","cyl")),
       function(col)
       {
         print(col)
         min(col)
       })

classTypes <- list(unique(copyDataset$class))
classTypes




subset1 <- subset(copyDataset,!(is.na(cty)),select = c("class","cty"))

subset1

lapply(  ,,function(cty){mean(cty)}))

subset()



##Using lapply() replacing all negative values with symbol NA and omitting trans column from display
selectedDataset$cty<-lapply(k,function(x) x<-NA)
selectedDataset[1:nrow(selectedDataset),-6]







dim(nonSelectedDataset)
nonNADataset <- nonSelectedDataset[complete.cases(nonSelectedDataset$cty),]
dim(nonNADataset)

complete.cases(nonSelectedDataset$cty)

lapply(selectedDataset, function(col1)mean(is.na(col)))

