ITEM.Name = 'Gas Powered'
ITEM.Price = 100
ITEM.Model = 'models/props/cs_assault/duct.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Spine'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.35,0.35,0.35)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')
	pos = pos + (ang:Forward() * 3) + (ang:Up() * 7.5) + (ang:Right() * 1.5)
	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), 0)
	ang:RotateAroundAxis(ang:Forward(), 180)
	
	return model, pos, ang
end
