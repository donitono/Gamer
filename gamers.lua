--[[
    XSAN's Fish It Pro - Ultimate Edition v1.0 WORKING VERSION
    
    Premium Fish It script with ULTIMATE features:
    • Quick Start Presets & Advanced Analytics
    • Smart Inventory Management & AI Features  
    • Enhanced Fishing & Quality of Life
    • Smart Notifications & Safety Systems
    • Advanced Automation & Much More
    • Ultimate Teleportation System (NEW!)
    
    Developer: XSAN
    Instagram: @_bangicoo
    GitHub: github.com/codeico
    
    Premium Quality • Trusted by Thousands • Ultimate Edition
--]]

print("XSAN: Starting Fish It Pro Ultimate v1.0...")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

-- Check basic requirements
if not LocalPlayer then
    warn("XSAN ERROR: LocalPlayer not found")
    return
end

if not ReplicatedStorage then
    warn("XSAN ERROR: ReplicatedStorage not found")
    return
end

print("XSAN: Basic services OK")

-- Enhanced Configuration Variables
local autoFishEnabled = false
local autoSellEnabled = false  
local perfectCast = false
local safeMode = false
local walkSpeedEnabled = false
local currentWalkSpeed = 50
local infiniteJumpEnabled = false
local lastPosition = nil

-- Notification Functions
local function NotifySuccess(title, message)
    print("✅ " .. title .. ": " .. message)
end

local function NotifyInfo(title, message)
    print("ℹ️ " .. title .. ": " .. message)
end

local function NotifyError(title, message)
    print("❌ " .. title .. ": " .. message)
end

-- Enhanced Auto Fishing Function
local function enhancedAutoFishing()
    autoFishEnabled = true
    spawn(function()
        while autoFishEnabled do
            pcall(function()
                -- Auto fishing logic here (placeholder)
                -- TODO: Integrate with actual fishing system
                if autoSellEnabled then
                    -- Auto sell logic (placeholder)
                    -- TODO: Integrate with actual sell system
                end
            end)
            wait(0.5) -- Prevent spam
        end
    end)
end

local function DisableEnhancedAutoFishing()
    autoFishEnabled = false
end

-- XSAN Anti Ghost Touch System
local ButtonCooldowns = {}
local BUTTON_COOLDOWN = 0.5

local function CreateSafeCallback(originalCallback, buttonId)
    return function(...)
        local currentTime = tick()
        if ButtonCooldowns[buttonId] and currentTime - ButtonCooldowns[buttonId] < BUTTON_COOLDOWN then
            return
        end
        ButtonCooldowns[buttonId] = currentTime
        
        local success, result = pcall(originalCallback, ...)
        if not success then
            warn("XSAN Error:", result)
        end
    end
end

-- Modern Floating UI System (ArcvourHUB Style)
print("XSAN: Loading Modern UI System...")

-- UI Variables
local ScreenGui, FloatingButton, MainFrame, Sidebar, ContentArea, CloseButton
local currentPage = "Farming"
local isUIVisible = false

-- Create Modern UI Function
local function CreateModernUI()
    -- Destroy existing UI if any
    if game.CoreGui:FindFirstChild("XSANModernHub") then
        game.CoreGui:FindFirstChild("XSANModernHub"):Destroy()
    end
    
    -- Main ScreenGui
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "XSANModernHub"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- Floating Toggle Button
    FloatingButton = Instance.new("ImageButton")
    FloatingButton.Name = "FloatingButton"
    FloatingButton.Parent = ScreenGui
    FloatingButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    FloatingButton.BorderSizePixel = 0
    FloatingButton.Position = UDim2.new(0, 20, 0.5, -25)
    FloatingButton.Size = UDim2.new(0, 50, 0, 50)
    FloatingButton.Image = "rbxassetid://3926305904" -- Modern icon
    FloatingButton.ImageColor3 = Color3.fromRGB(138, 43, 226)
    FloatingButton.Active = true
    FloatingButton.Draggable = true
    
    -- Floating Button Corner
    local FloatingCorner = Instance.new("UICorner")
    FloatingCorner.CornerRadius = UDim.new(0, 12)
    FloatingCorner.Parent = FloatingButton
    
    -- Main Hub Frame (Hidden by default)
    MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
    MainFrame.Size = UDim2.new(0, 450, 0, 350)
    MainFrame.Visible = false
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    -- Main Frame Corner
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 15)
    MainCorner.Parent = MainFrame
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 15)
    TopBarCorner.Parent = TopBar
    
    -- Fix top bar corners
    local TopBarFix = Instance.new("Frame")
    TopBarFix.Parent = TopBar
    TopBarFix.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TopBarFix.BorderSizePixel = 0
    TopBarFix.Position = UDim2.new(0, 0, 0.5, 0)
    TopBarFix.Size = UDim2.new(1, 0, 0.5, 0)
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = TopBar
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(0, 200, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "ArcvourHUB"
    Title.TextColor3 = Color3.fromRGB(138, 43, 226)
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Subtitle
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Parent = TopBar
    Subtitle.BackgroundTransparency = 1
    Subtitle.Position = UDim2.new(0, 125, 0, 0)
    Subtitle.Size = UDim2.new(0, 100, 1, 0)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.Text = "Fish It"
    Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Subtitle.TextSize = 14
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Close Button
    CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TopBar
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(1, -30, 0, 10)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 10)
    CloseCorner.Parent = CloseButton
    
    -- Sidebar
    Sidebar = Instance.new("ScrollingFrame")
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Sidebar.BorderSizePixel = 0
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.Size = UDim2.new(0, 150, 1, -40)
    Sidebar.ScrollBarThickness = 6
    Sidebar.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
    Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    -- Content Area
    ContentArea = Instance.new("ScrollingFrame")
    ContentArea.Name = "ContentArea"
    ContentArea.Parent = MainFrame
    ContentArea.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    ContentArea.BorderSizePixel = 0
    ContentArea.Position = UDim2.new(0, 150, 0, 40)
    ContentArea.Size = UDim2.new(1, -150, 1, -40)
    ContentArea.ScrollBarThickness = 6
    ContentArea.ScrollBarImageColor3 = Color3.fromRGB(138, 43, 226)
    ContentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentArea.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    return ScreenGui, FloatingButton, MainFrame, Sidebar, ContentArea, CloseButton
end

print("XSAN: Modern UI System loaded successfully!")

-- Navigation Data
local NavigationPages = {
    {icon = "🌾", name = "Farming", desc = "Auto Fish & Sell"},
    {icon = "🚤", name = "Spawn Boat", desc = "Boat Management"},
    {icon = "🏃", name = "Movement", desc = "Speed & Jump"},
    {icon = "📊", name = "Edit Stats", desc = "Player Stats"},
    {icon = "🎣", name = "Buy Rod", desc = "Rod Shop"},
    {icon = "🌦️", name = "Buy Weather", desc = "Weather Shop"},
    {icon = "🪱", name = "Buy Baits", desc = "Bait Shop"},
    {icon = "🏝️", name = "TP Islands", desc = "Teleportation"}
}

-- Create Sidebar Navigation
local function CreateSidebarNavigation()
    -- Clear existing content
    for _, child in pairs(Sidebar:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
    
    -- Navigation List Layout
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Parent = Sidebar
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Padding = UDim.new(0, 2)
    
    -- Create navigation buttons
    for i, page in pairs(NavigationPages) do
        local NavButton = Instance.new("TextButton")
        NavButton.Name = page.name .. "Button"
        NavButton.Parent = Sidebar
        NavButton.BackgroundColor3 = currentPage == page.name and Color3.fromRGB(138, 43, 226) or Color3.fromRGB(40, 40, 50)
        NavButton.BorderSizePixel = 0
        NavButton.Size = UDim2.new(1, -10, 0, 45)
        NavButton.Position = UDim2.new(0, 5, 0, 0)
        NavButton.AutoButtonColor = false
        NavButton.Text = ""
        
        local NavCorner = Instance.new("UICorner")
        NavCorner.CornerRadius = UDim.new(0, 8)
        NavCorner.Parent = NavButton
        
        -- Icon
        local Icon = Instance.new("TextLabel")
        Icon.Parent = NavButton
        Icon.BackgroundTransparency = 1
        Icon.Position = UDim2.new(0, 10, 0, 0)
        Icon.Size = UDim2.new(0, 25, 1, 0)
        Icon.Font = Enum.Font.Gotham
        Icon.Text = page.icon
        Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
        Icon.TextSize = 16
        Icon.TextXAlignment = Enum.TextXAlignment.Center
        
        -- Text Container
        local TextContainer = Instance.new("Frame")
        TextContainer.Parent = NavButton
        TextContainer.BackgroundTransparency = 1
        TextContainer.Position = UDim2.new(0, 40, 0, 5)
        TextContainer.Size = UDim2.new(1, -45, 1, -10)
        
        -- Name
        local NameLabel = Instance.new("TextLabel")
        NameLabel.Parent = TextContainer
        NameLabel.BackgroundTransparency = 1
        NameLabel.Size = UDim2.new(1, 0, 0.6, 0)
        NameLabel.Font = Enum.Font.GothamSemibold
        NameLabel.Text = page.name
        NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameLabel.TextSize = 13
        NameLabel.TextXAlignment = Enum.TextXAlignment.Left
        NameLabel.TextYAlignment = Enum.TextYAlignment.Bottom
        
        -- Description
        local DescLabel = Instance.new("TextLabel")
        DescLabel.Parent = TextContainer
        DescLabel.BackgroundTransparency = 1
        DescLabel.Position = UDim2.new(0, 0, 0.6, 0)
        DescLabel.Size = UDim2.new(1, 0, 0.4, 0)
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.Text = page.desc
        DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        DescLabel.TextSize = 10
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.TextYAlignment = Enum.TextYAlignment.Top
        
        -- Button click event
        NavButton.MouseButton1Click:Connect(function()
            SwitchToPage(page.name)
        end)
        
        -- Hover effect
        NavButton.MouseEnter:Connect(function()
            if currentPage ~= page.name then
                NavButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            end
        end)
        
        NavButton.MouseLeave:Connect(function()
            if currentPage ~= page.name then
                NavButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            end
        end)
    end
end

-- Create Modern Toggle Function
local function CreateModernToggle(parent, name, desc, defaultValue, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = name .. "Toggle"
    ToggleFrame.Parent = parent
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Size = UDim2.new(1, -20, 0, 50)
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 10)
    ToggleCorner.Parent = ToggleFrame
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Parent = ToggleFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 5)
    Title.Size = UDim2.new(1, -70, 0, 20)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Description
    local Desc = Instance.new("TextLabel")
    Desc.Parent = ToggleFrame
    Desc.BackgroundTransparency = 1
    Desc.Position = UDim2.new(0, 15, 0, 25)
    Desc.Size = UDim2.new(1, -70, 0, 15)
    Desc.Font = Enum.Font.Gotham
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(180, 180, 180)
    Desc.TextSize = 12
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Toggle Switch
    local Switch = Instance.new("Frame")
    Switch.Name = "Switch"
    Switch.Parent = ToggleFrame
    Switch.BackgroundColor3 = defaultValue and Color3.fromRGB(138, 43, 226) or Color3.fromRGB(60, 60, 70)
    Switch.BorderSizePixel = 0
    Switch.Position = UDim2.new(1, -45, 0.5, -10)
    Switch.Size = UDim2.new(0, 35, 0, 20)
    
    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(0, 10)
    SwitchCorner.Parent = Switch
    
    -- Toggle Circle
    local Circle = Instance.new("Frame")
    Circle.Name = "Circle"
    Circle.Parent = Switch
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.BorderSizePixel = 0
    Circle.Position = defaultValue and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
    Circle.Size = UDim2.new(0, 16, 0, 16)
    
    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(0, 8)
    CircleCorner.Parent = Circle
    
    -- Toggle functionality
    local isToggled = defaultValue
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Parent = ToggleFrame
    ToggleButton.BackgroundTransparency = 1
    ToggleButton.Size = UDim2.new(1, 0, 1, 0)
    ToggleButton.Text = ""
    
    ToggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        
        -- Animate toggle
        game:GetService("TweenService"):Create(Circle, TweenInfo.new(0.2), {
            Position = isToggled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        }):Play()
        
        game:GetService("TweenService"):Create(Switch, TweenInfo.new(0.2), {
            BackgroundColor3 = isToggled and Color3.fromRGB(138, 43, 226) or Color3.fromRGB(60, 60, 70)
        }):Play()
        
        -- Callback
        if callback then
            callback(isToggled)
        end
    end)
    
    return ToggleFrame, isToggled
end

-- Create Modern Slider Function (Matching image style)
local function CreateModernSlider(parent, name, desc, min, max, defaultValue, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = name .. "Slider"
    SliderFrame.Parent = parent
    SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Size = UDim2.new(1, -20, 0, 70)
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 10)
    SliderCorner.Parent = SliderFrame
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Parent = SliderFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 8)
    Title.Size = UDim2.new(0.7, 0, 0, 18)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = name
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Value Display
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Parent = SliderFrame
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Position = UDim2.new(0.7, 0, 0, 8)
    ValueLabel.Size = UDim2.new(0.3, -15, 0, 18)
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.Text = tostring(defaultValue)
    ValueLabel.TextColor3 = Color3.fromRGB(138, 43, 226)
    ValueLabel.TextSize = 14
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    -- Slider Track
    local Track = Instance.new("Frame")
    Track.Parent = SliderFrame
    Track.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    Track.BorderSizePixel = 0
    Track.Position = UDim2.new(0, 15, 0, 35)
    Track.Size = UDim2.new(1, -30, 0, 6)
    
    local TrackCorner = Instance.new("UICorner")
    TrackCorner.CornerRadius = UDim.new(0, 3)
    TrackCorner.Parent = Track
    
    -- Slider Fill (Purple like in image)
    local Fill = Instance.new("Frame")
    Fill.Parent = Track
    Fill.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    Fill.BorderSizePixel = 0
    Fill.Size = UDim2.new((defaultValue - min) / (max - min), 0, 1, 0)
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0, 3)
    FillCorner.Parent = Fill
    
    -- Slider Handle
    local Handle = Instance.new("Frame")
    Handle.Parent = Track
    Handle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Handle.BorderSizePixel = 0
    Handle.Position = UDim2.new((defaultValue - min) / (max - min), -8, 0.5, -8)
    Handle.Size = UDim2.new(0, 16, 0, 16)
    
    local HandleCorner = Instance.new("UICorner")
    HandleCorner.CornerRadius = UDim.new(0, 8)
    HandleCorner.Parent = Handle
    
    -- Slider functionality
    local currentValue = defaultValue
    local dragging = false
    
    local function UpdateSlider(percentage)
        percentage = math.clamp(percentage, 0, 1)
        currentValue = math.floor(min + (max - min) * percentage)
        
        Fill.Size = UDim2.new(percentage, 0, 1, 0)
        Handle.Position = UDim2.new(percentage, -8, 0.5, -8)
        ValueLabel.Text = tostring(currentValue)
        
        if callback then
            callback(currentValue)
        end
    end
    
    Track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local percentage = (input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X
            UpdateSlider(percentage)
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percentage = (input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X
            UpdateSlider(percentage)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return SliderFrame, currentValue
end

-- Switch to Page Function
function SwitchToPage(pageName)
    currentPage = pageName
    CreateSidebarNavigation() -- Refresh sidebar to update active state
    CreatePageContent(pageName)
end

-- Create Page Content
function CreatePageContent(pageName)
    -- Clear existing content
    for _, child in pairs(ContentArea:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
    
    -- Content List Layout
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Parent = ContentArea
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 10)
    
    -- Padding
    local Padding = Instance.new("UIPadding")
    Padding.Parent = ContentArea
    Padding.PaddingTop = UDim.new(0, 10)
    Padding.PaddingBottom = UDim.new(0, 10)
    Padding.PaddingLeft = UDim.new(0, 10)
    Padding.PaddingRight = UDim.new(0, 10)
    
    -- Page-specific content
    if pageName == "Farming" then
        CreateModernToggle(ContentArea, "Enable AutoFish", "Automatically catch fish", autoFishEnabled, function(value)
            autoFishEnabled = value
            if value then
                enhancedAutoFishing()
                NotifySuccess("Auto Fish", "Enhanced auto fishing enabled!")
            else
                DisableEnhancedAutoFishing()
                NotifyInfo("Auto Fish", "Auto fishing disabled!")
            end
        end)
        
        CreateModernToggle(ContentArea, "Auto Sell", "Automatically sell caught fish", autoSellEnabled, function(value)
            autoSellEnabled = value
            NotifyInfo("Auto Sell", "Auto sell " .. (value and "enabled" or "disabled"))
        end)
        
        CreateModernToggle(ContentArea, "Perfect Cast", "Enable perfect cast mode", perfectCast, function(value)
            perfectCast = value
            NotifyInfo("Perfect Cast", "Perfect cast " .. (value and "enabled" or "disabled"))
        end)
        
        CreateModernToggle(ContentArea, "Safe Mode", "Random perfect cast for safety", safeMode, function(value)
            safeMode = value
            NotifyInfo("Safe Mode", "Safe mode " .. (value and "enabled" or "disabled"))
        end)
        
    elseif pageName == "Movement" then
        CreateModernToggle(ContentArea, "Enable WalkSpeed", "Enable custom walk speed", walkSpeedEnabled, function(value)
            walkSpeedEnabled = value
            if value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = currentWalkSpeed
            elseif LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = 16 -- Default
            end
            NotifyInfo("Walk Speed", "Walk speed " .. (value and "enabled" or "disabled"))
        end)
        
        CreateModernSlider(ContentArea, "WalkSpeed Value", "Set your walking speed", 16, 200, currentWalkSpeed, function(value)
            currentWalkSpeed = value
            if walkSpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = value
            end
        end)
        
        CreateModernToggle(ContentArea, "Enable Infinite Jump", "Jump infinitely", infiniteJumpEnabled, function(value)
            infiniteJumpEnabled = value
            NotifyInfo("Infinite Jump", "Infinite jump " .. (value and "enabled" or "disabled"))
        end)
        
    elseif pageName == "Spawn Boat" then
        -- Page Header
        local HeaderFrame = Instance.new("Frame")
        HeaderFrame.Parent = ContentArea
        HeaderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        HeaderFrame.BorderSizePixel = 0
        HeaderFrame.Size = UDim2.new(1, -20, 0, 40)
        
        local HeaderCorner = Instance.new("UICorner")
        HeaderCorner.CornerRadius = UDim.new(0, 10)
        HeaderCorner.Parent = HeaderFrame
        
        local HeaderText = Instance.new("TextLabel")
        HeaderText.Parent = HeaderFrame
        HeaderText.BackgroundTransparency = 1
        HeaderText.Position = UDim2.new(0, 15, 0, 0)
        HeaderText.Size = UDim2.new(1, -30, 1, 0)
        HeaderText.Font = Enum.Font.GothamBold
        HeaderText.Text = "🚤 Boat Management"
        HeaderText.TextColor3 = Color3.fromRGB(138, 43, 226)
        HeaderText.TextSize = 16
        HeaderText.TextXAlignment = Enum.TextXAlignment.Left
        
        -- TODO: Add boat spawn buttons here
        
    elseif pageName == "TP Islands" then
        -- Page Header
        local HeaderFrame = Instance.new("Frame")
        HeaderFrame.Parent = ContentArea
        HeaderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        HeaderFrame.BorderSizePixel = 0
        HeaderFrame.Size = UDim2.new(1, -20, 0, 40)
        
        local HeaderCorner = Instance.new("UICorner")
        HeaderCorner.CornerRadius = UDim.new(0, 10)
        HeaderCorner.Parent = HeaderFrame
        
        local HeaderText = Instance.new("TextLabel")
        HeaderText.Parent = HeaderFrame
        HeaderText.BackgroundTransparency = 1
        HeaderText.Position = UDim2.new(0, 15, 0, 0)
        HeaderText.Size = UDim2.new(1, -30, 1, 0)
        HeaderText.Font = Enum.Font.GothamBold
        HeaderText.Text = "🏝️ Island Teleportation"
        HeaderText.TextColor3 = Color3.fromRGB(138, 43, 226)
        HeaderText.TextSize = 16
        HeaderText.TextXAlignment = Enum.TextXAlignment.Left
        
        -- TODO: Add teleport buttons here
    end
end

-- Initialize Modern UI
local function InitializeModernUI()
    local success, error = pcall(function()
        -- Create the UI
        ScreenGui, FloatingButton, MainFrame, Sidebar, ContentArea, CloseButton = CreateModernUI()
        
        -- Floating button click event
        FloatingButton.MouseButton1Click:Connect(function()
            isUIVisible = not isUIVisible
            MainFrame.Visible = isUIVisible
            
            if isUIVisible then
                -- Initialize sidebar and content
                CreateSidebarNavigation()
                SwitchToPage("Farming") -- Default page
            end
        end)
        
        -- Close button event
        CloseButton.MouseButton1Click:Connect(function()
            isUIVisible = false
            MainFrame.Visible = false
        end)
        
        -- Success notification
        NotifySuccess("ArcvourHUB", "Modern UI loaded successfully!")
        print("✅ XSAN: Modern UI system initialized successfully!")
    end)
    
    if not success then
        warn("❌ XSAN Error: Failed to initialize Modern UI - " .. tostring(error))
        -- Fallback notification
        print("⚠️ XSAN: UI initialization failed, check console for details")
        return false
    end
    
    return true
end

-- Auto-detect screen size and adjust window accordingly
local function GetOptimalWindowSize()
    local screenSize = workspace.CurrentCamera.ViewportSize
    local screenWidth = screenSize.X
    local screenHeight = screenSize.Y
    
    -- Calculate optimal size (60% of screen width, 80% of screen height, with limits)
    local optimalWidth = math.min(math.max(screenWidth * 0.6, 350), 500)
    local optimalHeight = math.min(math.max(screenHeight * 0.8, 400), 650)
    
    -- Position window to center-left for mobile compatibility
    local posX = screenWidth < 768 and 0.02 or 0.01  -- Closer to edge on mobile
    local posY = screenWidth < 768 and 0.05 or 0.02  -- Lower on mobile
    
    return {
        width = optimalWidth,
        height = optimalHeight,
        posX = posX,
        posY = posY,
        tabWidth = screenWidth < 768 and 120 or 160  -- Smaller tabs on mobile
    }
end

local windowConfig = GetOptimalWindowSize()

-- Initialize Modern UI (Comment out Rayfield)
print("XSAN: Initializing Modern UI...")
--[[
-- Create Window
print("XSAN: Creating main window...")
local Window = Rayfield:CreateWindow({
    Name = "XSAN Fish It Pro v1.0",
    LoadingTitle = "XSAN Fish It Pro Ultimate",
    LoadingSubtitle = "by XSAN - Ultimate Edition",
    Theme = "DarkBlue",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "XSAN",
        FileName = "FishItProUltimate"
    },
    KeySystem = false,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    TabWidth = windowConfig.tabWidth,
    Size = UDim2.fromOffset(windowConfig.width, windowConfig.height),
    Position = UDim2.fromScale(windowConfig.posX, windowConfig.posY)
})

print("XSAN: Window created successfully!")

-- Ultimate tabs with all features
print("XSAN: Creating tabs...")
local InfoTab = Window:CreateTab("INFO", "crown")
print("XSAN: InfoTab created")
local PresetsTab = Window:CreateTab("PRESETS", "zap")
print("XSAN: PresetsTab created")
--]]

-- Initialize the modern UI system instead
local uiInitSuccess = InitializeModernUI()
if uiInitSuccess then
    print("XSAN: Modern UI initialized successfully!")
else
    warn("XSAN: Failed to initialize Modern UI, check errors above")
end

--[[
local MainTab = Window:CreateTab("AUTO FISH", "fish") 
print("XSAN: MainTab created")
local TeleportTab = Window:CreateTab("TELEPORT", "map-pin")
print("XSAN: TeleportTab created")
local AnalyticsTab = Window:CreateTab("ANALYTICS", "bar-chart")
print("XSAN: AnalyticsTab created")
local InventoryTab = Window:CreateTab("INVENTORY", "package")
print("XSAN: InventoryTab created")
local UtilityTab = Window:CreateTab("UTILITY", "settings")
print("XSAN: UtilityTab created")

print("XSAN: All tabs created successfully!")
--]]

-- Modern UI Only - Disable old Rayfield system
--[[
-- Load Remotes (Modern UI doesn't need old Rayfield tabs)
print("XSAN: Loading remotes...")
local net, rodRemote, miniGameRemote, finishRemote, equipRemote

pcall(function()
    net = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net")
    print("XSAN: Net found")
    rodRemote = net:WaitForChild("RF/ChargeFishingRod")
    print("XSAN: Rod remote found")
    miniGameRemote = net:WaitForChild("RF/RequestFishingMinigameStarted")
    print("XSAN: MiniGame remote found")
    finishRemote = net:WaitForChild("RE/FishingCompleted")
    print("XSAN: Finish remote found")
    equipRemote = net:WaitForChild("RE/EquipToolFromHotbar")
    print("XSAN: Equip remote found")
end)

print("XSAN: Remotes loading completed!")

-- State Variables
print("XSAN: Initializing variables...")
local autofish = false
local perfectCast = false
local safeMode = false  -- Safe Mode for random perfect cast
local safeModeChance = 70  -- 70% chance for perfect cast in safe mode
local autoRecastDelay = 0.5
local fishCaught = 0
local itemsSold = 0
local autoSellThreshold = 10
local autoSellOnThreshold = false
local sessionStartTime = tick()
local perfectCasts = 0
local normalCasts = 0  -- Track normal casts for analytics
local currentPreset = "None"
local globalAutoSellEnabled = true  -- Global auto sell control

-- Feature states
local featureState = {
    AutoSell = false,
    SmartInventory = false,
    Analytics = true,
    Safety = true,
}

print("XSAN: Variables initialized successfully!")

-- XSAN Ultimate Teleportation System
print("XSAN: Initializing teleportation system...")

-- Dynamic Teleportation System (Matching bang.lua)
local tpFolder = workspace:FindFirstChild("!!!! ISLAND LOCATIONS !!!!")
local charFolder = workspace:FindFirstChild("Characters")

-- Dynamic Island Detection
local function getDynamicIslands()
    local islands = {}
    if tpFolder then
        for _, island in ipairs(tpFolder:GetChildren()) do
            if island:IsA("BasePart") then
                islands[island.Name] = island.CFrame
            end
        end
    end
    return islands
end

-- Dynamic Player Detection
local function getDynamicPlayers()
    local players = {}
    if charFolder then
        for _, player in ipairs(charFolder:GetChildren()) do
            if player:IsA("Model") and player.Name ~= LocalPlayer.Name and player:FindFirstChild("HumanoidRootPart") then
                players[player.Name] = player.HumanoidRootPart.CFrame
            end
        end
    end
    -- Also get from Players service for active players
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            players[plr.Name] = plr.Character.HumanoidRootPart.CFrame
        end
    end
    return players
end

-- Teleportation Data (Now Dynamic + Static Backup)
local TeleportLocations = {
    Islands = getDynamicIslands(),
    
    NPCs = {
        ["🛒 Shop (Alex)"] = CFrame.new(391, 135, 300),
        ["🎣 Rod Shop (Marc)"] = CFrame.new(454, 150, 229),
        ["⚓ Shipwright (Shipwright)"] = CFrame.new(343, 135, 271),
        ["📦 Storage (Henry)"] = CFrame.new(491, 150, 272),
        ["🏆 Angler (Angler)"] = CFrame.new(484, 150, 331),
        ["🦈 Shark Hunter (Shark Hunter)"] = CFrame.new(-1442, 142, 1006),
        ["❄️ Ice Merchant (Ice Merchant)"] = CFrame.new(2648, 140, 2522),
        ["🌙 Moonstone Merchant"] = CFrame.new(-3004, 135, -1157),
        ["🏛️ Keeper (Keeper)"] = CFrame.new(1296, 135, -808),
        ["🌊 Deep Merchant"] = CFrame.new(994, -715, 1226)
    },
    
    Events = {
        ["🌟 Isonade Event"] = CFrame.new(-1442, 135, 1006),
        ["🦈 Great White Event"] = CFrame.new(1082, 124, -924),
        ["❄️ Whale Event"] = CFrame.new(2648, 140, 2522),
        ["🔥 Volcano Event"] = CFrame.new(-1888, 164, 330),
        ["🌙 Lunar Event"] = CFrame.new(-3004, 135, -1157),
        ["🏛️ Altar Event"] = CFrame.new(1296, 135, -808),
        ["🌊 Deep Sea Event"] = CFrame.new(994, -715, 1226)
    },
    
    Players = getDynamicPlayers()
}

-- Safe Teleportation Function (Enhanced for Dynamic)
local function SafeTeleport(targetCFrame, locationName)
    pcall(function()
        if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            NotifyError("Teleport", "Character not found! Cannot teleport.")
            return
        end
        
        -- Safety check for CFrame
        if not targetCFrame or typeof(targetCFrame) ~= "CFrame" then
            NotifyError("Teleport", "Invalid location: " .. tostring(locationName))
            return
        end
        
        -- Store current position for undo
        lastPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
        
        -- Teleport with offset for safety
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame + Vector3.new(0, 3, 0)
        
        NotifySuccess("Teleported!", "Successfully teleported to: " .. locationName)
    end)
end

-- Update Dynamic Data Function
local function UpdateDynamicData()
    -- Update Islands from workspace
    if tpFolder then
        TeleportLocations.Islands = getDynamicIslands()
    end
    
    -- Update Players
    TeleportLocations.Players = getDynamicPlayers()
end

-- Utility function for table keys
local function GetTableKeys(tbl)
    local keys = {}
    for key, _ in pairs(tbl) do
        table.insert(keys, key)
    end
    return keys
end

-- Auto-refresh data every 5 seconds
spawn(function()
    while true do
        wait(5)
        UpdateDynamicData()
    end
end)
        end
        
        local humanoidRootPart = LocalPlayer.Character.HumanoidRootPart
        
        -- Smooth teleportation with fade effect
        local originalCFrame = humanoidRootPart.CFrame
        
        -- Teleport with slight offset to avoid collision
        local safePosition = targetCFrame.Position + Vector3.new(0, 5, 0)
        humanoidRootPart.CFrame = CFrame.new(safePosition) * CFrame.Angles(0, math.rad(math.random(-180, 180)), 0)
        
        wait(0.1)
        
        -- Lower to ground
        humanoidRootPart.CFrame = targetCFrame
        
        NotifySuccess("Teleport", "Successfully teleported to: " .. locationName)
        
        -- Log teleportation for analytics
        print("XSAN Teleport: " .. LocalPlayer.Name .. " -> " .. locationName)
    end)
end

-- Player Teleportation Function
local function TeleportToPlayer(targetPlayerName)
    pcall(function()
        local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
        if not targetPlayer then
            NotifyError("Player TP", "Player '" .. targetPlayerName .. "' not found!")
            return
        end
        
        if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            NotifyError("Player TP", "Target player's character not found!")
            return
        end
        
        local targetCFrame = targetPlayer.Character.HumanoidRootPart.CFrame
        SafeTeleport(targetCFrame, targetPlayerName .. "'s location")
    end)
end

print("XSAN: Teleportation system initialized successfully!")

-- Notification Functions
local function NotifySuccess(title, message)
	Rayfield:Notify({ Title = "XSAN - " .. title, Content = message, Duration = 3, Image = "circle-check" })
end

local function NotifyError(title, message)
	Rayfield:Notify({ Title = "XSAN - " .. title, Content = message, Duration = 3, Image = "ban" })
end

local function NotifyInfo(title, message)
	Rayfield:Notify({ Title = "XSAN - " .. title, Content = message, Duration = 4, Image = "info" })
end

-- Analytics Functions
local function CalculateFishPerHour()
    local timeElapsed = (tick() - sessionStartTime) / 3600
    if timeElapsed > 0 then
        return math.floor(fishCaught / timeElapsed)
    end
    return 0
end

local function CalculateProfit()
    local avgFishValue = 50
    return fishCaught * avgFishValue
end

-- Quick Start Presets
local function ApplyPreset(presetName)
    currentPreset = presetName
    
    if presetName == "Beginner" then
        autoRecastDelay = 2.0
        perfectCast = false
        safeMode = false
        autoSellThreshold = 5
        autoSellOnThreshold = globalAutoSellEnabled  -- Use global setting
        NotifySuccess("Preset Applied", "Beginner mode activated - Safe and easy settings" .. (globalAutoSellEnabled and " (Auto Sell: ON)" or " (Auto Sell: OFF)"))
        
    elseif presetName == "Speed" then
        autoRecastDelay = 0.5
        perfectCast = true
        safeMode = false
        autoSellThreshold = 20
        autoSellOnThreshold = globalAutoSellEnabled  -- Use global setting
        NotifySuccess("Preset Applied", "Speed mode activated - Maximum fishing speed" .. (globalAutoSellEnabled and " (Auto Sell: ON)" or " (Auto Sell: OFF)"))
        
    elseif presetName == "Profit" then
        autoRecastDelay = 1.0
        perfectCast = true
        safeMode = false
        autoSellThreshold = 15
        autoSellOnThreshold = globalAutoSellEnabled  -- Use global setting
        NotifySuccess("Preset Applied", "Profit mode activated - Optimized for maximum earnings" .. (globalAutoSellEnabled and " (Auto Sell: ON)" or " (Auto Sell: OFF)"))
        
    elseif presetName == "AFK" then
        autoRecastDelay = 1.5
        perfectCast = true
        safeMode = false
        autoSellThreshold = 25
        autoSellOnThreshold = globalAutoSellEnabled  -- Use global setting
        NotifySuccess("Preset Applied", "AFK mode activated - Safe for long sessions" .. (globalAutoSellEnabled and " (Auto Sell: ON)" or " (Auto Sell: OFF)"))
        
    elseif presetName == "Safe" then
        autoRecastDelay = 1.2
        perfectCast = false
        safeMode = true
        safeModeChance = 70
        autoSellThreshold = 18
        autoSellOnThreshold = globalAutoSellEnabled
        NotifySuccess("Preset Applied", "Safe mode activated - Smart random casting (70% perfect, 30% normal)" .. (globalAutoSellEnabled and " (Auto Sell: ON)" or " (Auto Sell: OFF)"))
        
    elseif presetName == "AutoSellOn" then
        globalAutoSellEnabled = true
        autoSellOnThreshold = true
        NotifySuccess("Auto Sell", "Global Auto Sell activated - Will apply to all future presets at " .. autoSellThreshold .. " fish")
        
    elseif presetName == "AutoSellOff" then
        globalAutoSellEnabled = false
        autoSellOnThreshold = false
        NotifySuccess("Auto Sell", "Global Auto Sell deactivated - Manual selling only for all presets")
    end
end

-- Auto Sell Function
local function CheckAndAutoSell()
    if autoSellOnThreshold and fishCaught >= autoSellThreshold then
        pcall(function()
            if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then return end

            local npcContainer = ReplicatedStorage:FindFirstChild("NPC")
            local alexNpc = npcContainer and npcContainer:FindFirstChild("Alex")

            if not alexNpc then
                NotifyError("Auto Sell", "NPC 'Alex' not found! Cannot auto sell.")
                return
            end

            local originalCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            local npcPosition = alexNpc.WorldPivot.Position

            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(npcPosition)
            wait(1)

            ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/SellAllItems"]:InvokeServer()
            wait(1)

            LocalPlayer.Character.HumanoidRootPart.CFrame = originalCFrame
            itemsSold = itemsSold + 1
            fishCaught = 0
            
            NotifySuccess("Auto Sell", "Automatically sold items! Fish count: " .. autoSellThreshold .. " reached.")
        end)
    end
end

-- ═══════════════════════════════════════════════════════════════
-- INFO TAB - XSAN Branding Section
-- ═══════════════════════════════════════════════════════════════

print("XSAN: Creating INFO tab content...")
InfoTab:CreateParagraph({
    Title = "XSAN Fish It Pro Ultimate v1.0",
    Content = "The most advanced Fish It script ever created with AI-powered features, smart analytics, and premium automation systems.\n\nCreated by XSAN - Trusted by thousands of users worldwide!"
})

InfoTab:CreateParagraph({
    Title = "Ultimate Features",
    Content = "Quick Start Presets • Advanced Analytics • Smart Inventory Management • AI Fishing Assistant • Enhanced Safety Systems • Premium Automation • Quality of Life Features • And Much More!"
})

InfoTab:CreateParagraph({
    Title = "Follow XSAN",
    Content = "Stay updated with the latest scripts and features!\n\nInstagram: @_bangicoo\nGitHub: github.com/codeico\n\nYour support helps us create better tools!"
})

InfoTab:CreateButton({ 
    Name = "Copy Instagram Link", 
    Callback = CreateSafeCallback(function() 
        if setclipboard then
            setclipboard("https://instagram.com/_bangicoo") 
            NotifySuccess("Social Media", "Instagram link copied! Follow for updates and support!")
        else
            NotifyInfo("Social Media", "Instagram: @_bangicoo")
        end
    end, "instagram")
})

InfoTab:CreateButton({ 
    Name = "Copy GitHub Link", 
    Callback = CreateSafeCallback(function() 
        if setclipboard then
            setclipboard("https://github.com/codeico") 
            NotifySuccess("Social Media", "GitHub link copied! Check out more premium scripts!")
        else
            NotifyInfo("Social Media", "GitHub: github.com/codeico")
        end
    end, "github")
})

print("XSAN: INFO tab completed successfully!")

-- ═══════════════════════════════════════════════════════════════
-- PRESETS TAB - Quick Start Configurations
-- ═══════════════════════════════════════════════════════════════

print("XSAN: Creating PRESETS tab content...")
PresetsTab:CreateParagraph({
    Title = "XSAN Quick Start Presets",
    Content = "Instantly configure the script with optimal settings for different use cases. Perfect for beginners or quick setup!"
})

PresetsTab:CreateButton({
    Name = "Beginner Mode",
    Callback = CreateSafeCallback(function()
        ApplyPreset("Beginner")
    end, "preset_beginner")
})

PresetsTab:CreateButton({
    Name = "Speed Mode",
    Callback = CreateSafeCallback(function()
        ApplyPreset("Speed")
    end, "preset_speed")
})

PresetsTab:CreateButton({
    Name = "Profit Mode", 
    Callback = CreateSafeCallback(function()
        ApplyPreset("Profit")
    end, "preset_profit")
})

PresetsTab:CreateButton({
    Name = "AFK Mode",
    Callback = CreateSafeCallback(function()
        ApplyPreset("AFK") 
    end, "preset_afk")
})

PresetsTab:CreateButton({
    Name = "🛡️ Safe Mode",
    Callback = CreateSafeCallback(function()
        ApplyPreset("Safe") 
    end, "preset_safe")
})

PresetsTab:CreateParagraph({
    Title = "Auto Sell Global Controls",
    Content = "Global auto sell control - When you set Auto Sell ON/OFF, it will apply to ALL preset modes. This gives you master control over auto selling."
})

PresetsTab:CreateButton({
    Name = "🟢 Global Auto Sell ON",
    Callback = CreateSafeCallback(function()
        ApplyPreset("AutoSellOn")
    end, "preset_autosell_on")
})

PresetsTab:CreateButton({
    Name = "🔴 Global Auto Sell OFF",
    Callback = CreateSafeCallback(function()
        ApplyPreset("AutoSellOff")
    end, "preset_autosell_off")
})

print("XSAN: PRESETS tab completed successfully!")

-- ═══════════════════════════════════════════════════════════════
-- TELEPORT TAB - Ultimate Teleportation System
-- ═══════════════════════════════════════════════════════════════

print("XSAN: Creating TELEPORT tab content...")
TeleportTab:CreateParagraph({
    Title = "XSAN Ultimate Teleport System",
    Content = "Instant teleportation to any location with smart safety features. The most advanced teleportation system for Fish It!"
})

-- Islands Section (Dynamic)
TeleportTab:CreateParagraph({
    Title = "🏝️ Island Teleportation",
    Content = "Dynamic island detection from workspace. Automatically detects all available fishing locations!"
})

-- Function to refresh island buttons
local function RefreshIslandButtons()
    -- Update dynamic data first
    TeleportLocations.Islands = getDynamicIslands()
end

-- Initial load
RefreshIslandButtons()

-- Create buttons for each island (Dynamic)
for locationName, cframe in pairs(TeleportLocations.Islands) do
    TeleportTab:CreateButton({
        Name = locationName,
        Callback = CreateSafeCallback(function()
            SafeTeleport(cframe, locationName)
        end, "tp_island_" .. locationName)
    })
end

-- NPCs Section
TeleportTab:CreateParagraph({
    Title = "🛒 NPC Teleportation",
    Content = "Instantly teleport to important NPCs for trading, upgrades, and services. Save time with quick access!"
})

-- Create buttons for each NPC
for npcName, cframe in pairs(TeleportLocations.NPCs) do
    TeleportTab:CreateButton({
        Name = npcName,
        Callback = CreateSafeCallback(function()
            SafeTeleport(cframe, npcName)
        end, "tp_npc_" .. npcName)
    })
end

-- Events Section
TeleportTab:CreateParagraph({
    Title = "🌟 Event Teleportation",
    Content = "Quick access to event locations and special fishing spots. Never miss an event again!"
})

-- Create buttons for each event location
for eventName, cframe in pairs(TeleportLocations.Events) do
    TeleportTab:CreateButton({
        Name = eventName,
        Callback = CreateSafeCallback(function()
            SafeTeleport(cframe, eventName)
        end, "tp_event_" .. eventName)
    })
end

-- Player Teleportation Section
TeleportTab:CreateParagraph({
    Title = "👥 Player Teleportation",
    Content = "Teleport to other players in the server. Great for meeting friends or following experienced fishers!"
})

TeleportTab:CreateButton({
    Name = "🔄 Refresh Player List",
    Callback = CreateSafeCallback(function()
        local playerCount = 0
        local playerList = ""
        
        -- Update dynamic player data
        TeleportLocations.Players = getDynamicPlayers()
        
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                playerCount = playerCount + 1
                playerList = playerList .. player.Name .. " • "
            end
        end
        
        if playerCount > 0 then
            NotifyInfo("Player List", "Players in server (" .. playerCount .. "):\n\n" .. playerList:sub(1, -3))
        else
            NotifyInfo("Player List", "No other players found in the server!")
        end
    end, "refresh_players")
})

-- Dynamic Islands Refresh Button
TeleportTab:CreateButton({
    Name = "🏝️ Refresh Islands",
    Callback = CreateSafeCallback(function()
        TeleportLocations.Islands = getDynamicIslands()
        local islandCount = 0
        local islandList = ""
        
        for islandName, _ in pairs(TeleportLocations.Islands) do
            islandCount = islandCount + 1
            islandList = islandList .. islandName .. " • "
        end
        
        if islandCount > 0 then
            NotifySuccess("Islands Updated", "Found " .. islandCount .. " islands:\n\n" .. islandList:sub(1, -3))
        else
            NotifyError("No Islands", "No islands found in workspace!")
        end
    end, "refresh_islands")
})

-- Create direct teleport buttons for current players
local function CreateLivePlayerButtons()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= LocalPlayer then
            TeleportTab:CreateButton({
                Name = "👤 TP to " .. player.Name,
                Callback = CreateSafeCallback(function()
                    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        SafeTeleport(player.Character.HumanoidRootPart.CFrame, player.Name)
                    else
                        NotifyError("Player Offline", player.Name .. " is no longer available!")
                    end
                end, "tp_live_player_" .. player.Name)
            })
        end
    end
end

-- Initial player buttons
CreateLivePlayerButtons()
local playerDropdown
spawn(function()
    while true do
        wait(5) -- Update every 5 seconds
        pcall(function()
            if TeleportTab then
                local players = {}
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        table.insert(players, player.Name)
                    end
                end
                
                if #players > 0 then
                    -- Update player list (if dropdown exists, recreate it)
                    -- For now, we'll use buttons since Rayfield dropdown might not support dynamic updates
                end
            end
        end)
    end
end)

-- Manual Player Teleport
local targetPlayerName = ""

TeleportTab:CreateInput({
    Name = "Enter Player Name",
    PlaceholderText = "Type player name here...",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        targetPlayerName = text
    end
})

TeleportTab:CreateButton({
    Name = "🎯 Teleport to Player",
    Callback = CreateSafeCallback(function()
        if targetPlayerName and targetPlayerName ~= "" then
            TeleportToPlayer(targetPlayerName)
        else
            NotifyError("Player TP", "Please enter a player name first!")
        end
    end, "tp_to_player")
})

-- Utility Teleportation
TeleportTab:CreateParagraph({
    Title = "🔧 Teleport Utilities",
    Content = "Additional teleportation features and safety options."
})

TeleportTab:CreateButton({
    Name = "📍 Save Current Position",
    Callback = CreateSafeCallback(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            _G.XSANSavedPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
            NotifySuccess("Position Saved", "Current position saved! Use 'Return to Saved Position' to come back here.")
        else
            NotifyError("Save Position", "Character not found!")
        end
    end, "save_position")
})

TeleportTab:CreateButton({
    Name = "🔙 Return to Saved Position",
    Callback = CreateSafeCallback(function()
        if _G.XSANSavedPosition then
            SafeTeleport(_G.XSANSavedPosition, "Saved Position")
        else
            NotifyError("Return Position", "No saved position found! Save a position first.")
        end
    end, "return_position")
})

TeleportTab:CreateButton({
    Name = "🏠 Teleport to Spawn",
    Callback = CreateSafeCallback(function()
        SafeTeleport(CFrame.new(389, 137, 264), "Moosewood Spawn")
    end, "tp_spawn")
})

print("XSAN: TELEPORT tab completed successfully!")

-- ═══════════════════════════════════════════════════════════════
-- AUTO FISH TAB - Enhanced Fishing System
-- ═══════════════════════════════════════════════════════════════

print("XSAN: Creating AUTO FISH tab content...")
MainTab:CreateParagraph({
    Title = "XSAN Ultimate Auto Fish System",
    Content = "Advanced auto fishing with AI assistance, smart detection, and premium features for the ultimate fishing experience."
})

MainTab:CreateToggle({
    Name = "Enable Auto Fishing",
    CurrentValue = false,
    Callback = CreateSafeCallback(function(val)
        autofish = val
        if val then
            NotifySuccess("Auto Fish", "XSAN Ultimate auto fishing started! AI systems activated.")
            spawn(function()
                while autofish do
                    pcall(function()
                        if equipRemote then equipRemote:FireServer(1) end
                        wait(0.1)

                        -- Safe Mode Logic: Random between perfect and normal cast
                        local usePerfectCast = perfectCast
                        if safeMode then
                            usePerfectCast = math.random(1, 100) <= safeModeChance
                        end

                        local timestamp = usePerfectCast and 9999999999 or (tick() + math.random())
                        if rodRemote then rodRemote:InvokeServer(timestamp) end
                        wait(0.1)

                        local x = usePerfectCast and -1.238 or (math.random(-1000, 1000) / 1000)
                        local y = usePerfectCast and 0.969 or (math.random(0, 1000) / 1000)

                        if miniGameRemote then miniGameRemote:InvokeServer(x, y) end
                        wait(1.3)
                        if finishRemote then finishRemote:FireServer() end
                        
                        fishCaught = fishCaught + 1
                        
                        -- Track cast types for analytics
                        if usePerfectCast then
                            perfectCasts = perfectCasts + 1
                        else
                            normalCasts = normalCasts + 1
                        end
                        
                        CheckAndAutoSell()
                    end)
                    wait(autoRecastDelay)
                end
            end)
        else
            NotifyInfo("Auto Fish", "Auto fishing stopped by user.")
        end
    end, "autofish")
})

MainTab:CreateToggle({
    Name = "Perfect Cast Mode",
    CurrentValue = false,
    Callback = CreateSafeCallback(function(val)
        perfectCast = val
        if val then
            safeMode = false  -- Disable safe mode when perfect cast is manually enabled
        end
        NotifySuccess("Perfect Cast", "Perfect cast mode " .. (val and "activated" or "deactivated") .. "!")
    end, "perfectcast")
})

MainTab:CreateToggle({
    Name = "🛡️ Safe Mode (Smart Random)",
    CurrentValue = false,
    Callback = CreateSafeCallback(function(val)
        safeMode = val
        if val then
            perfectCast = false  -- Disable perfect cast when safe mode is enabled
            NotifySuccess("Safe Mode", "Safe mode activated - Smart random casting for better stealth!")
        else
            NotifyInfo("Safe Mode", "Safe mode deactivated - Manual control restored")
        end
    end, "safemode")
})

MainTab:CreateSlider({
    Name = "Safe Mode Perfect Cast %",
    Range = {30, 90},
    Increment = 5,
    CurrentValue = safeModeChance,
    Callback = function(val)
        safeModeChance = val
        if safeMode then
            NotifyInfo("Safe Mode", "Perfect cast chance set to: " .. val .. "%")
        end
    end
})

MainTab:CreateSlider({
    Name = "Auto Recast Delay",
    Range = {0.5, 5},
    Increment = 0.1,
    CurrentValue = autoRecastDelay,
    Callback = function(val)
        autoRecastDelay = val
    end
})

MainTab:CreateToggle({
    Name = "Auto Sell on Fish Count",
    CurrentValue = false,
    Callback = CreateSafeCallback(function(val)
        autoSellOnThreshold = val
        if val then
            NotifySuccess("Auto Sell Threshold", "Auto sell on threshold activated! Will sell when " .. autoSellThreshold .. " fish caught.")
        else
            NotifyInfo("Auto Sell Threshold", "Auto sell on threshold disabled.")
        end
    end, "autosell_threshold")
})

MainTab:CreateSlider({
    Name = "Fish Count Threshold",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = autoSellThreshold,
    Callback = function(val)
        autoSellThreshold = val
        if autoSellOnThreshold then
            NotifyInfo("Threshold Updated", "Auto sell threshold set to: " .. val .. " fish")
        end
    end
})

print("XSAN: AUTO FISH tab completed successfully!")

-- ═══════════════════════════════════════════════════════════════
-- ANALYTICS TAB - Advanced Statistics & Monitoring
-- ═══════════════════════════════════════════════════════════════

print("XSAN: Creating ANALYTICS tab content...")
AnalyticsTab:CreateParagraph({
    Title = "XSAN Advanced Analytics",
    Content = "Real-time monitoring, performance tracking, and intelligent insights for optimal fishing performance."
})

AnalyticsTab:CreateButton({
    Name = "Show Detailed Statistics",
    Callback = CreateSafeCallback(function()
        local sessionTime = (tick() - sessionStartTime) / 60
        local fishPerHour = CalculateFishPerHour()
        local estimatedProfit = CalculateProfit()
        local totalCasts = perfectCasts + normalCasts
        local perfectEfficiency = totalCasts > 0 and (perfectCasts / totalCasts * 100) or 0
        local castingMode = safeMode and "Safe Mode" or (perfectCast and "Perfect Cast" or "Normal Cast")
        
        local stats = string.format("XSAN Ultimate Analytics:\n\nSession Time: %.1f minutes\nFish Caught: %d\nFish/Hour: %d\n\n=== CASTING STATS ===\nMode: %s\nPerfect Casts: %d (%.1f%%)\nNormal Casts: %d\nTotal Casts: %d\n\n=== EARNINGS ===\nItems Sold: %d\nEstimated Profit: %d coins\nActive Preset: %s", 
            sessionTime, fishCaught, fishPerHour, castingMode, perfectCasts, perfectEfficiency, normalCasts, totalCasts, itemsSold, estimatedProfit, currentPreset
        )
        NotifyInfo("Advanced Stats", stats)
    end, "detailed_stats")
})

AnalyticsTab:CreateButton({
    Name = "Reset Statistics",
    Callback = CreateSafeCallback(function()
        sessionStartTime = tick()
        fishCaught = 0
        itemsSold = 0
        perfectCasts = 0
        normalCasts = 0
        NotifySuccess("Analytics", "All statistics have been reset!")
    end, "reset_stats")
})

print("XSAN: ANALYTICS tab completed successfully!")

-- ═══════════════════════════════════════════════════════════════
-- INVENTORY TAB - Smart Inventory Management
-- ═══════════════════════════════════════════════════════════════

print("XSAN: Creating INVENTORY tab content...")
InventoryTab:CreateParagraph({
    Title = "XSAN Smart Inventory Manager",
    Content = "Intelligent inventory management with auto-drop, space monitoring, and priority item protection."
})

InventoryTab:CreateButton({
    Name = "Check Inventory Status",
    Callback = CreateSafeCallback(function()
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            local items = #backpack:GetChildren()
            local itemNames = {}
            for _, item in pairs(backpack:GetChildren()) do
                table.insert(itemNames, item.Name)
            end
            
            local status = string.format("Inventory Status:\n\nTotal Items: %d/20\nSpace Available: %d slots\n\nItems: %s", 
                items, 20 - items, table.concat(itemNames, ", "))
            NotifyInfo("Inventory", status)
        else
            NotifyError("Inventory", "Could not access backpack!")
        end
    end, "check_inventory")
})

print("XSAN: INVENTORY tab completed successfully!")

-- ═══════════════════════════════════════════════════════════════
-- UTILITY TAB - System Management & Advanced Features
-- ═══════════════════════════════════════════════════════════════

print("XSAN: Creating UTILITY tab content...")
UtilityTab:CreateParagraph({
    Title = "XSAN Ultimate Utility System",
    Content = "Advanced system management, quality of life features, and premium utilities."
})

UtilityTab:CreateButton({
    Name = "Show Ultimate Session Stats",
    Callback = CreateSafeCallback(function()
        local sessionTime = (tick() - sessionStartTime) / 60
        local fishPerHour = CalculateFishPerHour()
        local estimatedProfit = CalculateProfit()
        local efficiency = fishCaught > 0 and (perfectCasts / fishCaught * 100) or 0
        local thresholdStatus = autoSellOnThreshold and ("Active (" .. autoSellThreshold .. " fish)") or "Inactive"
        
        local ultimateStats = string.format("XSAN ULTIMATE SESSION REPORT:\n\n=== PERFORMANCE ===\nSession Time: %.1f minutes\nFish Caught: %d\nFish/Hour Rate: %d\nPerfect Casts: %d (%.1f%%)\n\n=== EARNINGS ===\nItems Sold: %d\nEstimated Profit: %d coins\n\n=== AUTOMATION ===\nAuto Fish: %s\nThreshold Auto Sell: %s\nActive Preset: %s", 
            sessionTime, fishCaught, fishPerHour, perfectCasts, efficiency,
            itemsSold, estimatedProfit,
            autofish and "Active" or "Inactive",
            thresholdStatus, currentPreset
        )
        NotifyInfo("Ultimate Stats", ultimateStats)
    end, "ultimate_stats")
})

UtilityTab:CreateParagraph({
    Title = "📱 Mobile UI Controls",
    Content = "Automatic screen detection active! Window size adjusts based on your device. Use manual resize options below if needed."
})

UtilityTab:CreateButton({
    Name = "📱 Mobile Size (Small)",
    Callback = CreateSafeCallback(function()
        if game:GetService("CoreGui"):FindFirstChild("Rayfield") then
            local rayfield = game:GetService("CoreGui").Rayfield
            local main = rayfield:FindFirstChild("Main")
            if main then
                main.Size = UDim2.fromOffset(320, 450)
                main.Position = UDim2.fromScale(0.02, 0.05)
                NotifySuccess("UI Resize", "Mobile size applied - 320x450px")
            end
        end
    end, "mobile_size")
})

UtilityTab:CreateButton({
    Name = "💻 Desktop Size (Medium)",
    Callback = CreateSafeCallback(function()
        if game:GetService("CoreGui"):FindFirstChild("Rayfield") then
            local rayfield = game:GetService("CoreGui").Rayfield
            local main = rayfield:FindFirstChild("Main")
            if main then
                main.Size = UDim2.fromOffset(450, 600)
                main.Position = UDim2.fromScale(0.01, 0.02)
                NotifySuccess("UI Resize", "Desktop size applied - 450x600px")
            end
        end
    end, "desktop_size")
})

UtilityTab:CreateButton({
    Name = "🖥️ Large Size (Big Screen)",
    Callback = CreateSafeCallback(function()
        if game:GetService("CoreGui"):FindFirstChild("Rayfield") then
            local rayfield = game:GetService("CoreGui").Rayfield
            local main = rayfield:FindFirstChild("Main")
            if main then
                main.Size = UDim2.fromOffset(520, 700)
                main.Position = UDim2.fromScale(0.01, 0.02)
                NotifySuccess("UI Resize", "Large size applied - 520x700px")
            end
        end
    end, "large_size")
})

UtilityTab:CreateButton({ 
    Name = "Rejoin Server", 
    Callback = CreateSafeCallback(function() 
        NotifyInfo("Server", "Rejoining current server...")
        wait(1)
        TeleportService:Teleport(game.PlaceId, LocalPlayer) 
    end, "rejoin_server")
})

UtilityTab:CreateButton({ 
    Name = "Emergency Stop All",
    Callback = CreateSafeCallback(function()
        autofish = false
        featureState.AutoSell = false
        autoSellOnThreshold = false
        
        NotifyError("Emergency Stop", "All automation systems stopped immediately!")
    end, "emergency_stop")
})

UtilityTab:CreateButton({ 
    Name = "Unload Ultimate Script", 
    Callback = CreateSafeCallback(function()
        NotifyInfo("XSAN", "Thank you for using XSAN Fish It Pro Ultimate v1.0! The most advanced fishing script ever created.\n\nScript will unload in 3 seconds...")
        wait(3)
        if game:GetService("CoreGui"):FindFirstChild("Rayfield") then
            game:GetService("CoreGui").Rayfield:Destroy()
        end
    end, "unload_script")
})

print("XSAN: UTILITY tab completed successfully!")

-- Hotkey System
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F1 then
        autofish = not autofish
        NotifyInfo("Hotkey", "Auto fishing " .. (autofish and "started" or "stopped") .. " (F1)")
    elseif input.KeyCode == Enum.KeyCode.F2 then
        perfectCast = not perfectCast
        NotifyInfo("Hotkey", "Perfect cast " .. (perfectCast and "enabled" or "disabled") .. " (F2)")
    elseif input.KeyCode == Enum.KeyCode.F3 then
        autoSellOnThreshold = not autoSellOnThreshold
        NotifyInfo("Hotkey", "Auto sell threshold " .. (autoSellOnThreshold and "enabled" or "disabled") .. " (F3)")
    elseif input.KeyCode == Enum.KeyCode.F4 then
        -- Quick teleport to spawn
        SafeTeleport(CFrame.new(389, 137, 264), "Moosewood Spawn")
        NotifyInfo("Hotkey", "Quick teleport to spawn (F4)")
    elseif input.KeyCode == Enum.KeyCode.F5 then
        -- Save current position
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            _G.XSANSavedPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
            NotifyInfo("Hotkey", "Position saved (F5)")
        end
    elseif input.KeyCode == Enum.KeyCode.F6 then
        -- Return to saved position
        if _G.XSANSavedPosition then
            SafeTeleport(_G.XSANSavedPosition, "Saved Position")
            NotifyInfo("Hotkey", "Returned to saved position (F6)")
        end
    end
end)

-- Welcome Messages
spawn(function()
    wait(2)
    NotifySuccess("Welcome!", "XSAN Fish It Pro ULTIMATE v1.0 loaded successfully!\n\nULTIMATE FEATURES ACTIVATED:\nAI-Powered Analytics • Smart Automation • Advanced Safety • Premium Quality • Ultimate Teleportation • And Much More!\n\nReady to dominate Fish It like never before!")
    
    wait(4)
    NotifyInfo("Hotkeys Active!", "HOTKEYS ENABLED:\nF1 - Toggle Auto Fishing\nF2 - Toggle Perfect Cast\nF3 - Toggle Auto Sell Threshold\nF4 - Quick TP to Spawn\nF5 - Save Position\nF6 - Return to Saved Position\n\nCheck PRESETS tab for quick setup!")
    
    wait(3)
    NotifyInfo("📱 Smart UI!", "SMART UI DETECTION:\nWindow automatically sized for your device!\n\nNeed manual resize? Check UTILITY tab for Mobile/Desktop size options!")
    
    wait(3)
    NotifyInfo("🌟 Ultimate Teleportation!", "DYNAMIC TELEPORTATION SYSTEM ACTIVE:\n🏝️ Auto-detect Islands • 👥 Live Player Tracking • 🎯 Events • 📍 Position Saving\n\n✨ Now matches bang.lua system!\nCheck TELEPORT tab for instant travel!")
    
    wait(3)
    NotifyInfo("Follow XSAN!", "Instagram: @_bangicoo\nGitHub: codeico\n\nThe most advanced Fish It script ever created! Follow us for more premium scripts and exclusive updates!")
end)

-- Dynamic Player Update Events (Matching bang.lua behavior)
game.Players.PlayerAdded:Connect(function(player)
    wait(1) -- Wait for player to fully load
    UpdateDynamicData()
    NotifyInfo("Player Joined", player.Name .. " joined the server!")
end)

game.Players.PlayerRemoving:Connect(function(player)
    UpdateDynamicData()
    NotifyInfo("Player Left", player.Name .. " left the server!")
end)

-- Dynamic Island Detection (Check for workspace changes)
if tpFolder then
    tpFolder.ChildAdded:Connect(function(newIsland)
        if newIsland:IsA("BasePart") then
            wait(1) -- Wait for island to fully load
            TeleportLocations.Islands = getDynamicIslands()
            NotifySuccess("New Island!", "Detected new island: " .. newIsland.Name)
        end
    end)
    
    tpFolder.ChildRemoved:Connect(function(removedIsland)
        if removedIsland:IsA("BasePart") then
            TeleportLocations.Islands = getDynamicIslands()
            NotifyInfo("Island Removed", "Island removed: " .. removedIsland.Name)
        end
    end)
end
--]]

-- Console Branding
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("XSAN FISH IT PRO ULTIMATE v1.0")
print("THE MOST ADVANCED FISH IT SCRIPT EVER CREATED")
print("Premium Script with AI-Powered Features & Ultimate Automation")
print("Instagram: @_bangicoo | GitHub: codeico")
print("Professional Quality • Trusted by Thousands • Ultimate Edition")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("XSAN: Script loaded successfully! All systems operational!")
print("")
print("🔧 DYNAMIC TELEPORTATION STATUS:")
if tpFolder then
    local islandCount = 0
    for _ in pairs(getDynamicIslands()) do islandCount = islandCount + 1 end
    print("✅ Islands Folder Found: " .. islandCount .. " islands detected")
else
    print("❌ Islands Folder Not Found - Using static coordinates")
end

if charFolder then
    print("✅ Characters Folder Found - Dynamic player tracking active")
else
    print("❌ Characters Folder Not Found - Using Players service only")
end

local playerCount = 0
for _ in pairs(getDynamicPlayers()) do playerCount = playerCount + 1 end
print("👥 Active Players: " .. playerCount)
print("")

-- Performance Enhancements
pcall(function()
    local Modifiers = require(game:GetService("ReplicatedStorage").Shared.FishingRodModifiers)
    for key in pairs(Modifiers) do
        Modifiers[key] = 999999999
    end

    local bait = require(game:GetService("ReplicatedStorage").Baits["Luck Bait"])
    bait.Luck = 999999999
    
    print("XSAN: Performance enhancements applied!")
end)
