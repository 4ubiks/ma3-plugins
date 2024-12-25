local function print(table, x)
	for i=1, #x do
		Printf("========" .. x[i].fixture .. "========")
		Printf("Fixture ID: " .. x[i].fixture)
		Printf("Fixture Manufacturer: " .. x[i].name)
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