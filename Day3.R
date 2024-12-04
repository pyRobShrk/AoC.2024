input = file('input2024d3',open='r')
library(stringr)
corrupt = str_c(readLines(input), collapse=' ')
checksum = 0
mul = function(a,b){a*b}
calcs = str_extract_all(corrupt, 'mul\\(\\d{1,3}\\,\\d{1,3}\\)')
for (m in calcs[[1]]){
  checksum = checksum + eval(str2expression(m))
}
print (checksum) #Part 1