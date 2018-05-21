ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'journaliste', _U('alert_journaliste'), true, true)
TriggerEvent('esx_society:registerSociety', 'journaliste', 'Journaliste', 'society_journaliste', 'society_journaliste', 'society_journaliste', {type = 'public'})

ESX.RegisterServerCallback('esx_ambulancejob:getBankMoney', function(source, cb)

    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getAccount('bank').money

    cb(money)
end)

TriggerEvent('es:addGroupCommand', 'revive', 'admin', function(source, args, user)

  if args[2] ~= nil then
    TriggerClientEvent('esx_ambulancejob:revive', tonumber(args[2]))
  else
    TriggerClientEvent('esx_ambulancejob:revive', source)
  end

end, function(source, args, user)
  TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end, {help = _U('revive_help'), params = {{name = 'id'}}})
