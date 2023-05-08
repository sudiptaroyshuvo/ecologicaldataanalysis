library(tidyverse)
cru <- read_csv("cru_kg.csv")

#Consolidating the dplyr/pipeline toolset

cru
temp_subset <- filter(cru, tmp, month= 7)

#action1
cru
cru %>%
  filter(month==7, cls== "Cfb")%>%
  summarise(mean_tmp= mean(tmp))

#action2
cru%>%
  filter(month== 7)%>%
  group_by(cls)%>%
  summarise(mean_tmp= mean(tmp))

porsches <- c(971, 911, 944, 955, 918,
              924, 968, 928)

porsches

#coup? models: 918, 924, 944

coupes_1 <- porsches== 918| porsches== 924 | porsches== 944 
coupes_1

coupes_2 <- porsches %in% c(918, 924, 944)
coupes_2

all.equal(coupes_1, coupes_2)

#more on mutate()
dt <- tibble(
  x = c(1.2, 2.1, 4.2, 2.9, 2.1),
  y = c(0.2, 1.0, 0.3, 0.2, 0.7))
dt %>% mutate(z1 = x/2,
              z2 = log(y),
              z3 = x + y,
              z4 = x * y)

#Many possible functions, but all must be vectorised, i.e. take a vector as argument and return a vector of the same length!

#Examples for functions to be used with mutate():
  
 #1 Arithmetics: +, -, *, /, ^
  #2 Logs: log(), log2(), log10() for scaling data with wide ranges
#3Offsets (from dplyr):
  #a lead() to refer to leading values
  #b lag() to refer to lagging values
u <- 1:10
lag(u)
lead(u)

#Cumulative aggregates:
  
#cumsum() for cumulative sums
#cumprod() for cumulative products
#cummin() for cumulative minima
#cummax() for cumulative maxima
#cummean() for cumulative means (from dplyr)

x <- 1:10
cumsum(x); cumprod(x); cummax(x); cummean(x)

#Logical comparisons: <, <=, >, >=, ==, !=
  #Ranking (all from dplyr):
  #min_rank() most important
#row_number(), dense_rank(), percent_rank(), cume_dist(), ntile()

x <- c(9, 1, 2, 3, 1, 4)
min_rank(x); min_rank(desc(x)); percent_rank((x))

#action2
cru

cru %>%
  filter (cls %in% c("Cfb","Cfc", "Dfb", "Dfc"))%>%
  filter(lat>0)%>%
  filter(month %in% 6:8)%>%
  group_by (cls) %>%
  summarise (mean_summer_temp=mean(tmp))

#moremutate
dt <- tibble(
  x = c(1.2, 2.1, 4.2, 2.9, 2.1),
  y = c(0.2, 1.0, 0.3, 0.2, 0.7))
dt
dt %>% mutate(z1 = x/2,
              z2 = log(y),
              z3 = x + y,
              z4 = x * y)

#lead
u <- 1:10
lag(u)
lead(u)
cumsum(u)
cumprod(u)
cummax(u)
cummean(u)

x <- c(9, 1, 2, 3, 1, 4)
min_rank(x)
min_rank(desc(x)) 

percent_rank((x))

#action3
cru
#1
cru%>%
  group_by(cls,northern_hs =lon>0)%>%
  filter(month== 8)%>%
  summarise(mean_aug= mean(tmp))

#sol
cru%>%
  mutate(northern_hs=lat>0)%>%
  group_by(cls, northern_hs)%>%
  filter(month== 8)%>%
  summarise(mean_aug= mean(tmp))
cru
#2
cru
cru%>%
  group_by(year, lon, lat)%>%
  summarise(P_sum= sum(pre), t_mean=mean(tmp))%>%
  mutate(dmi= P_sum/ (t_mean+ 10))%>%
  arrange(abs(lat))
cru
