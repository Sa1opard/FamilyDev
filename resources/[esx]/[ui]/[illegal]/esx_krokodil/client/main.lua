local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PID           			= 0
local GUI           			= {}
local iodeQTE       			= 0
ESX 			    			= nil
GUI.Time            			= 0
local kroko_poochQTE 			= 0
local codeineQTE				= 0
local essenceQTE				= 0
local disolvantQTE				= 0
local heroineQTE   				= 0
local phosphorerougeQTE			= 0
local myJob 					= nil
local PlayerData 				= {}
local GUI 						= {}
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('esx_kroko:hasEnteredMarker', function(zone)

        ESX.UI.Menu.CloseAll()

        --codeine
        if zone == 'CodeineFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'codeine_harvest'
                CurrentActionMsg  = _U('press_collect_codeine')
                CurrentActionData = {}
            end
        end

        --essence
        if zone == 'EssenceFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'essence_harvest'
                CurrentActionMsg  = _U('press_collect_essence')
                CurrentActionData = {}
            end
        end

        --disolvant
        if zone == 'DisolvantFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'disolvant_harvest'
                CurrentActionMsg  = _U('press_collect_disolvant')
                CurrentActionData = {}
            end
        end

        --phosphorerouge
        if zone == 'PhosphorerougeFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'phosphorerouge_harvest'
                CurrentActionMsg  = _U('press_collect_phosphorerouge')
                CurrentActionData = {}
            end
        end

        --heroine
        if zone == 'HeroineFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'heroine_harvest'
                CurrentActionMsg  = _U('press_collect_heroine')
                CurrentActionData = {}
            end
        end

        --iode
        if zone == 'IodeFarm' then
            if myJob ~= "police" then
                CurrentAction     = 'iode_harvest'
                CurrentActionMsg  = _U('press_collect_iode')
                CurrentActionData = {}
            end
        end

		if zone == 'KrokoTreatment' then
            if myJob ~= "police" then
                    print('J\'ai vérifie la quantité')
                    CurrentAction     = 'kroko_treatment'
                    CurrentActionMsg  = _U('press_process_kroko')
                    CurrentActionData = {}
            end
        end

        if zone == 'KrokoResell' then
            if myJob ~= "police" then
                if kroko_poochQTE >= 1 then
                    CurrentAction     = 'kroko_resell'
                    CurrentActionMsg  = _U('press_sell_kroko')
                    CurrentActionData = {}
                end
            end
        end
    end)

AddEventHandler('esx_kroko:hasExitedMarker', function(zone)

        CurrentAction = nil
        ESX.UI.Menu.CloseAll()

        TriggerServerEvent('esx_kroko:stopHarvestCodeine')
        TriggerServerEvent('esx_kroko:stopHarvestEssence')
        TriggerServerEvent('esx_kroko:stopHarvestDisolvant')
        TriggerServerEvent('esx_kroko:stopHarvestPhosphorerouge')
        TriggerServerEvent('esx_kroko:stopHarvestHeroine')
        TriggerServerEvent('esx_kroko:stopHarvestIode')
        TriggerServerEvent('esx_kroko:stopTransformKroko')
        TriggerServerEvent('esx_kroko:stopSellKroko')
end)

-- Kroko Effect
RegisterNetEvent('esx_kroko:onPot')
AddEventHandler('esx_kroko:onPot', function()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
        Citizen.Wait(0)
    end
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
    Citizen.Wait(600000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Render markers
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords = GetEntityCoords(GetPlayerPed(-1))

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
                DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            end
        end

    end
end)

-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_kroko:ReturnInventory')
AddEventHandler('esx_kroko:ReturnInventory', function(codeineNbr, essenceNbr, disolvantNbr, phosphorerougeNbr, heroineNbr, iodeNbr, krokopNbr, jobName, currentZone)
	codeineQTE       = codeineNbr
	essenceQTE 	  = essenceNbr
	disolvantQTE 	  = disolvantNbr
	phosphorerougeQTE       = phosphorerougeNbr
	heroineQTE       = heroineNbr
	iodeQTE       = iodeNbr
	kroko_poochQTE = krokopNbr
	myJob         = jobName
	TriggerEvent('esx_kroko:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
    while true do

        Wait(0)

        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
                isInMarker  = true
                currentZone = k
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            lastZone                = currentZone
            TriggerServerEvent('esx_kroko:GetUserInventory', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('esx_kroko:hasExitedMarker', lastZone)
        end

    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustReleased(0, 38) then
                if CurrentAction == 'codeine_harvest' then
                    TriggerServerEvent('esx_kroko:startHarvestCodeine')
                end
                if CurrentAction == 'essence_harvest' then
                    TriggerServerEvent('esx_kroko:startHarvestEssence')
                end
                if CurrentAction == 'disolvant_harvest' then
                    TriggerServerEvent('esx_kroko:startHarvestDisolvant')
                end
                if CurrentAction == 'phosphorerouge_harvest' then
                    TriggerServerEvent('esx_kroko:startHarvestPhosphorerouge')
                end
                if CurrentAction == 'heroine_harvest' then
                    TriggerServerEvent('esx_kroko:startHarvestHeroine')
                end
                if CurrentAction == 'iode_harvest' then
                    TriggerServerEvent('esx_kroko:startHarvestIode')
                end
                if CurrentAction == 'kroko_treatment' then
                    TriggerServerEvent('esx_kroko:startTransformKroko')
                end
                if CurrentAction == 'kroko_resell' then
                    TriggerServerEvent('esx_kroko:startSellKroko')                   
                end
                CurrentAction = nil
            end
        end
    end
end)