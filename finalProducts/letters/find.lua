-- handles user input

function find()											-- This file will handle user input and determine what letter(s) to use, returning to 'letters.lua'

	ins = {}
	for k,v in pairs(lettersTable.inputs) do
		userLetter = tostring(v)
		table.insert(ins, userLetter)
	end
	
	fixt = ins[4]
	userLetter = ins[3]
	
	Printf(" -- From `find.lua`...")
	Printf("ins[1]: " .. ins[1]) -- green
	Printf("ins[2]: " .. ins[2]) -- blue
	Printf("ins[3]: " .. ins[3])
	Printf("ins[4]: " .. ins[4])
	Printf("ins[5]: " .. ins[5]) -- red
	
    userLetter = string.upper(userLetter)
	
end

return find
