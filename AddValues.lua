game.Players.PlayerAdded:Connect(function(player)
	local values = Instance.new("Folder",player)
	values.Name = "Values"
	local choice = Instance.new("StringValue",values)
	choice.Name = "Choice"
	choice.Value = ""
	local playing = Instance.new("BoolValue",values)
	playing.Name = "Playing"
	playing.Value = false
	local vsplayer = Instance.new("StringValue",values)
	vsplayer.Name = "VsPlayer"
	vsplayer.Value = ""
	local round = Instance.new("IntValue",values)
	round.Name = "Round"
	round.Value = 0
	local coins = Instance.new("IntValue", values)
	coins.Name = "Coins"
	coins.Value = 0
	local leaderstats = Instance.new("Folder",player)
	leaderstats.Name = "leaderstats"
	local wins = Instance.new("IntValue",leaderstats)
	wins.Name = "Wins"
	wins.Value = 0
end)
