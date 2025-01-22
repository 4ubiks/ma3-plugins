# ma3-plugins
these are ma3 plugins built in Lua, using Lua and built-in grandMA3 functions

## *Please, notify me with any bugs/errors in the `issues` tab!*

## All completed plugins are stored in the $${\color{purple}finalProducts}$$ directory
*note - DO NOT expect any plugins outside of that directory to work, at all.*

## $${\color{grey}universeTrace.lua:}$$
The sequel and newly-revised version of `singleUniverse.lua`. This plugin allows you to list every universe you'd like to select, separated by commas. The plugin formats each universe to be selected individually. So, if you want to trace universes 2, 3, and 5, you type `2, 3, 5` into the plugin menu. It will select universes 2, 3, and 5. It returns their addresses with the universe in the standard format. You can also determine whether or not you'd like to enable HiLite or Solo mode when selecting your universes. 
<br>
<br>

## $${\color{grey}letters}$$
This is a directory housing a plugin that takes a user's input string and displays the text on multi-instance fixtures with a 6x6 color grid. There are a few conditions that haven't been fully resolved, *please be mindful of any user errors!* You must have enough fixtures as is the length of string you wish to use. For example, `hello` uses 5 characters. So, you must be using 5 lights, patched in order to do this. The plugin takes the starting fixtureID and increments by 1 for each light. The fixtures displaying `hello` must be 1, 2, 3, 4, 5, for example, or 10, 11, 12, 13, 14. I'm definitely going to make this more advanced as time goes on, so stay tuned for that! The fixtures also *must* be using a 6x6 color grid! It will likely still work, technically, if they are not, but it won't look very good. This one was a ton of fun to make, and I'm quite pleased with the outcome. Have fun!

## $${\color{grey}saveAll.lua:}$$
Allows you to save your showfile to all currently connected drives. Will only list existing drives (ex. with no flash drives plugged in, your only option is `Internal`. With two flash drives, you'll see three options (internal, and your two drives). With three flash drives, you'll see four options (internal, and your three drives). You can select which areas to save to, and don't have to save to every drive if you want. It also re-selects Drive 1 (internal) at the very end, so you don't accidentally save things elsewhere. 
<br>
<br>

## $${\color{grey}patchInfo.lua:}$$
Generates a report of every fixture in your patch, including each fixture's manufacturer, model, and patch mode. This will all be printed to an external .txt document. You'll have to adjust the file path to meet the specifications of your system and what works best for you. Include this on line 3, rewriting `"report.txt"` as `"/path/to/the/file/report.txt"`. The only indication of this plugin being run is a return in your command line history and system monitor, indicating that the respective plugin has run. Efficient tool for generating a quick, concise summary of your showfile's patch. 
<br>
<br>

# Unfinished Plugins
## $${\color{grey}patchOrganize.lua (WIP):}$$
Plugin will take all objects in the patch, if they are not grouped, create groups for each, and put them into respective groups, while keeping the addresses and universes intact. It's an organizational tool for LDs with a crowded patch
<br>
<br>
## $${\color{grey}singleUniverse.lua:}$$
The first rendition of a plugin that selects a universe and traces it, selecting every fixture in the provided universe, and returns their fixture address. This only works for one universe, and input must be formatted a specific way. It's trivial, and not super effective if you want to trace multiple universes, but hey, it was my first plugin I ever wrote. 
<br>
<br>
## $${\color{grey}smalls.lua:}$$
Just small code snippets that do little, but important things. An example, I saved the line of code that returns the name of the current showfile. 
<br>
<br>
## $${\color{grey}testZone.lua:}$$
When building applications, you sometimes need to test small parts of it. That is to be done here. I do not save anything I want to remember long-term in here. 
<br>
<br>
## $${\color{grey}references folder:}$$
these plugins are not mine. i did not create them nor do i claim ownership or authorship of them. i use these to help me in building my own. 
