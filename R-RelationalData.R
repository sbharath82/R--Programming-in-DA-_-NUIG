library(nycflights13)
library(tidyverse)
library(dplyr)

View(flights)
View(weather)

flights_jfk <- filter(flights,origin == "JFK" & month == 1 )
View(flights_jfk)
dim(flights_jfk)

weather_jfk <- filter(weather, origin == "JFK" & month == 1 )
View(weather_jfk)

left_join(flights_jfk,weather_jfk,by="month")

fli_weat_jfk <- left_join(flights_jfk,weather_jfk,by=c("year","month","hour","day","origin"))
View(fli_weat_jfk)
glimpse(fli_weat_jfk)

#Possible hyporthesis
# impact of visibility on departure_delay
#impact of windspeed on departure delay
#impact of wind direction  on departure delay
#impact of avg temp on number of delays
#impact of wind gust on departure delay
#tme of day on departure delays
#impact of Extend to 12 months and all 3 airports



select(filter(fli_weat_jfk,year==2013 & month==1 & day==9 & sched_dep_time==1900),temp) 

ggplot(fli_weat_jfk,mapping = aes(x=wind_gust,y=arr_delay))+geom_boxplot()+geom_smooth()

ggplot(fli_weat_jfk,mapping = aes(x=wind_speed,y=arr_delay))+geom_point()+geom_smooth()

ggplot(fli_weat_jfk,mapping = aes(x=dewp,y=arr_delay))+geom_point()+geom_smooth()

ggplot(fli_weat_jfk,mapping = aes(x=precip,y=arr_delay))+geom_point()+geom_smooth()

ggplot(fli_weat_jfk,mapping = aes(x=pressure,y=arr_delay))+geom_point()+geom_smooth()

ggplot(fli_weat_jfk,mapping = aes(x=visib,y=arr_delay))+geom_point()+geom_smooth()

ggplot(fli_weat_jfk,mapping = aes(x=wind_dir,y=arr_delay))+geom_point()+geom_smooth()
