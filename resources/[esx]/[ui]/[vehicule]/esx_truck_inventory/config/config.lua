--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1000



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	bread = 100,
	water = 200,
	black_money = 1, -- poids pour un argent
    clip = 100,
}

Config.VehicleLimit = {
    [0] = 60000, --Compact
    [1] = 100000, --Sedan
    [2] = 160000, --SUV
    [3] = 50000, --Coupes
    [4] = 80000, --Muscle
    [5] = 80000, --Sports Classics
    [6] = 80000, --Sports
    [7] = 50000, --Super
    [8] = 10000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 180000, --Utility
    [12] = 180000, --Vans
    [13] = 2000, --Cycles
    [14] = 300000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0, --Trains
}