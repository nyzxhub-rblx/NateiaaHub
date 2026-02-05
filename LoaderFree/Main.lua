local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local placeId = game.PlaceId
local player = Players.LocalPlayer

local ntLogo = "rbxassetid://84946340265305"

local gameScripts = {
    [9615893653] = {
        name = "B",
        free = "https://raw.githubusercontent.com/"
    },
    [121864768012064] = {
        name = "Fish It",
        free = "https://raw.githubusercontent.com/albibot69-lgtm/Lexs/refs/heads/main/Fish_It/freemiumopen.colseui.lua"
    }
}

local gameData = gameScripts[placeId]
local gameName = gameData and gameData.name or "Unknown Game"

StarterGui:SetCore("SendNotification", {
    Title = "NT Hub",
    Text = "Detected game: " .. gameName,
    Icon = ntLogo,
    Duration = 3
})

task.wait(0.3)

if gameData then
    StarterGui:SetCore("SendNotification", {
        Title = "NT Hub",
        Text = "Loading FREE version...",
        Icon = ntLogo,
        Duration = 3
    })

    local success, scriptContent = pcall(function()
        return game:HttpGet(gameData.free)
    end)

    if success and scriptContent and scriptContent ~= "" then
        local f = loadstring(scriptContent)
        if f then
            f()
        end
    else
        StarterGui:SetCore("SendNotification", {
            Title = "NT Hub",
            Text = "Failed to load script!",
            Icon = ntLogo,
            Duration = 4
        })
    end
else
    StarterGui:SetCore("SendNotification", {
        Title = "NT Hub",
        Text = "Game not supported!",
        Icon = ntLogo,
        Duration = 4
    })
end
