-- handles user input

function find()											-- This file will handle user input and determine what letter(s) to use, returning to 'letters.lua'

	ins = {}
	for k,v in pairs(lettersTable.inputs) do
		userLetter = tostring(v)
		table.insert(ins, userLetter)
	end
	
	fixt = ins[1]
	userLetter = ins[4]
    userLetter = string.upper(userLetter)
	
end

return find
