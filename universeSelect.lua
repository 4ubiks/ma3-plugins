local function main()
	local title = "Enter the universe to trace: "
	local message = "Universe..."
	local input = TextInput(title, message)
	input = tonumber(input)
	
	if Confirm("Confirmation", input) then
		Printf("OK")
	else
		Printf("Cancel")
	end
	
	
	-- if DMX == nil then
		-- ErrPrintf("The requested universe has not been found, configured, or does not exist.")
		-- return
	-- end 
	
	local fixturesInPatch = GetSubfixtureCount()
	
    local myObjects = ObjectList("Fixture 1 thru ", fixturesInPatch)

    local countFix = 0
    for i=1, #myObjects do
    	--if myObjects[i].at(0) == input
    	local universe = tonumber(string.match(myObjects[i].patch, "^%d+"))
    	if universe == input then
    		countFix = countFix + 1
    		Printf("Address of fixture " ..countFix.. " in universe " ..input.. " = " .. myObjects[i].patch)
    		Cmd(myObjects[i].fid)
    	end	
    end
    
    if (countFix == 0) then
    	ErrPrintf("There are no fixtures currently patched into this universe.")
    	Confirm("This universe is empty.", " ")
    end
	
end

return main