library(ggplot2)

d<-ggplot2::mpg
d
summary(d)
View(d)
#scatter-plots
ggplot(data=d,aes(x=displ,y=hwy))+ geom_point()+geom_smooth(method="lm")
ggplot(data = d) + geom_point(mapping=aes(x=displ,y=hwy),colour="blue")
ggplot(data = d) + geom_point(mapping=aes(x=displ,y=hwy),colour="blue")+
          geom_point(mapping=aes(x=displ,y=cty),colour="red")
ggplot(data = d) + geom_point(mapping=aes(x=displ,y=hwy),colour="blue")+
  geom_point(mapping=aes(x=displ,y=cty,colour=class))

ggplot(d)+geom_point(aes(x=displ,y=cty,colour=class))

ggplot(d)+geom_point(aes(x=displ,y=cty,colour=class,size=cyl))



ggplot(data=d,aes(x=displ,y=hwy,colour=class))+geom_point()+
  geom_smooth(method="lm")+facet_wrap(~manufacturer)



ggplot(data=d,aes(x=displ,y=hwy,colour=class))+geom_point()+
  geom_smooth(method="lm")+facet_grid(drv~cyl)


ggplot(d)+geom_density(aes(x=displ),colour=class,size=cyl)

ggplot(d)+geom_point(aes(x=displ,y=hwy,colour=class,size=cyl))

ggplot(d)+geom_point(aes(x=displ,y=hwy,colour=class,size=cyl))

ggplot(d)+geom_point(aes(x=displ,y=hwy,colour=class,size=cyl))

library(nycflights13)
View(flights)
unique(flights$origin)

ggplot(data = fl1)+geom_point(aes(x=month,y=arr_delay,color=origin))

ggplot(data = flights)+geom_point(aes(x=arr_dela y,y=dep_delay,color=origin))
library(dplyr)
fl1=sample_n(flights,4000)
str(flights)
library(lubridate)
wday(flights$time_hour[1])
flights$day_of_Week<-wday(flights$time_hour[1],label=T)
