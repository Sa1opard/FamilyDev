local firstSpawn = false
AddEventHandler("playerSpawned", function()
	if(not firstSpawn) then
		TriggerServerEvent("esx_whitelistExtended:removePlayerToInConnect")
		firstSpawn = true
	end
end)
