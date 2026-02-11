function light(letter, fixture)

    FID =0
	FID = fixture
	atFull = "Fixture "
	Printf("Fixture ID: " .. FID)
	atFull = atFull .. FID .. " at Full"	

    -- creating array to use as global, this is what gets used in main
	lightLetter = {}
	local choice = _G[letter] -- global table reference '_G'

	-- maps whatever letter chosen from 'alphabet.lua' to lightLetter
	-- k: subfixture grid
	-- v: letter array '1' or '0'
	if choice and type(choice) == "table" then
		for k,v in ipairs(choice) do
			table.insert(lightLetter, v)
		end
	end

	-- 'values' stores an integer value of each letter being used
	magicpanelValues = {0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
  	 	  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0,
		  0, 0, 0, 0, 0, 0}

	mkWashValues = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, 0}
					
	-- setting each value in 'values' matrix
	local setVal = 0
	for i=1, #lightLetter do
		if lightLetter[i] == '1' then
			setVal = 100
			magicpanelValues[i] = setVal
		else 
			setVal = 0
			magicpanelValues[i] = setVal
		end
	end	

	-- multi-instance fixture at full
	Cmd(atFull)
	-- stores each instance at the necessary value
	for j=1, #lightLetter do
		local val = "Fixture " .. FID .. "." .. j .. " at " .. magicpanelValues[j]
		Cmd(val)
	end
	
	Cmd("Fixture " .. FID)
	-- set color for light
	Cmd("Attribute ColorRGB_R at " .. fixtureInfoTable["FixtureRGB_R"])
	Cmd("Attribute ColorRGB_G at " .. fixtureInfoTable["FixtureRGB_G"])
	Cmd("Attribute ColorRGB_B at " .. fixtureInfoTable["FixtureRGB_B"])
	Cmd("Clear")
end

return light