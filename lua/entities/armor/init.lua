AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self.Entity:SetModel("models/items/healthkit.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	
	local phys = self.Entity:GetPhysicsObject()
	self.nodupe = true
	self.ShareGravgun = true

	if phys and phys:IsValid() then phys:Wake() end
	self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS) 
end

function ENT:SpawnFunction(ply, tr)
   	if (!tr.Hit) then
	return end
 	 
 	local SpawnPos = tr.HitPos + tr.HitNormal

 	local ent = ents.Create("armor")
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
 	 	 
	return ent 
end

function ENT:Use(plyUse)
	self:Remove()

	local armor
	local curArmor = plyUse:Armor()
	local maxArmor = Armor.CustomMaxValues[team.GetName(plyUse:Team())] or Armor.Config.MaxArmorValue

	if Armor.Config.SetTheValue then
		armor = maxArmor
	else
		local armorToAdd = Armor.CustomAddValues[team.GetName(plyUse:Team())] or Armor.Config.AddValue
		armor = curArmor + armorToAdd

		if armor > maxArmor then
			armor = maxArmor
		end
	end

	plyUse:SetArmor(armor)
end

function ENT:OnRemove()
	self:Remove()
end