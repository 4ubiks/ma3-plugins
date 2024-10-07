local function main()

	local states = {
	{name = "HiLight", state=true, group=1},
	{name = "Solo", state=true, group=2}
}
	
	local inputs = {
	{name = "Universe: ", value="5...", whiteFilter="0123456789, "}
}
	local selectors={
	{ name = "Swipe selector", selectedValue=2, values={["Triggers"]=2}, type=0}	
}
	
	-- message box
	local resultTable=
		MessageBox(
		{
			title= "Universe Selection",
			message="Seect your universes, separated by comma, if multiple.",
			message_align_h = Enums.AlignmentH.Left,
			message_align_v = Enums.AlignmentV.Top,
			commands = {{value = 1, name="OK"}, {value=0, name="Cancel"}},
			states=states,
			inputs=inputs,
			selectors=selectors,
			backColor= "Global.Default",
			icon="logo_small",
			messageTextColor= "Global.Text",
			autoCloseOnInput= true
		}
	)
		
	-- prints input values
	for k,v in pairs(resultTable.inputs) do
		--Printf("Input '%s' = '%s'", k,tostring(v))
		inp = tostring(v)
	end
	
	-- prints inputted values
	--for k,v in pairs(resultTable.states) do
		--Printf("State '%s' = '%s'", k,tostring(v))
	--end
	
	
	-- hilight and solo toggle
	for k,v in pairs(resultTable.states) do
		
		-- trigger hilight
		if (k == 'HiLight') then
			if (tostring(v) == 'true') then
				Cmd("Highlight On Selection")
			else
				Cmd("Highlight Off Selection")
			end
		end
		
		
		-- trigger solo		
		if (k == 'Solo') then
			if (tostring(v) == 'true') then
				Cmd("Solo On Selection")
			else
				Cmd("Solo Off Selection")
			end
		end
	end
	
	
	-- parse out commas from list, separate by whitespace
	final = inp:gsub("%s*,%s*", " ")
	
	
	-- Now, get to getting universe info
	
	local fixturesInPatch = GetSubfixtureCount()
	
	for i=1, #final do
		if (final:sub(i, i) ~= " ") then
			currentUniverse = tonumber(final:sub(i, i))
			Printf("")
			Printf("--------------------------------------------")
			Printf("----------------Universe " .. currentUniverse .. "------------------")
			
			myObjects = ObjectList("Fixture 1 thru ", fixturesInPatch)
			countFix = 0
			
			for j=1,#myObjects do
				uni = tonumber(string.match(myObjects[j].patch, "^%d+"))
				if (uni == currentUniverse) then
					countFix = countFix + 1
					Printf("Address of Fixture " .. myObjects[j].fid .. " in universe " .. currentUniverse .. " = " .. myObjects[j].patch)
					Cmd(myObjects[j].fid)
				end
			end
			
			-- empty universe check
			if (countFix == 0) then
				ErrPrintf("Universe " .. currentUniverse .. " appears to be empty. Double check your patch, and try again. ")
			end
		end
	end	
end

return main