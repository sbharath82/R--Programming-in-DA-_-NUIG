##Few basic initial settings to display the output and table column width properly
options(max.print = 10000)
library(dplyr)

##Setting the seed to 100 and Selecting 10 random row no.s from total no. of rows in mpg using sample() 
set.seed(100)
rowNos<-sample(nrow(ggplot2::mpg),10,replace=FALSE)
rowNos

##Copying the entire ggplot2::mpg dataset as a dataframe in our local variable
copyDataset<-data.frame(ggplot2::mpg)

# to validate the structure and dimensions of copied dataframe
str(copyDataset)
dim(copyDataset[rowNos,])
dim(copyDataset)

##Filtering dataframe using selected 10 random rows of observations
copyDataset[rowNos,]      

##Setting the cty variable to -999 for randomly selected observations
copyDataset[rowNos,]$cty <- -999
copyDataset[rowNos,]      # Displaying expected output by filtering only random observation rows


##Setting the cty variable to NA in the dataframe for the cty entries which are negative using lapply()
lapply(copyDataset$cty,function(x)  ifelse(x < 0, NA, x ))

copyDataset$cty <- lapply(copyDataset$cty,function(x)  ifelse(x < 0, NA, x ))

##Hiding the trans column for formatting
copyDataset[rowNos,-6]


##Calculate the mean cty for each of the different classes of car(excluding NA values)
classTypes <- unique(copyDataset$class)     # Assigning all unique values of class to a vector
listOfMeans <- vector()
for (i in classTypes){
  
  subset1 <- subset(copyDataset,class == i ,select = c("cty"))  # using subset function returning filtered dataframe of only those rows whidh matches the same class
  mean <- mean(as.numeric(unlist(subset1)), na.rm = TRUE)       # computing mean of all cty values (non NA) for the same class 
  listOfMeans <- c(listOfMeans, mean)                           # concatenating the mean values of all classes to a vector 
  
  }
names(listOfMeans) <- classTypes        # Assigning unique class values as names of the corresponding means
listOfMeans                             # Displaying expected output of all computed means for every class        


##Replace the NA with the mean of the car class 
copyDataset$cty[is.na(copyDataset$cty)] <- listOfMeans[copyDataset$class[is.na(copyDataset$cty)]]  # Using subsetting  
copyDataset$cty <- as.numeric(copyDataset$cty)
copyDataset[rowNos,-c(6,7,9)]             # Displaying expected output by hiding few columns for formatting


##Summarizing the data 
new_df <- as_tibble(copyDataset)
str(new_df)
summary(copyDataset)


##Showing that the two mean values now differ:
mean(mpg$cty)
mean(copyDataset$cty)

