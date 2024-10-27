-- Configuração do Hub de Verificação de Chave
local KeyHub = Instance.new("ScreenGui")
local KeyFrame = Instance.new("Frame")
local KeyInput = Instance.new("TextBox")
local VerifyButton = Instance.new("TextButton")
local UserInputService = game:GetService("UserInputService")

-- Garantir que o ScreenGui está definido corretamente
KeyHub.Name = "KeyHub"
KeyHub.Parent = game.CoreGui  -- Adiciona ao CoreGui para visibilidade em todo o jogo

-- Configuração do Frame principal
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = KeyHub
KeyFrame.Size = UDim2.new(0, 300, 0, 150)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
KeyFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
KeyFrame.Visible = true  -- Certifique-se de que o Frame está visível

-- Configuração da Key
local storedKey = "SUA_CHAVE_AQUI"  -- Substitua pela sua chave válida

-- Configuração do campo de entrada de texto (Input)
KeyInput.Name = "KeyInput"
KeyInput.Parent = KeyFrame
KeyInput.Size = UDim2.new(0, 250, 0, 30)
KeyInput.Position = UDim2.new(0.5, -125, 0.3, -15)
KeyInput.PlaceholderText = "Insert Key Here"
KeyInput.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)

-- Configuração do botão de verificação
VerifyButton.Name = "VerifyButton"
VerifyButton.Parent = KeyFrame
VerifyButton.Size = UDim2.new(0, 250, 0, 30)
VerifyButton.Position = UDim2.new(0.5, -125, 0.6, -15)
VerifyButton.Text = "Verify Key"
VerifyButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)

-- Função para verificar a chave e carregar o Hub de ESP
VerifyButton.MouseButton1Click:Connect(function()
    print("Botão de verificação clicado")  -- Debug
    if KeyInput.Text == storedKey then
        print("Chave correta!")  -- Debug
        -- Acesso concedido, chama o hub de ESP
        KeyHub:Destroy()
        loadstring(game:HttpGet("URL_DO_SCRIPT_DO_ESP"))() -- Substitua pela URL ou código do script ESP
    else
        print("Chave incorreta.")  -- Debug
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Invalid Key, try again"
        KeyInput.BackgroundColor3 = Color3.new(1, 0, 0)
        wait(1)
        KeyInput.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        KeyInput.PlaceholderText = "Insert Key Here"
    end
end)
