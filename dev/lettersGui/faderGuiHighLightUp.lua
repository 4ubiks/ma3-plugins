function lightUpHigh(highDimmerValue)
    local letter = "B"
    local fixture = 301

    lightLetter = {}
    local choice = _G[letter]

    Printf("letter: ")

    Cmd("Fixture " .. fixture .. " at 100")

    for fixtureID,subfixtureValue in ipairs(choice) do
        Printf("fixtureID: " .. fixtureID)
        Printf("subfixtureValue: " .. subfixtureValue)
        table.insert(lightLetter, subfixtureValue)
        if tostring(subfixtureValue) == "1" then
            Cmd("Fixture 301." .. fixtureID .. " at " .. highDimmerValue)
        end
    end
end

return lightUp