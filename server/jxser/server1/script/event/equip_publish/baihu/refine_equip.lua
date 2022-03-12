-- ÖØÖý°×»¢×°±¸

Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")

IncludeLib("ITEM")
tbBaiHuRefineEquip = {}

tbBaiHuRefineList = 
{
	[1]= {szName="B¹ch Hæ H¹ng Liªn", nStone = 1, nWidth = 2, nHeight = 1, },
	[2]= {szName="B¹ch Hæ Kh«i",   nStone = 2, nWidth = 2, nHeight = 2, },
	[3]= {szName="B¹ch Hæ Th­îng Giíi", nStone = 2, nWidth = 1, nHeight = 1, },
	[4]= {szName="B¹ch Hæ Hé UyÓn", nStone = 1, nWidth = 1, nHeight = 2, },
	[5]= {szName="B¹ch Hæ Yªu §¸i", nStone = 2, nWidth = 2, nHeight = 1, },
	[6]= {szName="B¹ch Hæ Y",   nStone = 3, nWidth = 2, nHeight = 3, },
	[7]= {szName="B¹ch Hæ Vò KhÝ", nStone = 4, nWidth = 2, nHeight = 4, },
	[8]= {szName="B¹ch Hæ Hµi",   nStone = 3, nWidth = 2, nHeight = 2, },
	[9]= {szName="B¹ch Hæ Béi",   nStone = 3, nWidth = 1, nHeight = 2, },
	[10]={szName="B¹ch Hæ H¹ Giíi", nStone = 2, nWidth = 1, nHeight = 1, },
}

BAIHU_IDX_START = 2285
BAIHU_IDX_END = 2514


tbRefineMaterial = {szName = "B¹ch Hæ Trïng LuyÖn Ngäc", tbProp = {6,1,3187, -1},}

function tbBaiHuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "Trang BÞ B¹ch Hæ", " B¹ch Hæ Trïng LuyÖn Ngäc")
	
	local strDesc = ""
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s%-21s\t%d\n", strDesc, pTmp.szName, pTmp.nStone)	
	end
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbBaiHuRefineEquip:GiveUIOk(nPutCount)	
	
	if nPutCount ~= 1 then
		Talk(1, "", "ChØ cÇn ®Æt vµo 1 mãn trang bÞ B¹ch Hæ")
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	local nItemQuality = GetItemQuality(nItemIndex)
	if nItemQuality ~= 1 then
		Talk(1, "", "Trang bÞ ng­¬i ®Æt vµo kh«ng ph¶i lµ trang bÞ hoµng kim")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nItemIndex)
	if %BAIHU_IDX_START > nGoldEquipIdx or nGoldEquipIdx > %BAIHU_IDX_END  then
		Talk(1, "", "Trang bÞ ng­¬i ®Æt vµo kh«ng ph¶i lµ trang bÞ B¹ch Hæ")
		return
	end
	--¼ì²é°ó¶¨×´Ì¬
	local nBindState = GetItemBindState(nItemIndex)
	if nBindState ~= 0 then
		Talk(1, "", "Trang bÞ cña ng­¬i ®ang trong tr¹ng th¸i khãa, kh«ng thÓ trïng luyÖn.")
		return
	end
	
	--¼ì²éÊÇ·ñÊÇÆÆËð×°±¸
	local nG, _, _ = GetItemProp(nItemIndex)
	if nG == 7 then
		Talk(1, "", "Trang bÞ cña ng­¬i ®· bÞ h­ h¹i kh«ng thÓ trïng luyÖn.")
		return
	end
	if ITEM_GetExpiredTime(nItemIndex) ~= 0 then
		Talk(1, "", "Kh«ng ph¶i trang bÞ vÜnh viÔn kh«ng thÓ tïng luyÖn")
		return
	end
	
	
	local nEquType = mod(nGoldEquipIdx - %BAIHU_IDX_START, 10) + 1
	
	local nWidth = %tbBaiHuRefineList[nEquType].nWidth
	local nHeight = %tbBaiHuRefineList[nEquType].nHeight
	
	if nWidth ~= 0 and nHeight ~= 0 and CountFreeRoomByWH(nWidth, nHeight, 1) < 1 then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", 1, nWidth, nHeight))
		return
	end	

	local tbItem = 
	{
		szName = %tbRefineMaterial.szName, 
		tbProp = %tbRefineMaterial.tbProp, 
		nCount = %tbBaiHuRefineList[nEquType].nStone
	}
	local tbProp = tbItem.tbProp
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
		Talk(1, "", format("<color=red>TØ lÖ %sng­¬i ®Æt vµo kh«ng ®ñ. <color>", tbItem.szName))
		return
	end
	
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	RemoveItemByIndex(nItemIndex)
	if ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
		return
	end	

	tbAwardTemplet:Give({tbProp = {0, nGoldEquipIdx}, nQuality = 1}, 1, {self.szLogTitle})
end

function tbBaiHuRefineEquip:Dialog()
		
	local strDesc = "<npc>LÊy <color=yellow> cÇn trïng luyÖn trang bÞ B¹ch Hæ<color> vµ sè l­îng<color=yellow> B¹ch Hæ Trïng LuyÖn Ngäc t­¬ng øng<color> ®Æt vµo"
	
	strDesc = format("%s\n\t\t\t\t\t%-29s%s", strDesc, "Trang BÞ B¹ch Hæ", " B¹ch Hæ Trïng LuyÖn Ngäc")
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", strDesc, pTmp.szName, pTmp.nStone)
	end
	local tbOpt = {}
	tinsert(tbOpt, {"Trïng luyÖn trang bÞ B¹ch Hæ", self.ComposeGiveUI, {self}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(strDesc, tbOpt);
end


Include("\\script\\event\\equip_publish\\dialog.lua")
REFINE_EQUIP_LIST["baihu"] = {}
REFINE_EQUIP_LIST["baihu"].nPak = curpack()
REFINE_EQUIP_LIST["baihu"].szOpt = "Trïng luyÖn trang bÞ B¹ch Hæ"
REFINE_EQUIP_LIST["baihu"].pFun = tbBaiHuRefineEquip.ComposeGiveUI
REFINE_EQUIP_LIST["baihu"].pSelf = tbBaiHuRefineEquip
