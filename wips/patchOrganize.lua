---@class deletetest.model.show.ShowPatch
local ShowPatch = {}

---@param self deletetest.model.show.ShowPatch

function main()
    Cmd("cd Root")
	Cmd("cd 'ShowData'.'Patch'")
    Cmd("cd Stages")
    Cmd("cd 1")
    Cmd("cd Fixtures")
    Cmd("Delete Fixture 1 thru")
    Cmd("cd Root")
end

return main