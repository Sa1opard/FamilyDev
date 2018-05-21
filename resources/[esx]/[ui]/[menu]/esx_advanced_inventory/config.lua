Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 150000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 1000

-- WIP Holding more and more stuff make you slower and slower (Do not work at this time.. Try some native, look at client/main.lua)
Config.userSpeed = false

-- TODO, see server/main.lua
--Config.Config.BagIsSkin = true

-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:
Config.localWeight = {
	bread = 1000,
    water = 1000,
    wine = 1000,
    beer = 1000,
    vodka = 1000,
    chocolate = 1000,
    sandwish = 1000,
    hamburger = 1000,
    tequila = 1000,
    whisky = 1000,
    cupcake = 1000,
    cocacola = 1000,
    icetea = 1000,
    redbull = 1000,
    cigarett = 1000,
    lighter = 1000,
    milk = 1000,
    plongee1 = 1000,
    plongee2 = 1000,
    weed = 1000,
    weed_pooch = 1000,
    coke = 1000,
    coke_pooch = 1000,
    meth = 1000,
    meth_pooch = 1000,
    opium = 1000,
    opium_pooch = 1000,
    alive_chicken = 1000,
    slaughtered_chicken = 1000,
    packaged_chicken = 1000,
    fish = 1000,
    stone = 1000,
    washed_stone = 1000,
    copper = 1000,
    iron = 1000,
    gold = 1000,
    diamond = 1000,
    wood = 1000,
    cutted_wood = 1000,
    packaged_plank = 1000,
    petrol = 1000,
    petrol_raffin = 1000,
    essence = 1000,
    whool = 1000,
    fabric = 1000,
    clothe = 1000,
    gazbottle = 1000,
    fixtool = 1000,
    carotool = 1000,
    blowpipe = 1000,
    fixkit = 1000,
    carokit = 1000,
    bandage = 1000,
    medikit = 1000,
    clip = 1000,
    cola = 1000,
    vegetables = 1000,
    meat = 1000,
    tacos = 1000,
    burger = 1000,
    blackberry = 1000,
    poubelle = 1000,
    croquettes = 1000,
    silencieux = 1000,
    flashlight = 1000,
    grip = 1000,
    yusuf = 1000,
}