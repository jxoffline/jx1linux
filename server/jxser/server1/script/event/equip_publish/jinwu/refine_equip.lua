-- ÖØÖı½ğÎÚ×°±¸
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
Include("\\script\\event\\equip_publish\\dialog.lua")

tbJinWuRefineEquip = tbActivityCompose:new()

tbJinWuRefineList = 
{
	[1]= {szName="Kim ¤ H¹ng Liªn", nStone = 1, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[2]= {szName="Kim ¤ Kh«i",   nStone = 2, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[3]= {szName="Kim ¤ Th­îng Giíi ChØ", nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
	[4]= {szName="Kim ¤ Hé UyÓn", nStone = 1, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[5]= {szName="Kim ¤ Yªu §¸i", nStone = 2, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[6]= {szName="Kim ¤ Y Phôc",   nStone = 3, nWidth = 2, nHeight = 3, nFreeItemCellLimit = 1},
	[7]= {szName="Kim ¤ Vò Khİ", nStone = 4, nWidth = 2, nHeight = 4, nFreeItemCellLimit = 1},
	[8]= {szName="Kim ¤ Hµi",   nStone = 3, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[9]= {szName="Kim ¤ Béi",   nStone = 3, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[10]={szName="Kim ¤ H¹ Giíi ChØ", nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
}

function tbJinWuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "Trang bŞ Kim ¤", "Kim ¤ Trïng LuyÖn Ngäc")
	local strDesc = format("   %-21s\t%d", "Kim ¤ Kh«i", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ Y Phôc", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ Hµi", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ Yªu §¸i", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ Hé UyÓn", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ Ngäc Béi", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ H¹ng Liªn", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ Giíi ChØ", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "Kim ¤ Vò Khİ", 4)
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbJinWuRefineEquip:Compose(nComposeCount)
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- È¡µÃ½ğÎÚÖØÁ·Ê¯µÄÊıÁ¿
  local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  Ã¿´Î¶¼ÖØĞÂ»ñÈ¡£¬ÒÔ·ÀÖ¹ÓĞ±ä»¯	
	local tbGoldEquip = nil
	local nEquType = 0		-- ÎäÆ÷Àà±ğ
	local nEqIndex = 0
	for i = 1, getn(tbRoomItems) do 
		nItemQuality = GetItemQuality(tbRoomItems[i])
		--¼ì²éÎïÆ·Æ·ÖÊ
		if nItemQuality == 1 then
			nEqIndex = GetGlodEqIndex(tbRoomItems[i])
			if nEqIndex >= 2055 and nEqIndex <= 2284 then -- ½ğÎÚ×°±¸
				--¼ì²é°ó¶¨×´Ì¬
				local nBindState = GetItemBindState(tbRoomItems[i])
				if nBindState ~= 0 then
					Say("Trang bŞ cña ng­¬i ®ang trong tr¹ng th¸i khãa, kh«ng thÓ trïng luyÖn.")
					return 0
				end
				
				--¼ì²éÊÇ·ñÊÇÆÆËğ×°±¸
				local nG, _, _ = GetItemProp(tbRoomItems[i])
				if nG == 7 then
					Say("Trang bŞ cña ng­¬i ®· bŞ h­ h¹i kh«ng thÓ trïng luyÖn.")
					return 0
				end
				
				nEquType = mod(nEqIndex - 2055, 10) + 1
				tbGoldEquip = {0, nEqIndex}
				break
			end
		end	
	end
	
	if tbGoldEquip == nil then
		Say("Ng­¬i ch­a ®Æt trang bŞ Kim ¤ nµo vµo ®©y c¶.")
		return 0	
	end
		
	local nFreeItemCellLimit = %tbJinWuRefineList[nEquType].nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if %tbJinWuRefineList[nEquType].nWidth ~= 0 and %tbJinWuRefineList[nEquType].nHeight ~= 0 and CountFreeRoomByWH(%tbJinWuRefineList[nEquType].nWidth, %tbJinWuRefineList[nEquType].nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, %tbJinWuRefineList[nEquType].nWidth, %tbJinWuRefineList[nEquType].nHeight))
		return 0
	end	

  local tbItem = {szName = "Ngäc Trïng LuyÖn Kim ¤", tbProp = {6,1,3005,1,0,0}, nCount = %tbJinWuRefineList[nEquType].nStone} 
  local nCount = self:CalcItemCount(tbRoomItems, tbItem)
  if nCount < %tbJinWuRefineList[nEquType].nStone then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>Kim ¤ Trïng LuyÖn Ngäc mµ ng­¬i ®Æt vµo kh«ng ®ñ. <color>"
		Talk(1, "", szMsg)
		return 0;
  end
	
	local nIdx = floor((nEqIndex - 2055)/10) + 1
	local tbProduct = tbEquip_jinwu[nEquType][nIdx]
	local tbMaterial = {{szName = tbProduct.szName, tbProp = tbGoldEquip, nCount = 1}, tbItem}

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		--Say("ÖÆ×÷Ê§°Ü£¬²¿·ÖÎïÆ·¶ªÊ§¡£",0)
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	

	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
	
	if type(self.tbFormula.pProductFun) == "function" then
		self.tbFormula:pProductFun(nComposeCount)
	end
	return 1;
end

--function refine_jinwu()
--		
--	local strDesc = "<npc>½«ĞèÒªÖØÖıµÄ<color=yellow>½ğÎÚ×°±¸<color>ºÍÏàÓ¦ÊıÁ¿µÄ<color=yellow>½ğÎÚÖØÁ·Ê¯<color>·ÅÈëÏÂÃæµÄÎïÆ·À¸"
--	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "½ğÎÚ×°±¸", " ½ğÎÚÖØÁ·Ê¯")
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚÍ·¿ø", 1)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚÒÂ·ş", 2)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚĞ¬×Ó", 2)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚÑü´ø", 1)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚ»¤Íó", 1)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚÓñÅå", 2)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚÏîÁ´", 2)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚ½äÖ¸", 2)
--	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "½ğÎÚÎäÆ÷", 3)
--	local tbOpt = {}
--	
--	local p = tbJinWuRefineEquip:new(tbMate, "JinWuRefineEquip", INVENTORY_ROOM.room_giveitem)
--	tinsert(tbOpt, {"ÖØÖı½ğÎÚ×°±¸", p.ComposeGiveUI, {p}})
--	tinsert(tbOpt, {"È¡Ïû"})
--	CreateNewSayEx(strDesc, tbOpt);
--end
local tbMate =	
{
	tbMaterial = 
	{
		{szName = "Trang bŞ Kim ¤", tbProp = {0, {2055,2084}}, nQuality = 1 },
		{szName = "Ngäc Trïng LuyÖn Kim ¤", tbProp = {6,1,3005,1,0,0},},
	},
	tbProduct = {szName="Trang bŞ Kim ¤", tbProp={0, {2055,2084}}},
}
tbJinWuRefineEquip:_init(tbMate, "JinWuRefineEquip", INVENTORY_ROOM.room_giveitem)


REFINE_EQUIP_LIST["jinwu"] = {}
REFINE_EQUIP_LIST["jinwu"].nPak = curpack()
REFINE_EQUIP_LIST["jinwu"].szOpt = "Trïng luyÖn trang bŞ Kim ¤"
REFINE_EQUIP_LIST["jinwu"].pFun = tbJinWuRefineEquip.ComposeGiveUI
REFINE_EQUIP_LIST["jinwu"].pSelf = tbJinWuRefineEquip





