game.ReplicatedStorage.Events.JoinNewGame.OnServerEvent:Connect(function(player,name)
	local hum = player.Character:WaitForChild("HumanoidRootPart")
	hum.CFrame = CFrame.new(game.Workspace.WaitingRoom2.Position)
	game.ReplicatedStorage.Events.DisableControls:FireClient(player)
	game.ReplicatedStorage.Events.EnableCopDefGui:FireClient(player)
	game.ReplicatedStorage.Events.EnableCopDefGui:FireClient(game.Players:FindFirstChild(name))
	game.ReplicatedStorage.Events.JoinNewGame:FireAllClients()
	player.Values.VsPlayer.Value = name
	game.Players:FindFirstChild(name).Values.VsPlayer.Value = player.Name
end)
