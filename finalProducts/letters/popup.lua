-- popup menu for the plugin

function call()	
	-- each field for user input
	inputs = {
		{name = "Starting Fixture ID", value="301", whiteFilter="0123456789"},
		{name = "Letter Sequence ", value="helloworld", whiteFilter="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"},
		{name = "Fixture Red ", value="100", whiteFilter="1234567890"},
		{name = "Fixture Green", value="100", whiteFilter="1234567890"},
		{name = "Fixture Blue ", value="100", whiteFilter="12345667890"}
	}
	-- popup structure, stored as a class object 'lettersTable'
	lettersTable=
		MessageBox(
		{
			title= "Letters on Fixtures",
			message="Enter the fixture info and character string below.",
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
