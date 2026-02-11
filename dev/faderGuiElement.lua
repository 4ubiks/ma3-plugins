-- Testing the creation of a Popup that integrates faders. 
-- This is for the `letters/` plugin, but it's not a finished product. 
-- Creating it here, s.t. I don't disrupt the working product. However, this belongs to the letters/ plugin. 

local pluginName = select(1, ...)
local componentName = select(2, ...)
local signalTable = select(3, ...)
local myHandle = select(4, ...)

function main(displayHandle)

    local displayIndex = Obj.Index(GetFocusDisplay())
    if displayIndex > 5 then
        displayIndex = 1
    end

    local colorTransparent = Root().ColorTheme.ColorGroups.Global.Transparent

    local displayObject = GetDisplayByIndex(displayIndex)
    local screenOverlay = displayObject.ScreenOverlay

    screenOverlay:ClearUIChildren()  

    -- dialog base
    local dialogHeight = 700
    local dialogWidth = 800
    local baseInput = screenOverlay:Append("BaseInput")
    baseInput.Name = "Lettering"
    baseInput.H = dialogHeight
    baseInput.W = dialogWidth
    baseInput.MaxSize = string.format("%s,%s", displayObject.W * 0.8, displayObject.H)
    baseInput.MinSize = string.format("%s,400", dialogWidth - 100)
    baseInput.Columns = 1  
    baseInput.Rows = 2
    baseInput[1][1].SizePolicy = "Fixed"
    baseInput[1][1].Size = "60"
    baseInput[1][2].SizePolicy = "Stretch"
    baseInput.AutoClose = "No"
    baseInput.CloseOnEscape = "Yes"

    -- Create the title bar.
    local titleBar = baseInput:Append("TitleBar")
    titleBar.Columns = 2  
    titleBar.Rows = 1
    titleBar.Anchors = "0,0"
    titleBar[2][2].SizePolicy = "Fixed"
    titleBar[2][2].Size = "50"
    titleBar.Texture = "corner2"
    
    local titleBarIcon = titleBar:Append("TitleButton")
    titleBarIcon.Text = "Letters"
    titleBarIcon.Texture = "corner1"
    titleBarIcon.Anchors = "0,0"
    titleBarIcon.Icon = "Logo"
    
    local titleBarCloseButton = titleBar:Append("CloseButton")
    titleBarCloseButton.Anchors = "1,0"
    titleBarCloseButton.Texture = "corner2"

    -- dialog main frame
    local dlgFrame = baseInput:Append("DialogFrame")
    dlgFrame.H = "100%"
    dlgFrame.W = "100%"
    dlgFrame.Columns = 2
    dlgFrame.Rows = 5
    dlgFrame.Anchors = {
        left = 0,
        right = 0,
        top = 1,
        bottom = 1
    }
    dlgFrame[1][1].SizePolicy = "Fixed"
    dlgFrame[1][1].Size = "60"
    dlgFrame[1][2].SizePolicy = "Stretch"
    dlgFrame[1][3].SizePolicy = "Fixed"  
    dlgFrame[1][3].Size = "80"  

    -- subtitle
    local subTitle = dlgFrame:Append("UIObject")
    subTitle.Text = "Enter the fixture info and character string below."
    subTitle.ContentDriven = "Yes"
    subTitle.ContentWidth = "No"
    subTitle.TextAutoAdjust = "No"
    subTitle.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
    subTitle.Padding = {
        left = 20,
        right = 20,
        top = 15,
        bottom = 15
    }
    subTitle.Font = "Medium20"
    subTitle.HasHover = "No"
    subTitle.BackColor = colorTransparent  

    -- faders
    local faderGrid = dlgFrame:Append("UILayoutGrid")
    faderGrid.Columns = 2
    faderGrid.Rows = 1
    faderGrid.Anchors = {
        left = 0,
        right = 0,
        top = 1,
        bottom = 1
    }
    faderGrid.Margin = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 5    
    }

    local highIntensityFader = faderGrid:Append("UiFader")
    highIntensityFader.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
    highIntensityFader.Changed = "OnOutputLevelChanged"
    highIntensityFader.PluginComponent = myHandle
    highIntensityFader.Text = "High Intensity"

    local lowIntensityFader = faderGrid:Append("UiFader")
    lowIntensityFader.Anchors = {
        left = 1,
        right = 1,
        top = 0,
        bottom = 0
    }
    lowIntensityFader.Changed = "OnOutputLevelChanged"
    lowIntensityFader.PluginComponent = myHandle
    lowIntensityFader.Text = "Low Intensity"

    local buttonGrid = dlgFrame:Append("UILayoutGrid")
    buttonGrid.Columns=2
    buttonGrid.Rows = 1
    buttonGrid.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }

    -- input grid
    -- 3rd row of dialog
    local inputsGrid = dlgFrame:Append("UILayoutGrid")
    inputsGrid.Columns=3
    buttonGrid.Rows = 1
    buttonGrid.Anchors = {
        left=0,
        right=3,
        top=2,
        bottom=2
    }

    -- INPUTS
    local fixtureRGB_R_input = inputsGrid:Append("LineEdit")
    fixtureRGB_R_input.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
    fixtureRGB_R_input.Textshadow = 1;
    fixtureRGB_R_input.HasHover = "Yes";
    fixtureRGB_R_input.Text = "FixtureRGB_R";
    fixtureRGB_R_input.Font = "Medium20";
    fixtureRGB_R_input.TextalignmentH = "Centre";
    fixtureRGB_R_input.PluginComponent = myHandle
    fixtureRGB_R_input.Clicked = "FixtureRGB_RClicked"
    fixtureRGB_R_input.Visible = "Yes"

    -- green color input
    local fixtureRGB_G_input = inputsGrid:Append("LineEdit")
    fixtureRGB_G_input.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
    fixtureRGB_G_input.Textshadow = 1;
    fixtureRGB_G_input.HasHover = "Yes";
    fixtureRGB_G_input.Text = "FixtureRGB_R";
    fixtureRGB_G_input.Font = "Medium20";
    fixtureRGB_G_input.TextalignmentH = "Centre";
    fixtureRGB_G_input.PluginComponent = myHandle
    fixtureRGB_G_input.Clicked = "FixtureRGB_GClicked"

    -- blue color input
    local fixtureRGB_B_input = inputsGrid:Append("LineEdit")
    fixtureRGB_B_input.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
    fixtureRGB_B_input.Textshadow = 1;
    fixtureRGB_B_input.HasHover = "Yes";
    fixtureRGB_B_input.Text = "FixtureRGB_R";
    fixtureRGB_B_input.Font = "Medium20";
    fixtureRGB_B_input.TextalignmentH = "Centre";
    fixtureRGB_B_input.PluginComponent = myHandle
    fixtureRGB_B_input.Clicked = "FixtureRGB_BClicked"

    local resizer = baseInput:Append("ResizeCorner")
    resizer.Anchors = "0,1" 
    resizer.AlignmentH = "Right"
    resizer.AlignmentV = "Bottom"  

    signalTable.ChauvetButtonClicked = function(caller)
        Echo(caller.Text .. " selected.")
        Obj.Delete(screenOverlay, Obj.index(baseInput))
    end

    signalTable.OnOutputLevelChanged = function(caller)
        Echo(caller.Text .. " changed: " .. caller.Value)
    end

end
return main