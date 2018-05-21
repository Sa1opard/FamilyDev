ESX                = nil
PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'mecano', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'mecano', 'mechanic_customer', true, true)
TriggerEvent('esx_society:registerSociety', 'mecano', 'Mecano', 'society_mecano', 'society_mecano', 'society_mecano', {type = 'private'})

AddEventHandler('esx:playerDropped', function(source) -- put vehicle in pound if crash or disconnected
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerCarsParked = {}
	local playerCarsOwned = {}
	local carsToPound = {}	

	MySQL.Async.fetchAll("SELECT * FROM `user_parkings` WHERE identifier = @identifier",
	{
		['@identifier'] = xPlayer.identifier
	},
	function(parkedVehicles)

		for i=1, #parkedVehicles, 1 do
			local vehicle = json.decode(parkedVehicles[i].vehicle)
			local plate = vehicle.plate
			table.insert(playerCarsParked, plate)
		end

		MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles` WHERE owner = @identifier",
		{
			['@identifier'] = xPlayer.identifier
		},
		function(ownedVehciles)
			print('\n')
			for i=1, #ownedVehciles, 1 do
				local vehicle = json.decode(ownedVehciles[i].vehicle)
				local plate = vehicle.plate
				table.insert(playerCarsOwned,
				{
					plate 	= plate,
					pounded = ownedVehciles[i].car_pound,
					id 		= ownedVehciles[i].id
				})
			end

			for i=1, #playerCarsOwned, 1 do
				if #playerCarsParked > 0 then
					for j=1, #playerCarsParked, 1 do
						if playerCarsOwned[i].plate ~= playerCarsParked[j] and playerCarsOwned[i].pounded ~= 1 then
							MySQL.Async.execute(
								'UPDATE `owned_vehicles` SET `car_pound` = 1 WHERE id = @id',
								{
									['@id'] = playerCarsOwned[i].id
								}
							)
						end
					end
				else
					if playerCarsOwned[i].pounded ~= 1 then
						MySQL.Async.execute(
							'UPDATE `owned_vehicles` SET `car_pound` = 1 WHERE id = @id',
							{
								['@id'] = playerCarsOwned[i].id
							}
						)
					end
				end
			end

		end
		)

	end
	)

end)

RegisterServerEvent('esx_mecanojob:getCarOutOfPound')
AddEventHandler('esx_mecanojob:getCarOutOfPound', function(id)
	MySQL.Async.execute(
		'UPDATE `owned_vehicles` SET `car_pound` = 0 WHERE id = @id',
		{
			['@id'] = id
		}
	)
end)

ESX.RegisterServerCallback('esx_mecanojob:getCustomers', function(source, cb)
	MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles`",
	{},
	function(result)
		local customers = {}
		for i=1, #result, 1 do
			if result[i].car_pound == 1 then
				local xPlayer 	= ESX.GetPlayerFromIdentifier(result[i].owner)

				if xPlayer ~= nil then
					local vehicle 	= json.decode(result[i].vehicle)
					table.insert(customers,
					{
						id 					= result[i].id,
						vehicleOwner 		= result[i].owner,
						vehicleOwnerName 	= xPlayer.name,
						vehicle	 			= vehicle
					})
				end
			end
		end
		cb(customers)
	end
	)
end)

-------------- Récupération bouteille de gaz -------------
---- Sqlut je teste ------
local function Harvest(source)
local _source = source
	SetTimeout(4000, function()

		if PlayersHarvesting[_source] == true then

			local xPlayer  = ESX.GetPlayerFromId(_source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', _source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('gazbottle', 1)
					
				Harvest(_source)
			end
		end
	end)
end

RegisterServerEvent('esx_mecanojob:startHarvest')
AddEventHandler('esx_mecanojob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récupération de ~b~bouteille de gaz~s~...')
	Harvest(_source)
end)

RegisterServerEvent('esx_mecanojob:stopHarvest')
AddEventHandler('esx_mecanojob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)
------------ Récupération Outils Réparation --------------
local function Harvest2(source)
local _source = source
	SetTimeout(4000, function()

		if PlayersHarvesting2[_source] == true then

			local xPlayer  = ESX.GetPlayerFromId(_source)
			local FixToolQuantity  = xPlayer.getInventoryItem('fixtool').count
			if FixToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez ~r~plus de place')				
			else
                xPlayer.addInventoryItem('fixtool', 1)
					
				Harvest2(_source)
			end
		end
	end)
end

RegisterServerEvent('esx_mecanojob:startHarvest2')
AddEventHandler('esx_mecanojob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récupération d\'~b~Outils réparation~s~...')
	Harvest2(_source)
end)

RegisterServerEvent('esx_mecanojob:stopHarvest2')
AddEventHandler('esx_mecanojob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)
----------------- Récupération Outils Carosserie ----------------
local function Harvest3(source)
local _source = source
	SetTimeout(4000, function()

		if PlayersHarvesting3[_source] == true then

			local xPlayer  = ESX.GetPlayerFromId(_source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('carotool').count
            if CaroToolQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez ~r~plus de place')					
			else
                xPlayer.addInventoryItem('carotool', 1)
					
				Harvest3(_source)
			end
		end
	end)
end

RegisterServerEvent('esx_mecanojob:startHarvest3')
AddEventHandler('esx_mecanojob:startHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récupération d\'~b~Outils carosserie~s~...')
	Harvest3(_source)
end)

RegisterServerEvent('esx_mecanojob:stopHarvest3')
AddEventHandler('esx_mecanojob:stopHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)
------------ Craft Chalumeau -------------------
local function Craft(source)
local _source = source
	SetTimeout(4000, function()

		if PlayersCrafting[_source] == true then

			local xPlayer  = ESX.GetPlayerFromId(_source)
			local GazBottleQuantity = xPlayer.getInventoryItem('gazbottle').count

			if GazBottleQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez ~r~pas assez~s~ de bouteille de gaz')		
			else   
                xPlayer.removeInventoryItem('gazbottle', 1)
                xPlayer.addInventoryItem('blowpipe', 1)
					
				Craft(_source)
			end
		end
	end)
end

RegisterServerEvent('esx_mecanojob:startCraft')
AddEventHandler('esx_mecanojob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Assemblage de ~b~Chalumeaux~s~...')
	Craft(_source)
end)

RegisterServerEvent('esx_mecanojob:stopCraft')
AddEventHandler('esx_mecanojob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)
------------ Craft kit Réparation --------------
local function Craft2(source)
local _source = source
	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(_source)
			local FixToolQuantity  = xPlayer.getInventoryItem('fixtool').count
			if FixToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez ~r~pas assez~s~ d\'outils réparation')				
			else
                xPlayer.removeInventoryItem('fixtool', 1)
                xPlayer.addInventoryItem('fixkit', 1)
					
				Craft2(_source)
			end
		end
	end)
end

RegisterServerEvent('esx_mecanojob:startCraft2')
AddEventHandler('esx_mecanojob:startCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Assemblage de ~b~Kit réparation~s~...')
	Craft2(_source)
end)

RegisterServerEvent('esx_mecanojob:stopCraft2')
AddEventHandler('esx_mecanojob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)
----------------- Craft kit Carosserie ----------------
local function Craft3(source)
local _source = source
	SetTimeout(4000, function()

		if PlayersCrafting3[_source] == true then

			local xPlayer  = ESX.GetPlayerFromId(_source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('carotool').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', _source, 'Vous n\'avez ~r~pas assez~s~ d\'outils carosserie')					
			else
                xPlayer.removeInventoryItem('carotool', 1)
                xPlayer.addInventoryItem('carokit', 1)
					
				Craft3(_source)
			end
		end
	end)
end

RegisterServerEvent('esx_mecanojob:startCraft3')
AddEventHandler('esx_mecanojob:startCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Assemblage de ~b~kit carosserie~s~...')
	Craft3(_source)
end)

RegisterServerEvent('esx_mecanojob:stopCraft3')
AddEventHandler('esx_mecanojob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)

---------------------------- NPC Job Earnings ------------------------------------------------------

RegisterServerEvent('esx_mecanojob:onNPCJobMissionCompleted')
AddEventHandler('esx_mecanojob:onNPCJobMissionCompleted', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--local total   = math.random(Config.NPCJobEarnings.min, Config.NPCJobEarnings.max);
	local total = 1000
	local societyAccount = nil

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
		societyAccount = account
	end)

	local playerMoney  = math.floor(total / 100 * 34)
    local societyMoney = math.floor(total / 100 * 66)

    xPlayer.addMoney(playerMoney)
    societyAccount.addMoney(societyMoney)

 	TriggerClientEvent("esx:showNotification", xPlayer.source, "Vous avez ~g~gagné~s~ ~g~$ ".. playerMoney)
 	TriggerClientEvent("esx:showNotification", xPlayer.source, "Votre société a ~g~gagné~s~ ~g~$ ".. societyMoney)

end)

---------------------------- register usable item --------------------------------------------------
ESX.RegisterUsableItem('blowpipe', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('blowpipe', 1)

	TriggerClientEvent('esx_mecanojob:onHijack', _source)
    TriggerClientEvent('esx:showNotification', _source, 'Vous avez utilisé un ~b~Chalumeau')

end)

ESX.RegisterUsableItem('fixkit', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('fixkit', 1)

	TriggerClientEvent('esx_mecanojob:onFixkit', _source)
    TriggerClientEvent('esx:showNotification', _source, 'Vous avez utilisé un ~b~Kit de réparation')

end)

ESX.RegisterUsableItem('carokit', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('carokit', 1)

	TriggerClientEvent('esx_mecanojob:onCarokit', _source)
    TriggerClientEvent('esx:showNotification', _source, 'Vous avez utilisé un ~b~Kit de carosserie')

end)

----------------------------------
---- Ajout Gestion Stock Boss ----
----------------------------------

RegisterServerEvent('esx_mecanojob:getStockItem')
AddEventHandler('esx_mecanojob:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mecano', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_mecanojob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mecano', function(inventory)
		cb(inventory.items)
	end)

end)

-------------
-- AJOUT 2 --
-------------

RegisterServerEvent('esx_mecanojob:putStockItems')
AddEventHandler('esx_mecanojob:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mecano', function(inventory)

		local item = inventory.getItem(itemName)
		local playerItemCount = xPlayer.getInventoryItem(itemName).count

		if item.count >= 0 and count <= playerItemCount then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

	end)

end)

--ESX.RegisterServerCallback('esx_mecanojob:putStockItems', function(source, cb)

--	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_policestock', function(inventory)
--		cb(inventory.items)
--	end)

--end)

ESX.RegisterServerCallback('esx_mecanojob:getPlayerInventory', function(source, cb)
	local _source = source
	local xPlayer    = ESX.GetPlayerFromId(_source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)

----------------------------------------------------------------------------------------------------------------------
--------------------------------------Coffre argent sale / Armes ------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
ESX.RegisterServerCallback('esx_mecanojob:getBlackMoneySociety', function(source, cb)
	local _source = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local blackMoney = 0
  local items      = {}
  local weapons    = {}

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano_black', function(account)
    blackMoney = account.money
  end)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_mecano', function(inventory)
    items = inventory.items
  end)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_mecano', function(store)
    local storeWeapons = store.get('weapons')

    if storeWeapons ~= nil then
      weapons = storeWeapons
    end
  end)

  cb({
    blackMoney = blackMoney,
    items      = items,
    weapons    = weapons
  })

end)

RegisterServerEvent('esx_mecanojob:getItem')
AddEventHandler('esx_mecanojob:getItem', function(type, item, count)

  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_account' then

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano_black', function(account)

      local roomAccountMoney = account.money

      if roomAccountMoney >= count then
        account.removeMoney(count)
        xPlayer.addAccountMoney(item, count)
      else
        TriggerClientEvent('esx:showNotification', _source, 'Montant invalide')
      end

    end)
  end

  if type == 'item_weapon' then

    TriggerEvent('esx_datastore:getSharedDataStore', 'society_mecano', function(store)

      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      local weaponName   = nil
      local ammo         = nil

      for i=1, #storeWeapons, 1 do
        if storeWeapons[i].name == item then
          weaponName = storeWeapons[i].name
          ammo       = storeWeapons[i].ammo
          table.remove(storeWeapons, i)
          break
        end
      end
      store.set('weapons', storeWeapons)
      xPlayer.addWeapon(weaponName, ammo)
    end)
  end
end)

RegisterServerEvent('esx_mecanojob:putItem')
AddEventHandler('esx_mecanojob:putItem', function(type, item, count)

  local _source      = source
  local xPlayer      = ESX.GetPlayerFromId(_source)

  if type == 'item_account' then
    local playerAccountMoney = xPlayer.getAccount(item).money

    if playerAccountMoney >= count then

      xPlayer.removeAccountMoney(item, count)
      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano_black', function(account)
        account.addMoney(count)
      end)
    else
      TriggerClientEvent('esx:showNotification', _source, 'Montant invalide')
    end
  end

  if type == 'item_weapon' then
    TriggerEvent('esx_datastore:getSharedDataStore', 'society_mecano', function(store)
      local storeWeapons = store.get('weapons')

      if storeWeapons == nil then
        storeWeapons = {}
      end

      table.insert(storeWeapons, {
        name = item,
        ammo = count
      })
      store.set('weapons', storeWeapons)

      xPlayer.removeWeapon(item)
    end)
  end
end)

ESX.RegisterServerCallback('esx_mecanojob:getPlayerInventory2', function(source, cb)
	local _source = source
  local xPlayer    = ESX.GetPlayerFromId(_source)
  local blackMoney = xPlayer.getAccount('black_money').money
  local items      = xPlayer.inventory

  cb({
    blackMoney = blackMoney,
    items      = items
  })
end)
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------