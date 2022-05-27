DEFINE_BASECLASS( "base_gmodentity" )

ENT.PrintName		= "Armor (Modded)"
ENT.Author		    = "joshs26 and modded by WAP"
ENT.Information		= ""
ENT.Category		= "joshs26"

ENT.Editable		= false
ENT.Spawnable		= true
ENT.AdminOnly		= true

Armor = {}
Armor.Config = {}

-- Set this to true if you want to set the armor to MaxArmorValue when used,
-- or false if you want to instead add AddValue to the current armor
Armor.Config.SetTheValue = false

-- To prevent people having a lot of armor, define a default maximum value here
Armor.Config.MaxArmorValue = 100

-- Optional. These values will override the setting above for specific teams.
Armor.CustomMaxValues = {
	-- Example:
	-- ["Mega-Cop"] = 300,
}

-- If SetTheValue is false, then this will be the amount of armor added
Armor.Config.AddValue = 100

-- Optional. If SetTheValue is false, then these values will override the AddValue for specific teams.
Armor.CustomAddValues = {
	-- Example:
	-- ["Mega-Cop"] = 100,
}

