Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\vng_script\\features\\trungluyen_hkmp\\head.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\progressbar.lua")
IncludeLib("ITEM")

function tbVngTrungLuyenHKMP:UpgradeEquip_UI()	
	local strDesc = format("Trïng luyÖn 1 trang bÞ Hoµng kim M«n Ph¸i cÇn 1 viªn §¸ V« Cùc.<enter>")	
	g_GiveItemUI("Trïng luyÖn", strDesc, {self.UpgradeEquip, {self}}, nil, 1)
end

function tbVngTrungLuyenHKMP:UpgradeEquip()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nGoldEquipID, nItemIndex =  self:CheckGoldEqInRoomUI(tbRoomItems)
	if not nGoldEquipID or not nItemIndex then 
		return
	end
	if self:CheckMaterialInRoomUI(tbRoomItems) ~= 1 then
		return
	end
	local szMsg = format("<npc>Cã ph¶i c¸c h¹ muèn trïng luyÖn trang bÞ <color=yellow>%s<color> ?", GetItemName(nItemIndex))	
	local tbOpt = 
	{
		{"§ång ý Trïng luyÖn", self.UpgradeEquip_ProcessBar, {self,nGoldEquipID,nItemIndex}},
		{"§Ó ta ®Æt l¹i nguyªn liÖu", self.UpgradeEquip_UI, {self}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)		
end
local _UpgradeEquipOK = function(nGoldEquipID,nItemIndex)		
	local szEquipName = GetItemName(nItemIndex)
	
	local szKeyLog = tbVngTrungLuyenHKMP.EVENT_LOG_TITLE
	--tru nguyen lieu
	local tbProp = tbVngTrungLuyenHKMP.tbTrungLuyenMaterial.tbProp
	if ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
		tbLog:PlayerActionLog("Error TrungLuyenHKMP - Loi tru khong duoc Da Vo Cuc")
		return
	end

	--xãa trang bÞ trïng luyÖn
	RemoveItemByIndex(nItemIndex)

	local tbEquip_Upgrade ={ {szName=szEquipName,tbProp={0,nGoldEquipID},nCount=1,nQuality = 1,}}
	tbAwardTemplet:Give(tbEquip_Upgrade, 1, {szKeyLog.."- [TrungLuyen]: ThanhCong"})	
	Talk(1,"",format("Chóc mõng c¸c h¹ ®· trïng luyÖn thµnh c«ng trang bÞ: <color=yellow>%s<color> .",szEquipName))
end

local _OnBreak = function()
	Msg2Player("Trïng luyÖn bÞ gi¸n ®o¹n, h·y lµm l¹i.")
end

function tbVngTrungLuyenHKMP:UpgradeEquip_ProcessBar(nGoldIndex,nItemIndex)
	tbProgressBar:OpenByConfig(20, %_UpgradeEquipOK, {nGoldIndex,nItemIndex}, %_OnBreak)
end

function tbVngTrungLuyenHKMP:CheckGoldEqInRoomUI(tbRoomItems)
	local nCountGoldEq = 0
	local nCountMaterial = 0
	local nItemIndex = 0
	local nGoldEquipID = 0 
	for i=1, getn(tbRoomItems) do
		if GetGlodEqIndex(tbRoomItems[i]) > 0 then
			nCountGoldEq = nCountGoldEq + 1
			nItemIndex = tbRoomItems[i] 
			nGoldEquipID = GetGlodEqIndex(tbRoomItems[i] )
		end
	end
	if nCountGoldEq ~= 1  then
		Talk(1,"","H·y ®Æt duy nhÊt 1 mãn trang bÞ Hoµng Kim M«n Ph¸i muèn Trïng luyÖn.")	
		return nil
	end
	if nGoldEquipID == 0 then
		Talk(1,"","Trang bÞ nµy kh«ng thÓ n©ng cÊp.")	
		return nil
	end
	if self:CheckAllStateEquip(nItemIndex) ~= 1 then
		return nil
	end	
	return nGoldEquipID, nItemIndex
end
--Kiem tra nguyen lieu
function tbVngTrungLuyenHKMP:CheckMaterialInRoomUI(tbRoomItems)	
	local nCountMaterial = 0	
	local nStackCount = 0	
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		local nG, nD, nP = GetItemProp(nItemIndex)
		local nQuality = GetItemQuality(nItemIndex)
		local nGoldEquipID = GetGlodEqIndex(nItemIndex)
		local tbProp = self.tbTrungLuyenMaterial.tbProp
		if nG == tbProp[1] and nD ==  tbProp[2] and nP ==  tbProp[3]  then
			nCountMaterial = nCountMaterial + 1	
			nStackCount = GetItemStackCount(nItemIndex)	
		elseif (nGoldEquipID <= 0) or (nGoldEquipID > 140) or (nQuality ~= 1) then
			Talk(1,"","ChØ ®­îc bá Trang bÞ Hoµng Kim M«n Ph¸i vµ  §¸ V« Cùc vµo.")	
			return 			
		end
	end
	if nCountMaterial ~= 1 or nStackCount ~= 1  then
		Talk(1,"","Mçi lÇn Trïng luyÖn h·y bá duy nhÊt 1 viªn §¸ V« Cùc.")	
		return 
	end	
	return 1
end
--kiem tra dk cua trang bi trung luyen
function tbVngTrungLuyenHKMP:CheckAllStateEquip(nItemIndex)
	local nG, nD, nP = GetItemProp(nItemIndex)
	local nQuality = GetItemQuality(nItemIndex)
	local nGoldEquipID = GetGlodEqIndex(nItemIndex)
	
	--trang bi ton hai
	if (nG == 7) then 
		Talk(1,"","Trang bÞ tæn h¹i kh«ng thÓ ph©n gi¶i hay n©ng cÊp")
		return 0	
	end
	if (nGoldEquipID <= 0) or (nGoldEquipID > 140) or (nQuality ~= 1) then 
		Talk(1,"","Trang bÞ kh«ng ph¶i hoµng kim m«n ph¸i kh«ng thÓ trïng luyÖn.")
		return 0	
	end
	--kiem tra dk khoa, co thoi han su dung
	if  ITEM_GetExpiredTime(nItemIndex) > 0 or GetItemBindState(nItemIndex) ~= 0 then
		Talk(1,"","Trang bÞ cã thêi h¹n sö dông hoÆc khãa vÜnh viÔn kh«ng thÓ ph©n gi¶i hay n©ng cÊp")
		return 0	
	end
	
	if IsMyItem(nItemIndex) ~= 1 then
		Talk(1,"","ThËt thµ míi lµ ®øc tÝnh tèt!!!")
		return 0
	end
	return 1
end
EventSys:GetType("AddNpcOption"):Reg("B¸ch nghÖ nh©n","Trïng luyÖn trang bÞ hoµng kim m«n ph¸i", tbVngTrungLuyenHKMP.UpgradeEquip_UI,{tbVngTrungLuyenHKMP})


