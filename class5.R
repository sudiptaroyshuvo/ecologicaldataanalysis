library(tidyverse)

temp <- read_csv("ZonAnn.Ts.csv")
select(temp, Year, Glob, NHem, SHem)
select(temp, Year:SHem)
select(temp, -SHem)


#Helper functions to assist with variable selection:
  
#starts_with(), ends_with(): select variables starting or ending with string
#contains(): select variables containing string
#matches(): select with regular expression
#num_range(): select by numeric positions

select(temp, Year, contains("-"))

#renaming
select(temp, year = Year, temp = Glob)
rename(temp, year = Year, temp = Glob)

#Action1

temp_red <- select(temp, Year, NHem, SHem)
temp_red <- select(temp, Year, `64N-90N`, `90S-64S`)
temp_red

#mutate()

temp_red <- select(temp, Year, NHem, SHem)
mutate(temp_red, hemisphere_diff = NHem - SHem)

#action2
temp_red <- select (temp, Year, Glob)
temp_red<- mutate(temp_red, positive_anom= Glob>0)
temp_red

filter (temp_red, positive_anom == TRUE)

#summarise
summarise(temp, mean_nh = mean(NHem))
summarise(temp, max_anom = max(Glob))

#Real power comes from grouping!

toy <- tibble(
  year = c(1962, 1963, 1973, 1974, 1981,
           1982, 1990, 1991, 2008, 2009),
  temp = c(0.02, 0.02, 0.22, -0.04, 0.44,
           0.14, 0.54, 0.53, 0.65, 0.79),
  volcano = rep(c("no_eruption", "eruption"), 5)
)

toy
toy_group <- group_by(toy, volcano)
toy_group
summarise(toy_group, mean_anom = mean(temp))

temp_time <- mutate(temp, after_1960 = Year > 1960)
temp_time
temp_time_group <- group_by(temp_time, after_1960)
temp_time_group

summarise(temp_time_group, max_anom = max(Glob))

#pipelines

#calling functions
z <- c(0.2, 0.4, 0.3, 2, 0.7)
z_mean <- mean(z, trim = 0.2)
z_mean
#nestingfunction
log(z_mean, base = 3)

log(mean(c(0.2, 0.4, 0.3, 2, 0.7), trim= 0.2), base=3)

#task
#compu the differences between temp anomalies in the northern vs southern HS but only
#for this time after 1980
#ans without pipes
temp_filter <- filter(temp, Year > 1980)
temp_select <- select(temp_filter, Year:SHem)
temp_mutate <- mutate(temp_select,
                      hemisph_diff = NHem - SHem)

temp_mutate

temp_mutate <- mutate(
  select(
    filter(
      temp, Year > 1980),
    Year:SHem),
  hemisph_diff = NHem - SHem)
#pipes
temp %>%
  select(Year, NHem, SHem)%>%
  filter(Year > 1980) %>%
mutate(hs_diff = NHem - SHem)

#temp is already piped no need to write it in the bracket

#action3
temp
temp %>%
  select(Year, NHem, SHem)%>%
  filter(Year >= 1950) %>%
  mutate( Before_1980= Year < 1980, After_1980= Year >1980)%>%
  mutate(temp_anom= NHem- SHem)%>%
  summarise(Before_1980, After_1980)
         

#solution
temp
temp %>%
  select(Year, NHem, SHem)%>%
  filter(Year >= 1950) %>%
  mutate(Before_1980= Year <1980) %>%
  group_by(Before_1980) %>%
  mutate(hs_diff= NHem- SHem)%>%
  summarise(mean_hs_diff = mean(hs_diff))

         
#newdataset
cli <- read_csv("cru_kg.csv")
cli

#action 4
#1.
cli %>% 
  filter(month == 7, cls == "Cfb") %>% 
  summarise(meanCfb = mean(tmp))

#2. 
cli %>% 
  filter(month == 7) %>% 
  group_by(cls) %>% 
  summarise(meanTmp = mean(tmp))

#3.
cli%>%
  filter(cls %in% c("Cfb","Cfc","Dfb","Dfc")) %>% 
  filter(month %in% 6:8) %>% 
  filter(lat>0) %>% 
  group_by(cls) %>% 
  summarise(tmean= mean(tmp))

cli %>%
  filter(cls %in% c("Cfb", "Cfc", "Dfb", "Dfc")) %>% 
  filter(month %in% 6:8) %>% 
  filter(lat > 0) %>% 
  group_by(cls) %>% 
  summarise(tmean = mean(tmp))
