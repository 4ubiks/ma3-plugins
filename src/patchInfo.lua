local function print(table, x)
	
	filewrite = io.open("/Users/jaharris20/Desktop/report.txt", "w")
	
	local myTypes = ObjectList("FixtureType 1 Thru")
	local k = 1
	
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
		
		local mode = tostring(x[i].mode)
		mode = mode:gsub("%d+", "")
		
		filewrite:write("========================================\n")
		filewrite:write("-" .. x[i].fixture ..":\n")
		filewrite:write(manu .. " " .. x[i].fixturetype.name .. ", " .. mode .. " mode\n")
		filewrite:write(" \n")
		filewrite:write("Fixture ID: " .. x[i].fixture .. "\n")
		filewrite:write("Fixture address: " .. x[i].patch .. "\n")
		filewrite:write("\n")
	end
	
	filewrite:close()
end

local function main()
	local myObjects = ObjectList("Fixture 1 Thru")
	print(table, myObjects)
	
	
end



return main
