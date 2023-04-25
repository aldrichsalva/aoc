tail(cumsum(read.table(file = "~/aoc/d1_2018")$V1),n=1)

n <- 140
freq <- do.call("rbind", replicate(n, read.table(file = "~/aoc/d1_2018"), simplify = FALSE))

freq2 <- freq %>% 
  mutate(sum=cumsum(V1),
         dup = if_else(duplicated(sum)==TRUE, "Y","N")) %>% 
  filter(dup=="Y")

head(freq2)

