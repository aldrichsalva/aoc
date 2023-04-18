library(tidyverse)

d1  <- read.table(file = "~/aoc/d1_2021")

depth <- d1 %>% 
  mutate(prev=lag(V1)) %>% 
  mutate(chg=(if_else(V1 > prev, "increased", "decreased")))

table(depth$chg)

depth2 <- d1 %>%
  mutate(V2 = lead(V1),
         V3 = lead(V2),
         V1tot = V1 + V2 + V3,
         prev = lag(V1tot),
         chg=(if_else(V1tot > prev, "increased", "decreased")))

table(depth2$chg)
