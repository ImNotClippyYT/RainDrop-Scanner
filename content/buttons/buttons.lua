local execute = Instance.new("TextButton",frame)
execute.BackgroundTransparency = 1
execute.Position = UDim2.new(0,0,0.851,0)
execute.Size = UDim2.new(0,200,0,50)
execute.Font = Enum.Font.Highway
execute.TextColor3 = Color3.fromRGB(255,255,255)
execute.TextScaled = true
execute.Text = "Execute"

local textlabel = Instance.new("TextLabel",frame)
textlabel.BackgroundTransparency = 1
textlabel.Position = UDim2.new(-0.056,0,0,0)
textlabel.Size = UDim2.new(0,850,0,50)
textlabel.Text = "Raindrop backdoor scanner"
textlabel.Font = Enum.Font.Highway
textlabel.TextColor3 = Color3.fromRGB(85,85,255)
textlabel.TextScaled = true

local cler = Instance.new("TextButton",frame)
cler.BackgroundTransparency = 1
cler.Position = UDim2.new(0.242,0,0.851,0)
cler.Size = UDim2.new(0,200,0,50)
cler.Font = Enum.Font.Highway
cler.TextColor3 = Color3.fromRGB(255,255,255)
cler.TextScaled = true
cler.Text = "Clear"

function clear()
    textbox.Text = ""
end

cler.MouseButton1Click:Connect(clear)

highwayfont =Enum.Font.Highway

local finallydrag = Instance.new("TextButton",frame)
dragthing = false
function drag()
    frame.Active = true
    frame.Draggable = true
end

function undrag()
frame.Active = false
frame.Draggable = false
end

finallydrag.MouseButton1Click:Connect(function()
drag()
end)

finallydrag.Text = "drag"
finallydrag.BackgroundTransparency = 1
finallydrag.Position = UDim2.new(0.481,0,0.851,0)
finallydrag.Size = UDim2.new(0,142,0,50)
finallydrag.Font = highwayfont
finallydrag.TextColor3 = Color3.fromRGB(255,255,255)
finallydrag.TextScaled = true

local hehe = Instance.new("TextButton",frame)
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
    hehe.Position = UDim2.new(0.79,0,0.851)
end)
