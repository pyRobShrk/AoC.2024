input = file('example.txt',open='r')
data = readLines(input)
library(stringr)
readvec = function(s){
  eval(str2expression(str_c( 'c(', s, ')')))
}
