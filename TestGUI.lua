local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

TextLabel.Parent = ScreenGui
TextLabel.Text = "Success"
TextLabel.Size = UDim2.new(0.3, 0, 0.1, 0)
TextLabel.Position = UDim2.new(0.35, 0, 0.45, 0)
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextSize = 24
