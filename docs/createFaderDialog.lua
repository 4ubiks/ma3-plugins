-- Referenced from an MA3 Forum thread regarding UI elements. 
-- https://forum.malighting.com/forum/thread/5738-lua-ui/?postID=17524#post17524

local pluginName = select(1, ...)
local componentName = select(2, ...)
local signalTable = select(3, ...)
local myHandle = select(4, ...)

function CreateFaderDialog(displayHandle)  
 
   -- Get the index of the display on which to create the dialog.
  local displayIndex = Obj.Index(GetFocusDisplay())
  if displayIndex > 5 then
    displayIndex = 1
  end
  
  -- Get the colors.
  local colorTransparent = Root().ColorTheme.ColorGroups.Global.Transparent
  local colorBackground = Root().ColorTheme.ColorGroups.Button.Background
  local colorBackgroundPlease = Root().ColorTheme.ColorGroups.Button.BackgroundPlease
  
  -- Get the overlay.
  local display = GetDisplayByIndex(displayIndex)
  local screenOverlay = display.ScreenOverlay
  
  -- Delete any UI elements currently displayed on the overlay.
  screenOverlay:ClearUIChildren()   
  
  -- Create the dialog base.
  local dialogWidth = 1300
  local baseInput = screenOverlay:Append("BaseInput")
  baseInput.Name = "DMXTesterWindow"
  baseInput.H = "0"
  baseInput.W = dialogWidth
  baseInput.MaxSize = string.format("%s,%s", display.W * 0.8, display.H)
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
  
  -- Create the dialog's main frame.
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
  --dlgFrame[1][2].Size = "200"
  dlgFrame[1][3].SizePolicy = "Fixed"  
  dlgFrame[1][3].Size = "80"    
  
  -- Create the sub title.
  -- This is row 1 of the dlgFrame.
  local subTitle = dlgFrame:Append("UIObject")
  subTitle.Text = "This example shows multiple faders."
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
  
  -- Create the fader grid.
  -- This is row 2 of the dlgFrame.
  local faderGrid = dlgFrame:Append("UILayoutGrid")
  faderGrid.Columns = 3
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
  
  local fader1 = faderGrid:Append("UiFader")
  fader1.Anchors = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
  fader1.Text = "Fader 1"
  fader1.Changed = "OnOutputLevelChanged"
  fader1.PluginComponent = myHandle
  
  local fader2 = faderGrid:Append("UiFader")
  fader2.Anchors = {
    left = 1,
    right = 1,
    top = 0,
    bottom = 0
  }
  fader2.Text = "Fader 2"
  fader2.Changed = "OnOutputLevelChanged"
  fader2.PluginComponent = myHandle  
  
  local fader3 = faderGrid:Append("UiFader")
  fader3.Anchors = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0
  }
  fader3.Text = "Fader 3"
  fader3.Changed = "OnOutputLevelChanged"
  fader3.PluginComponent = myHandle
  
  -- Create the button grid.
  -- This is row 3 of the dlgFrame.
  local buttonGrid = dlgFrame:Append("UILayoutGrid")
  buttonGrid.Columns = 2
  buttonGrid.Rows = 1
  buttonGrid.Anchors = {
    left = 0,
    right = 0,
    top = 2,
    bottom = 2
  }
  
  local applyButton = buttonGrid:Append("Button");
  applyButton.Anchors = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
  applyButton.Textshadow = 1;
  applyButton.HasHover = "Yes";
  applyButton.Text = "Apply";
  applyButton.Font = "Medium20";
  applyButton.TextalignmentH = "Centre";
  applyButton.PluginComponent = myHandle
  applyButton.Clicked = "ApplyButtonClicked"  

  local cancelButton = buttonGrid:Append("Button");
  cancelButton.Anchors = {
    left = 1,
    right = 1,
    top = 0,
    bottom = 0
  }
  cancelButton.Textshadow = 1;
  cancelButton.HasHover = "Yes";
  cancelButton.Text = "Cancel";
  cancelButton.Font = "Medium20";
  cancelButton.TextalignmentH = "Centre";
  cancelButton.PluginComponent = myHandle
  cancelButton.Clicked = "CancelButtonClicked"
  cancelButton.Visible = "Yes"
  
  -- Resizer.
  local resizer = baseInput:Append("ResizeCorner")
  resizer.Anchors = "0,1" 
  resizer.AlignmentH = "Right"
  resizer.AlignmentV = "Bottom"  
  
  -- Handlers.
  signalTable.CancelButtonClicked = function(caller)
    
    Echo("Cancel button clicked.")
    Obj.Delete(screenOverlay, Obj.Index(baseInput))
    
  end  
  
  signalTable.ApplyButtonClicked = function(caller)
    
    Echo("Apply button clicked.")    
    
    if (applyButton.BackColor == colorBackground) then
      applyButton.BackColor = colorBackgroundPlease
    else
      applyButton.BackColor = colorBackground
    end  
    
  end
  
  signalTable.OnOutputLevelChanged = function(caller)
 
    Echo(caller.Text .. " changed: '" .. caller.Value .. "'")
    
  end
  
end

-- Run the plugin.
return CreateFaderDialog
  