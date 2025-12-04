local button = script.Parent
local toggle = 0
local remote = button.TalkToEachother
local looping = false
local maxdistance = 10
local Players = game:GetService("Players")
local boom = false

--below is code for a "personal space" button, when enabled, if someone gets in radius of you, they will freeze, then explode and be flung.
remote.OnServerEvent:Connect(function(plr, int)
	local plr1 = plr.Character or plr.CharacterAdded:Wait()	
	local root = plr1:WaitForChild("HumanoidRootPart")
	local activation = int
	if activation == 1 then
		print("on!!")
		looping = true
		activation = 0
	elseif activation == 0 then
		print("off!!")
		looping = false
		activation = 1
	end

	while looping == true do
		task.wait(0.5)
		for i,other in pairs(Players:GetPlayers()) do
			if other ~= plr then
				local other = other.Character or other.CharacterAdded:Wait()
				if other then
					local otherroot = other:WaitForChild("HumanoidRootPart")
					local otherhum = other:WaitForChild("Humanoid")
					local distance = (root.Position - otherroot.Position).Magnitude
					if distance < maxdistance then -- if player is in radius, they explode and fling into the distance.
						if boom == false then
							local light = Instance.new("PointLight")
							local explosion = Instance.new("Explosion")
							local warning = Instance.new("Sound")
							local rndm = Random.new()
							warning.Parent = otherroot
							otherroot.Anchored = true
							warning.SoundId = "rbxassetid://675587093"
							light.Color = Color3.new(1,0,0)
							light.Brightness = 10
							light.Parent = otherroot
							explosion.DestroyJointRadiusPercent = 0
							explosion.BlastPressure = 0
							warning:Play()
							otherhum.PlatformStand = true
							task.wait(2)
							otherroot.Anchored = false
							explosion.Parent = otherroot		
							explosion.Position = otherroot.Position
							otherroot.AssemblyLinearVelocity = rndm:NextUnitVector() * 2000
							otherroot.AssemblyAngularelocity = rndm:NextUnitVector() * 9000
							light:Destroy()
							boom = true
						end
						wait(2)
						boom = false
					end
				end
			end
		end
	end
end)
