ITEM.Name = 'Life Preserver'
ITEM.Price = 100
ITEM.Model = 'models/props/de_nuke/LifePreserver.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Spine'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(0.55, 0)
	pos = pos + (ang:Right() * -2) + (ang:Up() * 0) + (ang:Forward() * 0)
	
	return model, pos, ang
end