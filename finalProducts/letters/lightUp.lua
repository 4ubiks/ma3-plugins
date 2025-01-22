function light(letter, fixture)

    FID =0
	FID = fixture
	atFull = "Fixture "
	atFull = atFull .. FID .. " at Full"	

    -- creating array to use as global, this is what gets used in main
	lightLetter = {}
	local choice = _G[letter] -- global table reference '_G'

	-- maps whatever letter chosen from 'alphabet.lua' to lightLetter
	if choice and type(choice) == "table" then
		for k,v in ipairs(choice) do
			table.insert(lightLetter, v)
		end
	end

	-- 'values' stores an integer value of each letter being used
	values = {0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
  	 	  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0}

		  
	-- setting each value in 'values' matrix
	local setVal = 0
	for i=1, #lightLetter do
		if lightLetter[i] == '1' then
			setVal = 100
			values[i] = setVal
		else 
			setVal = 0
			values[i] = setVal
		end
	end


	-- multi-instance fixture at full
	Cmd(atFull)
	-- stores each instance at the necessary value
	for j=1, #lightLetter do
		local val = "Fixture " .. FID .. "." .. j .. " at " .. values[j]
		Cmd(val)
	end
end

return light