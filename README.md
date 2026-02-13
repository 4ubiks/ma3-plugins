# ma3-plugins
These are ma3 plugins built in Lua, using Lua syntax and built-in grandMA3 functions to help optimize console efficiency

# src/
## universeTrace.lua (v1.1.0.0)
The sequel and newly-revised version of `singleUniverse.lua`. This plugin allows you to list every universe you'd like to select, separated by commas. The plugin formats each universe to be selected individually. So, if you want to trace universes 2, 3, and 5, you type `2, 3, 5` into the plugin menu. It will select universes 2, 3, and 5. It returns their addresses with the universe in the standard format. You can also determine whether or not you'd like to enable HiLite or Solo mode when selecting your universes. 
<br>
<br>

## letters/ (v1.2.1.0)
This is a directory housing a plugin that takes a user's input string and displays the text on multi-instance fixtures with a 6x6 color grid. 
Currently supports `Ayrton MagicPanel 6x6` fixtures and `Chauvet MK3 Wash` fixtures. 

## saveAll.lua (v1.2.0.0)
Allows you to save your showfile to all currently connected drives. Will only list existing drives (ex. with no flash drives plugged in, your only option is `Internal`. With two flash drives, you'll see three options (internal, and your two drives). With three flash drives, you'll see four options (internal, and your three drives). You can select which areas to save to, and don't have to save to every drive if you want. It also re-selects Drive 1 (internal) at the very end, so you don't accidentally save things elsewhere. 
<br>
<br>

## patchInfo.lua (v1.0.0.0)
Generates a report of every fixture in your patch, including each fixture's manufacturer, model, and patch mode. This will all be printed to an external .txt document. You'll have to adjust the file path to meet the specifications of your system and what works best for you. Include this on line 3, rewriting `"report.txt"` as `"/path/to/the/file/report.txt"`. The only indication of this plugin being run is a return in your command line history and system monitor, indicating that the respective plugin has run. Efficient tool for generating a quick, concise summary of your showfile's patch. 
<br>
<br>

## exportPlugins.lua (v1.0.0.0)
A plugin I wrote catered towards my environment, but it just exports all my plugins to an external drive at once. It got tedious trying to ensure my flash drives always had the latest version, it's a quick fix. Not a complex plugin. If you use, make sure you have an external drive plugged in. Otherwise they just save to your internal disk. 
<br>
<br>

# Legacy Plugins
## singleUniverse.lua:
Selects a single universe, and traces each fixture that exists inside it. Returns fixture ID and patch information. WOrks for a single universe at a time, ideal for quick traces and small troubleshooting. Precursor to `universeTrace.lua`.
<br>
<br>
