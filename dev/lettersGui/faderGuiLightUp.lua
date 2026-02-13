function lightUp()
    local letter = "B"
    local fixture = 301

    lightLetter = {}
    local choice = _G[letter]

    Cmd("Fixture " .. fixture .. " at 100")

    for k,v in ipairs(choice) do
        table.insert(lightLetter, v)
        Cmd("Fixture 301.5 at 50")
    end
    Echo("hi from lightup")
end

return lightUp