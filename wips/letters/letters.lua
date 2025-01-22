-- this plugin will display a letter on a Ayrton MagicPanel fixture! Only works on that one, currently. 
-- Can display any english letter `A - Z, uppercase only` on a fixture! A quick way to get letters :)
-- uses two files: 'letters.lua', and 'alphabet.lua'

-- This file holds main

local function main()

	alphabet()
	
	call()
	
	find()
	
	
	Cmd("Fixture 301 at Full")
	
	for i=1, #A do
		Printf(A[i])
	end

	letterTestA = lightLetter

	values = {0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0,
			  0, 0, 0, 0, 0, 0}

	Cmd("Fixture 301 at Full")

	local setVal = 0
	
	for i=1, #letterTestA do
		if letterTestA[i] == '1' then
			setVal = 100
			values[i] = setVal
		else 
			setVal = 0
			values[i] = setVal
		end
	end
	
	for j=1, #letterTestA do
		local val = "Fixture 301." .. j .. " at " .. values[j]
		Cmd(val)
	end
	
end

return main
