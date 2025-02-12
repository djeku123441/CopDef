game.ReplicatedStorage.Events.CreateUI.OnServerEvent:Connect(function(player,plr)
	print(player)
	print(plr)
	game.ReplicatedStorage.Events.CreateUI:FireAllClients(plr)
	for i,v in pairs(game.Workspace.Rooms:GetChildren()) do
		for s,k in pairs(v:GetChildren()) do
			print(v)
			if k:IsA("BoolValue") then
				print(k)
				if k.Value == false then
					print(k)
					print(v)
					local hum = player.Character:WaitForChild("HumanoidRootPart")
					hum.CFrame = CFrame.new(game.Workspace.Rooms:FindFirstChild(v.Name).WaitingRoom.Position)
					v.taken.Value = true
					v.id.Value = player.UserId
					print(player.UserId)
					game.ReplicatedStorage.Events.DisableControls:FireClient(player)
					return end
			end
		end
	end
end)

game.ReplicatedStorage.Events.DeleteRoom.OnServerEvent:Connect(function(player,id)
	print(id)
	print(player)
	game.ReplicatedStorage.Events.DeleteRoom:FireAllClients(id)
	local hum = player.Character:WaitForChild("HumanoidRootPart")
	hum.CFrame = CFrame.new(game.Workspace.SpawnLocation.Position)
	game.ReplicatedStorage.Events.DisableControls:FireClient(player)
	for i,v in pairs(game.Workspace.Rooms:GetChildren()) do
		for s,k in pairs(v:GetChildren()) do
			print(v)
			print(k)
			if k:IsA("IntValue") and k.Value == player.UserId then
				print(k)
				print(k.Value)
				print("id")
				k.Value = 0
				v.taken.Value = false
				return end
		end
	end
end)
