ITEM.Name = 'Facepunch Mask'
ITEM.Price = 1500
ITEM.Model = 'models/props_phx/facepunch_logo.mdl'
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.0375,0.0375,0.0375)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')
	ang:RotateAroundAxis(ang:Right(), -90)
	
	return model, pos, ang
end