local defect = game.ReplicatedStorage.Events.Defect
local cooperate = game.ReplicatedStorage.Events.Cooperate
local disablegui = game.ReplicatedStorage.Events.DisableCopDefGui
local enablegui = game.ReplicatedStorage.Events.EnableCopDefGui
local mainmodule = require(game.ReplicatedStorage.Modules.Main)
local players = game.Players
local l = 0
local enablecontrols = game.ReplicatedStorage.Events.EnableControls
local reset = game.ReplicatedStorage.Events.Reset
local endround = game.ReplicatedStorage.Events.EndRound
local locationendround = game.Workspace.EndRoundPart
local ws = game.Workspace
local replicatedstorage = game.ReplicatedStorage
local winner = ""
local function checkround(round,player,player2)
	if round <= mainmodule.MaxRounds then
		print("good to go")
	else
		print("max rounds")
		enablecontrols:FireClient(player)
		enablecontrols:FireClient(player2)
		disablegui:FireClient(player)
		disablegui:FireClient(player2)
		reset:FireClient(player)
		reset:FireClient(player2)
		endround:FireClient(player)
		endround:FireClient(player2)
	end
end
local function game(player,player2,choice)
	print("Round going on")
	print(mainmodule.MaxRounds)
	print(choice)
	print(player2.Name)
	winner = ""
	if player.Values.Choice.Value == player2.Values.Choice.Value then
		print("both have same choice")
		if player.Values.Choice.Value == "Defect" then
			player.Values.Coins.Value += mainmodule.Coins.DefDef
			player2.Values.Coins.Value += mainmodule.Coins.DefDef
			player.Values.Round.Value += 1
			player2.Values.Round.Value += 1
			enablegui:FireClient(player)
			enablegui:FireClient(player2)
			checkround(player.Values.Round.Value,player,player2)
		elseif player.Values.Choice.Value == "Cooporate" then
			player.Values.Coins.Value += mainmodule.Coins.CopCop
			player2.Values.Coins.Value += mainmodule.Coins.CopCop
			player.Values.Round.Value += 1
			player2.Values.Round.Value += 1
			enablegui:FireClient(player)
			enablegui:FireClient(player2)
			checkround(player.Values.Round.Value,player,player2)
		else return end
	elseif player.Values.Choice.value ~= player2.Values.Choice.Value then
		print("different choices")
		if player.Values.Choice.Value == "Defect" then
			player.Values.Coins.Value += mainmodule.Coins.WinDef
			player2.Values.Coins.Value += mainmodule.Coins.LoseDef
			player.Values.Round.Value += 1
			player2.Values.Round.Value += 1
			enablegui:FireClient(player)
			enablegui:FireClient(player2)
			checkround(player.Values.Round.Value,player,player2)
		elseif player.Values.Choice.Value == "Cooporate" then
			player.Values.Coins.Value += mainmodule.Coins.LoseDef
			player2.Values.Coins.Value += mainmodule.Coins.WinDef
			player.Values.Round.Value += 1
			player2.Values.Round.Value += 1
			enablegui:FireClient(player)
			enablegui:FireClient(player2)
			checkround(player.Values.Round.Value,player,player2)
		else return end
	end
end
defect.OnServerEvent:Connect(function(player)
	print(l)
	print(player.Name.." defected")
	print(player)
	print(player)
	player.Values.Choice.Value = "Defect"
	local player2 = players:FindFirstChild(player.Values.VsPlayer.Value)
	disablegui:FireClient(player)
	l += 1
	print(l)
	if l == 2 then
		game(player,player2,"Defect")
		l = 0
	end
end)
cooperate.OnServerEvent:Connect(function(player)
	print(l)
	print(player.Name.." cooporated")
	print(player)
	player.Values.Choice.Value = "Cooporate"
	local player2 = players:FindFirstChild(player.Values.VsPlayer.Value)
	disablegui:FireClient(player)
	l += 1
	print(l)
	if l == 2 then
		game(player,player2,"Cooporate")
		l = 0
	end
end)
endround.OnServerEvent:Connect(function(player)
	print(player.Name)
	player.Values.Round.Value = 0
	player.Values.Coins.Value = 0
	replicatedstorage.Events.DeleteRoom:FireAllClients(player.UserId)
	player.Character:FindFirstChild("Humanoid").Health = 0
	if player.Values.Coins.Value >= players:FindFirstChild(player.Values.VsPlayer.Value).Values.Coins.Value then
		print("winner is "..player.Name)
		winner = player.Name
		print(winner)
		player.leaderstats.Wins.Value += 1
		replicatedstorage.Events.WinnerGui:FireClient(player,winner)
		replicatedstorage.Events.WinnerGui:FireClient(players:FindFirstChild(player.Values.VsPlayer.Value),winner)
	elseif player.Values.Coins.Value <= players:FindFirstChild(player.Values.VsPlayer.Value).Values.Coins.Value then
		print("winner is "..players:FindFirstChild(player.Values.VsPlayer.Value).Name)
		winner = players:FindFirstChild(player.Values.VsPlayer.Value).Name
		player:FindFirstChild(player.Values.VsPlayer.Value).leaderstats.Wins.Value += 1
		print(winner)
		replicatedstorage.Events.WinnerGui:FireClient(player,winner)
		replicatedstorage.Events.WinnerGui:FireClient(players:FindFirstChild(player.Values.VsPlayer.Value),winner)
	end
end)
