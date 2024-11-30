print("GUI has been opened")
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Hauptcontainer
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Rundung der Ecken des Hauptcontainers
local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0, 10)
mainFrameCorner.Parent = mainFrame

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

local tabs = {"Home", "Settings", "Fun"}

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

    -- Home-Tab: Buttons und Checkboxen
   if tabName == "Home" and tabContent then
        local buttonLabels = {"Steal Car", "Car Fly", "Infinite Yield"}
        for j = 1, 3 do
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 30)
            button.Position = UDim2.new(0, 40, 0, 20 + (j - 1) * 40)
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
                                    closestSeat = obj
                                end
                            end
                        end
                    end

                    if closestSeat and closestSeat:IsA("VehicleSeat") then
                        hrp.CFrame = closestSeat.CFrame
                        wait(0.1)
                        closestSeat:Sit(character.Humanoid)
                        print("Player seated in the closest vehicle seat.")
                        -- Versuche, den VehicleController zu nutzen
                        local vehicleController = game.Players.LocalPlayer.PlayerScripts.PlayerModule.ControlModule:FindFirstChild("VehicleController")
                        if vehicleController and vehicleController:FindFirstChild("Enable") then
                            vehicleController.Enable:Invoke(true, closestSeat)
                            print("VehicleController enabled for the player.")
                        else
                            print("VehicleController not found or cannot be enabled.")
                        end
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

        local checkboxLabels = {"Anti Fall", "Noclip"}
        for k = 1, 2 do
            local checkboxFrame = Instance.new("Frame")
            checkboxFrame.Size = UDim2.new(0, 140, 0, 20)
            checkboxFrame.Position = UDim2.new(0, 160, 0, 20 + (k - 1) * 40)
            checkboxFrame.BackgroundTransparency = 1
            checkboxFrame.Parent = tabContent

            local checkbox = Instance.new("TextButton")
            checkbox.Size = UDim2.new(0, 20, 0, 20)
            checkbox.Position = UDim2.new(0, 0, 0, 0)
            checkbox.Text = ""
            checkbox.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
            checkbox.Parent = checkboxFrame

            checkbox.MouseButton1Click:Connect(function()
                if checkbox.BackgroundColor3 == Color3.fromRGB(120, 120, 120) then
                    checkbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                    if k == 1 then
                        _G.antiFallEnabled = true
                    elseif k == 2 then
                        _G.noclipEnabled = true
                        game:GetService("RunService").Stepped:Connect(function()
                            if _G.noclipEnabled then
                                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                    if part:IsA("BasePart") then
                                        part.CanCollide = false
                                    end
                                end
                            end
                        end)
                    end
                else
                    checkbox.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
                    if k == 1 then
                        _G.antiFallEnabled = false
                    elseif k == 2 then
                        _G.noclipEnabled = false
                        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = true
                            end
                        end
                    end
                end
            end)

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(0, 100, 0, 20)
            label.Position = UDim2.new(1, 5, 0, 0)
            label.Text = checkboxLabels[k]
            label.TextColor3 = Color3.new(1, 1, 1)
            label.Font = Enum.Font.SourceSans
            label.TextSize = 14
            label.BackgroundTransparency = 1
            label.Parent = checkboxFrame
        end
    end

    -- Settings-Tab: Scrollbar und Dropdowns
    if tabName == "Settings" then
        local dropdownFrame = Instance.new("Frame")
        dropdownFrame.Size = UDim2.new(0, 140, 1, 0)
        dropdownFrame.Position = UDim2.new(0, 0, 0, 0)
        dropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        dropdownFrame.Parent = tabContent

        local dropdownList = Instance.new("ScrollingFrame")
        dropdownList.Size = UDim2.new(1, 0, 1, 0)
        dropdownList.CanvasSize = UDim2.new(0, 0, 2, 0)
        dropdownList.ScrollBarThickness = 10
        dropdownList.Parent = dropdownFrame

        local dropdowns = {
            {Name = "Teleports", Options = {"Bank", "Jeweler", "Dealership", "Smuggler"}},
            {Name = "Car Settings", Options = {"Always working"}},
            {Name = "Character", Options = {}}
        }

            for i, dropdown in ipairs(dropdowns) do
            local dropdownTitle = Instance.new("TextButton")
            dropdownTitle.Size = UDim2.new(1, 0, 0, 30)
            dropdownTitle.Position = UDim2.new(0, 0, 0, (i - 1) * 50) -- Verschieben nach links und unten
            dropdownTitle.Text = dropdown.Name
            dropdownTitle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            dropdownTitle.TextColor3 = Color3.new(1, 1, 1)
            dropdownTitle.Font = Enum.Font.SourceSansBold
            dropdownTitle.TextSize = 18
            dropdownTitle.Parent = dropdownList

            local dropdownContent = Instance.new("Frame")
            dropdownContent.Name = dropdown.Name
            dropdownContent.Size = UDim2.new(0, 250, 0, #dropdown.Options * 40)
            dropdownContent.Position = UDim2.new(0, 140, 0, 0)
            dropdownContent.Visible = false
            dropdownContent.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            dropdownContent.Parent = tabContent

            dropdownTitle.MouseButton1Click:Connect(function()
                dropdownContent.Visible = not dropdownContent.Visible
            end)

            for j, option in ipairs(dropdown.Options) do
                local optionButton = Instance.new("TextButton")
                optionButton.Size = UDim2.new(1, -10, 0, 30)
                optionButton.Position = UDim2.new(0, 5, 0, (j - 1) * 40)
                optionButton.Text = option
                optionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                optionButton.TextColor3 = Color3.new(1, 1, 1)
                optionButton.Font = Enum.Font.SourceSans
                optionButton.TextSize = 16
                optionButton.Parent = dropdownContent

                -- Beispielaktion für Teleport-Optionen
                optionButton.MouseButton1Click:Connect(function()
                    local player = game.Players.LocalPlayer
                    if option == "Bank" then
                        -- Teleportiere den Spieler zur Bank
                       local player = game.Players.LocalPlayer
                       local vehicle = game.Workspace.Vehicles:FindFirstChild(player.Name)
                            vehicle.IsOn = true
                    elseif option == "Jeweler" then
                        -- Teleportiere den Spieler zum Juwelier
                        player.Character:MoveTo(Vector3.new(10, 0, 10))
                    elseif option == "Dealership" then
                        -- Teleportiere den Spieler zum Autohaus
                        player.Character:MoveTo(Vector3.new(-10, 0, -10))
                    elseif option == "Smuggler" then
                        -- Teleportiere den Spieler zum Schmuggler
                        
                        if vehicle and vehicle:FindFirstChild("DriveSeat") then
                            local driveSeat = vehicle.DriveSeat
                            if driveSeat:IsA("VehicleSeat") then
                                player.Character.HumanoidRootPart.CFrame = driveSeat.CFrame
                                wait(0.1)
                                driveSeat:Sit(player.Character.Humanoid)
                                print("Player seated in the vehicle.")

                                local target = game.ReplicatedStorage.SmugglerNavigationTargets:FindFirstChild("Smuggler")
                                if target then
                                    vehicle:SetPrimaryPartCFrame(CFrame.new(target.Position))
                                    print("Vehicle teleported to Smuggler.")
                                else
                                    warn("Smuggler target not found.")
                                end
                            else
                                warn("DriveSeat is not a VehicleSeat.")
                            end
                        else
                            warn("Vehicle or DriveSeat not found.")
                        end
                    end
                end)
            end
        end
    end
end


-- Cheat-Name anzeigen
local cheatNameLabel = Instance.new("TextLabel")
cheatNameLabel.Size = UDim2.new(0, 100, 1, 0)
cheatNameLabel.Position = UDim2.new(1, -100, 0, 0)
cheatNameLabel.Text = "Kaniflow"
cheatNameLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
cheatNameLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
cheatNameLabel.Font = Enum.Font.SourceSansBold
cheatNameLabel.TextSize = 18
cheatNameLabel.Parent = tabBar

-- Neuer Anti-Fall Ansatz
game:GetService("RunService").Stepped:Connect(function()
    if _G.antiFallEnabled then
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
            local hrp = player.Character.HumanoidRootPart
            local humanoid = player.Character.Humanoid

            if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                humanoid.PlatformStand = true -- Verhindert Fallschaden
                hrp.Velocity = Vector3.new(hrp.Velocity.X, -12, hrp.Velocity.Z) -- Verlangsamt das Fallen
            else
                humanoid.PlatformStand = false
            end
        end
    end
end)

print("GUI has been closed")
