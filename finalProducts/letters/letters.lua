-- this plugin will display a letter on a Ayrton MagicPanel fixture! Only works on that one, currently. 
-- Can display any english letter `A - Z, uppercase only` on a fixture! A quick way to get letters :)
-- uses two files: 'letters.lua', and 'alphabet.lua'

-- This file holds main

local function main()
	message()   -- calls the popup message for user
	
	-- calls the respective alphabet function for the selected fixture
	if (selectedFixture == 1) then
		mkAlphabet() 	
	else
		magicpanelAlphabet()
	end
	
	call()		-- calls 'call.lua', gets user input and desired letter
	find()		-- calls 'find.lua', handles user input and returns letter array

	local fixID = fixt
	-- `light()` does most of the calculations
	for i=1, #userLetter do
		light(string.sub(userLetter, i, i), fixID)
		fixID= fixID + 1
	end
end

return main
