ITEM.Name = 'Top Hat'
ITEM.Price = 100
ITEM.Model = 'models/player/items/humans/top_hat.mdl'
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	pos = pos + (ang:Forward() * -4) + (ang:Up() * -1)
--	ang:RotateAroundAxis(ang:Right(), 180)
	
	return model, pos, ang
end
