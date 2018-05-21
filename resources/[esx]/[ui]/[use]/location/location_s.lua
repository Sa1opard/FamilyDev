RegisterServerEvent('voiture:CheckMoneyForVel')

AddEventHandler('voiture:CheckMoneyForVel', function(name, vehicle, price)
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.getIdentifier()
    local vehicle = vehicle
    local name = name
    local price = tonumber(price)

        if (tonumber(user.getMoney()) >= tonumber(price)) then
          user.removeMoney((price))
          TriggerClientEvent('voiture:FinishMoneyCheckForVel', source, name, vehicle, price)
          TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
        else
          TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Fonds insuffisants!\n")
       end
    end)
end)