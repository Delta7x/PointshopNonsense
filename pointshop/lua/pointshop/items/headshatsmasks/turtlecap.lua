ITEM.Name = '<3 Turtles'
ITEM.Price = 200
ITEM.Model = "models/props/de_tides/vending_hat.mdl"
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	model:SetModelScale(1, 0)
	pos = pos + (ang:Forward() * -3) + (ang:Up() * 3)
	ang:RotateAroundAxis(ang:Up(), -90)
	
	return model, pos, ang
end
