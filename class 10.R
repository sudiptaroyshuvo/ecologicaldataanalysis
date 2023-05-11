library(tidyverse)

#Adding layers
glb <- read_csv("GLB.Ts+dSST.csv", skip = 1,
                na = "***")
ggplot(glb) +
  geom_line(aes(x = Year,
                y = `J-D`))



ggplot(glb) +
  geom_line(aes(x = Year,
                y = `J-D`)) +
  geom_point(aes(x = Year,
                 y = `J-D`,
                 colour = `J-D` > 0.5))

ggplot(glb, aes(x = Year,
                y = `J-D`)) +
  geom_line() +
  geom_point(aes(colour = `J-D` > 0.5))

#overwriting

ggplot(glb, aes(x = Year,
                y = `J-D`)) +
  geom_line() +
  geom_line(aes(y = JJA))

#clean_data
glb %>% gather(aggregation, temp, -Year) %>% 
  filter(aggregation %in% c("J-D", "JJA")) %>% 
  ggplot(aes(x = Year,
             y = temp,
             colour = aggregation)) +
  geom_line()

#action 1
ggplot(glb, aes(x= Year,
                 y= MAM-SON,
                 colour= `J-D`)) +
  geom_point()+
  geom_line()

#mapping vs setting

ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width))

ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 colour = "blue"))  

#mapping vs setting

g <- ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 colour = Species))
g + scale_color_manual(values = 
                         c("red", "blue", "black"))

#more geoms
#histogram


ggplot(iris) +
  geom_histogram(aes(x = Sepal.Length))

#boxplot

iris %>% 
  gather(feature, length, -Species) %>% 
  ggplot() +
  geom_boxplot(aes(x = Species,
                   y = length,
                   colour = feature))
#action 2
glb %>% gather(month, temp, Jan:Dec) %>% 
  ggplot() +
  geom_boxplot(aes(x= month,
                   y= temp))

#smoothing
ggplot(glb, aes(x = Year,
                y = MAM)) +
  geom_point() +
  geom_smooth()

#Actiion 3

ggplot(glb, aes(x = Jan,
                y = Apr)) +
  geom_point() +
  geom_smooth(method = "lm")
