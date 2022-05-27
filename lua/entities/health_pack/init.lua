AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:Initialize()
	self.Entity:SetModel("models/healthvial.mdl")
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

 	local ent = ents.Create("health_pack")
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
 	 	 
	return ent 
end

function ENT:Use(plyUse)
	self:Remove()

	local health
	local curHealth = plyUse:Health()
	local maxHealth = HealthPack.Config.UseMaxHealth and plyUse:GetMaxHealth() or HealthPack.Config.DefaultMaxValue
	maxHealth = HealthPack.CustomMaxValues[team.GetName(plyUse:Team())] or maxHealth

	if HealthPack.Config.SetTheValue then
		health = maxHealth
	else
		local healthToAdd = HealthPack.CustomAddValues[team.GetName(plyUse:Team())] or HealthPack.Config.AddValue
		health = curHealth + healthToAdd
		
		if health > maxHealth then
			health = maxHealth
		end
	end

	plyUse:SetHealth(health)
end

function ENT:OnRemove()
	self:Remove()
end