library(tidyr)
library(sloop)
library(rlang)
library(dplyr)
library(mtcars)

v <- 1:100
v
attr(v,"dim") <- c(10,10)
v[1:2,1:2]

v2 <- 1:10
summary(v2)
summary(mtcars)

typeof(mtcars)
class(mtcars)
sloop::otype(mtcars)


length(methods(print))

methods(print)[1:2]

o <- list(Name = "Test")
str(o)
class(o)
attr(o,"class") <- "my_class"
str(o)
class(o)


sloop::otype(o)
library(sloop)
devtools::install_github("r-lib/sloop")
1

x <- 1:10
summary(x)
sloop::otype(x)
attr(x,"class") <- "my_class"
class(x)
sloop::otype(x)

mtcars
View(mtcars)
mtcars[1:2,1:5]
summary(mtcars)


attr(mtcars,"class") <- "Hello World"
summary(mtcars)
summary.default <- function(mtcars){
  print("Hello World")
}


ans <- my_lm(faithful$eruptions, faithful$waiting, faithful)
class(ans)
attributes(ans)
sloop::otype(ans)
coefficients(ans)


mod <- lm(eruptions ~ waiting, data=faithful)
class(mod)
attributes(mod)
sloop::otype(mod)
coefficients(mod)

class(mod) <- c("my_lm","lm")
class(mod)
coefficients(mod)

summary(mod)

summary.my_lm <- function(o){
  cat("Myversion of summary..")
}

summary(mod)


class(mod) <- c("my_lm","lm") 




lm(lm,faithful$eruptions, faithful$waiting)
