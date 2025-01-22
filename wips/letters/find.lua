-- handles user input

function find()											-- This file will handle user input and determine what letter(s) to use, returning to 'letters.lua'
	for k,v in pairs(lettersTable.inputs) do
		userLetter = tostring(v)
	end
	
	--Printf(userLetter)

	-- creating array to use as global, this is what gets used in main
	lightLetter = {}
	local choice = _G[userLetter] -- global table reference '_G'

	-- maps whatever letter chosen from 'alphabet.lua' to lightLetter
	if choice and type(choice) == "table" then
		for k,v in ipairs(choice) do
			Printf(v)
			table.insert(lightLetter, v)
		end
	end
end

return find
