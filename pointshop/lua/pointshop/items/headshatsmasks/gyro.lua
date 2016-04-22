ITEM.Name = 'GyroHat'
ITEM.Price = 1000
ITEM.Model = 'models/maxofs2d/hover_rings.mdl'
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	pos = pos + (ang:Forward() * -3) + (ang:Up() * 2)
	ang:RotateAroundAxis(ang:Right(), 180)
	
	return model, pos, ang
end
