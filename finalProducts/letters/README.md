# 'letters' Plugin Summary
most are globals, just due to the nature of the MA3 ide

## Summary:
There are a few conditions that haven't been fully resolved, *please be mindful of any user errors!* You must have enough fixtures as is the length of string you wish to use. For example, `hello` uses 5 characters. So, you must be using 5 lights, patched in order to do this. The plugin takes the starting fixtureID and increments by 1 for each light. The fixtures displaying `hello` must be 1, 2, 3, 4, 5, for example, or 10, 11, 12, 13, 14. I'm definitely going to make this more advanced as time goes on, so stay tuned for that! The fixtures also *must* be using a 6x6 color grid! It will likely still work, technically, if they are not, but it won't look very good. This one was a ton of fun to make, and I'm quite pleased with the outcome. Have fun!


# `letters.lua`:
`FID`: holds fixture ID in main
`atFull`: a string, runs the command to bring selected fixture to full
`letterTestA`: the matrix of a letter to turn on
`values`: an empty value array to be manipulated
`setVal`: sets the value, 0 or 100, for light


# `alphabet.lua`:
none

# `find.lua`:
`ins`: both inputs from popup menu, fixtureID and letter seq
`userLetter`= string from popup menu
`fixt`: fixture ID from popup menu

`lightLetter`: value array built from input, fed into main
`choice`: matches input to the arrays in `alphabet.lua`

## Version History

## v1.2.2.0
Rewrote `find.lua` to support `ipairs` iterations and ensure a consistent ordering of table attributes
```lua
-- Old:
ins[1] = attribute1
ins[2] = attribute2
ins[3] = attribute3
-- problem, ordering could vary

-- New:
fixtureTable["RGB_R"] = RedAttribute
fixtureTable["RGB_G"] = GreenAttribute
fixtureTable["RGB_B"] = BlueAttribute
-- ensures order is always the same for `lightUp.lua`

```

## v1.2.1.0
Added print debug statements for the `ins[]` array

# v1.2.0.0
Implemented Chauvet MK3 Wash support

# v1.1.0.0
Implemented first draft of color selection (manual RGB selection)

# v1.0.0.0
First publication of plugin