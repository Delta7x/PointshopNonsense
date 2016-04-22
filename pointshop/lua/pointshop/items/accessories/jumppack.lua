ITEM.Name = 'Jump Pack'
ITEM.Price = 500
ITEM.Model = 'models/thrusters/jetpack.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Spine2'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(0.8, 0)
	pos = pos + (ang:Right() * 5) + (ang:Up() * 0) + (ang:Forward() * 4)
	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), 270)
	ang:RotateAroundAxis(ang:Forward(), 0)
	
	return model, pos, ang
end

function ITEM:Think(ply, modifications)
	if ply:KeyDown(IN_JUMP) then
		ply:SetVelocity(ply:GetUp() * 6)
	end
end