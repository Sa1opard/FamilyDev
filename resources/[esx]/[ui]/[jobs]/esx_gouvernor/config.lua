----------------------------------------------------------------------
----------------------- Developped by AlphaKush ----------------------
----------------------------------------------------------------------

Config              = {}
Config.DrawDistance = 100.0
Config.MarkerColor  = {r = 120, g = 120, b = 240}
Config.EnableSocietyOwnedVehicles = false -- à tester
Config.EnablePlayerManagement     = true
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.Zones = {

	CloakRoom = { --Vestaire privé président
		--Pos   = {x = 126.43100738525, y = -729.10052490234, z = 241.15190124512},
		Pos   = {x = -78.399, y = -812.452, z = 242.385},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	CloakRoom2 = { --Vestaire garde du corps
		Pos   = {x = 118.327, y = -729.028, z = 241.151},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},



	OfficeActions = { -- Marker action boss
		--Pos   = {x = 156.23593139648, y = -740.03515625, z = 241.1519317624},
		Pos   = {x = -80.59, y = -801.65, z = 242.40},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = 1
	},

	--- Garage ----



	VehicleSpawner = { -- Menu dans le garage pour les véhicules
		Pos   = {x = 233.05233764648, y = -977.39697265625, z = -99.999954223633},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 242, g = 255, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = { --Spawn du véhicule dans le garage
		Pos   = {x = 228.47023010254, y = -988.41326904297, z = -98.999954223633},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	VehicleSpawnExterior = { --Spawn devant la sortie du garage
			Pos = {x = -558.039, y = -161.656, z = 38.0},
			Size  = {x = 1.5, y = 1.5, z = 1.0},
			Color = {r = 0, g = 204, b = 3},
			Type  = -1,
			Heading = 290.0
	},

	GarageExitWithVehicle = { -- Marker pour sortir du garage avec la voiture
			Pos = {x = 224.589, y = -998.044, z = -99.999},
			Size  = {x = 2.0, y = 2.0, z = 1.0},
			Color = {r = 204, g = 91, b = 0},
			Type  = 1
	},

	VehicleDeleter = { -- Marker pour ranger la voiture
		Pos   = {x = -576.185, y = -131.827, z = 34.46},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 0, b = 0},
		Type  = 1
	},

	------------ TP hélico -----------

	HelicoSpawner = { -- Menu pour spawn l'hélico
		Pos   = {x = -588.650, y = -135.576, z = 38.710},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 242, g = 255, b = 0},
		Type  = 1
	},

	HelicoSpawnPoint = { --Spawn de l'hélico sur la plateforme
		Pos   = {x = -606.779, y = -127.862, z = 39.008}, --Heading = 160.0
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 0, g = 204, b = 3},
		Type  = -1
	},

	HelicoDeleter = { -- Marker pour ranger l'hélico
		Pos   = {x = -502.895, y = -234.864, z = 36.375},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 0, b = 0},
		Type  = 1
	},
}

