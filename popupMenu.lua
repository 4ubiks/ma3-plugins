local function main()

	local states = {
	{name = "HiLight", state=true, group=1},
	{name = "Solo", state=true, group=2}
}
	
	local inputs = {
	{name = "Universe: ", value="5...", whiteFilter="0123456789 "}
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
		Printf("Input '%s' = '%s'", k,tostring(v))
	end
	
	-- prints inputted values
	for k,v in pairs(resultTable.states) do
		Printf("State '%s' = '%s'", k,tostring(v))
	end
	
	
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
			
	
end

return main