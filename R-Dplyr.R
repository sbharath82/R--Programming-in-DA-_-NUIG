library(dplyr)
library(mtcars)
library(ggplot2)
mpg
filter
filter(mpg,displ > 6 | displ < 2)


dim(mpg)
View(mpg)

# Challenge 2.1 
filter(mpg,cty > median(cty))


filter(mpg, displ == max(displ))

ncol(select(mpg,  starts_with('d'), ends_with('y'), matches('year') ))
ncol(select(mpg,everything()))
select(mpg,year,everything())
 select(mpg,contains('ans'))

slice(mpg,2:3)
#similar to mpg[2:4,]

sample_n(mpg,2)
sml<- select(mpg, model,displ,cty)
sml
sml<- mutate(sml,KPG=cty*1.6)
sml

mpg %>% slice(1:2)
mpg %>% group_by(year) %>% summarise(AvyCty = mean(cty))
x<- mpg %>% filter(year==1999)
mean(x$cty)


unique(mpg$manufacturer)

mpg %>% group_by(manufacturer) %>% summarise(AvgCty = mean(cty)) %>% arrange(desc(AvgCty))


mpg %>% group_by(manufacturer) %>% 
  summarise(AvgCty = mean(cty),N=n()) %>% 
  arrange(desc(AvgCty)) %>% 
  slice(1:5)

glimpse(nycflights13::flights$origin)
View(nycflights13::flights)


month_df <- nycflights13::flights %>% group_by(month,origin) %>% summarise(AvgDelay=mean(dep_delay,na.rm = TRUE)) 

AvgDelay

ggplot(month_df) + geom_point(aes(x=month,y=AvgDelay,colour=origin)) + geom_line(aes(x=month,y=AvgDelay,colour=origin))

       