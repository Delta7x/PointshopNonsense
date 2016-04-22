ITEM.Name = 'Sensors'
ITEM.Price = 2000
ITEM.Model = 'models/gibs/gunship_gibs_sensorarray.mdl'
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.25,0.25,0.25)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')
	
	pos = pos + (ang:Forward() * 0.25) + (ang:Up() * 1.5)
	
	return model, pos, ang
end
