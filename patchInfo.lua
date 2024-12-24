local function print(table, x)
	Printf("Fixture ID: " .. x[1].fixture)
	Printf("Fixture Manufacturer: " .. x[1].name)
	Printf("Fixture Type: " .. x[1].name)
	Printf("Fixture mode: " .. x[1].mode)
	Printf("Fixture address: " .. x[1].patch)
end

local function main()
	local myObjects = ObjectList("Fixture 101 Thru 105")
	Printf(myObjects[1].patch)
	print(table, myObjects)
	--Printf(myObjects[1]:Dump())
end

return main