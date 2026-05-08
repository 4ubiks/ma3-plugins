-- Experimental script to generate a landing screen *entirely* from the command line. 
-- Whenever the script is run, a completely random UI is generated. I'll try and write my own randomization method.
-- 

local function main()
    Cmd("Delete ScreenContent Default") 

    -- generate LEFT SIDE
    -- Camera selection
    Cmd("Store ScreenContent Default 'WindowCameraPool' 'MinW'='4' 'MinH'='2' 'SnapToBlockSize'='Yes' /NoConfirmation")
    Cmd("Set ScreenContent Default.1 'X'='0' 'Y'='0' 'W'='16' 'H'='2'")

    -- 3D Window
    Cmd("Store ScreenContent Default 'Window3D' 'MinW'='4' 'MinH'='2' /NoConfirmation")
    Cmd("Set ScreenContent Default.2 'X'='0' 'Y'='2' 'W'='34' 'H'='16'")

    -- SysMon
    Cmd("Store ScreenContent Default 'WindowSystemMonitor' 'MinW'='4' 'MinH'='4' /NoConfirmation")
    Cmd("Set ScreenContent Default.3 'X'='0' 'Y'='18' 'W'='34' 'H'='6'")

    -- Matricks pool
    Cmd("Store ScreenContent Default 'WindowMatricksPool' 'MinW'='2' 'MinH'='2' /NoConfirmation")
    Cmd("Set ScreenContent Default.4 'X'='0' 'Y'='26' 'W'='34' 'H'='4'")

    -- XKeys
    Cmd("Store ScreenContent Default 'WindowXkeys' 'MinW'='4' 'MinH'='4' /NoConfirmation")
    Cmd("Set ScreenContent Default.5 'X'='0' 'Y'='30' 'W'='34' 'H'='6'")
    
end

return main
