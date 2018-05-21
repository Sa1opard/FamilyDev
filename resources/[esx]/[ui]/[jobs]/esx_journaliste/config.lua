Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 102, g = 0, b = 102 }
Config.EnableSocietyOwnedVehicles = false
Config.EnablePlayerManagement     = true
Config.Locale                     = 'fr'

Config.Blip = {
  Pos     = { x = -1087.048, y = -249.330, z = 36.947},
  Sprite  = 135,
  Display = 4,
  Scale   = 1.2,
  Colour  = 0,
}

Config.Zones = {

  AmbulanceActions = {
    Pos  = { x = -1087.048, y = -249.330, z = 36.947},
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = 1
  },

  VehicleSpawner = {
    Pos  = { x = -1096.290, y = -256.451, z = 36.293},
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = 1
  },

  VehicleSpawnPoint = {
    Pos  = { x = -1099.061, y = -265.882, z = 37.692},
    Size = { x = 1.5, y = 1.5, z = 1.0 },
    Type = -1
  },

  VehicleDeleter = {
    Pos  = { x = -1102.436, y = -255.600, z = 36.292},
    Size = { x = 4.0, y = 4.0, z = 2.0 },
    Type = 1
  }

}
