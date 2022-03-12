Include("\\script\\petsys\\head.lua")

ITEM_APPLE = {szName="Tr¸i t¸o", tbProp={6,1,3455,1,0,0}, nTaskId=TSK_APPLE_DAILY}
ITEM_MAIZE = {szName="B¾p", tbProp={6,1,3457,1,0,0}, nTaskId=TSK_MAIZE_DAILY}
ITEM_SWEET_POTATO = {szName="Khoai lang", tbProp={6,1,3458,1,0,0}, nTaskId=TSK_SUGARCANE_DAILY}
ITEM_SUGARCANE = {szName="MÝa", tbProp={6,1,3456,1,0,0}, nTaskId=TSK_SWEET_POTATO_DAILY}

tbFood = {
	[format("%d,%d,%d",unpack(ITEM_APPLE.tbProp))] = ITEM_APPLE,
	[format("%d,%d,%d",unpack(ITEM_MAIZE.tbProp))] = ITEM_MAIZE,
	[format("%d,%d,%d",unpack(ITEM_SWEET_POTATO.tbProp))] = ITEM_SWEET_POTATO,
	[format("%d,%d,%d",unpack(ITEM_SUGARCANE.tbProp))] = ITEM_SUGARCANE,
}

function main(nItemIndex)
	local nG,nD,nP = GetItemProp(nItemIndex)
	local szGDP = format("%d,%d,%d", nG,nD,nP)
	local tbItem = tbFood[szGDP]
	if not tbItem then
		return 1
	end
	
	if not PET_IsCreate() then
		Talk(1, "", "Ng­¬i vÉn ch­a cã b¹n ®ång hµnh, kh«ng thÓ cho ¨n")
		return 1
	end
	
	if PlayerFunLib:GetTaskDaily(tbItem.nTaskId) >= MAX_FRUIT_COUNT_DAILY then
		Talk(1, "", format("H«m nay kh«ng thÓ cho ¨n %s n÷a råi", tbItem.szName))
		return 1
	end
	
	PlayerFunLib:AddTaskDaily(tbItem.nTaskId, 1)
	local nGrownPoint = PET_GetGrownPoint()
	PET_SetGrownPoint(nGrownPoint + 2)
	
	PlayerFunLib:GetItem({nExp=1000000}, 1, "PetSys", "Feed_pet")
	
	return
end