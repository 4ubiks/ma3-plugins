-- popup menu for the plugin

function call()	
	-- each field for user input
	inputs = {
		{name = "Starting Fixture ID", value="101", whiteFilter="0123456789"},
		{name = "Letter Sequence ", value="helloworld", whiteFilter="ABCDEFGHIJKLMNOPQRSTUVWXYZ,"}
	}
	-- popup structure, stored as a class object 'lettersTable'
	lettersTable=
		MessageBox(
		{
			title= "Letters on Fixtures",
			message="Enter the sequence of letters to display",
			message_align_h = Enums.AlignmentH.Left,
			message_align_v = Enums.AlignmentV.Top,
			commands = {{value = 1, name="Enter Values"}, {value=0, name="Cancel"}},
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
