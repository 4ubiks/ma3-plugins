-- Experimental script to generate a landing screen *entirely* from the command line. 
-- Whenever the script is run, a completely random UI is generated. 
-- 

local function main()

    -- Ones that NEED more space ("MinH"="4"):
    --     - ContentSheet
    --     - WindowAtFilter
    --     - PhaserEditor
    --     - SpecialDialog 
    --     - 3dViewer
    --     - AgendaViewer
    --     - FixtureSheet
    --     - SelectionGrid
    --     - TimecodeViewer
    --     - LayoutViewer
    --     - CommandLine
    --     - CommandBarWing

    local common = {"WindowFixtureSheet", "Window3D", "WindowPlaybacks", "WindowCommandLine", "WindowSequenceSheet", "WindowLayoutView", "WindowXkeys", "WindowDmxSheet", "WindowContentSheet", "WindowSelectionView", "WindowPhaserEditor", "WindowSpecialDialog", "WindowMatricks"}
    
    local datapools = {"WindowGeneratorBitmapPool", "WindowMacroPool", "WindowTimecodePool", "WindowConfigurationPool", "WindowMatricksPool", "WindowTimerPool", "WindowFilterPool", "WindowPagePool", "WindowWorldPool", "WindowGeneratorRandomPool", "WindowPluginPool", "WindowGroupPool", "WindowQuickeyPool", "WindowLayoutPool", "WindowSequencePool"}

    local presets = {"WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool", "WindowPresetPool"}
    local presets_num = {0, 1, 2, 3, 4, 5, 6, 7, 8, 20, 21, 22, 23, 24, 4294967295}

    local pools = {"WindowAppearancePool", "WindowUniversePool", "WindowGoboPool", "WindowCameraPool", "WindowDataPool", "WindowUserPool", "WindowImagePool", "WindowEncoderBarPool", "WindowGelPool", "WindowMeshPool", "WindowRenderQualityPool", "WindowScribblePool", "WindowSoundPool", "WindowViewPool", "WindowTagPool", "WindowSymbolPool", "WindowTimecodesSlotPool", "WindowVideoPool"}

    local tools = {"WindowContentSheet", "WindowAtFilter", "Window3D", "WindowRDM", "WindowDmxSheet", "WindowRecipeEditor", "WindowAgenda", "WindowSound", "WindowFixtureSheet", "WindowSelectionView", "WindowClock", "WindowTimecode", "WindowSequenceSheet", "WindowSmartView", "WindowLayoutView", "WindowSpecialDialog", "WindowMatricks", "WindowPhaserEditor"}

    local more = {"WindowAlignbar", "WindowCustomMasterSelection", "WindowCommandLine", "WindowTrackpad", "WindowCommandWingBar", "WindowRunningPlaybacks", "WindowHelpViewer", "WindowEncoderBar", "WindowPlaybacks", "WindowInfo", "WindowSelectionBar", "WindowXkeys", "WindowMessageCenter", "WindowStepBar", "WindowSystemInfo", "WindowSystemMonitor"}

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
