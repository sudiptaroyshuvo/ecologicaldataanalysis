library(tidyverse)
cru <- read_csv("cru_kg.csv")

data("ToothGrowth")

summarise(group_by(ToothGrowth, supp, dose),
          mean_len = mean(len))

ToothGrowth %>% 
  group_by(supp, dose) %>% 
  summarise(mean_len = mean(len))

#action 1

t<- cos(1:100)
median(sqrt(abs(t)))

t %>% 
  abs %>%
  sqrt %>% 
  median

#function call

ToothGrowth$len
ToothGrowth %>% .$len
ToothGrowth %>% `$`(., len)

ToothGrowth[,2]
ToothGrowth %>% .[,2]
ToothGrowth %>% `[[`(., 2)

#function

#To understand computations in R, two slogans are helpful: Everything that exists is an object. Everything that happens is a function call. - John Chambers

#Functions are a key feature of R:
  
  #functions are objects in R
  #fundamental building block for advanced techniques

cubic <- function(x) {
  x^3
}

cubic(3)

#Function components: body, formals, environment

body(cubic)
formals(cubic)
environment(cubic)

#action 2
#1
func_1<- function (x,y){
  y^x
}
func_1(34,12)
#3
body(func_1)
formals(func_1)

#default arguments


diff1 <- function(x, y) {
  x - y
}
diff1(10, 2)
diff1(10)

diff2 <- function(x, y = 4) {
  x - y
}
diff2(10, 2)
diff2(10)

#local assignment
y <- 10
foo <- function(x) {
  y <- 20
  x + y
}
foo(y)
y
#Assignments inside a function are evaluated in an ephemeral environment.


#global assignment

breakfast <- "icecream"

dont_change_breakfast <- function(x) {
  breakfast <- x
}
dont_change_breakfast("raisins")
breakfast

change_breakfast <- function(x) {
  breakfast <<- x
}
change_breakfast("shortbread")
breakfast

#action 3
de_matronne<- function(psum, tmean){
  psum/(tmean + 10)
 }
dmi_fun <- function(psum, tmean) {
  psum / (tmean + 10)
}

dmi_fun
cli%>%
  group_by(year, lon, lat)%>%
  summarise(Psum= sum(pre), tmean=mean(tmp))%>%
  mutate(dmi=dmi_fun(psum,tmean))%>%
  arrange(abs(lat))
#corr
cli %>% 
  group_by(lat, lon, year) %>% 
  summarise(psum = sum(pre, na.rm = TRUE),
            tmean = mean(tmp, na.rm = TRUE)) %>% 
  mutate(dmi = dmi_fun(psum, tmean)) %>% 
  # arranging to keep grid cells with missing values at the bottom
  arrange(abs(lat))

cli

#control flow
x <- 11
if (x >= 10) {
  print("x is at least 10")
} else {
  print("x is smaller than 10")
}

x <- 1
if (x < 10) {
  x <- 10
}
x

#inside function

check_breakfast <- function(x) {
  if (x == "fried mars bars") {
    print("yikes!")
  } else {
    print("how about fried mars bars?")
  }
}

check_breakfast("toast")

#action 4
func2<- function(x){
  if (length(x)>3){
    x[1:3]
  } else{
    x
  }
  
}

#Iteration
#for loops
for (i in 1:10) {
  print("Bishops love sci-fi!")
}

for (i in c("b", "c", "d")) {
  print(paste("Give me a", i))
}



l <- list(a = 1, b = 2:4, c = letters[1:4])

for (i in 1:length(l)) {
  print(length(l[[i]]))
}
l <- list(a = 1, b = 2:4, c = letters[1:4])

for (i in seq_along(l)) {
  print(length(l[[i]]))
}

#while loops
z <- 0

while (z < 10) {
  print("z is smaller than 10")
  z <- z + 1
}

#index


u <- list(bird = "peacock",
          wood = "doussie",
          friends = c("anne", "claude",
                      "sascha", "maude"))
n <- length(u)
for (i in 1:n) {
  print(i)
  print(u[[i]])
}
u
#action 5

target <- 1000
gone <- 0
time_passed <- 0
while (gone < target) {
  gone <- gone + 1 - 0.5
  time_passed <- time_passed + 3 * 1
}
time_passed / (60 * 60)
