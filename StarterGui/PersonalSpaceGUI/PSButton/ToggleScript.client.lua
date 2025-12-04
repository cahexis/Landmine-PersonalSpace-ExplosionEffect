local toggle = 0
local button = script.Parent
local lplr = game.Players.LocalPlayer
local remote = button.TalkToEachother
local char = lplr.Character or lplr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")


button.MouseButton1Click:Connect(function()

	if toggle == 0 then -- enabled
		toggle = 1
		remote:FireServer(1) -- tell server its enabled
	else -- disabled
		toggle = 0
		remote:FireServer(0) -- tell server its disabled
	end
end)
