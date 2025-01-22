# overview of variables and what they do
most are globals, just due to the nature of the MA3 ide

# `letters.lua`:
FID: holds fixture ID in main
atFull: a string, runs the command to bring selected fixture to full
letterTestA: the matrix of a letter to turn on
values: an empty value array to be manipulated
setVal: sets the value, 0 or 100, for light

# `alphabet.lua`:
none

# `find.lua`:
ins: both inputs from popup menu, fixtureID and letter seq
userLetter= string from popup menu
fixt: fixture ID from popup menu

lightLetter: value array built from input, fed into main
choice: matches input to the arrays in `alphabet.lua`
