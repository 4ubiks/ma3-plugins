# 'letters' Plugin Summary
Takes a user input string and displays the text on a series of alike light fixtures. A really simple and quick way to display words or something fun to interact with an audience. Currently supports `Ayrton MagicPanel 602` and `Chauvet MK3 Wash`. More to come. 

There are a few conditions that haven't been fully resolved, *please be mindful of any user errors!* You must have enough fixtures as is the length of string you wish to use. For example, `hello` uses 5 characters. So, you must be using 5 lights, patched in order to do this. The plugin takes the starting fixtureID and increments by 1 for each light. The fixtures displaying `hello` must be FID 1, 2, 3, 4, 5, for example, or FID 10, 11, 12, 13, 14. This one was a ton of fun to make, and I'm quite pleased with the outcome. Have fun!


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

## In Dev: `v1.2.3.0`
Adding support for ClayPaky B-Eye K20 fixtures

## Next bug:
Switching between fixture types produces garbage on fixtures. After one run of plugin and seeing trash output, it'll work. But it takes one round of looking weird until it works.

# Version History

## v1.2.2.0
Rewrote `find.lua` to support `ipairs` iterations and ensure a consistent ordering of table attributes
```lua
-- Old:
ins[1] = attribute1
ins[2] = attribute2
ins[3] = attribute3
-- problem, ordering could vary. `pairs` isn't order-specific, so ins[1] could end up attribute2. google 'lua pairs vs ipairs'

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
