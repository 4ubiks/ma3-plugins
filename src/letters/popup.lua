-- popup menu for the plugin

function call()	

	local states = {}
	
	table.insert(states, {name="Chauvet MK3 Wash", state=false, group=1, value=1})
	table.insert(states, {name="Ayrton MagicPanel", state=false, group=1, value=1})

	-- each field for user input
	inputs = {
		{name = "FixtureStartingID", value="301", whiteFilter="0123456789"},
		{name = "StringToDisplay", value="helloworld", whiteFilter="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"},
		{name = "FixtureRGB_R", value="100", whiteFilter="1234567890"},
		{name = "FixtureRGB_G", value="100", whiteFilter="1234567890"},
		{name = "FixtureRGB_B", value="100", whiteFilter="12345667890"}
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
			states=states,
			--selectors=selectors,
			backColor= "Global.Default",
			icon="logo_small",
			messageTextColor= "Global.Text",
			autoCloseOnInput= true
		}
	)
	
	-- temporary, this should be cleaned up later.
	selectedFixture = 0
	for k,v in pairs(lettersTable.states) do
		if (tostring(v) == 'true') then
			if (k == 'Chauvet MK3 Wash') then
				selectedFixture = 1
			end
		end
	end
	
	
				
end

return call
