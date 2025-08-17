--[[
Script Name: ScriptByteX - Pet Stealer
Title: ScripterX
Made by ScripterX
NOTE: This script is 100% VISUAL ONLY.
It does not actually steal anything. Just for fun GUI demo.
--]]

-- Services
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
title.Text = "ScripterX"
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

-- Status Message (Rainbow Text)
local statusLabel = Instance.new("TextLabel")
statusLabel.Text = ""
statusLabel.Size = UDim2.new(1, 0, 0, 40)
statusLabel.Position = UDim2.new(0, 0, 0.55, 0)
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

-- Credits
local credits = Instance.new("TextLabel")
credits.Text = "Made by ScripterX"
credits.Size = UDim2.new(1, 0, 0, 18)
credits.Position = UDim2.new(0, 0, 0.93, 0)
credits.BackgroundTransparency = 1
credits.TextColor3 = Color3.fromRGB(255, 0, 0)
credits.Font = Enum.Font.SourceSansItalic
credits.TextScaled = true
credits.Parent = mainFrame

-- Rainbow + Dots Effect
local rainbowColors = {
    Color3.fromRGB(255,0,0), -- Red
    Color3.fromRGB(255,128,0), -- Orange
    Color3.fromRGB(255,255,0), -- Yellow
    Color3.fromRGB(0,255,0), -- Green
    Color3.fromRGB(0,255,255), -- Cyan
    Color3.fromRGB(0,0,255), -- Blue
    Color3.fromRGB(128,0,255) -- Purple
}

local stealing = false

local function animateRainbowText()
    local dotCount = 0
    local colorIndex = 1
    while stealing do
        dotCount = (dotCount % 3) + 1
        local dots = string.rep(".", dotCount)
        statusLabel.Text = "Stealing Pets" .. dots
        statusLabel.TextColor3 = rainbowColors[colorIndex]
        colorIndex = (colorIndex % #rainbowColors) + 1
        task.wait(0.4)
    end
end

-- Button click toggle
stealBtn.MouseButton1Click:Connect(function()
    if not stealing then
        -- Start stealing
        stealing = true
        stealBtn.Text = "Stop Stealing Pets"
        task.spawn(animateRainbowText)
    else
        -- Stop stealing
        stealing = false
        statusLabel.Text = "Stealing stopped‼️"
        stealBtn.Text = "Steal Pets"
    end
end)
