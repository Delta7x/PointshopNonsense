ITEM.Name = 'Guitar'
ITEM.Price = 500
ITEM.Model = 'models/props_phx/misc/fender.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Spine2'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.7,0.7,0.7)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')
	pos = pos + (ang:Right() * 3.5) + (ang:Up() * -3) + (ang:Forward() * 0)
	ang:RotateAroundAxis(ang:Right(), 45)
	ang:RotateAroundAxis(ang:Up(), 0)
	ang:RotateAroundAxis(ang:Forward(), 90)
	
	return model, pos, ang
end