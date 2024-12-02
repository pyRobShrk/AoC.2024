d1 = read.fwf('input2024day1.txt',c(5,3,5), col.names=c('One','z','Two'))
col1 = d1[order(d1[['One']]),'One']
col2 = d1[order(d1[['Two']]),'Two']
print (sum(abs(col2-col1))) # Part 1
freq = function(val){sum(col2 == val)}
library(purrr)
print (sum(col1*map_vec(col1,freq))) #Part 2, requires library(purrr)