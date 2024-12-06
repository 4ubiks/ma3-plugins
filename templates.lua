local function main()
	--CmdIndirect("Select Drive 2")
	--Cmd("SaveShow 'plugins'")
	
	
	local states = {
	{name = "Internal Drive", state=true, group=1},
	{name = "Drive 2", state=true, group=2},
	{name = "Drive 3", state=true, group=3}
}
	
	local inputs = {
	{name = "File Name: ", value="myshow.show", whiteFilter="0123456789, "}
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
			commands = {{value = 1, name="Close Without Saving"}, {value=0, name="Save to Drives"}},
			states=states,
			inputs=inputs,
			--selectors=selectors,
			backColor= "Global.Default",
			icon="logo_small",
			messageTextColor= "Global.Text",
			autoCloseOnInput= true
		}
	)
	
end

return main