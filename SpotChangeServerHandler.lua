game.Players.PlayerAdded:Connect(function(player)
	game.ReplicatedStorage.Events.newplayeradded:FireClient(player)
end)
game.ReplicatedStorage.Events.ChangeSpotValue.OnServerEvent:Connect(function(player,spots)
	print(spots)
	if spots < 2 then
		spots += 1
		print(spots)
		game.ReplicatedStorage.Events.ChangeSpotValue:FireAllClients(spots)
	end
end)
