Include("\\script\\lib\\log.lua")

if not DisposeEquip then DisposeEquip = {} end

DisposeEquip.LOG_TITLE = "LOG_FEATURE_CTC"

DisposeEquip.TbListEquip = {
		{szName="Kim Phong Thanh D­¬ng Kh«i", tbProp = {0,177},},
		{szName="Kim Phong Kú L©n HuyÕt",	tbProp = {0,178},},
		{szName="Kim Phong Tr¹c Liªn Quang",	tbProp = {0,179},},
		{szName="Kim Phong C«ng CÈn Tam Th¸n",	tbProp = {0,180},},
		{szName="Kim Phong §o¹t Hån Ngäc ®¸i",	tbProp = {0,181},},
		{szName="Kim Phong HËu NghÖ dÉn cung",	tbProp = {0,182},},
		{szName="Kim Phong Lan §×nh Ngäc",	tbProp = {0,183},},
		{szName="Kim Phong Thiªn Lý Th¶o Th­îng Phi", tbProp = {0,184},},
		{szName="Kim Phong §ång T­íc Xu©n Th©m", tbProp = {0,185},},
}

function DisposeEquip:ShowDisposeUI()
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	print("-------vao function DisposeConfirm ")
	if (nCount ~= 1) then 
		Talk(1, "", "Mçi lÇn chØ cã thÓ hñy ®­îc mét vËt phÈm!!");
		return
	end
		
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	local nGoldEquipIdx = GetGlodEqIndex(nItemIndex)
	if (nBindState ~= -2) then
		Talk(1, "", "VËt phÈm cÇn hñy ph¶i lµ vËt phÈm khãa vÜnh viÔn!");
		return
	end	
	local strItem = GetItemName(nItemIndex)
	--kiem tra trong danh sach
	local nCheck, szEquipName = DisposeEquip:CheckInList(nGoldEquipIdx)
	if (nCheck ~= 1) or (szEquipName ~=  strItem) then
		return Talk(1, "", "Tr­íc m¾t ta chØ hñy ®­îc trang bÞ Kim Phong khãa, thø ng­¬i bá vµo kh«ng phï hîp.");
	end
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", format(" Hñy trang bÞ <color=yellow>%s<color> thµnh c«ng.",strItem))
	Msg2Player(format("Ng­¬i võa hñy trang bÞ %s thµnh c«ng.",strItem))
	local szactionlog = format("Hñy trang bÞ %s thµnh c«ng.",strItem)
	tbLog:PlayerActionLog(DisposeEquip.LOG_TITLE,szactionlog)
end

function DisposeEquip:CheckInList(nGoldEquipIdx)
	local nFlag = 0
	local szEquipName = ""
	for i=1,getn(self.TbListEquip) do
		local tbItem = self.TbListEquip[i].tbProp
		if nGoldEquipIdx == tbItem[2] then
			nFlag = 1
			szEquipName = self.TbListEquip[i].szName
			break
		end
	end
	return nFlag,szEquipName
end

function OnCancel()
end


