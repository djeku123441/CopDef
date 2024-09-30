game.ReplicatedStorage.Events.Playing.OnClientEvent:Connect(function(player)
	print(player)
end)
game.ReplicatedStorage.Events.EnableCopDefGui.OnClientEvent:Connect(function()
	print("afgfafaf")
	local player = game.Players.LocalPlayer
	player.PlayerGui.Cooperate_Defect.Enabled = true
end)
game.ReplicatedStorage.Events.DisableCopDefGui.OnClientEvent:Connect(function()
	print("gfagfafa")
	local player = game.Players.LocalPlayer
	player.PlayerGui.Cooperate_Defect.Enabled = false 
end)
