-- Experimental script to generate a landing screen *entirely* from the command line. 
-- Whenever the script is run, a completely random UI is generated. 
-- 

local function main()

    Cmd("Delete ScreenContent Default") 

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

    local offsetMultiplier = GetAttributeCount()
    local offsetConstant = GetDebugFPS()

    local x_config = 0
    local y_config = 0 

    local width_config = 32
    local height_config = 8

    for i=0, 9 do

        if i==5 then
            y_config = 0
            x_config = 32
            height_config = 8
        end

        if y_config > 28 then
            height_config = 4
        end

        local pickerBase=2

        pickerBase = pickerBase * offsetMultiplier
        pickerBase = pickerBase + offsetConstant

        offsetMultiplier = pickerBase

        local menuCat = (pickerBase%6) + 1
        local roundedMenuCat = menuCat - (menuCat % 1)

        if roundedMenuCat == 1 then
            Printf("common, size " .. #common)
            objectGenerator(common, 0, x_config, y_config, width_config, height_config, i)
        elseif roundedMenuCat == 2 then
            Printf("datapools, size " .. #datapools)
            objectGenerator(datapools, 0, x_config, y_config, width_config, height_config, i)
        elseif roundedMenuCat == 3 then
            Printf("presets, size " .. #presets)
            objectGenerator(presets_num, 1, x_config, y_config, width_config, height_config, i)
        elseif roundedMenuCat == 4 then
            Printf("pools, size " .. #pools)
            objectGenerator(pools, 0, x_config, y_config, width_config, height_config, i)
        elseif roundedMenuCat == 5 then
            Printf("tools, size " .. #tools)
            objectGenerator(tools, 0, x_config, y_config, width_config, height_config, i)
        elseif roundedMenuCat == 6 then 
            Printf("more, size " .. #more)
            objectGenerator(more, 0, x_config, y_config, width_config, height_config, i)
        end

        y_config = y_config + 8
        
    end
    
end

return main
