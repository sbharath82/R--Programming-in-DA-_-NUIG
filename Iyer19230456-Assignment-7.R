library(tidyr)
library(readxl)
library(tidyverse)
library(lubridate)
library(corrplot)
library(stringr)

# Reading Dublin Inward dataset from Excel sheet and displaying first ten rows

d_in <- read_excel("../../R/datasets/DublinAirport.xlsx", sheet = "DublinInward")
d_in[1:10,1:10]

# Reading Dublin Outward dataset from Excel sheet and displaying first ten rows

d_out <- read_excel("../../R/datasets/DublinAirport.xlsx", sheet = "DublinOutward")
d_out[1:10,1:10]

# Using the appropriate functions to transform the Dublin Inbound data sets to their tidy data equivalent

d_in_tidy <- d_in %>% 
              pivot_longer(-Date, names_to = "Airport", values_to = "Passengers" ) %>%
              separate(Date, into=c("Year","Month"),sep = "M", remove = TRUE ) %>%
              unite(Date,c("Year","Month"), sep="-", remove=FALSE) %>%
              mutate(Date = as.Date(paste0(Date,"-01"),'%Y-%m-%d'),
                     MonthName = as.factor(month.abb[as.integer(Month)]),
                     Direction = "Inbound", Passengers = as.integer(Passengers) ) %>% 
              select(Year,Month,Airport,Passengers,Direction,MonthName,Date) %>%
              arrange(Airport)
d_in_tidy

# Using the appropriate functions to transform the Dublin Outbound data sets to their tidy data equivalent

d_out_tidy <- d_out %>% 
              pivot_longer(-Date, names_to = "Airport", values_to = "Passengers" ) %>%
              separate(Date, into=c("Year","Month"),sep = "M", remove = TRUE ) %>%
              unite(Date,c("Year","Month"), sep="-", remove=FALSE) %>%
              mutate(Date = as.Date(paste0(Date,"-01"),'%Y-%m-%d'),
                    MonthName = as.factor(month.abb[as.integer(Month)]),
                    Direction = "Outbound", Passengers = as.integer(Passengers) ) %>% 
              select(Year,Month,Airport,Passengers,Direction,MonthName,Date) %>%
              arrange(Airport)
d_out_tidy

# Creating a full tidy data set encompassing both the inbound and outbound data.

full_data <- full_join(d_in_tidy,d_out_tidy)
full_data

# Listing top ten, in terms of passenger numbers (to and from Dublin Airports)

top_ten <- full_data %>% group_by(Airport) %>% 
      summarise(Total=sum(Passengers)) %>% arrange(desc(Total)) %>% 
      select(Airport) %>% slice(1:10) 
as.data.frame(top_ten)

# Summarise the Yearly values, by direction

summ_year <- full_data %>% group_by(Year, Direction) %>% 
              summarise(Total=sum(Passengers)) 
summ_year

# Summarise the average monthly values, by direction

avr_month <- full_data %>% group_by(Year, Month, Direction) %>% 
              summarise(Total=mean(Passengers),Date=first(Date))
avr_month

# Total outbound passengers per month (excluding 2019):

Total_Pass <- full_data %>% filter(Direction  == "Outbound" & as.integer(Year) < 2019) %>%
              group_by(Year, Month) %>% 
              summarise(Total=sum(Passengers))
Total_Pass  

# Display a heat map of passenger numbers by month. Use the functions geom_tile() and scale_fill_gradient()

Total_Pass %>% ggplot(aes(x=Year, y=Month, fill=Total))+ geom_tile() +
          scale_fill_gradient(low="Blue", high="red", space ="Lab" )

# Based on the outward passenger numbers for each destination, create the following correlation plot matrix

cor_pl <- d_out[,2:44]
colnames(cor_pl) <- str_extract(colnames(cor_pl), "(?<=\\()(.*)(?=\\))")
M <- cor(x=cor_pl)
corrplot(M, method="circle", type="upper")

