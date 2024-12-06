# ma3-plugins
these are ma3 plugins built in Lua, using Lua and built-in grandMA3 functions




## universeTrace.lua:
The sequel and newly-revised version of `singleUniverse.lua`. This plugin allows you to list every universe you'd like to select, separated by commas. The plugin formats each universe to be selected individually. So, if you want to trace universes 2, 3, and 5, you type `2, 3, 5` into the plugin menu. It will select universes 2, 3, and 5. It returns their addresses with the universe in the standard format. You can also determine whether or not you'd like to enable HiLite or Solo mode when selecting your universes. 

## saveAll.lua:
Allows you to save your showfile to all currently connected drives. Will only list existing drives (ex. with no flash drives plugged in, your only option is `Internal`. With two flash drives, you'll see three options (internal, and your two drives). With three flash drives, you'll see four options (internal, and your three drives). You can select which areas to save to, and don't have to save to every drive if you want. 

## patchOrganize.lua (WIP): 
Plugin will take all objects in the patch, if they are not grouped, create groups for each, and put them into respective groups, while keeping the addresses and universes intact. It's an organizational tool for LDs with a crowded patch

## singleUniverse.lua:
The first rendition of a plugin that selects a universe and traces it, selecting every fixture in the provided universe, and returns their fixture address. This only works for one universe, and input must be formatted a specific way. It's trivial, and not super effective if you want to trace multiple universes, but hey, it was my first plugin I ever wrote. 

## references folder
these plugins are not mine. i did not create them nor do i claim ownership or authorship of them. i use these to help me in building my own. 
