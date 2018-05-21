ESX 						           = nil
local CopsConnected       	           = 0
local PlayersHarvestingCodeine         = {}
local PlayersHarvestingEssence         = {}
local PlayersHarvestingDisolvant       = {}
local PlayersHarvestingPhosphorerouge  = {}
local PlayersHarvestingHeroine         = {}
local PlayersHarvestingIode            = {}
local PlayersTransformingKroko         = {}
local PlayersSellingKroko              = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(5000, CountCops)

end

CountCops()

--codeine
local function HarvestCodeine(source)

	if CopsConnected < Config.RequiredCopsCodeine then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsCodeine)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingCodeine[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local codeine = xPlayer.getInventoryItem('codeine')

			if codeine.limit ~= -1 and codeine.count >= codeine.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_codeine'))
			else
				xPlayer.addInventoryItem('codeine', 1)
				HarvestCodeine(source)
			end

		end
	end)
end

RegisterServerEvent('esx_kroko:startHarvestCodeine')
AddEventHandler('esx_kroko:startHarvestCodeine', function()

	local _source = source

	PlayersHarvestingCodeine[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestCodeine(_source)

end)

RegisterServerEvent('esx_kroko:stopHarvestCodeine')
AddEventHandler('esx_kroko:stopHarvestCodeine', function()

	local _source = source

	PlayersHarvestingCodeine[_source] = false

end)

--essence
local function HarvestEssence(source)

	if CopsConnected < Config.RequiredCopsEssence then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsEssence)
		return
	end
	
	SetTimeout(5000, function()

		if PlayersHarvestingEssence[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local essence = xPlayer.getInventoryItem('essence')

			if essence.limit ~= -1 and essence.count >= essence.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_essence'))
			else
				xPlayer.addInventoryItem('essence', 1)
				HarvestEssence(source)
			end

		end
	end)
end

RegisterServerEvent('esx_kroko:startHarvestEssence')
AddEventHandler('esx_kroko:startHarvestEssence', function()

	local _source = source

	PlayersHarvestingEssence[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestEssence(_source)

end)

RegisterServerEvent('esx_kroko:stopHarvestEssence')
AddEventHandler('esx_kroko:stopHarvestEssence', function()

	local _source = source

	PlayersHarvestingEssence[_source] = false

end)

--disolvant
local function HarvestDisolvant(source)

	if CopsConnected < Config.RequiredCopsDisolvant then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsDisolvant)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingDisolvant[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local disolvant = xPlayer.getInventoryItem('disolvant')

			if disolvant.limit ~= -1 and disolvant.count >= disolvant.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_disolvant'))
			else
				xPlayer.addInventoryItem('disolvant', 1)
				HarvestDisolvant(source)
			end

		end
	end)
end

RegisterServerEvent('esx_kroko:startHarvestDisolvant')
AddEventHandler('esx_kroko:startHarvestDisolvant', function()

	local _source = source

	PlayersHarvestingDisolvant[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestDisolvant(_source)

end)

RegisterServerEvent('esx_kroko:stopHarvestDisolvant')
AddEventHandler('esx_kroko:stopHarvestDisolvant', function()

	local _source = source

	PlayersHarvestingDisolvant[_source] = false

end)

--phosphorerouge

local function HarvestPhosphorerouge(source)

	if CopsConnected < Config.RequiredCopsPhosphorerouge then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsPhosphorerouge)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingPhosphorerouge[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local phosphorerouge = xPlayer.getInventoryItem('phosphorerouge')

			if phosphorerouge.limit ~= -1 and phosphorerouge.count >= phosphorerouge.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_phosphorerouge'))
			else
				xPlayer.addInventoryItem('phosphorerouge', 1)
				HarvestPhosphorerouge(source)
			end

		end
	end)
end

RegisterServerEvent('esx_kroko:startHarvestPhosphorerouge')
AddEventHandler('esx_kroko:startHarvestPhosphorerouge', function()

	local _source = source

	PlayersHarvestingPhosphorerouge[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestPhosphorerouge(_source)

end)

RegisterServerEvent('esx_kroko:stopHarvestPhosphorerouge')
AddEventHandler('esx_kroko:stopHarvestPhosphorerouge', function()

	local _source = source

	PlayersHarvestingPhosphorerouge[_source] = false

end)

--heroine
local function HarvestHeroine(source)

	if CopsConnected < Config.RequiredCopsHeroine then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsHeroine)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingHeroine[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local heroine = xPlayer.getInventoryItem('heroine')

			if heroine.limit ~= -1 and heroine.count >= heroine.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_heroine'))
			else
				xPlayer.addInventoryItem('heroine', 1)
				HarvestHeroine(source)
			end

		end
	end)
end

RegisterServerEvent('esx_kroko:startHarvestHeroine')
AddEventHandler('esx_kroko:startHarvestHeroine', function()

	local _source = source

	PlayersHarvestingHeroine[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestHeroine(_source)

end)

RegisterServerEvent('esx_kroko:stopHarvestHeroine')
AddEventHandler('esx_kroko:stopHarvestHeroine', function()

	local _source = source

	PlayersHarvestingHeroine[_source] = false

end)

--iode
local function HarvestIode(source)

	if CopsConnected < Config.RequiredCopsKroko then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsKroko)
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingIode[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local iode = xPlayer.getInventoryItem('iode')

			if iode.limit ~= -1 and iode.count >= iode.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_iode'))
			else
				xPlayer.addInventoryItem('iode', 1)
				HarvestIode(source)
			end

		end
	end)
end

RegisterServerEvent('esx_kroko:startHarvestIode')
AddEventHandler('esx_kroko:startHarvestIode', function()

	local _source = source

	PlayersHarvestingIode[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestIode(_source)

end)

RegisterServerEvent('esx_kroko:stopHarvestIode')
AddEventHandler('esx_kroko:stopHarvestIode', function()

	local _source = source

	PlayersHarvestingIode[_source] = false

end)

local function TransformKroko(source)

    if CopsConnected < Config.RequiredCopsKroko then
        TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsKroko)
        return
    end

    SetTimeout(10000, function()

        if PlayersTransformingKroko[source] == true then

            local xPlayer  = ESX.GetPlayerFromId(source)

            local iodeQuantity = xPlayer.getInventoryItem('iode').count
            local poochQuantity = xPlayer.getInventoryItem('kroko_pooch').count
            local codeineQuantity = xPlayer.getInventoryItem('codeine').count
            local essenceQuantity = xPlayer.getInventoryItem('essence').count
            local disolvantQuantity = xPlayer.getInventoryItem('disolvant').count
            local phosphorerougeQuantity = xPlayer.getInventoryItem('phosphorerouge').count
            local heroineQuantity = xPlayer.getInventoryItem('heroine').count

            if poochQuantity > 35 then
                TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
            elseif codeineQuantity and essenceQuantity and disolvantQuantity and phosphorerougeQuantity and iodeQuantity and heroineQuantity < 1 then
                TriggerClientEvent('esx:showNotification', source, _U('not_enough_ingredient'))
            else
                xPlayer.removeInventoryItem('iode', 7)
                xPlayer.removeInventoryItem('codeine', 5)
                xPlayer.removeInventoryItem('essence', 10)
                xPlayer.removeInventoryItem('disolvant', 5)
                xPlayer.removeInventoryItem('phosphorerouge', 5)
                xPlayer.removeInventoryItem('heroine', 30)

                xPlayer.addInventoryItem('kroko_pooch', 1)
            
                TransformKroko(source)
            end

        end
    end)
end

RegisterServerEvent('esx_kroko:startTransformKroko')
AddEventHandler('esx_kroko:startTransformKroko', function()

	local _source = source

	PlayersTransformingKroko[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformKroko(_source)

end)

RegisterServerEvent('esx_kroko:stopTransformKroko')
AddEventHandler('esx_kroko:stopTransformKroko', function()

	local _source = source

	PlayersTransformingKroko[_source] = false

end)

local function SellKroko(source)

	if CopsConnected < Config.RequiredCopsKroko then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police') .. CopsConnected .. '/' .. Config.RequiredCopsKroko)
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingKroko[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local poochQuantity = xPlayer.getInventoryItem('kroko_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('kroko_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 7)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_kroko'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 19)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_kroko'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 12)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_kroko'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_kroko'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 16)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_kroko'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 2)  
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_kroko'))
                end
				
				SellKroko(source)
			end

		end
	end)
end

RegisterServerEvent('esx_kroko:startSellKroko')
AddEventHandler('esx_kroko:startSellKroko', function()

	local _source = source

	PlayersSellingKroko[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellKroko(_source)

end)

RegisterServerEvent('esx_kroko:stopSellKroko')
AddEventHandler('esx_kroko:stopSellKroko', function()

	local _source = source

	PlayersSellingKroko[_source] = false

end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_kroko:GetUserInventory')
AddEventHandler('esx_kroko:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_kroko:ReturnInventory', 
    	_source, 
    	xPlayer.getInventoryItem('codeine').count, 
		xPlayer.getInventoryItem('essence').count,  
		xPlayer.getInventoryItem('disolvant').count,  
		xPlayer.getInventoryItem('phosphorerouge').count, 
		xPlayer.getInventoryItem('heroine').count,
		xPlayer.getInventoryItem('iode').count, 
		xPlayer.getInventoryItem('kroko_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)

-- Register Usable Item
ESX.RegisterUsableItem('kroko_pooch', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('kroko_pooch', 1)

	TriggerClientEvent('esx_kroko:onPot', _source)
    TriggerClientEvent('esx:showNotification', _source, _U('used_one_kroko'))

end)
