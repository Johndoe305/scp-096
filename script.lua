-- ✅ Anti-SCP com botão e GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar a GUI principal
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "AntiSCPGui"
screenGui.ResetOnSpawn = false

-- Suporte para mobile
screenGui.IgnoreGuiInset = true

-- Criar o Frame (janela)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.05, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Criar o botão
local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.8, 0, 0.4, 0)
button.Position = UDim2.new(0.1, 0, 0.3, 0)
button.Text = "Ativar Anti-SCP"
button.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.SourceSansBold
button.TextSize = 18

-- Label de status
local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Size = UDim2.new(1, 0, 0.2, 0)
statusLabel.Position = UDim2.new(0, 0, 0.75, 0)
statusLabel.Text = "Status: Waiting"
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextScaled = true

-- Função do botão
button.MouseButton1Click:Connect(function()
    local lookScript = player.PlayerGui:FindFirstChild("LookDetector")

    if lookScript then
        lookScript:Destroy()
        statusLabel.Text = "Status: LookDetector Removed ✅"
    else
        statusLabel.Text = "Status: Look detector scp Removing"
        player.PlayerGui.ChildAdded:Connect(function(child)
            if child.Name == "LookDetector" then
                task.wait(0.1)
                child:Destroy()
                statusLabel.Text = "Status: LookDetector Removed ✅"
            end
        end)
    end
end)
