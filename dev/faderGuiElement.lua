-- Testing the creation of a Popup that integrates faders. 
-- This is for the `letters/` plugin, but it's not a finished product. 
-- Creating it here, s.t. I don't disrupt the working product. However, this belongs to the letters/ plugin. 

local myHandle = select(4, ...)

local function main()

    local displayIndex = Obj.Index(GetFocusDisplay())
    if displayIndex > 5 then
        displayIndex = 1
    end

    local colorTransparent = Root().ColorTheme.ColorGroups.Global.Transparent

    local displayObject = GetDisplayByIndex(displayIndex)
    local screenOverlay = displayObject.ScreenOverlay

    screenOverlay:ClearUIChildren()  

    -- dialog base
    local dialogHeight = 1400
    local dialogWidth = 1600
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
    titleBarIcon.Text = "Dialog Example"
    titleBarIcon.Texture = "corner1"
    titleBarIcon.Anchors = "0,0"
    titleBarIcon.Icon = "star"
    
    local titleBarCloseButton = titleBar:Append("CloseButton")
    titleBarCloseButton.Anchors = "1,0"
    titleBarCloseButton.Texture = "corner2"

    -- dialog main frame
    local dlgFrame = baseInput:Append("DialogFrame")
    dlgFrame.H = "100%"
    dlgFrame.W = "100%"
    dlgFrame.Columns = 1  
    dlgFrame.Rows = 3
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
        left = 3,
        right = 0,
        top = 2,
        bottom = 2
    }

    local chauvetButton = buttonGrid:Append("Checkbox")
    chauvetButton.Anchors = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 2
    }

    chauvetButton.Textshadow = 1;
    chauvetButton.Text = "Chauvet"

    local resizer = baseInput:Append("ResizeCorner")
    resizer.Anchors = "0,1" 
    resizer.AlignmentH = "Right"
    resizer.AlignmentV = "Bottom"  
end
return main