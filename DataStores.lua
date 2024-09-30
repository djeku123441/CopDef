local dataStore = game:GetService("DataStoreService"):GetDataStore("SaveData")
game.Players.PlayerAdded:Connect(function(player)
	wait()
	local playerid = "id_"..player.UserId
	local wins = player.leaderstats.Wins
	local GetSaved = dataStore:GetAsync(playerid)
	if GetSaved then
		print("Succes1")
		wins.Value = GetSaved[1]
	else
		print("Succes2")
		local NumberForSaving = {wins.Value}
		dataStore:GetAsync(playerid, NumberForSaving)
	end
end)
game.Players.PlayerRemoving:Connect(function(player)
	dataStore:SetAsync("id_"..player.UserId, {player.Values.Wins.Value})
end)
