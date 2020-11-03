##Creating Closure named my_timer as follows using the states (variables) and functions correspondingly and
#listing output as required

my_timer <- function(){
      Name = "Unknown"
      start_time = character()
      finish_time = character()
      duration = numeric()
      all_times <- tibble(Name = character(),StartTime = character(), FinishTime = character(), Duration = numeric())

          #start_timing event function definition
      list(start = function(name="Unknown") {
            Name <<- name
            start_time <<- Sys.time()
          },
          #finish_timing event function definition
          finish = function() {
            finish_time <<- Sys.time()
            duration  <<- finish_time - start_time
            t$archive()
          },
          #get_time function definition to fetch duration
          get_time = function() {
            duration
          },
          #summary function definition to list added event details
          summary = function(){
              sum1 <- list(
                Name=Name,
                StartTime=start_time,
                FinishTime=finish_time
              )
          },
          #archive function definition to store added event details in a tibble
          archive = function(){
            all_times <<- all_times %>% add_row(Name=Name, StartTime=as.character(start_time), FinishTime=as.character(finish_time), Duration=as.numeric(duration))

         },
          #summary function definition to list added event details
          get_all_times = function(){
            all_times
         }

      )
}

##Creating object of the closure and Calling structure() to list its structural details
t <- my_timer()
str(t)

##Adding first timing event details of Person1 using start and finish with duration of 3 seconds
t$start("Person1")
Sys.sleep(3)
t$finish()

##Confirming the result of Person1's timing added
t$get_time()

##Showing the summary of timings of first Person's details added
(t$summary())

##Adding second timing details of Person2 using start and finish with duration of 2 seconds
t$start("Person2")
Sys.sleep(2)
t$finish()

##Confirming the result of Person2's timing added
t$get_time()

##Showing the summary of timings of second Person's details added
(t$summary())

##Finally, show the full set of results from both timing events
(t$get_all_times())

