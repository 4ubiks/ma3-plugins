-- handles user input

function find()											-- This file will handle user input and determine what letter(s) to use, returning to 'letters.lua'

	fixtureInfoTable = {}
	
	for k,v in pairs(lettersTable.inputs) do
		if tostring(k) == "FixtureStartingID" then
			fixtureInfoTable["fixtureID"] = v
		elseif tostring(k) == "FixtureRGB_R" then
			fixtureInfoTable["FixtureRGB_R"] = v
		elseif k == "FixtureRGB_G" then
			fixtureInfoTable["FixtureRGB_G"] = v
		elseif k == "FixtureRGB_B" then
			fixtureInfoTable["FixtureRGB_B"] = v
		elseif k == "StringToDisplay" then
			fixtureInfoTable["definedString"] = v
		else
			ErrPrintf("k value not recognized: " .. k)
		end
	
		userLetter = tostring(v)
	end
	
	fixt = fixtureInfoTable["fixtureID"]
	userLetter = fixtureInfoTable["definedString"]
	
	Printf(" -- From `find.lua`...")
	Printf('fixtureInfoTable["FixtureRGB_R"]: ' .. fixtureInfoTable["FixtureRGB_R"])
	Printf('fixtureInfoTable["FixtureRGB_G"]: ' .. fixtureInfoTable["FixtureRGB_G"])
	Printf('fixtureInfoTable["FixtureRGB_B"]: ' .. fixtureInfoTable["FixtureRGB_B"])
	Printf('fixtureInfoTable["fixtureID"]: ' .. fixtureInfoTable["fixtureID"])
	Printf('fixtureInfoTable["definedString"]: ' .. fixtureInfoTable["definedString"])
	
    userLetter = string.upper(userLetter)
	
end

return find
