search()


e <- new.env()


e$A <- F
e$b <- "a"

e$c <- 2.3
e$d <- 1:3

parent.env(e)

globalenv()
baseenv()
emptyenv()
environment()

library(pryr)
where(mean)

h <- function(x){
  a <- 2
  x + a
}

h(1)

plus <- function(x){
#  print(environment())
  function(y) x+y
}

p <- plus(2)
p

ls(env=rlang::fn_env(p))

rlang::fn_env(p)$x

##Closures

my_power <- function(exp){
  function(x)x^exp
}

f1<- my_power(2)
f1(2)

new_counter <- function(){
  i<- 0
  function(){
    i<<- i +1
    i
  }
}

counter_one <- new_counter()
counter_one()

counter <- function(init){
  i <- init
  list(increment = function(v=1)i<<-i+v,
       decrement = function(v=1)i<<-i-v,
       show = function()i)
}

c1 <- counter(10)
c1$increment()
c1$show()
c1$decrement()

str(c1)


search()
where("mean")

mean <- function(x)X+1
where("mean")

mean72(1:2)
where("faithful")

y <- 100
f <- function()y<- 20
f()
y

library(rlang)
y <- 300
f <- function(x){

  x+y
}

f(10)
f()
y


y <- 300
f <- function(x){
  ans <-  x+y
  y <- 700
  ans
  }
f(10)
f()
y

# Changes th eglobal env variable using special operator<<-
y <- 300
f <- function(x){
  ans <-  x+y
  y <<- 700
  xyz <<- 800
  ans
}
f(10)
y



fn_env(f)




library(nycflights13)
my_f <- flights

f1 <- function(){
  dim(my_f)
}

f2 <- function(){
  ## Local env Year column
  my_f$year <- NULL
  ## Changes the global value from dataset's year column
  ##my_f$year <<- NULL
  dim(my_f)

}



e <- new.env()
current_env()
parent.env(e)



mystack <- function(el){

  stack_arr<- list()
  list(push = function(v=el){
                stack_arr <<- c(stack_arr,v)
                },
       peek = function(){
                v <<- stack_arr
                print(v)
                },
       pop = function(){
                stack_arr <<- c(stack_arr)
                },
       show = function(v=el){

                print(stack_arr)
       })

}

m <- mystack(1)
m$push(0)
m$peep()
m$show()
m$push(1)
m$push(2)
m$push(3)
m$pop(2)
m$show()
rlang::fn_env()
