# ma3-plugins
these are ma3 plugins built in Lua, using Lua and built-in grandMA3 functions


## universeSelect.lua:
This gets one universe as the input from the user, selects every fixture within that universe, and prints each fixture's DMX address to the console. The input only allows for one integer as input, for now. 

## patchOrganize.lua (WIP): 
Plugin will take all objects in the patch, if they are not grouped, create groups for each, and put them into respective groups, while keeping the addresses and universes intact. It's an organizational tool for LDs with a crowded patch

## popupMenu.lua:
An extension of the `universeSelect.lua` plugin, basically a scaled-up version. Allows for multiple universe input, and you can enable/disable highlight and solo for your selection. Functionally, very similar to `universeSelect.lua`.  

## references folder
these plugins are not mine. i did not create them nor do i claim ownership or authorship of them. i use these to help me in building my own. 