-- used in the UI generation, gets a random object based on a chosen set of menu items

function objectGenerator(menuList, preset, x_pos, y_pos, width, height, itemNumber)
    local menuItemGeneratorMultiplier = GetSubfixtureCount() + 1 -- ensuring it's never 0
    local menuItemGeneratorConstant = GetDebugFPS()

    local itemBase = 1

    itemBase = itemBase * menuItemGeneratorMultiplier * itemNumber
    itemBase = itemBase + menuItemGeneratorConstant

    menuItemGeneratorMultiplier = itemBase

    local nonRoundedItem = (itemBase%#menuList)+1
    local item = nonRoundedItem - (nonRoundedItem%1)

    Printf("Item " .. item .. " is " .. menuList[item])

    if preset==1 then
        Printf(Cmd("Store ScreenContent Default 'WindowPresetPool' 'MinW'='4' 'MinH'='2' 'PresetPoolType'='" .. menuList[item] .. "' 'SnapToBlockSize'='Yes' /NoConfirmation"))
    else
        Cmd("Store ScreenContent Default '" .. menuList[item] .. "' 'MinW'='4' 'MinH'='2' 'SnapToBlockSize'='Yes' /NoConfirmation")
    end

    -- after object created, set it on the screen
    --Cmd("Set ScreenContent Default.3 'X'='0' 'Y'='18' 'W'='34' 'H'='6'")
    Cmd("Set ScreenContent Default." .. itemNumber .. " 'X'='" .. x_pos .."' 'Y'='" .. y_pos .. "' 'W'='" .. width .. "' 'H'='" .. height .. "'")

end