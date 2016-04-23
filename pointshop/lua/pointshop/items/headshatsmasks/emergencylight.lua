ITEM.Name = 'Emergency Hat'
ITEM.Price = 100
ITEM.Model = 'models/props/de_nuke/emergency_lighta.mdl'
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)

end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
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
