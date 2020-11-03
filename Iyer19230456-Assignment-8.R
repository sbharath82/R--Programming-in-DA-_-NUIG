
##Using Inheritance to implement rep_lm by extending the lm class fucntionality

## Implementing as parametrized Constructor by required three no. of params name, formula and data
rep_lm <- function(name, model, data_f_name){    ##Defining the Class using Parametrized Constructor
  data_cols <- c(colnames(get(data_f_name)))    ##Fetching column names
  lin_mod <- lm(formula = as.formula(model), data = get(data_f_name))   ##creating the Object of base lm class
  obs <- length(lin_mod$model$eruptions)
  dt <- as.character(Sys.time() ,format = "%a %b %d %X %Y" )   ##system date and time formatting
  lin_mod$Information <- list(Name = name, DateRun = dt , LinearModel = model, DataSource = data_f_name, 
             Columns = data_cols, Observations = obs)  ## Adding additional information for our class
  
  mod <- structure(lin_mod,class =c('rep_lm','lm'))  ## Inheriting the parent class object and creating child class 
  return(mod)                                         ##Returns the new S3 object rep_lm
}

## how the function is called by creatign an object and passing parameters to the constructor
m <- rep_lm("My Model", "eruptions~waiting","faithful") 
str(m)

## Implementing the new summary function for the new class using required formatting:
summary.rep_lm <- function(mod){
  cat(noquote("(1) rep_lm class summary\n"))
  cat("\n")
  cat(noquote(paste0("Model Name: " ,mod$Information$Name, " \t Date of Run: ", mod$Information$DateRun)))
  cat("\n\n")
  cat(noquote(paste0("Linear Model: " ,mod$Information$LinearModel, "\tData Source: ", mod$Information$DataSource))) 
  cat("\n\n")
  cat(noquote(paste0("Columns: " ,mod$Information$Columns[1])))
  cat("\n")
  cat(noquote(paste0("Columns: " ,mod$Information$Columns[2])))
  cat("\n\n")
  cat(noquote(paste("Observations: " ,mod$Information$Observations)))
  cat("\n\n")
  cat(noquote("(2) lm class summary\n\n"))
  summary.lm(mod)
  
}

## Calling the generic function which provides the expected output
summary(m)

