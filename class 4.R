#Reading data into R
#reading csv file
temp <- read_csv("ZonAnn.Ts.csv")

#missing values
beer_col <- c("light", "dark", NA)
names(beer_col) <- c("Heineken", "Guiness",
                     "Spaten")

beer_col == "light"

#For reading in data, we need to specify, how NA values are encoded:
  
temp <- read_csv("ZonAnn.Ts.csv", na = "*****")

#Data Transformation
#what is it?
#1.getting data in the right structure for analysis: selection, reordering, filtering
#2.creating new variables from existing ones
#3.getting some first insights from simple summaries

#Intro to dplyr

#dplyr is a core part of the "tidyverse": package specifically designed for data transformation (also helps with modelling and EDA)
#easy syntax: reads +- like English



#Key verbs (= functions):
  
#filter(): pick observations by their values
#arrange(): reorder the rows
#select(): pick variables by their names
#mutate(): create new variables with functions of existing variables
#summarise(): collapse many values down to a single summary

#These verbs can be combined with group_by() to operate group by group.


#All verbs work similarly:
  
#first argument is a data.frame or tibble
#other arguments describe what to do with the data
#no need for $ to reference columns/variables
#result is another data.frame or tibble

#Filter rows with filter()

#filter() allows you to subset observations based on their values:
  
#first argument is a data.frame or a tibble
#subsequent arguments are filter expressions, based on the columns/variables

# observations since 1960
filter(temp, Year >= 1960)

# only obs w/ positive anomalies
filter(temp, Glob > 0)


foo <- c(2, 3, 9)
bar <- c(2, 1, 7)

foo < bar
foo <= bar
foo > bar
foo >= bar
foo == bar
foo != bar

foo %in% c(2, 9)
foo %in% c(6, 8)
!(foo %in% c(6, 8))

#%in% helps to identify if an element belongs to a vector

#combining filters



foo <- c(2, 3, 9)
bar <- c(2, 1, 7)

foo > bar
foo < 5
foo > bar & foo < 5
foo > bar | foo < 5
foo > bar & !(foo < 5)
xor(foo > bar, foo < 5)

#Filter rows with filter() (ctd.)

#Use several variables for filtering:
  
  # greater anomalies on northern
  # hemisphere than globally
  filter(temp, NHem > Glob)
  
  # will not work:
filter(temp, 44S-24S < 0)
  
  # will work:
filter(temp, `44S-24S` < 0)
#Caution: Backticks needed!

#action 3
filter(temp,NHem>SHem)

#corr
temp <- read_csv("ZonAnn.Ts.csv", na = "*****")
filter(temp, `EQU-24N` > `24S-EQU`)

#Arrange rows with arrange()

#arrange() can change the order of rows
#takes data.frame and a set of column names (or more complex expression) to order by

# order by global temp anomalies
arrange(temp, Glob)

#Use desc() to sort in descending order:
  
arrange(temp, desc(Glob))



#Use more arguments to arrange() to specify tie-breakers:
  
arrange(temp, Glob)
arrange(temp, Glob, NHem)

#action 4
arrange(temp, `64N-90N`)

