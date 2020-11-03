 library(readxl)
library(ggplot2)
library(dplyr)
options(max.print = 10000)
orig_list <- data.frame(readxl::read_excel("R/datasets/Titanic/titanic3_assignment.xls"))
plist <- orig_list

plist$survived <- as.factor(plist$survived)
plist <- plist %>% mutate(survived = ifelse(survived == 0, FALSE, TRUE))

summary(plist)

#Q1 Convert survived to logical value
plist$pclass <- as.character(plist$pclass)
summary(plist) 

#Q2 Change class to String
plist <- plist %>% mutate(pclass = ifelse(pclass == "3" ,"Third", ifelse(pclass == "1", "First", "Second")))
summary(plist) 
unique(plist$pclass)

#Q3 Simple Imputation of age(mean of all ages)
plist$age[is.na(plist$age)] <- mean(plist$age,na.rm = T) 
summary(plist)

#Q4 Simple Imputation of fare(mean of all fares)
plist$fare[is.na(plist$fare)] <- mean(plist$fare,na.rm = T) 
summary(plist)

#Q5 Simple Imputation of place of embarking(randomly generated) with seed of 99
set.seed(99)
plist$embarked[is.na(plist$embarked)] <- sample(unique(plist$embarked),2,replace=F)
summary(plist)
unique(plist$embarked)

#Q6 Create new category(age_cohort) 
plist <- plist %>% mutate(age_cohort = ifelse(age < 16 ,"Child", ifelse((age >= 16 & age < 60) , "Adult", "Elderly")))
summary(plist) 

#Q7 Put in full town origin (Queenstown (Q) replaced by Cobh)
plist <- plist %>% mutate(embarked = ifelse(embarked == "S" ,"Southampton", ifelse(embarked == "C", "Cherbourg", "Cobh")))
summary(plist)
unique(plist$embarked)

#plist$embarked

#Q8 Double Check dataset
head(plist)

dim(plist)

table(plist$survived,plist$sex)

table(plist$survived)

table(plist$survived,plist$pclass)

table(plist$survived,plist$age_cohort)

table(plist$survived,plist$embarked)

#Plot 1
#Survival numbers by travel class
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=pclass))+ylab("Number") +
  xlab("Survived") + ggtitle("Survival Numbers by Travel Class") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot 2
#Survival numbers by gender
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=sex))+ylab("Number") + 
  xlab("Survived")  + ggtitle("Survival Numbers by Gender") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot3
#Survival numbers by age cohort
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=age_cohort))+ylab("Number") + 
  xlab("Survived")  + ggtitle("Survival Numbers by Age Cohort") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot4
#Survival numbers by embarkation location
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=embarked))+ylab("Number") + 
  xlab("Survived")  + ggtitle("Survival Numbers by Embarkation Location") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot5
#Survival Proportions by Embarkation Location (although title is wrong plot is done using pclass)
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=pclass),position="fill") + 
  ylab("Proportion") + 
  xlab("Survived")  + ggtitle("Survival Proportions by Embarkation Location") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot6
#Survival Proportions by gender
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=sex),position="fill") + 
  ylab("Proportion") + 
  xlab("Survived")  + ggtitle("Survival Proportions by Gender") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot7
#Survival Proportions by Age Cohort
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=age_cohort),position="fill") + 
  ylab("Proportion") + 
  xlab("Survived")  + ggtitle("Survival Proportions by Age Cohort") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot8
#Survival Proportions by place of Embarkation
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=embarked),position="fill") + 
  ylab("Proportion") + 
  xlab("Survived")  + ggtitle("Survival Proportions by place of Embarkation") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot9
#Survival Numbers by Cohort and Travel Class
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=age_cohort)) + ylab("Number") + 
  xlab("Survived")  + ggtitle("Survival Numbers by Cohort and Travel Class") +  
  facet_grid(~pclass) + theme(legend.position = "top") + 
  theme(legend.title = element_blank())

#Plot10
#Survival Numbers by Gender and Travel Class
ggplot(data = plist,aes(survived)) + geom_bar(aes(fill=sex)) + ylab("Number") + 
  xlab("Survived")  + ggtitle("Survival Numbers by Gender and Travel Class") +  
  facet_grid(~pclass) + theme(legend.position = "top") + 
  theme(legend.title = element_blank())

#Plot11
#Age v Fare by Place of Embarkation
ggplot(data = plist) + geom_point(aes(x=age,y=fare,colour=embarked)) + ylab("Fare") + 
  xlab("Age")  + ggtitle("Age v Fare by Place of Embarkation") +
  theme(legend.position = "top") + theme(legend.title = element_blank())
  
#Plot12
#Age v Fare with Linear Model
ggplot(data = plist,aes(x=age,y=fare)) + geom_point() + 
  geom_smooth(method="lm") +
  ylab("Fare") + 
  xlab("Age")  + ggtitle("Age v Fare with Linear Model")  

#Plot13
#Age v Fare with Survival Info
ggplot(data = plist) + geom_point(aes(x=age,y=fare,colour=survived)) + ylab("Fare") + 
  xlab("Age")  + ggtitle("Age v Fare with Survival Info") +
  theme(legend.position = "top") + theme(legend.title = element_blank())

#Plot14
#Age v Fare with Survival Info
ggplot(data = plist) + geom_point(aes(x=age,y=fare,colour=embarked)) + ylab("Fare") + 
  xlab("Age")  + ggtitle("Age v Fare By Travel Class and Point of Departure") +
  facet_grid(~pclass) + theme(legend.position = "top") + theme(legend.title = element_blank())
