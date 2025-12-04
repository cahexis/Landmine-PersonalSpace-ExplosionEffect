-- imports
local plr = game.Players
local physvice = game:GetService("PhysicsService")
local rep = game:GetService("ReplicatedStorage")
local ds = game:GetService("Debris")
--the code

local birdgroup = "CollisionGroupCube" -- custom collision to make them not push each other, allowing a smooth spread.
physvice:RegisterCollisionGroup(birdgroup)
physvice:CollisionGroupSetCollidable(birdgroup,birdgroup,false)

local function brickSpawn(place) -- spawns 5 birds that come out of the player on death.
	local limit = 0
	local square = rep.Bird

	while limit <= 5 do 
		local cls = square:Clone()
		cls.AssemblyLinearVelocity = Vector3.new(math.random(-50,50), 30, math.random(-50,50)) 
		cls.CollisionGroup = birdgroup
		cls.CFrame = place.CFrame + Vector3.new(0,2,0)
		cls.Parent = workspace
		ds:AddItem(cls, 5)
		cls.birdchirp:Play()
		
		limit = limit + 1
	end
end

local function plrAdded(player) -- checks when players added
	local function charAdded(character)
		local hum = character:WaitForChild("Humanoid")
		local head = character:WaitForChild("Head")
		local function oofd() -- checks when a player dies, they spawn the birds
			brickSpawn(head)
		end
		
		hum.Died:Connect(oofd)
	end
	player.CharacterAdded:Connect(charAdded)
end

plr.PlayerAdded:Connect(plrAdded)
