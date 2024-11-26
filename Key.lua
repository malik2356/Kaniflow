local gui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local textBox = Instance.new("TextBox")
local submitButton = Instance.new("TextButton")
local messageLabel = Instance.new("TextLabel")
local uiCorner = Instance.new("UICorner")

-- Parent setup
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
frame.Parent = gui
textBox.Parent = frame
submitButton.Parent = frame
messageLabel.Parent = frame
uiCorner.Parent = frame

-- Frame properties
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)

-- Make frame draggable
frame.Active = true
frame.Draggable = true

-- Rounded corners
uiCorner.CornerRadius = UDim.new(0, 15)

-- TextBox properties
textBox.PlaceholderText = "Enter Key"
textBox.Text = ""
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
textBox.Size = UDim2.new(0, 200, 0, 40)
textBox.Position = UDim2.new(0.5, -100, 0.3, 0)
textBox.ClearTextOnFocus = false

-- Submit button properties
submitButton.Text = "Submit"
submitButton.Font = Enum.Font.SourceSans
submitButton.TextSize = 18
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
submitButton.Size = UDim2.new(0, 100, 0, 40)
submitButton.Position = UDim2.new(0.5, -50, 0.6, 0)

-- Message label properties
messageLabel.Text = ""
messageLabel.Font = Enum.Font.SourceSans
messageLabel.TextSize = 16
messageLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
messageLabel.BackgroundTransparency = 1
messageLabel.Size = UDim2.new(0, 200, 0, 40)
messageLabel.Position = UDim2.new(0.5, -100, 0.8, 0)

-- Button functionality
submitButton.MouseButton1Click:Connect(function()
    local enteredKey = textBox.Text
    if enteredKey == "12345" then
        messageLabel.Text = "Loading..."
        messageLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(0.5)
        gui:Destroy() -- Destroy the key GUI
        loadstring(game:HttpGet("https://malik2356.github.io/Kaniflow/TestGUI.lua"))()
    else
        messageLabel.Text = "Invalid Key!"
        messageLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
