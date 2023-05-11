library(tidyverse)

#readr update
install.packages("readr")
library(readr)
write_excel_csv2(mtcars, "mtcars.csv")
mtcars



nh_temp <- 
  read_csv("http://data.giss.nasa.gov/gistemp/tabledata_v3/NH.Ts+dSST.csv",
           skip = 1, na = "***")

head(nh_temp)

months_num <- 1:12
names(months_num) <- c("Jan", "Feb", "Mar",
                       "Apr", "May", "Jun",
                       "Jul", "Aug", "Sep",
                       "Oct", "Nov", "Dec")
months_num[months]
names(months)

months_num <- 1:12
names(months_num) <- c("Jan", "Feb", "Mar",
                       "Apr", "May", "Jun",
                       "Jul", "Aug", "Sep",
                       "Oct", "Nov", "Dec")

nh_tidy %>% mutate(Month = months_num[Month])

colnames(nh_temp,"Jan":"Dec")<- months_num
nh_temp
nh_tidy<- tibble::as_tibble(nh_temp)

months_num <- 1:12
names(months_num) <- c("Jan", "Feb", "Mar",
                       "Apr", "May", "Jun",
                       "Jul", "Aug", "Sep",
                       "Oct", "Nov", "Dec")

nh_tidy %in% mutate("Month" = months_num[Month])
rename(nh_tidy, Jan=1, Feb=2,Mar=3, Apr=4, May=5, Jun= 6, Jul=7, Aug= 8, Sep= 9, Oct= 10, Nov= 11, Dec=12)
nh_tidy

#Visualization with ggplot
#scatterplot
x <- 1:10
y <- c(3, 2, 1, 2, 3, 1, 2, 3, 4, 5)
plot(x, y)
plot(x, y, type = "l")

#barplot
y <- c(3, 2, 1, 2, 3, 1, 2, 3, 4, 5)
barplot(y)

#boxplot
x <- c(1, 1, 1, 2, 2, 2, 3, 3, 3, 3)
y <- c(3, 2, 1, 2, 3, 1, 2, 3, 4, 5)
boxplot(y)
boxplot(y ~ x)



ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 colour = Species)) +
  theme_bw()

ToothGrowth

#action 3
ggplot(ToothGrowth)+
  geom_point(aes(x= dose,
                 y= len,
                 colour = supp)) +
  theme_bw()

ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 shape = Species))

#action 4
ggplot(iris) +
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 colours = Species,
                 alpha = Petal.Length,
                 size= Petal.Width))

#Line plots
co2 <- read_table("CO2_OBS_1850-2005.lpl",
                  skip = 4, 
                  col_names = c("year", "conc"))

ggplot(co2) +
  geom_line(aes(x = year,
                y = conc,
                colour = conc > 330))

#Action 5
co2_2.6<-read_table("CO2_RCP3PD_1850-2500.lpl",
           skip = 4, 
           col_names = c("year", "conc"))

ggplot(co2_2.6)+
  geom_line(aes(x= year,
                y=conc,
                colour = conc> 330 ))
