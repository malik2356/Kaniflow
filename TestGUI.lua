local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Hauptcontainer
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true
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

local tabs = {"Home", "Settings", "Fun"} -- Beispiel-Reiter

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 100, 1, 0)
    tabButton.Position = UDim2.new(0, (i - 1) * 100, 0, 0)
    tabButton.Text = tabName
    tabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    tabButton.TextColor3 = Color3.new(1, 1, 1)
    tabButton.Font = Enum.Font.SourceSansBold
    tabButton.TextSize = 18
    tabButton.Parent = tabBar

    tabButton.MouseButton1Click:Connect(function()
        for _, child in pairs(contentFrame:GetChildren()) do
            child.Visible = false
        end

        local tabContent = contentFrame:FindFirstChild(tabName)
        if tabContent then
            tabContent.Visible = true
        end
    end)

    local tabContent = Instance.new("Frame")
    tabContent.Name = tabName
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.Visible = (i == 1)
    tabContent.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabContent.Parent = contentFrame

    -- Platzhalter: Buttons
    local buttonLabels = {"Steal Car", "Car Fly", "Infinite Yield"}
    if tabName ~= "Home" then
        buttonLabels = {"Button 1", "Button 2", "Button 3"}
    end

    for j = 1, 3 do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 100, 0, 30)
        button.Position = UDim2.new(0, 20, 0, 20 + (j - 1) * 40)
        button.Text = buttonLabels[j]
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 14
        button.Parent = tabContent

        if button.Text == "Steal Car" then
            button.MouseButton1Click:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player.Character
                local hrp = character:WaitForChild("HumanoidRootPart")
                local closestSeat
                local closestDistance = math.huge

                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("VehicleSeat") or obj:IsA("Seat") then
                        if obj.Parent:IsA("Model") and obj.Parent:FindFirstChild("Humanoid") == nil then
                            local distance = (obj.Position - hrp.Position).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closest Seat = obj
                            end
                        end
                    end
                end

                if closestSeat and closestSeat:IsA("VehicleSeat") then
                    hrp.CFrame = closestSeat.CFrame
                    wait(0.1)
                    closestSeat:Sit(character.Humanoid)
                    print("Player seated in the closest vehicle seat.")
                else
                    print("No vehicle seat found nearby.")
                end
            end)
        end

        if button.Text == "Infinite Yield" then
            button.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            end)
        end
    end

    if tabName == "Settings" then
        local checkboxFrame = Instance.new("Frame")
        checkboxFrame.Size = UDim2.new(0, 140, 0, 20)
        checkboxFrame.Position = UDim2.new(0, 140, 0, 20)
        checkboxFrame.BackgroundTransparency = 1
        checkboxFrame.Parent = tabContent

        local checkbox = Instance.new("TextButton")
        checkbox.Size = UDim2.new(0, 20, 0, 20)
        checkbox.Position = UDim2.new(0, 0, 0, 0)
        checkbox.Text = ""
        checkbox.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
        checkbox.Parent = checkboxFrame

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 100, 0, 20)
        label.Position = UDim2.new(1, 5, 0, 0)
        label.Text = "Run Speed"
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.SourceSans
        label.TextSize = 14
        label.BackgroundTransparency = 1
        label.Parent = checkboxFrame

        local inputFrame = Instance.new("Frame")
        inputFrame.Size = UDim2.new(0, 100, 0, 30)
        inputFrame.Position = UDim2.new(0, 140, 0, 50)
        inputFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        inputFrame.Parent = tabContent
        inputFrame.Visible = false

        local textBox = Instance.new("TextBox")
        textBox.Size = UDim2.new(1, 0, 1, 0)
        textBox.Position = UDim2.new(0, 0, 0, 0)
        textBox.Text = "Enter speed"
        textBox.ClearTextOnFocus = true
        textBox.Font = Enum.Font.SourceSans
        textBox.TextSize = 14
        textBox.TextColor3 = Color3.new(1, 1, 1)
        textBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        textBox.Parent = inputFrame

        checkbox.MouseButton1Click:Connect(function()
            if checkbox.BackgroundColor3 == Color3.fromRGB(120, 120, 120) then
                checkbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                inputFrame.Visible = true
            else
                checkbox.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
                inputFrame.Visible = false
            end
        end)

        textBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                local speed = tonumber(textBox.Text)
                if speed then
                    local player = game.Players.LocalPlayer
                    if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                        local humanoid = player.Character.Humanoid
                        game:GetService("RunService").Stepped:Connect(function()
                            if humanoid and humanoid.Health > 0 then
                                local direction = humanoid.MoveDirection
                                humanoid.RootPart.Velocity = direction * speed
                            end
                        end)
                        print("Run speed set to:", speed)
                    end
                end
            end
        end)
    end
end

-- Cheat-Name anzeigen
local cheatNameLabel = Instance.new("TextLabel")
cheatNameLabel.Size = UDim2.new(0, 100, 1, 0)
cheatNameLabel.Position = UDim2.new(1, -100, 0, 0)
cheatNameLabel.Text = "Kaniflow"
cheatNameLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
cheatNameLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
che atNameLabel.Font = Enum.Font.SourceSansBold
cheatNameLabel.TextSize = 18
cheatNameLabel.Parent = tabBar

-- Neuer Anti-Fall Ansatz
game:GetService("RunService").Stepped:Connect(function()
    if _G.antiFallEnabled then
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character.Humanoid
            local hrp = player.Character.HumanoidRootPart
            local velocity = hrp.Velocity
            local ray = Ray.new(hrp.Position, Vector3.new(0, -10, 0))
            local rayResult = workspace:FindPartOnRay(ray)
            if rayResult then
                local distance = (hrp.Position - rayResult.Position).Magnitude
                if distance > 5 then
                    humanoid.JumpPower = 50
                    humanoid.Jump = true
                end
            else
                humanoid.JumpPower = 50
                humanoid.Jump = true
            end
        end
    end
end)

gui.Enabled = true
