ITEM.Name = 'Scout Backpack'
ITEM.Price = 500
ITEM.Model = 'models/weapons/w_snip_scout.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Spine2'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(0.8, 0)
	pos = pos + (ang:Right() * 3) + (ang:Up() * -3) + (ang:Forward() * 2)
	ang:RotateAroundAxis(ang:Right(), -30)
	
	return model, pos, ang
end