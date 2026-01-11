--[[
 ____       _           _
|  _ \ __ _(_)_ __   __| |_ __ ___  _ __
| |_) / _` | | '_ \ / _` | '__/ _ \| '_ \
|  _ < (_| | | | | | (_| | | | (_) | |_) |
|_| \_\__,_|_|_| |_|\__,_|_|  \___/| .__/
                                   |_|
]]

-- yes this code is cursed
-- no i will not apologize

-- =====================
-- SERVICES / VARS
-- =====================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local plr = Players.LocalPlayer
local plrGui = plr.PlayerGui
local strge = ReplicatedStorage

local function notifylol(title, message, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = duration or 4
        })
    end)
end

notifylol("RainDrop", "Loaded! v1.0", 3)

-- =====================
-- UI
-- =====================

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

-- =====================
-- BACKDOOR SCAN (GetChildren ONLY)
-- =====================

local backdoors = {}

local function scan()
    table.clear(backdoors)

    for _, obj in ipairs(strge:GetChildren()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            table.insert(backdoors, obj)
        end
    end

    if #backdoors > 0 then
        textbox.Text = "backdoor found: " .. backdoors[1].Name
    else
        textbox.Text = "no backdoor found"
    end
end

-- scan immediately on start
scan()

-- auto‑rescan
strge.ChildAdded:Connect(function(child)
    if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
        scan()
    end
end)

strge.ChildRemoved:Connect(function(child)
    if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
        scan()
    end
end)

-- =====================
-- EXECUTE LOGIC (NO SCAN HERE)
-- =====================

execute.MouseButton1Click:Connect(function()
    if #backdoors == 0 then
        notifylol("RainDrop", "No backdoor found or an error happend :(", 3)
        return
    end

    for _, backdoor in ipairs(backdoors) do
        local success, err = pcall(function()
            if backdoor:IsA("RemoteEvent") then
                backdoor:FireServer(textbox.Text)
            elseif backdoor:IsA("RemoteFunction") then
                backdoor:InvokeServer(textbox.Text)
            end

            
        end)
        
       if success then
       notifylol("RainDrop", "Executed :)", 5)
       
        if not success then
            notifylol("RainDrop","Error - "..err)
        end
    end

    end
end)

-- =====================
-- CONSOLE GUI
-- =====================

local LogService = game:GetService("LogService")
local Players = game:GetService("Players")

local plr = Players.LocalPlayer
local plrGui = plr:WaitForChild("PlayerGui")

-- MAIN SCREENGUI
local consoleGui = Instance.new("ScreenGui")
consoleGui.Name = "Console"
consoleGui.ResetOnSpawn = false
consoleGui.IgnoreGuiInset = true
consoleGui.Parent = plrGui

-- MAIN FRAME
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 600, 0, 350)
frame.Position = UDim2.new(0.3, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(20,20,25)
frame.BorderSizePixel = 0
frame.Parent = consoleGui

-- ROUND CORNERS
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,10)
corner.Parent = frame

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "RainDrop Client Console"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(85,170,255)
title.Font = Enum.Font.Highway
title.Parent = frame

-- SCROLL FRAME FOR LOGS
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-10,1,-40)
scroll.Position = UDim2.new(0,5,0,35)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.ScrollBarThickness = 6
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = frame

-- UI LIST LAYOUT
local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0,2)
layout.Parent = scroll

-- function to add a log line
local function addLog(msg, type)
    local color = Color3.fromRGB(255,255,255)
    if type == Enum.MessageType.MessageWarning then
        color = Color3.fromRGB(255, 170, 0)
    elseif type == Enum.MessageType.MessageError then
        color = Color3.fromRGB(255, 80, 80)
    end

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,0,20)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Top
    label.TextColor3 = color
    label.Font = Enum.Font.Code
    label.TextSize = 16
    label.Text = "["..os.date("%H:%M:%S").."] "..tostring(msg)
    label.Parent = scroll

    
    scroll.CanvasPosition = Vector2.new(0, scroll.CanvasSize.Y.Offset)
end
LogService.MessageOut:Connect(function(msg, type)
    addLog(msg, type)
end)

  local labelFrame = Instance.new("Frame") -- yellow background behind text
    labelFrame.Size = UDim2.new(1,0,0,22)
    labelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    labelFrame.BackgroundTransparency = 0
    labelFrame.BorderSizePixel = 0
    labelFrame.Parent = scroll

scroll.Active = true
scroll.Draggable = true
print("Console loaded!")
warn("This is a warning!")


