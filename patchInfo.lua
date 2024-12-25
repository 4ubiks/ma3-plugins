local function print(table, x)
	local myTypes = ObjectList("FixtureType 1 Thru")
	local k = 1
	
	Printf(myTypes[2].manufacturer)
	
	for j=1, #myTypes do
		if myTypes[j].name == x[k] then
			local manu = tostring(myTypes[j].manufacturer)
		end
		k = k + 1
	end
	
	manu = tostring(manu)
	
	for i=1, #x do
		for j=1, #myTypes do
			if tostring(myTypes[j].name) == tostring(x[i].fixturetype.name) then
				manu = myTypes[j].manufacturer
				manu = tostring(manu)
			end
		end
		
		Printf("========" .. x[i].fixture .. "========")
		Printf("Fixture ID: " .. x[i].fixture)
		Printf("Fixture Manufacturer: " .. manu)
		Printf("Fixture Type: " .. x[i].fixturetype.name)
		Printf("Fixture mode: " .. x[i].mode)
		Printf("Fixture address: " .. x[i].patch)
		Printf(" ")
	end
end

local function main()
	local myObjects = ObjectList("Fixture 1 Thru")
	print(table, myObjects)
end



return main