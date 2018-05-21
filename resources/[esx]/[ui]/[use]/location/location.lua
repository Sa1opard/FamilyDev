RegisterNetEvent('voiture:FinishMoneyCheckForVel')

local voitureshop = {
	opened = false,
	title = "Véhicule de location",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 5 },
	menu = {
		x = 0.9,
		y = 0.25,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = { 
			title = "CATEGORIES", 
			name = "main",
			buttons = { 
				{name = "Voiture sans permis", description = ''},
				{name = "Voiture avec permis", description = ''},
			}
		},
		["vehicles"] = { 
			title = "VEHICLES", 
			name = "vehicles",
			buttons = { 
				{name = "Voiture sans permis", description = ''},
				{name = "Voiture avec permis", description = ''},
				}
		},
		["Voiture-Sans-Permis"] = { 
			title = "Voiture-Sans-Permis", 
			name = "Voiture-Sans-Permis",
			buttons = { 
				{name = "Punto", costs = 100, description = {}, model = "panto"},
				{name = "Faggio", costs = 100, description = {}, model = "faggio2"},
				
			}
		},
		["Voiture-Avec-Permis"] = { 
			title = "Voiture-Avec-Permis", 
			name = "Voiture-Avec-Permis",
			buttons = { 
				{name = "Blista", costs = 150, description = {}, model = "blista"},
				{name = "Rhapsody", costs = 150, description = {}, model = "rhapsody"},
				{name = "Kalahari", costs = 150, description = {}, model = "kalahari"},
			}
		},
	}
}

local fakevoiture = {model = '', voiture = nil}
local voiture_localisations = {
{entering = {-904.39,-2337.38,6.71}, inside = {-905.96,-2333.15,6.71,62.16}, outside = {-905.96,-2333.15,6.71,62.16}},
{entering = {209.762,-938.398,23.1416}, inside = {214.684,-937.723,24.1416}, outside = {214.684,-937.723,24.1416}},
}

local voitureshop_blips ={}
local inrangeofvoitureshop = false
local currentlocationvoiture = nil
local boughtvoiture = false

local function LocalPed()
return GetPlayerPed(-1)
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)	
end

function IsPlayerinrangeofvoitureshop()
return inrangeofvoitureshop
end

function ShowvoitureshopBlips(bool)
	if bool and #voitureshop_blips == 0 then
		for station,pos in pairs(voiture_localisations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])

			SetBlipSprite(blip,365)
			SetBlipColour(blip, 74)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Location Véhicules')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(voitureshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #voitureshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(voitureshop_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and voitureshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 5.0 then
						DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					end
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and voitureshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 0.4001 then
						drawTxt('Appuyez sur ~g~ENTER~s~ pour acceder au ~b~véhicules',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocationvoiture = b
						inrange = true
					end
				end
				inrangeofvoitureshop = inrange
			end
		end)
	elseif bool == false and #voitureshop_blips > 0 then
		for i,b in ipairs(voitureshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		voitureshop_blips = {}
	end
end

function f(n)
return n + 0.0001
end

function LocalPed()
return GetPlayerPed(-1)
end

function try(f, catch_f)
local status, exception = pcall(f)
if not status then
catch_f(exception)
end
end
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function OpenCreatorvoiture()		
	boughtvoiture = false
	local ped = LocalPed()
	local pos = currentlocationvoiture.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	voitureshop.currentmenu = "main"
	voitureshop.opened = true
	voitureshop.selectedbutton = 0
end

function CloseCreatorvoiture()
	Citizen.CreateThread(function()
		local ped = LocalPed()
		if not boughtvoiture then
			local pos = currentlocationvoiture.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end	
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = currentlocationvoiture.pos.outside

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			personalvehicle = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)
			SetModelAsNoLongerNeeded(model)
			for i,mod in pairs(mods) do
				SetVehicleModKit(personalvehicle,0)
				SetVehicleMod(personalvehicle,i,mod)
			end
			SetVehicleOnGroundProperly(personalvehicle)
			SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
			local id = NetworkGetNetworkIdFromEntity(personalvehicle)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
			SetVehicleColours(personalvehicle,colors[1],colors[2])
			SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),personalvehicle,-1)
			SetEntityVisible(ped,true)
			
			
		end
		voitureshop.opened = false
		voitureshop.menu.from = 1
		voitureshop.menu.to = 10
	end)
end

function drawMenuvoitureButton(button,x,y,selected)
	local menu = voitureshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)	
end

function drawMenuvoitureInfo(text)
	local menu = voitureshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)	
end

function drawMenuvoitureRight(txt,x,y,selected)
	local menu = voitureshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)	
end

function drawMenuvoitureTitle(txt,x,y)
local menu = voitureshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)	
end
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end
function Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

function DoesPlayerHaveVehicle(model,button,y,selected)
		local t = false
		if t then
			drawMenuvoitureRight("OWNED",voitureshop.menu.x,y,selected)
		else
			drawMenuvoitureRight(button.costs.."$",voitureshop.menu.x,y,selected)
		end
end

local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerinrangeofvoitureshop() then
			if voitureshop.opened then
				CloseCreatorvoiture()
			else
				OpenCreatorvoiture()
			end
		end
		if voitureshop.opened then
			local ped = LocalPed()
			local menu = voitureshop.menu[voitureshop.currentmenu]
			drawTxt(voitureshop.title,1,1,voitureshop.menu.x,voitureshop.menu.y,1.0, 255,255,255,255)
			drawMenuvoitureTitle(menu.title, voitureshop.menu.x,voitureshop.menu.y + 0.08)
			drawTxt(voitureshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,voitureshop.menu.x + voitureshop.menu.width/2 - 0.0385,voitureshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = voitureshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			
			for i,button in pairs(menu.buttons) do
				if i >= voitureshop.menu.from and i <= voitureshop.menu.to then
					
					if i == voitureshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuvoitureButton(button,voitureshop.menu.x,y,selected)
					if button.costs ~= nil then
						if voitureshop.currentmenu == "Voiture-Sans-Permis" or voitureshop.currentmenu == "Voiture-Avec-Permis" then
							DoesPlayerHaveVehicle(button.model,button,y,selected)
						else
						drawMenuvoitureRight(button.costs.."$",voitureshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if voitureshop.currentmenu == "Voiture-Sans-Permis" or voitureshop.currentmenu == "Voiture-Avec-Permis" then
						if selected then
							if fakevoiture.model ~= button.model then
								if DoesEntityExist(fakevoiture.voiture) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakevoiture.voiture))
								end
								local pos = currentlocationvoiture.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)
									drawTxt("~b~Chargement...",0,1,0.5,0.5,1.5,255,255,255,255)
									
								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
								while not DoesEntityExist(veh) do
									Citizen.Wait(0)
									drawTxt("~b~Chargement...",0,1,0.5,0.5,1.5,255,255,255,255)
								end
								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakevoiture = { model = button.model, voiture = veh}
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end	
		end
		if voitureshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if voitureshop.selectedbutton > 1 then
					voitureshop.selectedbutton = voitureshop.selectedbutton -1
					if buttoncount > 10 and voitureshop.selectedbutton < voitureshop.menu.from then
						voitureshop.menu.from = voitureshop.menu.from -1
						voitureshop.menu.to = voitureshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if voitureshop.selectedbutton < buttoncount then
					voitureshop.selectedbutton = voitureshop.selectedbutton +1
					if buttoncount > 10 and voitureshop.selectedbutton > voitureshop.menu.to then
						voitureshop.menu.to = voitureshop.menu.to + 1
						voitureshop.menu.from = voitureshop.menu.from + 1
					end
				end	
			end
		end
		
	end
end)


function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end
function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = voitureshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Voiture sans permis" then
			OpenMenu('Voiture-Sans-Permis')
		elseif btn == "Voiture avec permis" then
			OpenMenu('Voiture-Avec-Permis')
		end
		
	elseif this == "Voiture-Sans-Permis" or this == "Voiture-Avec-Permis" then

	local name = button.name	
		local vehicle = button.model
		local price = button.costs
		TriggerServerEvent('voiture:CheckMoneyForVel',name, vehicle, price)
	end
end

AddEventHandler('voiture:FinishMoneyCheckForVel', function(name, vehicle, price)	
	local name = name
	local vehicle = vehicle
	local price = price
	boughtvoiture = true
	CloseCreatorvoiture(name, vehicle, price)
end)


function OpenMenu(menu)
	fakevoiture = {model = '', voiture = nil}
	voitureshop.lastmenu = voitureshop.currentmenu
	if menu == "vehicles" then
		voitureshop.lastmenu = "main"
	elseif menu == "bikes"  then
		voitureshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		voitureshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		voitureshop.lastmenu = "race_create_objects"
	end
	voitureshop.menu.from = 1
	voitureshop.menu.to = 10
	voitureshop.selectedbutton = 0
	voitureshop.currentmenu = menu	
end


function Back()
	if backlock then
		return
	end
	backlock = true
	if voitureshop.currentmenu == "main" then
		CloseCreatorvoiture()
	elseif voitureshop.currentmenu == "Voiture-Sans-Permis" or voitureshop.currentmenu == "Voiture-Avec-Permis" then
		if DoesEntityExist(fakevoiture.voiture) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakevoiture.voiture))
		end
		fakevoiture = {model = '', voiture = nil}
		OpenMenu(voitureshop.lastmenu)
	else
		OpenMenu(voitureshop.lastmenu)
	end
	
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
if firstspawn == 0 then
	ShowvoitureshopBlips(true)
	firstspawn = 1
end
end)