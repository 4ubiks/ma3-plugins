-- first draft: return what fader plugin is currently stored on
-- second draft: return active value of fader (0, 50, 75, etc)
-- final draft: change general universal value of RGB, CMY, or any other universal attribute for most fixtures

-- currently prints out value of a hard-coded fader

local function main()
	local myObject = GetExecutor(201)
	local myToken = 'FaderMaster'	
	local val = myObject:GetFader{token=myToken}

	Printf("your function is: " .. val)
end

return main