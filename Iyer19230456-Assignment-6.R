library(nycflights13)
library(dplyr)
library(ggplot2)
library(lubridate)

#Creating local copy of flights dataset
my_flights <- flights
my_flights


#Filter out missing values for dep_delay and arr_delay, 
filter_missing <- filter(my_flights, is.na(my_flights$dep_delay) == FALSE & is.na(my_flights$arr_delay) == FALSE )

#Using above filtered data, displaying all records by selecting only the following columns:
filter_df <- select(filter_missing,time_hour, origin, dest, carrier, dep_delay, arr_delay, air_time, distance)
filter_df

#Add 3 new columns for the day of the week, the hour of the day and month from lubridate.
date_format <- ymd_hms(filter_df$time_hour)
mutate_df <- mutate(filter_df, Month=month(date_format,label = T),DayOfWeek=wday(date_format,label = T),
                    HourOfDay=hour(date_format))
select(mutate_df,time_hour,Month,DayOfWeek,HourOfDay,origin,dest,carrier,dep_delay,arr_delay,air_time, distance)


#Calculate the average departure delay statistics by hour of day, ordered by delay.
gr <- group_by(mutate_df,HourOfDay)
avg_dep_delay <- summarise(gr, AvrDepDelay = mean(dep_delay))
arrange(avg_dep_delay,desc(AvrDepDelay))


#Average departure delay statistics by month, ordered by delay.
gr <- group_by(mutate_df,Month)
avg_dep_delay_mon <- summarise(gr, AvrDepDelay = mean(dep_delay))
arrange(avg_dep_delay_mon,desc(AvrDepDelay))


#Average departure delay statistics by carrier, ordered by delay.
gr <- group_by(mutate_df,carrier)
avg_dep_delay_car <- summarise(gr, AvrDepDelay = mean(dep_delay))
arrange(avg_dep_delay_car,desc(AvrDepDelay))


#Average departure delay statistics by airport by month, ordered by delay.
gr <- group_by(mutate_df,origin,Month)
avg_dep_delay_ori <- summarise(gr, AvrDepDelay = mean(dep_delay))
arrange(avg_dep_delay_ori,desc(AvrDepDelay))


#Add a new category, which divides each day into three sections (use case_when) - 
#Morning 5 <= time < 12 - Afternoon 12 <= time < 18 - Evening > =18 
mutate_df <- mutate(mutate_df, DaySection=
          case_when(mutate_df$HourOfDay >= 5 & mutate_df$HourOfDay < 12 ~ "Morning",
          mutate_df$HourOfDay >= 12 & mutate_df$HourOfDay < 18 ~ "Afternoon",
          mutate_df$HourOfDay >= 18 ~ "Evening")) 
select(mutate_df,time_hour,DaySection,Month,DayOfWeek,HourOfDay,origin,dest,carrier,dep_delay,arr_delay,air_time,distance)


#Use a boxplot to visualise the departure delays of less that 60 minutes 
#by the three different time sections for each day of the week
ggplot(mutate_df,mapping = aes(x=DayOfWeek, y=dep_delay, color=DaySection )) + 
  ylim(-50,60) + geom_boxplot(lwd = 0.7, fatten = 2.5, outlier.size = 2) +
  coord_cartesian(ylim = c(-40, 60), expand = TRUE)

