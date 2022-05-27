DEFINE_BASECLASS( "base_gmodentity" )

ENT.PrintName		= "Health Pack (Modded)"
ENT.Author		    = "joshs26 and modded by WAP"
ENT.Information		= ""
ENT.Category		= "joshs26"

ENT.Editable		= false
ENT.Spawnable		= true
ENT.AdminOnly		= true

HealthPack = {}
HealthPack.Config = {}

-- Set this to true if you want to set the health to max health (config for that below) when used,
-- or false if you want to instead add to the current health
HealthPack.Config.SetTheValue = false

-- Set this true if you want to use ply:GetMaxHealth() for getting the max health, useful if SetTheValue is true
-- If false, then DefaultMaxValue will be used
HealthPack.Config.UseMaxHealth = true

-- If UseMaxHealth is false, then the default value for maximum health will be this
HealthPack.Config.DefaultMaxValue = 100

-- Optional. These values will override the max health value for specific teams.
HealthPack.CustomMaxValues = {
	-- Example:
	-- ["Mega-Cop"] = 300,
}

-- If SetTheValue is false, then this will be the health added
HealthPack.Config.AddValue = 100

-- Optional. If SetTheValue is false, then these values will override the AddValue for specific teams.
HealthPack.CustomAddValues = {
	-- Example:
	-- ["Mega-Cop"] = 100,
}