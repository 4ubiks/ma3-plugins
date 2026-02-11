local function main()
	local showName = (Root().MAnetSocket.Showfile)
	
	local states = {}
	
	local myObjects = ObjectList('Drive Thru')
	for i = 1, #myObjects do
		if (myObjects[i].drivetype == 'Internal') then
			--Printf('Drive '..myObjects[i].no..' ('..myObjects[i].name..') = '..myObjects[i].drivetype)
			table.insert(states, {name=myObjects[i].name, state=true, group=i, value=i})
			
		elseif (myObjects[i].drivetype == 'Removeable') then
			table.insert(states, {name=myObjects[i].name, state=true, group=i})
			--Printf('Drive '..myObjects[i].no..' ('..myObjects[i].name..') = '..myObjects[i].drivetype)
		end
	end
	
	
	local inputs = {
	{name = "File Name: ", value=showName .. ".show"}
}
	--local selectors={
	--{ name = "Swipe selector", selectedValue=2, values={["Triggers"]=2}, type=0}	
--}
	
	-- message box
	local resultTable=
		MessageBox(
		{
			title= "Save To Drives",
			message="Save your show to whatever drives you would like, all at once!",
			message_align_h = Enums.AlignmentH.Left,
			message_align_v = Enums.AlignmentV.Top,
			commands = {{value = 1, name="Save to Selected Drives"}, {value=0, name="Quit Without Saving"}},
			states=states,
			inputs=inputs,
			--selectors=selectors,
			backColor= "Global.Default",
			icon="logo_small",
			messageTextColor= "Global.Text",
			autoCloseOnInput= true
		}
	)
	
	-- determine whether the table was completed or not
	if resultTable.success then
		if resultTable.result == 0 then
			return
		end
	end
	
	
	
	--only save checked drives 
	for k,v in pairs(resultTable.states) do
		if (tostring(v) == 'true') then
			if (k == 'Internal') then
				Cmd('Select Drive 1')
				Cmd('SaveShow '..showName)
			else
				--Printf(k)
				Cmd('Select Drive '..k)
				Cmd('SaveShow '..showName)
			end
		end
	end
	
	-- Return to internal drive
	Cmd('Select Drive 1')
	
end

return main 
