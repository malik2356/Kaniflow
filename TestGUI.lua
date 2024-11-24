local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Hauptcontainer
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = gui

-- Tab-Leiste
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, 0, 0, 50)
tabBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabBar.Parent = mainFrame

-- Inhaltsbereich
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -50)
contentFrame.Position = UDim2.new(0, 0, 0, 50)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.Parent = mainFrame

-- Tab: "Home"
local homeTab = Instance.new("Frame")
homeTab.Name = "Home"
homeTab.Size = UDim2.new(1, 0, 1, 0)
homeTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
homeTab.Parent = contentFrame

-- Button 1: Steal Car
local stealCarButton = Instance.new("TextButton")
stealCarButton.Size = UDim2.new(0, 100, 0, 30)
stealCarButton.Position = UDim2.new(0, 20, 0, 20)
stealCarButton.Text = "Steal Car"
stealCarButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
stealCarButton.TextColor3 = Color3.new(1, 1, 1)
stealCarButton.Font = Enum.Font.SourceSans
stealCarButton.TextSize = 14
stealCarButton.Parent = homeTab

-- Button 2: Car Fly
local carFlyButton = Instance.new("TextButton")
carFlyButton.Size = UDim2.new(0, 100, 0, 30)
carFlyButton.Position = UDim2.new(0, 20, 0, 60)
carFlyButton.Text = "Car Fly"
carFlyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
carFlyButton.TextColor3 = Color3.new(1, 1, 1)
carFlyButton.Font = Enum.Font.SourceSans
carFlyButton.TextSize = 14
carFlyButton.Parent = homeTab

-- Button 3: Infinite Yield
local infiniteYieldButton = Instance.new("TextButton")
infiniteYieldButton.Size = UDim2.new(0, 100, 0, 30)
infiniteYieldButton.Position = UDim2.new(0, 20, 0, 100)
infiniteYieldButton.Text = "Infinite Yield"
infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
infiniteYieldButton.TextColor3 = Color3.new(1, 1, 1)
infiniteYieldButton.Font = Enum.Font.SourceSans
infiniteYieldButton.TextSize = 14
infiniteYieldButton.Parent = homeTab

-- Checkbox 1: Enable Feature 1
local feature1Checkbox = Instance.new("Frame")
feature1Checkbox.Size = UDim2.new(0, 200, 0, 30)
feature1Checkbox.Position = UDim2.new(0, 140, 0, 20)
feature1Checkbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
feature1Checkbox.Parent = homeTab

local feature1Label = Instance.new("TextLabel")
feature1Label.Size = UDim2.new(1, 0, 1, 0)
feature1Label.Text = "Enable Feature 1"
feature1Label.TextColor3 = Color3.new(1, 1, 1)
feature1Label.TextSize = 14
feature1Label.BackgroundTransparency = 1
feature1Label.Parent = feature1Checkbox

local feature1Toggle = Instance.new("TextButton")
feature1Toggle.Size = UDim2.new(0, 30, 0, 30)
feature1Toggle.Position = UDim2.new(1, -40, 0, 0)
feature1Toggle.Text = "Off"
feature1Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
feature1Toggle.TextColor3 = Color3.new(1, 1, 1)
feature1Toggle.Font = Enum.Font.SourceSans
feature1Toggle.TextSize = 14
feature1Toggle.Parent = feature1Checkbox

-- Checkbox 2: Enable Feature 2
local feature2Checkbox = Instance.new("Frame")
feature2Checkbox.Size = UDim2.new(0, 200, 0, 30)
feature2Checkbox.Position = UDim2.new(0, 140, 0, 60)
feature2Checkbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
feature2Checkbox.Parent = homeTab

local feature2Label = Instance.new("TextLabel")
feature2Label.Size = UDim2.new(1, 0, 1, 0)
feature2Label.Text = "Enable Feature 2"
feature2Label.TextColor3 = Color3.new(1, 1, 1)
feature2Label.TextSize = 14
feature2Label.BackgroundTransparency = 1
feature2Label.Parent = feature2Checkbox

local feature2Toggle = Instance.new("TextButton")
feature2Toggle.Size = UDim2.new(0, 30, 0, 30)
feature2Toggle.Position = UDim2.new(1, -40, 0, 0)
feature2Toggle.Text = "Off"
feature2Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
feature2Toggle.TextColor3 = Color3.new(1, 1, 1)
feature2Toggle.Font = Enum.Font.SourceSans
feature2Toggle.TextSize = 14
feature2Toggle.Parent = feature2Checkbox

-- Funktion für die Buttons
stealCarButton.MouseButton1Click:Connect(function()
    print("Steal Car Button clicked!")
    -- Füge die Logik für den "Steal Car"-Button hier ein
end)

carFlyButton.MouseButton1Click:Connect(function()
    print("Car Fly Button clicked!")
    -- Füge die Logik für den "Car Fly"-Button hier ein
end)

infiniteYieldButton.MouseButton1Click:Connect(function()
    print("Infinite Yield Button clicked!")
    -- Füge die Logik für den "Infinite Yield"-Button hier ein
end)

-- Funktion für die Checkboxen
local function toggleFeature1()
    if feature1Toggle.Text == "Off" then
        feature1Toggle.Text = "On"
        print("Feature 1 enabled!")
        -- Füge die Logik für Feature 1 hier ein
    else
        feature1Toggle.Text = "Off"
        print("Feature 1 disabled!")
        -- Deaktiviert Feature 1
    end
end

local function toggleFeature2()
    if feature2Toggle.Text == "Off" then
        feature2Toggle.Text = "On"
        print("Feature 2 enabled!")
        -- Füge die Logik für Feature 2 hier ein
    else
        feature2Toggle.Text = "Off"
        print("Feature 2 disabled!")
        -- Deaktiviert Feature 2
    end
end

feature1Toggle.MouseButton1Click:Connect(toggleFeature1)
feature2Toggle.MouseButton1Click:Connect(toggleFeature2)
