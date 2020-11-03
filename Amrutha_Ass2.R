get_data <- function(modList,varToExtract){
  #This function accepts parameters modList and varToExtract
  #modList is the linear model from which it extracts the variable given in the second argument
  modList$model[[varToExtract]]
}

get_coefficient <- function(modList,coefToExtract) {
  #This function accepts parameters modList and coefToExtract
  #modList is the linear model from which it extracts the coeffecient given in the second argument
  coefficients(modList)[coefToExtract]
}

mod_summary<- function(modList) {
  #This function accepts modList which is the linear model considered
  #First calculates the number of rows and columns in the model and assigns it to the number of rows and columns calculated
  x <- c(nrow(modList$model),ncol(modList$model))
  names(x)<-c("Rows","Cols")
  #creates a list of 3 parameters,the call, the coefficients in the linear model and the rows and columns in the model
  list(call=modList$call,coeff=coefficients(modList),Datasize=x)
}

#linear model
mod <- lm(eruptions ~ waiting, data=faithful)
#Get data for the variable "waiting" from the linear model
d<-get_data(mod,"waiting")
d[1:20]

#Get data for the coefficient "waiting" from the linear model
c <-get_coefficient(mod,"waiting")
c

#Get the summary of the model (call, coefficients, number of rows and columns)
s <-mod_summary(mod)
s