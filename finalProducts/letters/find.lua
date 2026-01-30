-- handles user input

function find()											-- This file will handle user input and determine what letter(s) to use, returning to 'letters.lua'

	ins = {}
	for k,v in pairs(lettersTable.inputs) do
		userLetter = tostring(v)
		table.insert(ins, userLetter)
	end
	
	-- why does the increment of array change? as of last test, ins[4] is fixture ID and ins[3] is string
	fixt = ins[4]
	userLetter = ins[3]
	
	Printf("From `find.lua`...")
	Printf("Fixture ID: " .. ins[4])
	Printf("User string: "  .. ins[3])
	
    userLetter = string.upper(userLetter)
	
end

return find
