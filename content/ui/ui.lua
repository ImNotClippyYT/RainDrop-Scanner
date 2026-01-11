
local maingui = Instance.new("ScreenGui", plrGui)
maingui.IgnoreGuiInset = true
maingui.ResetOnSpawn = false
maingui.Name = "uncoolsd"

local frame = Instance.new("Frame", maingui)
frame.Size = UDim2.new(0,729,0,336)
frame.Position = UDim2.new(0.294,0,0.297,0)
frame.BackgroundColor3 = Color3.fromRGB(10,10,12)

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0,10)

local uistroke = Instance.new("UIStroke", frame)
uistroke.Thickness = 5
uistroke.Color = Color3.fromHex("#000000")

local textbox = Instance.new("TextBox", frame)
textbox.BackgroundColor3 = Color3.fromRGB(49,49,49)
textbox.ClearTextOnFocus = false
textbox.MultiLine = true
textbox.Position = UDim2.new(0.059,0,0.19,0)
textbox.Size = UDim2.new(0,637,0,202)
textbox.PlaceholderText = "have u heard of any backdoor scanners other than lalol?"
textbox.PlaceholderColor3 = Color3.fromRGB(255,255,255)
textbox.TextXAlignment = Enum.TextXAlignment.Left
textbox.TextYAlignment = Enum.TextYAlignment.Top
textbox.TextColor3 = Color3.new(1,1,1)
textbox.Text = ""

local textlabel = Instance.new("TextLabel", frame)
textlabel.BackgroundTransparency = 1
textlabel.Position = UDim2.new(-0.056,0,0,0)
textlabel.Size = UDim2.new(0,850,0,50)
textlabel.Text = "Raindrop backdoor scanner"
textlabel.Font = Enum.Font.Highway
textlabel.TextColor3 = Color3.fromRGB(85,85,255)
textlabel.TextScaled = true

-- =====================
-- BUTTONS (SAME AS BEFORE)
-- =====================

-- EXECUTE
local execute = Instance.new("TextButton", frame)
execute.BackgroundTransparency = 1
execute.Position = UDim2.new(0,0,0.851,0)
execute.Size = UDim2.new(0,200,0,50)
execute.Font = Enum.Font.Highway
execute.TextColor3 = Color3.fromRGB(255,255,255)
execute.TextScaled = true
execute.Text = "Execute"

-- CLEAR
local cler = Instance.new("TextButton", frame)
cler.BackgroundTransparency = 1
cler.Position = UDim2.new(0.242,0,0.851,0)
cler.Size = UDim2.new(0,200,0,50)
cler.Font = Enum.Font.Highway
cler.TextColor3 = Color3.fromRGB(255,255,255)
cler.TextScaled = true
cler.Text = "Clear"

cler.MouseButton1Click:Connect(function()
    textbox.Text = ""
end)

-- DRAG
local finallydrag = Instance.new("TextButton", frame)
finallydrag.Text = "drag"
finallydrag.BackgroundTransparency = 1
finallydrag.Position = UDim2.new(0.481,0,0.851,0)
finallydrag.Size = UDim2.new(0,142,0,50)
finallydrag.Font = Enum.Font.Highway
finallydrag.TextColor3 = Color3.fromRGB(255,255,255)
finallydrag.TextScaled = true

local dragOn = false
finallydrag.MouseButton1Click:Connect(function()
    dragOn = not dragOn
    frame.Active = dragOn
    frame.Draggable = dragOn
end)

-- SEIZURE (unchanged meme button)
local hehe = Instance.new("TextButton", frame)
hehe.BackgroundTransparency = 1
hehe.Position = UDim2.new(0.782,0,0.899,0)
hehe.Size = UDim2.new(0,142,0,50)
hehe.Font = Enum.Font.SpecialElite
hehe.Text = "SEIZURE"
hehe.TextColor3 = Color3.fromRGB(255,0,0)
hehe.TextScaled = true

hehe.MouseButton1Click:Connect(function()
    hehe.Text = "Under development :("
    hehe.Font = Enum.Font.Highway
    hehe.Position = UDim2.new(0.79,0,0.851,0)
end)
