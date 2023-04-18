library(tidyverse)

d1  <- read.table(file = "~/aoc/d1_2022", blank.lines.skip = FALSE)

cal <- d1 %>% 
  group_by(grp = cumsum(is.na(V1))) %>%
  na.omit() %>% 
  summarise(total = sum(V1))

top <- cal %>% slice_max(total, n = 3)

sum(top$total)
