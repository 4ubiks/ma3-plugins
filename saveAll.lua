local function main()
	--CmdIndirect("Select Drive 2")
	--Cmd("SaveShow 'plugins'")
	
	local showName = (Root().MAnetSocket.Showfile)
	
	
	local states = {}
	
	local myObjects = ObjectList('Drive Thru')
	for i = 1, #myObjects do
		if (myObjects[i].drivetype == 'Internal' or myObjects[i].drivetype == 'Removeable') then
			local cD = myObjects[i].co
			Printf('Drive '..myObjects[i].no..' = '..myObjects[i].drivetype)
			table.insert(states, {name=myObjects[i].name..' ('..myObjects[i].drivetype..')', state=true, group=i})
		end
	end
	
	
	local inputs = {
	{name = "File Name: ", value="myshow.show"}
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
	
	local j = 1
	for k,v in pairs(resultTable.states) do
		if (tostring(v) == 'true') then
			if (myObjects[j].drivetype == 'Internal' or myObjects[j].drivetype == 'Removeable') then
				local cD = myObjects[j].no
				Cmd("Select Drive " .. cD)
				Cmd("SaveShow " .. showName)
			end
		end
	end
	
end

return main