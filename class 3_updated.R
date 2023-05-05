dc <- c("beyonce", "kelly", "michelle")
dc != "beyonce"
dc[dc != "beyonce"]
pkgs <- c("tidyverse", "rmarkdown",
          "ggmap", "ncdf4")

install.packages(pkgs)

library(tidyverse)

#factors

music_collection <- c("rnb", "punk", "funk",
                      "punk", "rnb", "soul",
                      "jazz", "rnb", "jazz",
                      "funk")
music_collection <- factor(music_collection)
summary(music_collection)
music_collection

#class 3
#finishing data structures
#matrices

#In R: a collection of elements of the same type (like vectors), arranged into fixed number of rows and columns 
#???2-D data construct.

#Construction in R with the matrix() function:

matrix(1:9, nrow = 3)
matrix(1:9, byrow = TRUE, nrow = 3)


#first argument: collection of elements that shall be arranged as matrix; here: 1:9 which is identical to c(1, 2, 3, 4, 5, 6, 7, 8, 9)
#argument byrow: shall the matrix be filled by the rows? The default is FALSE
#argument nrow: how many rows shall the matrix have?

#action1
matrix(1:25, byrow = TRUE, nrow = 5)

#constructing matrices from vectors

#Remember the c() function? You can combine vectors, and then turn the combined vector into a matrix:

cat1 <- c("mona", "bone", "jakon")
cat2 <- c("maybe", "you're", "right")
cat3 <- c("fill", "my", "eyes")
cat_stevens_vector <- c(cat1, cat2, cat3)
cat_stevens_vector
cat_stevens_matrix <- matrix(cat_stevens_vector,
                             byrow = TRUE,
                             nrow = 3)
cat_stevens_matrix

#action 2
ant_species1 <- c(140, 110, 88, 12, 9)
ant_species2 <- c(24, 35, 17, 62, 76)
ant_species3 <- c(44, 31, 57, 88, 139)
days_vector <- c("Monday", "Tuesday",
                 "Wednesday", "Thursday",
                 "Friday")
names(ant_species3) <- 
  names(ant_species2) <-
  names(ant_species1) <- days_vector
ant_matrix <- matrix(c(ant_species1, ant_species2, ant_species3),
                     nrow = 3, byrow = TRUE)
ant_matrix

#naming a matrix
my_matrix <- matrix(c((1:3)^2, (1:3)^3),
                    byrow = TRUE,
                    ncol = 3)
my_matrix
colnames(my_matrix) <- c("one", "two", "three")
rownames(my_matrix) <- c("squared", "cubic")
my_matrix

#Action 3
rownames(ant_matrix)<- c("species1","species2","species3")
colnames(ant_matrix)<- days_vector
ant_matrix

#column and row-wise arithmetics
my_matrix <- matrix(1:9, byrow = TRUE, ncol = 3)
colSums(my_matrix)
colMeans(my_matrix)
ant_matrix

#action4
rowSums(ant_matrix)
colMeans(ant_matrix)

#adding rows and columns
my_matrix <- matrix(1:9, byrow = TRUE, ncol = 3)
my_matrix <- rbind(my_matrix, 10:12)

my_matrix

#action 5
ant_matrix
species4<- c(82,21,42,0,112)
ant_matrix<- rbind(ant_matrix,species4)
ant_matrix
ant_matrix<- ant_matrix[-4,]
ant_matrix
#selection of matrix elements
my_matrix <- matrix(1:9, byrow = TRUE, ncol = 3)
my_matrix
my_matrix[1,1]
my_matrix[2,3]
my_matrix[,3]
my_matrix[2,]
my_matrix[1:2,2:3]

#Action 6

ant_matrix
ant_matrix[2,1]
ant_matrix[,3]
ant_matrix[3:4,2:5]

#matix arithmetics
#Like with vectors, standard operators work element-wise:
my_matrix <- matrix(1:9, byrow = TRUE, ncol = 3)
my_matrix * 2
my_matrix + 2
my_matrix^2

#Lists
#Devices for storing a variety of objects in an ordered way: vectors, factors, matrices, data frames, other lists, 
my_vector <- 1:10
my_matrix <- matrix(1:9, ncol = 3)
my_factor <- factor(c("female", "female",
                      "male", "female"))
my_factor
my_list <- list(my_vector, my_matrix, my_factor)
my_list
#naming a lists
my_list <- list(the_vector = my_vector,
                the_matrix = my_matrix,
                the_factor = my_factor)
my_list

#Use str() (for structure) to learn about the list elements
str(my_list)
str(my_factor)

#selecting elements by positions

my_list[[1]]
my_list[[2]]

my_list[[1]][2]

#selecting elements by name
my_list[["the_vector"]]
my_list$the_matrix

#chaining
my_list$the_vector[2]

#Adding inforamtion to lists
my_list <- c(my_list,
             list(the_other_vector = my_vector))
my_list

#note: all arguments must be lists (otherwise: unexpected results)!

#Data frame
#ans: 2-D data structure representing variables (as columns) and observations (as rows). Unlike matrics: different data types (per column = variable) possible.

mtcars
head(mtcars)
tail(mtcars)
str(mtcars)

#creating data frame
name <- c("Shakira", "Serj Tankian",
          "Anthony Kiedis")
sex <- factor(c("f", "m", "m"))
year_of_birth <- c(1977, 1967, 1962)
born <- c("Colombia", "Libanon", "USA")
patern_gp <- c("Libanon", "Armenia",
               "Lithuania")

singers <- data.frame(name, sex,
                      year_of_birth, born,
                      patern_gp)
singers

#action 7
Rain<- c("no","no","no","yes","yes")
ant_matrix<- rbind(ant_matrix,Rain)
ant_matrix
#corr
Rain<- c(FALSE, FALSE, FALSE, TRUE,TRUE)
Rain
ant_df<-data.frame(days_vector,
                   ant_species1,
                   ant_species2,
                   Rain)
ant_df

#profcorr
ant_df <- data.frame(
  day = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"),
  species1 = c(140, 110, 88, 12, 9),
  species2 = c(24, 35, 17, 62, 76),
  rain = c(FALSE, FALSE, FALSE, TRUE, TRUE)
)
ant_df

#selection of elements

day <- c("Monday", "Tuesday", "Wednesday",
         "Thursday", "Friday")
species_1 <- c(140, 110, 88, 12, 9)
species_2 <- c(24, 35, 17, 62, 76)
rain <- c(FALSE, FALSE, FALSE, TRUE, TRUE)
ants_df <- data.frame(day, species_1,
                      species_2, rain)
ants_df[1,1]
ants_df[2, ]
ants_df[ ,3]

#selection using names
ants_df[, "rain"]
ants_df[1:3, "species_1"]

#select an entire column with $
ants_df$rain
ants_df$species_1

#action 8
ant_df[1:4, 2:3]
ant_df[,1]
ant_df[["day"]]
ant_df$day
ant_df[,"day"]
ant_df$rain[ant_df$species1>100]
ant_df

#Tibbles
#Tibbles are modernised data.frames:

#1.better printing
#2.type safe
#3.subsetting always returns another tibble
#Tibbles are available in the tidyverse:

#creating tibbles


day <- c("Monday", "Tuesday", "Wednesday",
         "Thursday", "Friday")
species_1 <- c(140, 110, 88, 12, 9)
species_2 <- c(24, 35, 17, 62, 76)
rain <- c(FALSE, FALSE, FALSE, TRUE, TRUE)
ants_tbl <- tibble(day, species_1,
                   species_2, rain)
ants_tbl

#Using tibbles
#Almost no difference, but easier and more predictable than traditional data.frames.
#changing
#Also: the tidyverse provides functions for efficiently reading data into tibbles.

