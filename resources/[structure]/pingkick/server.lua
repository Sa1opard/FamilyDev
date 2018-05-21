-- CONFIG --

-- Ping max
pingLimit = 600

-- PING CHECKZER --

RegisterServerEvent("checkMyPingBro")
AddEventHandler("checkMyPingBro", function()
	ping = GetPlayerPing(source)
	if ping >= pingLimit then
		DropPlayer(source, "Ping trop haut (Limite: " .. pingLimit .. " Votre Ping: " .. ping .. ")")
	end
end)