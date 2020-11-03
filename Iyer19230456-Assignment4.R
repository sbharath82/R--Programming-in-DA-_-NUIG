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

##Creating new dataFrame Using above selected 10 random rows of observations
selectedDataset<-copyDataset[c(rowNos),]
dim(selectedDataset)

##Creating copy of ggplot2::mpg dataset containing the rest 224 observations excluding the above 10 randomly genrated rows
nonSelectedDataset<-copyDataset[-c(rowNos),]
dim(nonSelectedDataset)

##Setting the cty variable to -999 in the dataframe of randomly selected observations
selectedDataset$cty<--999
selectedDataset$cty

##Using lapply() replacing all negative values with symbol NA and omitting trans column from display
k <- selectedDataset$cty
k
selectedDataset$cty<-lapply(k,function(x) x<-NA)
selectedDataset[1:nrow(selectedDataset),-6]


dim(nonSelectedDataset)
nonNADataset <- nonSelectedDataset[complete.cases(nonSelectedDataset$cty),]
dim(nonNADataset)

complete.cases(nonSelectedDataset$cty)

lapply(selectedDataset, function(col1)mean(is.na(col)))

