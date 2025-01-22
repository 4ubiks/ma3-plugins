-- popup menu for the plugin

function call()

	--local states = {
	--{name = "Internal Drive", state=true, group=1},
	--{name = "Drive 2", state=true, group=2},
	--{name = "Drive 3", state=true, group=3}
--}
	
	inputs = {
	
	{name = "Starting Fixture ID", value="101", whiteFilter="0123456789"},
	{name = "Letter Sequence ", value="helloworld", whiteFilter="ABCDEFGHIJKLMNOPQRSTUVWXYZ,"}
}

	lettersTable=
		MessageBox(
		{
			title= "Letters on Fixtures",
			message="Enter the sequence of letters to display",
			message_align_h = Enums.AlignmentH.Left,
			message_align_v = Enums.AlignmentV.Top,
			commands = {{value = 1, name="Enter Values"}, {value=0, name="Cancel"}},
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

return call