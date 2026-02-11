-- from the hardware_test plugin included with grandma3
local signalTable = select(3,...)
local util = signalTable.util

---Responsible for creating the patch in a show
---@class hardwaretest.model.show.ShowPatch
local ShowPatch = {}

---Removes all fixture(type)s and stages from show.
---@param self hardwaretest.model.show.ShowPatch
function ShowPatch:clearStageAndFixtures()
    Cmd("cd Root")
	Cmd("cd 'ShowData'.'Patch'")
    Cmd("delete 'Stages'.1 Thru")

	Cmd("cd FixtureTypes")
    Cmd("delete 1 thru")
    Cmd("cd Root")
end

---Patches 1360 Led Par RGB to the show and puts them in a 6m high plane parallel to the ground.
---@param self hardwaretest.model.show.ShowPatch
function ShowPatch:patchFixtures()
	local fixtureTypeName = "LED - RGB"
	local modeName = "8 bit"
	local fixtureCount = 1530
    self:clearStageAndFixtures()

	CurrentProfile().FixtureLibShowMA = true
	CurrentProfile().FixtureLibShowUser = false
	CurrentProfile().FixtureLibShowShare = false
    Cmd("cd 'ShowData'.'Patch'")
	Cmd("set 'FixtureTypes' 'SourceIsShow'='No'")
    Cmd("cd 'FixtureTypes'")
	local retry = 0
	repeat
		local cmdResult = Cmd("import lib '" .. fixtureTypeName .. "'")
		coroutine:yield(1)
		Echo("Result("..retry.."): " .. cmdResult)
		retry = retry + 1;
	until((cmdResult == "OK") or (retry > 10))

    Cmd("cd ..")
    Cmd("cd 'Stages'")
	Cmd("cd 1")
	Cmd("cd 'Fixtures")
	-- cd 'ShowData'.'Patch'.'Stages'.1.1
	Cmd("store 2 thru " .. (fixtureCount+1))
	Cmd("Assign FixtureType '" .. fixtureTypeName .. "' at 2 thru "..(fixtureCount+1))
	Cmd("Set 2 Thru Property 'FID' 1")
	
	for i = 2, 1361 do
		Cmd("Set " .. i .. " 'PosY' " .. math.floor(i / 36))
		Cmd("Set " .. i .. " 'PosX' " .. -17 + (i % 36))
	end
	Cmd("Set 2 thru " .. (fixtureCount+1) .. " 'PosZ' 6")
	
	local fts = Root().ShowData.Patch.FixtureTypes;
	local ft = fts:Find(fixtureTypeName);
	local foundMode = ft:FindRecursive(modeName)
	if IsObjectValid(foundMode) then
		Cmd("Set 2 thru " .. (fixtureCount+1) .. " property 'Mode' '"..tostring(HandleToStr(foundMode)).."'")
	end

	Cmd("Set 2 Thru 1361 'Patch' 1.1")
	Cmd("Set 1362 Thru "..(fixtureCount+1).." 'Patch' 10.1")

	Cmd("cd Root")
end

---Patches 3000 AlienPix into the show.
---@param self hardwaretest.model.show.ShowPatch
function ShowPatch:patchFixturesStress()
    local fixtureTypeName = "Alienpix-RS"
    local numFixtures = 3000
    self:clearStageAndFixtures()

    Cmd("cd 'ShowData'.'Patch'")
    Cmd("cd 'FixtureTypes'")
	local retry = 0
	repeat
		local cmdResult = Cmd("import lib '" .. fixtureTypeName .. "'")
		coroutine:yield(1)
		Echo("Result("..retry.."): " .. cmdResult)
		retry = retry + 1;
	until((cmdResult == "OK") or (retry > 10))

    Cmd("cd root")
    Cmd("cd 'ShowData'.'Patch'")
    Cmd("cd 'Stages'")
	Cmd("cd 1")
	Cmd("cd 'Fixtures")
    Cmd(string.format("store 1 thru %d", numFixtures))
    Cmd(string.format("Assign FixtureType '%s' at 1 thru", fixtureTypeName))
	Cmd("Set 1 Thru "..numFixtures.." FID 1")
    Cmd("Set 1 Thru "..numFixtures.." 'Patch' 1.1")

	Cmd("cd Root")
end

util.insertPathBuilding(signalTable, "hardwaretest.model.show.ShowPatch", ShowPatch)