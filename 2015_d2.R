library(stringr)
library(tidyverse)

gift <- read.table(file = "~/aoc/d2_2015")

f <- function(x,n) x[order(x)[n]]

meas <- as.data.frame(str_split_fixed(gift$V1, "x", 3)) %>% 
  mutate(l=as.numeric(V1),
         w=as.numeric(V2),
         h=as.numeric(V3)) %>% 
  mutate(lw = 2*l*w,
         wh = 2*w*h,
         hl = 2*h*l) %>% 
  mutate(area = lw + wh + hl + pmin(lw,wh,hl)/2) %>% 
  rowwise() %>%
  mutate(lowest = f(c_across(l:h),1),
         second_lowest = f(c_across(l:h),2)) %>% 
  mutate(rib = 2*lowest+2*second_lowest+(l*w*h))
  
sum(meas$area)
sum(meas$rib)
