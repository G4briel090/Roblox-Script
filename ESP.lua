local container = Instance.new("Folder", gethui())
local highlightActive = true
local UserInputService = game:GetService("UserInputService")

local function createHighlight(character)
    while true do
        wait(0.1)
    local highlight = Instance.new("Highlight", container)
    highlight.FillColor = BrickColor.new(character.Parent.Name).Color
    highlight.FillTransparency = 1
    highlight.OutlineTransparency = 0
    highlight.DepthMode = "AlwaysOnTop"
    highlight.Adornee = character

    character.Destroying:Connect(function()
        highlight:Destroy()
    end)
    end

    return highlight
end

local function toggleHighlights()
    highlightActive = not highlightActive
    for _, highlight in ipairs(container:GetChildren()) do
        if highlight:IsA("Highlight") then
            highlight.Enabled = highlightActive
        end
    end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui

local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size = UDim2.new(0, 100, 0, 25)
toggleButton.Position = UDim2.new(1, -110, 1, -30)
toggleButton.Text = "ESP"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextScaled = true
toggleButton.BorderSizePixel = 0
toggleButton.BackgroundTransparency = 0

toggleButton.MouseEnter:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
end)

toggleButton.MouseLeave:Connect(function()
    toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)

toggleButton.MouseButton1Click:Connect(toggleHighlights)

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.K then
        toggleHighlights()
    end
end)

for _, team in workspace:WaitForChild("Players"):GetChildren() do
    for _, child in team:GetChildren() do
        if highlightActive then
            createHighlight(child)
        end
    end
    team.ChildAdded:Connect(function(child)
        if highlightActive then
            createHighlight(child)
        end
    end)
end
