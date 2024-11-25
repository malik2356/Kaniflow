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

-- Tabs und Inhalte
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

    -- Klick-Event für Tabs
    tabButton.MouseButton1Click:Connect(function()
        -- Alle Inhalte verstecken
        for _, child in pairs(contentFrame:GetChildren()) do
            child.Visible = false
        end

        -- Inhalt für diesen Tab anzeigen (falls existiert)
        local tabContent = contentFrame:FindFirstChild(tabName)
        if tabContent then
            tabContent.Visible = true
        end
    end)

    -- Inhaltsbereich für den Tab
    local tabContent = Instance.new("Frame")
    tabContent.Name = tabName
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.Visible = (i == 1) -- Nur der erste Tab ist sichtbar
    tabContent.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabContent.Parent = contentFrame

    -- Platzhalter: Buttons
    local buttonLabels = {"Button 1", "Button 2", "Button 3"}
    if tabName == "Home" then
        buttonLabels = {"Steal Car", "Car Fly", "Infinite Yield"}
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

        -- Funktion für "Infinite Yield" Button
        if button.Text == "Infinite Yield" then
            button.MouseButton1Click:Connect(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            end)
        end
    end

    -- Platzhalter: Checkboxen
    local checkboxLabels = {"Checkbox 1", "Checkbox 2"} -- Beispieltexte für Checkboxen
    if tabName == "Home" then
        checkboxLabels = {"Anti Fall", "Checkbox 2"}
    end

    for k = 1, 2 do
        local checkboxFrame = Instance.new("Frame")
        checkboxFrame.Size = UDim2.new(0, 140, 0, 20)
        checkboxFrame.Position = UDim2.new(0, 140, 0, 20 + (k - 1) * 40)
        checkboxFrame.BackgroundTransparency = 1
        checkboxFrame.Parent = tabContent

        local checkbox = Instance.new("TextButton")
        checkbox.Size = UDim2.new(0, 20, 0, 20)
        checkbox.Position = UDim2.new(0, 0, 0, 0)
        checkbox.Text = ""
        checkbox.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
        checkbox.Parent = checkboxFrame

        -- Klick-Event für Checkbox (wechselt Farbe bei Klick)
        checkbox.MouseButton1Click:Connect(function()
            if checkbox.BackgroundColor3 == Color3.fromRGB(120, 120, 120) then
                checkbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Aktiviert
                _G.antiFallEnabled = true
            else
                checkbox.BackgroundColor3 = Color3.fromRGB(120, 120, 120) -- Deaktiviert
                _G.antiFallEnabled = false
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

-- Cheat-Name anzeigen
local cheatNameLabel = Instance.new("TextLabel")
cheatNameLabel.Size = UDim2.new(0, 100, 1, 0)
cheatNameLabel.Position = UDim2.new(1, -100, 0, 0) -- Rechts neben dem letzten Tab
cheatNameLabel.Text = "Kaniflow" -- Name deines Cheats
cheatNameLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dunkler Hintergrund
cheatNameLabel.TextColor3 = Color3.fromRGB(0, 170, 255) -- Leuchtend blau
cheatNameLabel.Font = Enum.Font.SourceSansBold
cheatNameLabel.TextSize = 18
cheatNameLabel.Parent = tabBar

-- Anti-Fall Funktion
game:GetService("RunService").Stepped:Connect(function()
    if _G.antiFallEnabled then
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
            local hrp = player.Character.HumanoidRootPart
            local humanoid = player.Character.Humanoid

            if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                if not workspace:FindFirstChild("AntiFallPlatform") then
                    local platform = Instance.new("Part")
                    platform.Name = "AntiFallPlatform"
                    platform.Size = Vector3.new(10, 1, 10)
                    platform.Position = hrp.Position - Vector3.new(0, 5, 0) -- Plattform unter dem Spieler erzeugen
                    platform.Anchored = true
                    platform.Parent = workspace

                    -- Plattformbewegung
                    game:GetService("RunService").RenderStepped:Connect(function()
                        if _G.antiFallEnabled and platform and platform.Parent then
                            platform.Position = platform.Position - Vector3.new(0, 0.1, 0) -- Plattform langsam nach unten bewegen
                        else
                            platform:Destroy()
                        end
                    end)
                else
                    local platform = workspace:FindFirstChild("AntiFallPlatform")
                    platform.Position = hrp.Position - Vector3.new(0, 5, 0) -- Plattform unter dem Spieler aktualisieren
                end
            else
                if workspace:FindFirstChild("AntiFallPlatform") then
                    workspace:FindFirstChild("AntiFallPlatform"):Destroy()
                end
            end
        end
    else
        if workspace:FindFirstChild("AntiFallPlatform") then
            workspace:FindFirstChild("AntiFallPlatform"):Destroy()
        end
    end
end)
