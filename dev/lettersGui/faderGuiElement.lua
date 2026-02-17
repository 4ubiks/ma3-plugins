-- Testing the creation of a Popup that integrates faders. 
-- This is for the `letters/` plugin, but it's not a finished product. 
-- Creating it here, s.t. I don't disrupt the working product. However, this belongs to the letters/ plugin.

-- author: jack harris

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
    local dialogHeight = 1000
    local dialogWidth = 1200
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
    dlgFrame.Columns = 1
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
    highIntensityFader.Changed = "HighFaderOutputLevelChanged"
    highIntensityFader.PluginComponent = myHandle
    highIntensityFader.Text = "High Intensity"

    local lowIntensityFader = faderGrid:Append("UiFader")
    lowIntensityFader.Anchors = {
        left = 1,
        right = 1,
        top = 0,
        bottom = 0
    }
    lowIntensityFader.Changed = "LowFaderOutputLevelChanged"
    lowIntensityFader.PluginComponent = myHandle
    lowIntensityFader.Text = "Low Intensity"

    -- local buttonGrid = dlgFrame:Append("UILayoutGrid")
    -- buttonGrid.Columns=2
    -- buttonGrid.Rows = 1
    -- buttonGrid.Anchors = {
    --     left = 0,
    --     right = 0,
    --     top = 0,
    --     bottom = 0
    -- }

    -- input grid
    -- 3rd row of dialog
    local inputsGrid = dlgFrame:Append("UILayoutGrid")
    inputsGrid.Columns=12
    inputsGrid.Rows = 5
    inputsGrid.Anchors = {
        left=0,
        right=0,
        top=3,
        bottom=3
    }
    inputsGrid.Margin = {
        left = 0,
        right = 0,
        top = 5,
        bottom = 5
    }

    -- INPUTS
    -- ==================
    -- FixtureRGB_R LABEL
    local fixtureRGB_R_label = inputsGrid:Append("UIObject")
    fixtureRGB_R_label.Text = "FixtureRGB_R"
    fixtureRGB_R_label.TextalignmentH = "Left"
    -- top/bottom: from TOP column to BOTTOM column...
    -- left/right: from LEFT row to RIGHT row...
    fixtureRGB_R_label.Anchors = {
        left = 1,
        right = 5,
        top = 0,
        bottom = 0
    }
    fixtureRGB_R_label.Padding = "5.5"
    fixtureRGB_R_label.Margin = {
        left = 2, 
        right = 2,
        top = 0,
        bottom = 2
    }

    -- ==================
    -- FixtureRGB_R INPUT
    local fixtureRGB_R_input = inputsGrid:Append("LineEdit")
    fixtureRGB_R_input.Margin = {
        left = 2,
        right = 0,
        top = 0,
        bottom = 2
    }
    fixtureRGB_R_input.Anchors = {
        left = 6,
        right = 9,
        top = 0,
        bottom = 0
    }
    fixtureRGB_R_input.Padding = "5,5"
    fixtureRGB_R_input.Filter = "0123456789"
    fixtureRGB_R_input.Textshadow = 1;
    fixtureRGB_R_input.HasHover = "Yes";
    fixtureRGB_R_input.Text = "FixtureRGB_R";
    fixtureRGB_R_input.Font = "Medium20";
    fixtureRGB_R_input.TextalignmentH = "Centre";
    fixtureRGB_R_input.PluginComponent = myHandle
    fixtureRGB_R_input.TextChanged = "FixtureRGB_REntered"
    fixtureRGB_R_input.Visible = "Yes"


    -- ==================
    -- FixtureRGB_G LABEL
    local fixtureRGB_G_label = inputsGrid:Append("UIObject")
    fixtureRGB_G_label.Text = "FixtureRGB_G"
    fixtureRGB_G_label.TextalignmentH = "Left"
    fixtureRGB_G_label.Anchors = {
        left = 1,
        right = 5,
        top = 1,
        bottom = 1
    }
    fixtureRGB_G_label.Padding = "5.5"
    fixtureRGB_G_label.Margin = {
        left = 2, 
        right = 2,
        top = 2,
        bottom = 2
    }

    -- ==================
    -- FixtureRGB_G INPUT
    local fixtureRGB_G_input = inputsGrid:Append("LineEdit")
    fixtureRGB_G_input.Margin = {
        left = 2,
        right = 0,
        top = 2,
        bottom = 2
    }
    fixtureRGB_G_input.Anchors = {
        left = 6,
        right = 9,
        top = 1,
        bottom = 1
    }
    fixtureRGB_G_input.Padding = "5,5"
    fixtureRGB_G_input.Filter = "0123456789"
    fixtureRGB_G_input.Textshadow = 1;
    fixtureRGB_G_input.HasHover = "Yes";
    fixtureRGB_G_input.Text = "FixtureRGB_G";
    fixtureRGB_G_input.Font = "Medium20";
    fixtureRGB_G_input.TextalignmentH = "Centre";
    fixtureRGB_G_input.PluginComponent = myHandle
    fixtureRGB_G_input.TextChanged = "FixtureRGB_GEntered"
    fixtureRGB_G_input.Visible = "Yes"


    -- ==================
    -- FixtureRGB_B LABEL
    local fixtureRGB_B_label = inputsGrid:Append("UIObject")
    fixtureRGB_B_label.Text = "FixtureRGB_B"
    fixtureRGB_B_label.TextalignmentH = "Left"
    fixtureRGB_B_label.Anchors = {
        left = 1,
        right = 5,
        top = 2,
        bottom = 2
    }
    fixtureRGB_B_label.Padding = "5.5"
    fixtureRGB_B_label.Margin = {
        left = 2, 
        right = 2,
        top = 2,
        bottom = 2
    }

    -- ==================
    -- FixtureRGB_B INPUT
    local fixtureRGB_B_input = inputsGrid:Append("LineEdit")
    fixtureRGB_B_input.Margin = {
        left = 2,
        right = 0,
        top = 2,
        bottom = 2
    }
    fixtureRGB_B_input.Anchors = {
        left = 6,
        right = 9,
        top = 2,
        bottom = 2
    }
    fixtureRGB_B_input.Padding = "5,5"
    fixtureRGB_B_input.Filter = "0123456789"
    fixtureRGB_B_input.Textshadow = 1;
    fixtureRGB_B_input.HasHover = "Yes";
    fixtureRGB_B_input.Text = "FixtureRGB_B";
    fixtureRGB_B_input.Font = "Medium20";
    fixtureRGB_B_input.TextalignmentH = "Centre";
    fixtureRGB_B_input.PluginComponent = myHandle
    fixtureRGB_B_input.TextChanged = "FixtureRGB_BEntered"
    fixtureRGB_B_input.Visible = "Yes"


    -- ==================
    -- Starting FID LABEL
    local startingFixtureID_label = inputsGrid:Append("UIObject")
    startingFixtureID_label.Text = "FixtureStartingID"
    startingFixtureID_label.TextalignmentH = "Left"
    startingFixtureID_label.Anchors = {
        left = 1,
        right = 5,
        top = 3,
        bottom = 3
    }
    startingFixtureID_label.Padding = "5.5"
    startingFixtureID_label.Margin = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2
    }

    -- ==================
    -- Starting FID INPUT
    local startingFixtureID_input = inputsGrid:Append("LineEdit")
    startingFixtureID_input.Margin = {
        left = 2,
        right = 0,
        top = 2,
        bottom = 2
    }
    startingFixtureID_input.Anchors = {
        left = 6,
        right = 9,
        top = 3,
        bottom = 3
    }
    startingFixtureID_input.Padding = "5,5"
    startingFixtureID_input.Filter = "0123456789"
    startingFixtureID_input.Textshadow = 1;
    startingFixtureID_input.HasHover = "Yes";
    startingFixtureID_input.Text = "FixtureStartingID";
    startingFixtureID_input.Font = "Medium20";
    startingFixtureID_input.TextalignmentH = "Centre";
    startingFixtureID_input.PluginComponent = myHandle
    startingFixtureID_input.Clicked = "StartFixIDClickedIdk"
    startingFixtureID_input.Visible = "Yes"


    -- ==================
    -- String LABEL
    local fixtureString_label = inputsGrid:Append("UIObject")
    fixtureString_label.Text = "StringToDisplay"
    fixtureString_label.TextalignmentH = "Left"
    fixtureString_label.Anchors = {
        left = 1,
        right = 5,
        top = 4,
        bottom = 4
    }
    fixtureString_label.Padding = "5.5"
    fixtureString_label.Margin = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2
    }

    -- ==================
    -- String INPUT
    local fixtureString_input = inputsGrid:Append("LineEdit")
    fixtureString_input.Margin = {
        left = 2,
        right = 0,
        top = 2,
        bottom = 2
    }
    fixtureString_input.Anchors = {
        left = 6,
        right = 9,
        top = 4,
        bottom = 4
    }
    fixtureString_input.Padding = "5,5"
    fixtureString_input.Textshadow = 1;
    fixtureString_input.HasHover = "Yes";
    fixtureString_input.Text = "StringToDisplay";
    fixtureString_input.Font = "Medium20";
    fixtureString_input.TextalignmentH = "Centre";
    fixtureString_input.PluginComponent = myHandle
    fixtureString_input.Clicked = "StringClickedIdk"
    fixtureString_input.Visible = "Yes"

    -- ==============
    -- buttons 'Confirm' and 'Cancel'
    local buttonGrid = dlgFrame:Append("UILayoutGrid")
    buttonGrid.Columns = 2
    buttonGrid.Rows = 1
    buttonGrid.Anchors = {
        left = 0,
        right = 0,
        top = 4,
        bottom = 4
    }
    buttonGrid.Margin = {
        left = 0,
        right = 0,
        top = 6,
        bottom = 6
    }

    -- 'Confirm'
    local enterChangesButton = buttonGrid:Append("Button")
    enterChangesButton.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
    enterChangesButton.Text = "Enter Changes";
    enterChangesButton.Clicked = "EnterButtonClicked"
    enterChangesButton.Font = "Medium20";
    enterChangesButton.TextAlignmentH = "Centre";

    -- 'Cancel'
    local cancelButton = buttonGrid:Append("Button")
    cancelButton.Anchors = {
        left = 1,
        right = 1,
        top = 0,
        bottom = 0
    }
    cancelButton.Text = "Cancel";
    cancelButton.Font = "Medium20";
    cancelButton.TextAlignmentH = "Centre"
    -- END OF GUI ICONS
    -- ========================================================

    local resizer = baseInput:Append("ResizeCorner")
    resizer.Anchors = "0,1" 
    resizer.AlignmentH = "Right"
    resizer.AlignmentV = "Bottom"  

    testAlphabet()

    signalTable.ChauvetButtonClicked = function(caller)
        Echo(caller.Text .. " selected.")
        Obj.Delete(screenOverlay, Obj.index(baseInput))
    end

    signalTable.HighFaderOutputLevelChanged = function(caller)
        Echo(caller.Text .. " changed: " .. caller.Value)
        Cmd("Fixture 301 at " .. caller.Value)
        lightUpHigh(caller.Value)
        Echo("uh,,.,")
    end

    signalTable.LowFaderOutputLevelChanged = function(caller)
        Echo(caller.Text .. " changed: " .. caller.Value)
        lightUpLow(caller.Value)
    end

    signalTable.FixtureRGB_REntered = function(caller)
        Echo("The value uhhhh is uh " .. caller.Content)
        Cmd("Fixture 301")
        if (tonumber(caller.Content) < 101) then
            Cmd("Attribute ColorRGB_R at " .. caller.Content)
        end
        Cmd("Clear")
    end

    signalTable.FixtureRGB_GEntered = function(caller)
        Cmd("Fixture 301")
        if (tonumber(caller.Content) < 101) then
            Cmd("Attribute ColorRGB_G at " .. caller.Content)
        end
        Cmd("Clear")
    end

    signalTable.FixtureRGB_BEntered = function(caller)
        Cmd("Fixture 301")
        if (tonumber(caller.Content) < 101) then
            Cmd("Attribute ColorRGB_B at " .. caller.Content)
        end
        Cmd("Clear")
    end

    signalTable.EnterButtonClicked = function(caller)
        Obj.Delete(screenOverlay, Obj.Index(baseInput))
        Echo("Enter button clicked")
    end

end
return main