
local function notifylol(title,message,duration)
    pcall(function()
        plrguieviltwin:SetCore("SendNotification", {
            Title = title,
            Text = message,
            Duration = duration or 4
        })
    end)
end
