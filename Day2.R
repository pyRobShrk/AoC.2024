input = file('input2024day2.txt',open='r')
lines = readLines(input)
library(stringr)
safe = 0
safe2 = 0
for (ln in lines){
  vals = as.numeric(unlist(str_split(ln,' ')))
  diffs = diff(vals)
  cond1 = min(diffs) > 0 || max(diffs) < 0
  cond2 = max(abs(diffs)) < 4
  if (cond1 && cond2){
    safe = safe + 1
  }
  else { #Problem Dampener
    dampen = FALSE
    for (omit in -1:-length(vals)){
      diffs = diff(vals[omit])
      cond1 = min(diffs) > 0 || max(diffs) < 0
      cond2 = max(abs(diffs)) < 4
      if (cond1 && cond2){
        dampen = TRUE
      }
    }
    if (dampen){
      safe2 = safe2 + 1}
  }
}
print (safe) #Part 1
print (safe + safe2) #Part 2