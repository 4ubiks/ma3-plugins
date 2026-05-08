-- used in the UI generation, gets a random object based on a chosen set of menu items

function objectGenerator(menuList, preset)
    local menuItemGeneratorMultiplier = GetSubfixtureCount() + 1 -- ensuring it's never 0
    local menuItemGeneratorConstant = GetDebugFPS()

    local itemBase = 1

    itemBase = itemBase * menuItemGeneratorMultiplier
    itemBase = itemBase + menuItemGeneratorConstant

    menuItemGeneratorMultiplier = itemBase

    local nonRoundedItem = (itemBase%#menuList)+1
    local item = nonRoundedItem - (nonRoundedItem%1)

    Printf(menuList[item])

    if preset==1 then
        Cmd("Store ScreenContent Default 'WindowPresetPool' 'MinW'='4' 'MinH'='2' 'PresetPoolType'='" .. "' 'SnapToBlockSize'='Yes' /NoConfirmation")
    else
        Cmd("Store ScreenContent Default '" .. menuList[item] .. "' 'MinW'='4' 'MinH'='2' 'SnapToBlockSize'='Yes' /NoConfirmation")
    end
    
end