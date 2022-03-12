Include("\\script\\changefeature\\equip_tryon.lua")

local tb = tbEquipTryOn:NewTemplate("§Çu kh«i")

tb.szFile_Male = "\\settings\\changefeature\\helm_male.txt"
tb.szFile_Female = "\\settings\\changefeature\\helm_female.txt"




function tb:TryOn(nNo)
	self:ChangeFeature(nNo, -1,-1,-1)
end

function tb:CheckEquip(nItemIndex)
	
	local nG, nD,nP = GetItemProp(nItemIndex)
	local nQuality = GetItemQuality(nItemIndex)
	if nQuality ~= 1 and nQuality ~= 4 then
		Talk(1, "", "§©y kh«ng ph¶i lµ trang bÞ hoµng kim.")
		return
	end
	if nG ~= 0 then
		Talk(1, "", "§©y kh«ng ph¶i lµ trang bÞ")
		return 
	end
	if nD ~= 7 then
		Talk(1, "", "Trang bÞ nµy kh«ng ph¶i lµ nãn.")
		return 
	end
	return 1
end

tb:LoadFile()