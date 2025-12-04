local invis = false --set to true if you want the landmine to be invisible when the game is loaded, otherwise set to false
local deleteafter = false -- set to true if you want the mine to dissapear when its used, otherwise set to false

--importants
local mine = script.Parent
local db = 0
game.Players.PlayerAdded:Connect(function()
	if invis == true then
		mine.button.Transparency = 1
		mine.minebase.Transparency = 1
	else
		mine.button.Transparency = 0
		mine.minebase.Transparency = 0
	end	
end)

mine.button.Touched:Connect(function(hit)
	local explosion = Instance.new("Explosion")
	explosion.BlastRadius = 10 -- change to set how big the explosion is
	explosion.BlastPressure = 10 --change to set how far affected parts fling
	local plr = game.Players:GetPlayerFromCharacter(hit.Parent)
	
	if plr then
		if db == 0 then
			db = 1
			explosion.Parent = mine.minebase
			if deleteafter == true then
				wait(0.5)
				mine:Destroy()
			end
			wait(1)
			db = 0			
		end
	end
end)
