repeat wait() until game.Players.LocalPlayer.Character
 
local plr = game.Players.LocalPlayer
local char = plr.Character
local hum = char:WaitForChild("Humanoid")
local Torso = char:WaitForChild("LowerTorso")
local Mouse = plr:GetMouse()
local toggle = false
 
Mouse.KeyDown:Connect(function(key)
	if key == "X" then
		if toggle == false then
			toggle = true
			local Anim = Instance.new("Animation")
			Anim.AnimationId = "rbxassetid://7189034627"
			local PlayAnim = hum:LoadAnimation(Anim)
			PlayAnim:Play()
			local BV = Instance.new("BodyVelocity",Torso)
			BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
			while toggle == true do
				BV.Velocity = Mouse.Hit.lookVector*100
				wait()
			end
		end
		if toggle == true then
			toggle = false
			Torso:FindFirstChildOfClass("BodyVelocity"):remove()
			local tracks = hum:GetPlayingAnimationTracks()
			for i, stoptracks in pairs(tracks) do
				stoptracks:Stop()
			end
			local Anim = Instance.new("Animation")
			Anim.AnimationId = "http://www.roblox.com/asset/?id=7189034627"
			local PlayAnim = hum:LoadAnimation(Anim)
			PlayAnim:Play()
		end
	end
end)