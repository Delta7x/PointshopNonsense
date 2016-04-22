game.AddParticles("particles/delta_particles.pcf")
ITEM.Name = 'Emergency Hat'
ITEM.Price = 100
ITEM.Model = 'models/props/de_nuke/emergency_lighta.mdl'
ITEM.Attachment = 'eyes'
ITEM.Particle = 'twist'
PrecacheParticleSystem(ITEM.Particle)

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
	timer.Create("effect_" .. ply:Nick() .. "_" .. self.Name, 1, 0, function ()
		if !IsValid(ply) then return end
		ParticleEffectAttach(self.Particle,PATTACH_POINT_FOLLOW,ply,ply:LookupAttachment("chest"))
	end)
	
/*
	timer.Simple(0.1, function()
		ply:SendLua([[LocalPlayer():StopParticles()]])
	end)
*/
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
	timer.Destroy("effect_" .. ply:Nick() .. "_" .. self.Name)
	ply:StopParticles()
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.5,0.5,0.5)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')
	pos = pos + (ang:Forward() * -4) + (ang:Up() * 8)
--	ang:RotateAroundAxis(ang:Right(), 180)
	
	return model, pos, ang
end
