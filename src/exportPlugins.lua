-- exports all functions to drive 2 (my flash drive)
-- author: jack harris
local function main()
	Cmd("Select Drive 2")
	Cmd("Export Plugin 2 /File 'universeTrace'")
	Cmd("Export Plugin 3 /File 'SaveToAllDrives'")
	Cmd("Export Plugin 4 /File 'ReturnPatchInfo'")
	Cmd("Export Plugin 5 /File 'letters'")
	Cmd("Export Plugin 6 /File 'exportPlugins'")
end

Cmd("Select Drive 1")
return main