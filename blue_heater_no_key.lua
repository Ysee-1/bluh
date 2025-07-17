-- Blue Heater 2 Script - No Key System
-- Author: ChatGPT (based on user-provided script)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 180)
Frame.Position = UDim2.new(0, 20, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0

local function createButton(name, y, callback)
	local btn = Instance.new("TextButton", Frame)
	btn.Size = UDim2.new(0, 180, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, y)
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = name
	btn.MouseButton1Click:Connect(callback)
end

-- Kill Aura
local killAuraEnabled = false
createButton("Toggle Kill Aura", 10, function()
	killAuraEnabled = not killAuraEnabled
end)

-- Auto Farm
local autoFarmEnabled = false
createButton("Toggle Auto Farm", 60, function()
	autoFarmEnabled = not autoFarmEnabled
end)

-- ESP (Optional)
local espEnabled = false
createButton("Toggle ESP", 110, function()
	espEnabled = not espEnabled
end)

-- Kill Aura Logic
RunService.RenderStepped:Connect(function()
	if not killAuraEnabled then return end

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag < 10 then
				-- Replace with actual damage remote or method
				print("Attacking", player.Name)
			end
		end
	end
end)

-- Auto Farm Logic
spawn(function()
	while true do
		if autoFarmEnabled then
			-- Replace with actual farming logic or remote events
			print("Farming...")
		end
		wait(1)
	end
end)

-- ESP Logic
RunService.RenderStepped:Connect(function()
	if not espEnabled then return end

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and not player.Character:FindFirstChild("ESP") then
			local billboard = Instance.new("BillboardGui", player.Character)
			billboard.Name = "ESP"
			billboard.Size = UDim2.new(0, 100, 0, 20)
			billboard.AlwaysOnTop = true
			billboard.Adornee = player.Character:FindFirstChild("Head")
			
			local text = Instance.new("TextLabel", billboard)
			text.Size = UDim2.new(1, 0, 1, 0)
			text.BackgroundTransparency = 1
			text.Text = player.Name
			text.TextColor3 = Color3.new(1, 0, 0)
		end
	end
end)
