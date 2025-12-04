local cam = workspace.CurrentCamera
local plr = game.Players.LocalPlayer
local char = script.Parent

char.Humanoid.Died:Connect(function() -- when player dies
	local pos = cam.CFrame --camera CFrame
	cam.CameraType = Enum.CameraType.Scriptable 
	cam.CFrame = pos -- freezes cam in place
	for i,v in pairs(char:GetDescendants()) do
		if v:IsA("MeshPart") then
			v.Anchored = true
			v:Destroy()
		end
	end
	task.wait(game.Players.RespawnTime) --waits for when player respawns
	cam.CameraType = Enum.CameraType.Custom -- changes camera back to normal
end)
