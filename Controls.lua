local controls = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
game.ReplicatedStorage.Events.DisableControls.OnClientEvent:Connect(function()
	controls:Disable()
end)
game.ReplicatedStorage.Events.EnableControls.OnClientEvent:Connect(function()
	controls:Enable()
end)