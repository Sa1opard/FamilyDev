Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 25
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale = 'fr'

Config.AvocatStations = {

  AVOCAT = {

    Blip = {
      Pos     = { x = -824.758, y = 174.601, z = 70.815 },
      Sprite  = 76,
      Display = 4,
      Scale   = 1.2,
      Colour  = 75,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_STUNGUN',          price = 60000 },
    },

    AuthorizedVehicles = {
      { name = 'police',  label = 'Véhicule de patrouille 1' },
      { name = 'police2', label = 'Véhicule de patrouille 2' },
      { name = 'police3', label = 'Véhicule de patrouille 3' },
      { name = 'police4', label = 'Véhicule civil' },
      { name = 'policeb', label = 'Moto' },
      { name = 'policet', label = 'Van de transport' },
    },

    Cloakrooms = {
      { x = -811.771, y = 175.175, z = 75.74 },
    },

    Armories = {
      { x = -809.743, y = 172.966, z = 75.740 },
    },

    Vehicles = {
      {
        Spawner    = { x = -807.761, y = 189.489, z = 71.477 },
        SpawnPoint = { x = -819.489, y = 184.130, z = 71.159 },
        Heading    = 90.0,
      }
    },

    VehicleDeleters = {
      { x = -812.702, y = 186.832, z = 71.467 },
    },

    BossActions = {
      { x = -800.569, y = 185.764, z = 71.605 }
    },

  },

}
