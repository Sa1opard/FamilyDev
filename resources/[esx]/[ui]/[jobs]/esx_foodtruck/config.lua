Config                        = {}
Config.DrawDistance           = 100.0
Config.Locale = 'fr'

local seconde = 1000
local minute = 60 * seconde

Config.Fridge = {
	steak = 300,
	packaged_chicken = 100,
	bread = 200,
	water = 100,
	cocacola = 100,
	vegetables = 100
} -- maxquantity

Config.Recipes = {
	tacos = {
		Ingredients = {
			bread 				= { "Pain"		, 1 },
			steak				= { "Viande"	, 2 },
			vegetables 			= { "Légumes"	, 1 }
		},
		Price = 100,
		CookingTime = 30 * seconde,
		Item = 'tacos',
		Name = 'Tacos'
	},
	hamburger = {
		Ingredients = {
			bread 				= { "Pain"		, 1 },
			packaged_chicken 	= { "Poulet"	, 1 },
			vegetables 			= { "Légumes"	, 1 }
		},
		Price = 100,
		CookingTime = 15 * seconde,
		Item = 'hamburger',
		Name = 'hamburger'
	}
}

Config.Zones = {
	Actions = {
		Pos   = {x = -169.85577392578, y = 285.20236206055, z = 93.763916015625},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 102, g = 102, b = 204},
		Type  = 0
	},
	VehicleSpawnPoint = {
		Pos   = {x = -173.174316406225, y = 276.71701049805, z = 93.26008605957},
		Size  = {x = 3.0, y = 3.0, z = 1.5},
		Type  = -1
	},
	VehicleDeleter = {
		Pos   = {x = -150.20896911621, y = 277.71151733398, z = 93.923698425293},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		Type  = 0
	}
--	Market = {
--		Pos   = {x = -2511.07, y = 3615.16, z = 12.6714},
--		Size  = {x = 1.5, y = 1.5, z = 1.0},
--		Color = {r = 0, g = 255, b = 0},
--		Type  = 0
--	}
}