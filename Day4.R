input = file('day4input.txt',open='r')
xmasRows = readLines(input)
library (stringr)
chr = function(str,c){substr(str,c,c)}
xmasCt = 0
for (r in 1:length(xmasRows)){
  for (c in 1:nchar(xmasRows[r])){
    across = substr(xmasRows[r],c,c+3)
    if (across == "XMAS" || across == "SAMX"){xmasCt = xmasCt+1}
    if (r < length(xmasRows)-2){
      down = str_c(chr(xmasRows[r],c),chr(xmasRows[r+1],c),chr(xmasRows[r+2],c),chr(xmasRows[r+3],c))
      if (down == "XMAS" || down == "SAMX"){xmasCt = xmasCt+1}
      diagonal = str_c(chr(xmasRows[r],c),chr(xmasRows[r+1],c+1),chr(xmasRows[r+2],c+2),chr(xmasRows[r+3],c+3))
      if (diagonal == "XMAS" || diagonal == "SAMX"){xmasCt = xmasCt+1}
      backdiag = str_c(chr(xmasRows[r],c),chr(xmasRows[r+1],c-1),chr(xmasRows[r+2],c-2),chr(xmasRows[r+3],c-3))
      if (backdiag == "XMAS" || backdiag == "SAMX"){xmasCt = xmasCt+1}
    }
  }
}
print (xmasCt) # Part 1
masXct = 0
for (r in 2:139){
  for (c in 2:139){
    if (chr(xmasRows[r],c) == 'A'){
      diag1 = str_c(chr(xmasRows[r-1],c-1),'A',chr(xmasRows[r+1],c+1))
      diag2 = str_c(chr(xmasRows[r+1],c-1),'A',chr(xmasRows[r-1],c+1))
      test1 = diag1 == 'SAM' || diag1 == 'MAS'
      test2 = diag2 == 'SAM' || diag2 == 'MAS'
      if (test1 && test2){masXct = masXct + 1}
    }
  }
}
print (masXct) # Part 2