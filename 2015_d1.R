library(stringr)
library(tidyverse)

d1  <- read.table(file = "~/aoc/d1_2015")

str_count(d1, "\\(")-str_count(d1, "\\)")

vec <- as.vector(str_split_fixed(d1, pattern = "", n = nchar(d1)))

tab <- as.data.frame(vec)

tab1 <- tab %>%
  mutate(val = if_else(vec=="(",1,-1)) %>% 
  mutate(tot = cumsum(val))

min(which(grepl(-1, tab1$tot)))
