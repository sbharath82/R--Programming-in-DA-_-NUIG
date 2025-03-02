#devtools::create("qfifo")

#' The constructor for the class qfifo
#' @return An S3 object of class qfifo
#' @examples
#' s <- qfifo()
#' @export
qfifo <- function(){
  structure(list(qfifo=list()), class ="qfifo")
}


#' adds a value onto the queue of fifo
#'
#' @param sp is the current stack object
#' @param val is the value to be added to the stack
#'
#' @return The updated stack object
#' @export
#'
#' @examples
#' s <- qfifo()
#' s <- add(s,123)
add <- function(q, v){
  UseMethod("add")
}

#' @export
add.qfifo <- function(q, v){
  q$qfifo[length(q$qfifo)+1] <-v
  q
}

#' Looks the top value on the stack
#'
#' @param sp is the current stack object
#'
#'
#' @return The topmost element in the queue
#' @export
#'
#' @examples
#' s <- qfifo()
#' s <- peek()


#' @export
peek <- function(sp){
  UseMethod("peek")
}

#' @export
peek.qfifo <- function(sp){
  # get the top element
  if(length(sp$stack) == 0)
    stop("No elements on the stack")
  sp$stack[[length(sp$stack)]]
}

#' @export
pop <- function(sp){
  UseMethod("pop")
}

#' @export
pop.qfifo <- function(sp){
  # get the top element
  if(length(sp$stack) == 0)
    stop("No elements on the stack to pop")
  sp$stack[length(sp$stack)] <- NULL
  sp
}

#' @export
get_length <- function(sp){
  UseMethod("get_length")
}

#' @export
get_length.qfifo <- function(sp){
  length(sp$stack)
}

#' @export
summary.qfifo <- function(sp){
  cat("The stack has ",length(sp$stack), "elements\n")
  cat("These are the elements, top to bottom.\n")
  count <- 1
  for(i in rev(seq_along(sp$stack))){
    cat("Element ",count," = ",sp$stack[[i]],"\n")
    count <- count + 1
  }
}

# Classroom Tasks
# (1) Add documentation for functions (generics)
# (2) Add a new function to reverse the stack
# (3) Add a new function to examine the oldest element
# (4) Add a few more tests


