function lightUpLow(lowDimmerValue)
    local letter = "B"
    local fixture = 301

    lightLetter = {}
    local choice = _G[letter]

    for fixtureID,subfixtureValue in ipairs(choice) do
        table.insert(lightLetter, subfixtureValue)
        if tostring(subfixtureValue) == "0" then
            Cmd("Fixture 301." .. fixtureID .. " at " .. lowDimmerValue)
        end
    end
    Echo("hi from lightup")
end

return lightUp