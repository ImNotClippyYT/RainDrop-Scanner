
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
-- EXECUTE LOGIC
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
