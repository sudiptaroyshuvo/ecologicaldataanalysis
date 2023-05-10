

weather <- "nice"

if (weather == "nice") {
  mood <- "good"
}

if (weather == "nice") {
  mood <- "good"
} else {
  mood <- "bad"
}

#iteration


x <- 0
for (i in 1:100) {
  x <- x + 1
}
x
x <- 0
while (x < 100) {
  print(x)
  x <- x + 1
}

#more on functions
foo <- function(x, y) {
  xy_ratio <- x/y
  if (xy_ratio > 1) {
    log(xy_ratio)
  } else {
    sqrt(xy_ratio)
  }
}

foo(2, 3)

foo <- function(x) {
  if (x > 2) {
    x + 10
  } else {
    x - 10
  }
}
foo(2)

foo <- function(x) {
  if (x > 2) {
    return(x + 10)
  } else {
    return(x - 10)
  }
}
foo(2)
#return() can be useful to make clear that you are returning early (e.g., after error checking).

head(mtcars)

summarise(mtcars)

#column names
read_csv("birds,lice\n1,3\n2,9")

read_csv("1,3\n2,9")

read_csv("1,3\n2,9", col_names = FALSE)

read_csv("1,2,3\n4,5,6", 
         col_names = c("A", "B", "C"))

read_csv("A,B,C\n1,2,3\n4,5,6")

read_csv("A,B,C\n1,2,3\n4,5,6", 
         col_names = c("i", "j", "k"))

#finding readr function
headf <- function(f, n = 5) {
  cat(paste(readLines(f)[1:n],
            collapse = "\n"))
}

headf("myfile.txt")

#action 2
t1 <- read_csv("file1.txt")
t2 <- read_delim("file2.txt", delim = "*")
t3 <- read_tsv("file3.txt")

#Action 3
write_csv(t3, "file3.csv")
write_csv(t2, "file2.csv")

#NASA GISTEMP monthly data
nh_temp <- 
  read_csv("http://data.giss.nasa.gov/gistemp/tabledata_v3/NH.Ts+dSST.csv",
           skip = 1, na = "***")

head(nh_temp)
library(tidyverse)

#gather() when one variable is spread across multiple columns
#spread() when one observation is scattered across multiple rows
temp <- tibble(
  Year = 1991:1993,
  Jan = c(10, 7, 9),
  Feb = c(9, 7, 8),
  Mar = c(12, 11, 13),
  Apr = c(18, 16, 17),
  May = c(22, 21, 23))

temp
gather(
  data = temp,     # data to operate on
  key = "Month",   # variable forming col names
  value = "Temp",  # variable spread over cells
  Jan:May          # cols representing values
)
#or with pipes
temp %>% gather("month", "Temp", Jan:May)

#Anatomy of the gather(data, key, value, ...)

#data: name of the data set to operate on (symbol)
#key: name of the implicit variable (not yet available, will be created ??? give as string)
#value: name of the variable spread over the cells (not yet available, will be created ??? give as string)
#...: names of the columns representing the values (symbols); can be specified like with dplyr::select()!

#action 5
#1
nh_temp <- 
  read_csv("http://data.giss.nasa.gov/gistemp/tabledata_v3/NH.Ts+dSST.csv",
           skip = 1, na = "***")

nh_temp %>% 
  select(Year:Dec) %>% 
  gather(Month, temp, Jan:Dec)

#2
nh_temp %>% 
  select(Year:Dec) %>% 
  gather(Month, temp, Jan:Dec) %>% 
  filter(Year %in% 1950:2010) %>% 
  group_by(Month) %>% 
  summarise(mTemp= mean(temp))
