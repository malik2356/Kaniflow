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

-- Tab: "Fun"
local funTab = Instance.new("Frame")
funTab.Name = "Fun"
funTab.Size = UDim2.new(1, 0, 1, 0)
funTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
funTab.Parent = contentFrame

-- Button im Fun-Tab
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 30)
flyButton.Position = UDim2.new(0, 20, 0, 20)
flyButton.Text = "Fliegen"
flyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
flyButton.TextColor3 = Color3.new(1, 1, 1)
flyButton.Font = Enum.Font.SourceSans
flyButton.TextSize = 14
flyButton.Parent = funTab

-- Flugsteuerung
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local flying = false
local flightSpeed = 30 -- Fluggeschwindigkeit
local bodyGyro = Instance.new("BodyGyro")
local bodyVelocity = Instance.new("BodyVelocity")

bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
bodyGyro.P = 3000
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)

-- Aktualisierte Fluglogik
local function startFlying()
    flying = true
    bodyGyro.Parent = humanoidRootPart
    bodyVelocity.Parent = humanoidRootPart

    game:GetService("RunService").RenderStepped:Connect(function()
        if flying then
            bodyGyro.CFrame = workspace.CurrentCamera.CFrame
            bodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * flightSpeed
        end
    end)
end

local function stopFlying()
    flying = false
    bodyGyro.Parent = nil
    bodyVelocity.Parent = nil
end

-- Sicherheitsmaßnahmen: Kill-Switch & Speed-Steuerung
local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if flying then
        -- Fluggeschwindigkeit erhöhen/verringern
        if input.KeyCode == Enum.KeyCode.W then
            flightSpeed = math.clamp(flightSpeed + 10, 0, 50)
        elseif input.KeyCode == Enum.KeyCode.S then
            flightSpeed = math.clamp(flightSpeed - 10, 0, 50)
        end
    end

    -- Kill-Switch (Taste: K)
    if input.KeyCode == Enum.KeyCode.K then
        flying = false
        stopFlying()
        flyButton.Text = "Fliegen"
        print("Kill-Switch aktiviert! Flug deaktiviert.")
    end
end)

-- Button-Logik
flyButton.MouseButton1Click:Connect(function()
    if flying then
        stopFlying()
        flyButton.Text = "Fliegen"
    else
        startFlying()
        flyButton.Text = "Stop"
    end
end)
