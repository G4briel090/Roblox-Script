-- Configuração do Hub de Verificação de Chave com Estilo
local KeyHub = Instance.new("ScreenGui")
local KeyFrame = Instance.new("Frame")
local KeyInput = Instance.new("TextBox")
local VerifyButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local UserInputService = game:GetService("UserInputService")

KeyHub.Name = "KeyHub"
KeyHub.Parent = game.CoreGui

-- Estilizando o quadro principal do Hub
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = KeyHub
KeyFrame.Size = UDim2.new(0, 300, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
KeyFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyFrame.BorderColor3 = Color3.fromRGB(70, 70, 70)

-- Cantos arredondados para o quadro principal
local frameCorner = Instance.new("UICorner", KeyFrame)
frameCorner.CornerRadius = UDim.new(0, 12)

-- Configuração da chave
local storedKey = "SUA_CHAVE_AQUI"  -- Substitua pela sua chave válida

-- Estilizando a caixa de entrada
KeyInput.Name = "KeyInput"
KeyInput.Parent = KeyFrame
KeyInput.Size = UDim2.new(0, 250, 0, 30)
KeyInput.Position = UDim2.new(0.5, -125, 0.3, -15)
KeyInput.PlaceholderText = "Insert Key Here"
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Cantos arredondados para a caixa de entrada
local inputCorner = Instance.new("UICorner", KeyInput)
inputCorner.CornerRadius = UDim.new(0, 8)

-- Estilizando o botão de verificação
VerifyButton.Name = "VerifyButton"
VerifyButton.Parent = KeyFrame
VerifyButton.Size = UDim2.new(0, 250, 0, 30)
VerifyButton.Position = UDim2.new(0.5, -125, 0.6, -15)
VerifyButton.Text = "Verify Key"
VerifyButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.Font = Enum.Font.SourceSansBold
VerifyButton.TextSize = 16

-- Cantos arredondados para o botão de verificação
local buttonCorner = Instance.new("UICorner", VerifyButton)
buttonCorner.CornerRadius = UDim.new(0, 8)

-- Gradiente para o botão
local buttonGradient = Instance.new("UIGradient", VerifyButton)
buttonGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 130, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 149, 237))
}
buttonGradient.Rotation = 90

-- Função para verificar a chave e carregar o Hub de ESP
VerifyButton.MouseButton1Click:Connect(function()
    if KeyInput.Text == storedKey then
        -- Acesso concedido
        KeyHub:Destroy()
        print("Key validada, carregando ESP...")
    else
        -- Chave incorreta
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Invalid Key, try again"
        KeyInput.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
        wait(1)
        KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        KeyInput.PlaceholderText = "Insert Key Here"
    end
end)
