local Duels_Autofarm = true
local Cooldown_Duels = 0.05

if not game:IsLoaded() then game.Loaded:Wait() end
local player = game:GetService("Players").LocalPlayer

print("[LOG] Script Loaded")

task.spawn(function()
    while true do
        task.wait(0.1)

        local character = player.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        local folder = workspace:FindFirstChild("SpawnablesClient")

        if Duels_Autofarm and hrp and folder then
            for _, coin in ipairs(folder:GetChildren()) do
                local touch = coin:FindFirstChild("Touch")
                if Duels_Autofarm and touch and touch.Parent then
                    pcall(function() hrp.CFrame = touch.CFrame end)
                    task.wait(Cooldown_Duels)
                end
            end
        end
    end
end)
