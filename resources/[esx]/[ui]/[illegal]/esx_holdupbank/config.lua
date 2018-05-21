Config = {}
Config.Locale = 'fr'
Config.NumberOfCopsRequired = 5
Config.TimerBeforeNewRob = 2100 -- seconds

Banks = {
	["fleeca"] = {
		position = { ['x'] = 147.04908752441, ['y'] = -1044.9448242188, ['z'] = 29.36802482605 },
		reward = math.random(15000,250000),
		nameofbank = "Fleeca Bank",
		lastrobbed = 0
	},
	["fleeca2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = math.random(15000,250000),
		nameofbank = "Fleeca Bank (Highway)",
		lastrobbed = 0
	},
	["cnn"] = {
		position = { ['x'] = -1211.3868, ['y'] = -335.574249, ['z'] = 37.7811 },
		reward = math.random(15000,250000),
		nameofbank = "Boulevard Del Pero",
		lastrobbed = 0
	},
	["hardwickBank"] = {
		position = { ['x'] = -353.6549, ['y'] = -54.0834, ['z'] = 49.0365 },
		reward = math.random(15000,250000),
		nameofbank = "Hardwick Ave",
		lastrobbed = 0
	},
	["68"] = {
		position = { ['x'] = 1177.7200927734, ['y'] = 2711.5969238281, ['z'] = 38.097747802734 },
		reward = math.random(15000,250000),
		nameofbank = "Banque de la Route 68",
		lastrobbed = 0
	},
	["popular"] = {
		position = { ['x'] = 311.1957, ['y'] = -283.4987, ['z'] = 54.1647 },
		reward = math.random(15000,250000),
		nameofbank = "Popular Street",
		lastrobbed = 0
	},
	["blainecounty"] = {
		position = { ['x'] = -104.1678, ['y'] = 6477.9121, ['z'] = 31.62670135498 },
		reward = math.random(15000,250000),
		nameofbank = "Blaine County Savings",
		lastrobbed = 0
	},
	["PrincipalBank"] = {
		position = { ['x'] = 253.88674926758, ['y'] = 225.21179199219, ['z'] = 101.8757019043 },
		reward = math.random(50000,500000),
		nameofbank = "Principal bank",
		lastrobbed = 0
	}
}
