my_vec <- 3:5
my_vec
names(my_vec) <- c ("good", "bad", "ugly")
my_vec

#can take note with it

vec_A <- c(1,2,3)
Vec_B <- c(4,5,6)
vec_total <- vec_A + Vec_B
vec_total

vec_A <- c(1, 2, 3)
vec_A_sum <- sum(vec_A)
vec_A_sum

vec <- c(1,2.3, 3, 8.7)

mean (vec)
median(vec)

?sum
#get help
?median

apropos(mean)
apropos("mean")
#bring all about mean

vec
vec +2
vec^7
vec * -0.76

ant_species1 <- c(140, 110, 88, 12, 9)
ant_species2 <- c(24, 35, 17, 62, 76)
day <- c("Mon", "Tue", "Wed", "Thu", "Fri")
names(ant_species1) <- day
names(ant_species2) <- day

#action1
ant_perday <- ant_species1 + ant_species2
ant_perday
#2.2
sum (ant_species1)
#sola
sum (ant_species1) + sum (ant_species2)
#solb
sum(ant_species1+ ant_species2)
#solc
sum (ant_perday)

6>2
6>7
6!=2
#not equal

value_A <- 121
value_B <- 33
value_A < value_B
value_A == value_B
value_A != value_B

#action2
ant_species1 > ant_species2
ant_species1 < ant_species2
ant_species1 == ant_species2
ant_species1 != ant_species2

#corr
sum (ant_species1) > sum (ant_species2)

foo <- c(1,2,3,4,5)
foo[1]
foo[4]
bar <-foo[3]
bar
#first element start from 1 not 0

#Action3
ant_species1["Wed"]
ant_species1[wed]
ant_species1[3]
sp1_wed <- ant_species1[3]
sp1_wed

my_vec <- c("fee", "fi", "foo", "fum")
my_vec[2]
my_vec[c(2,4)]
indices <- c(1,3)
my_vec[indices]

?indices
ant_species1
ant_species2
indices <- c(1,2,3)
ant_species1_montowed <- ant_species1[indices]
ant_species2_montowed <- ant_species2 [indices]
sum_species_montowed <- sum (ant_species1_montowed+ant_species2_montowed)
sum_species_montowed
indices <- c(4,5)

#action4
ant_total_day <- ant_species1+ ant_species2
ant_total_day
ant_total_first_half <- ant_total_day[c(1,2,3)]
ant_total_end<- ant_total_day[c(4,5)]
mean_first_half<- mean (ant_total_first_half)
mean_first_half
mean_total_end<-mean (ant_total_end)
mean_total_end
#experimentation
ant_sum<- ant_species1 + ant_species2
ant_sum
mean(ant_sum(indices_m<-c(1:3)))
indices_m<- c(1:3)
indices_t<- c(4,5)
mean(ant_sum[indices_m])
mean(ant_sum[indices_t])

#corraction4
ant_sum <- ant_species1 + ant_species2
mean(ant_sum[c(1, 2, 3)])
mean(ant_sum[c(4, 5)])

vector_1 <- c(1, 2, 3, 4, 5, 6, 7, 8)
vector_2 <- 1:8
vector_1
vector_2
all.equal(vector_1, vector_2)

my_vector <- c("this", "is", "a", "nice", "ant")
my_vector[c(3, 4, 5)]
my_vector[3:5]

#action5
ant_first_half <- ant_total_day[c(1:3)]
ant_last_half <- ant_total_day [c(4:5)]
mean_first_half<- mean (ant_first_half)
mean_first_half
mean_total_end<-mean (ant_last_half)
mean_total_end

#correction
 mean(ant_sum[c(1:3)])
mean(ant_sum[4:5])

#excluding elements 
foo<-1:10
foo[-7]
foo[-c(2,5)]
foo [-7:-9]
foo [-7:5]

#selecting by name
my_vector <- c(1,2,3)
names(my_vector) <- c("carl", "maria", "john")
my_vector
my_vector[2]
my_vector[c("maria", "john")]

ant_species1
ant_number_thursday<- ant_species1["Thur"]
ant_number_thursday

#action6
ant_sum
ant_sum["Thu"]

my_vector <- c(1, 2, 3)
names(my_vector) <- c("one", "two", "three")
my_vector["two"]
my_vector[c("one", "three")]

#select by comparison
3:10>6
c("hi", "there") !="hi"

#Logical comparison operators return logical vector
#Logical vectors can be used for subsetting other vectors

vec_A <- c(1, 3, 5, 3, 1)
vec_B <- c("yes", "no", "maybe", "no", "yes")

vec_A[c(1,3)]
vec_A[c(TRUE, FALSE, TRUE, FALSE, FALSE)]

selection<- vec_B !="no"
selection

vec_A [selection]
vec_A[vec_B !="no"]
#action7
ant_species1
ant_species_greater<- ant_species1>30
ant_species_greater
ant_species2
ant_species2_greater<- ant_species2>30
ant_species2_greater
#corr
ant_species2[ant_species2>30]
ant_species2[ant_species2>30]

#corr
indices<-ant_species2> 30
ant_species2 [indices]

#Three of them are correct

fruit <- c("nut", "berry", "drupe", "drupe",
           "berry", "drupe", "nut")
fruit_factor <- factor(fruit)
fruit_factor

levels(fruit_factor)
levels(fruit_factor) <- c("b","d","n")
fruit_factor

#Note: summary() is a function that we will be using often; it will automatically know what to compute based on the context.

summary(fruit_factor)

#Ordered factors

animals <- factor(c("Bear", "Donkey", "Eel"))
animals

temps <- factor(c("Low", "Medium", "High"))
temps

temps <- factor(c("Low", "Medium", "High"), 
                ordered = TRUE,
                levels = c("Low", "Medium", "High"))
temps


temps
#action8
shish <- factor(c("meat", "veg", "veg", "veg", "meat", "veg", "veg", "veg",
                  "meat", "veg", "veg", "veg", "meat", "veg"))

summary(shish)
