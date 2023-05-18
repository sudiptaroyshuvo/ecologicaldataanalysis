library(tidyverse)
mb <- read_csv2("FoG_MB_302.csv", skip = 13)
mb<- mb %>% 
  select(SURVEY_YEAR, WINTER_BALANCE, SUMMER_BALANCE, ANNUAL_BALANCE) %>% 
  rename(Year= SURVEY_YEAR)
mb

#4
mb %>% 
  gather(WINTER_BALANCE, SUMMER_BALANCE, ANNUAL_BALANCE, Year) %>% 

mb %>%
  gather(season, WINTER_BALANCE, SUMMER_BALANCE, ANNUAL_BALANCE, -Year) %>% 
  ggplot(aes(x = YEAR, y = season)) +
  geom_line(aes(colour = season)) 
