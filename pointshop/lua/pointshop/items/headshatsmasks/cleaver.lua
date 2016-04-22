ITEM.Name = 'Meat Cleaver'
ITEM.Price = 400
ITEM.Model = 'models/props_lab/Cleaver.mdl'
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(0.55, 0)
	pos = pos + (ang:Right() * -5) + (ang:Up() * 8) + (ang:Forward() * 2)
	ang:RotateAroundAxis(ang:Right(), 15)
	ang:RotateAroundAxis(ang:Up(), 15)
	ang:RotateAroundAxis(ang:Forward(), -45)
	
	return model, pos, ang
end