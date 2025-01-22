-- this plugin will display a letter on a Ayrton MagicPanel fixture! Only works on that one, currently. 
-- Can display any english letter `A - Z, uppercase only` on a fixture! A quick way to get letters :)
-- uses two files: 'letters.lua', and 'alphabet.lua'

-- This file holds main

local function main()

	alphabet() 	-- calls 'alphabet.lua', storing each letter's values
	call()		-- calls 'call.lua', gets user input and desired letter
	find()		-- calls 'find.lua', handles user input and returns letter array

	Cmd("Fixture 301 at Full")
	
	for i=1, #A do
		Printf(A[i])
	end

	letterTestA = lightLetter

	-- 'values' stores an integer value of each letter being used
	values = {0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
  	 	  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0}

	-- multi-instance parent fixture set full
	Cmd("Fixture 301 at Full")

	local setVal = 0

	-- setting each value in 'values' matrix
	for i=1, #letterTestA do
		if letterTestA[i] == '1' then
			setVal = 100
			values[i] = setVal
		else 
			setVal = 0
			values[i] = setVal
		end
	end

	-- stores each instance at the necessary value
	for j=1, #letterTestA do
		local val = "Fixture 301." .. j .. " at " .. values[j]
		Cmd(val)
	end
	
end

return main
