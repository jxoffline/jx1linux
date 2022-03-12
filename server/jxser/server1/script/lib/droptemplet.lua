
-- droptemplet.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-03-20 18:55:45

-- ¸øÓèÍæ¼Ò½±Àø £¬¿ÉÒÔÊÇ ¾­Ñé µÀ¾ß Ç®, CallBack
--Í¨¹ıGiveAwardByListº¯Êı¸øÓèÍæ¼Ò½±Àø£¬µÚÒ»¸ö²ÎÊıÊÇ½±Àø±í£¬µÚ¶ş¸ö²ÎÊıÊÇlogµÄtitle £¬²»ÌîÔò²»Ğ´log

--ÎïÆ·±íµÄ¶¨Òå
--tbItem = {}
--tbItem = {tbItem, tbItem, tbItem}

--ËµÃ÷[]ÄÚµÄÎª¿ÉÑ¡ÏîÄ¿
--szName	ÎïÆ·Ãû×Ö£¬Îª¿ÕÔòµ÷ÓÃGetItemName( nItemIndex ) ¶ÔÓÚ¿Éµş¼ÓµÄÎïÆ·¸Ãº¯Êı·µ»Ø¿Õ£¬½¨ÒéÒªÊÖ¶¯ÌîĞ´
--tbProp	ÎïÆ·µÄID G D PÖ®Àà£¬¶ÔÓÚ »Æ½ğ °×½ğ Îª {0,nRow}nRowÊÇËùÔÚĞĞÊı
--nQuality	ÎïÆ·µÄÆ·ÖÊ£¬Ä¬ÈÏÎª0
--nRate		ÈçÓĞ¸ÃÏîÄ¿ËµÃ÷¸Ã±íÊÇËæ»úÑ¡Ò»¸öµÄ±í
--nCount	ÎïÆ·¸öÊı£¬Ä¬ÈÏÎª 1¸ö
--nExp_tl	¸½¼Ó¹¦ÄÜ ¸øÎïÆ·Í¬Ê±¸øÓè ¿Éµş¼Ó¾­Ñé
--nJxb		¸øÎïÆ·Í¬Ê±¸øÓè¾­Ñé
--nExp		¸øÎïÆ·Í¬Ê±¸øÓè²»µş¼Ó¾­Ñé

--CallBack		»Øµ÷º¯Êı
--nExpiredTime	ÎïÆ·ÓĞĞ§ÆÚÓÃ·¨Í¬IBµÄITEM_SetExpiredTime
--nBindState	°ó¶¨×´Ì¬-2 ÎªÓÀ¾Ã  -1ÎªÆÕÍ¨°ó¶¨

--µ±tbPropÎª¿ÕÊ± ²»¸øÓÚÎïÆ·
IncludeLib("ITEM");
Include ("\\script\\lib\\common.lua")
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\item\\battles\\songjinskill.lua");
WLLS_TASKID_HONOUR	= 2501	
if not tbDropTemplet then

tbDropTemplet = {}

function tbDropTemplet:Debug(szMsg)
--	print(szMsg)
	
end

function tbDropTemplet:GiveAwardByRate(nNpcIndex, nBelongerIndex, tbItem, szLogTitle, nAwardCount)
	if tbItem == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			
			return self:GiveAwardByList(nNpcIndex, nBelongerIndex, tbItem[i], szLogTitle, nAwardCount),i
		end
	end
end

--DropItemEx( nSubWorldIdx, nMpsX, nMpsY, nBelonger, nVersion, uRandSeed, nQuality, nItemGenre, nItemDetailType, nItemParticularType, nItemLevel, nItemSeries, nItemLuck, nItemMagicLevel..6 )
function tbDropTemplet:DropItem(nNpcIndex, nBelongerIndex, tbItem)
	local nRow = 0
	if tbItem.nQuality and (tbItem.nQuality == 1 or tbItem.nQuality == 4) then
		nRow = 1
	end
	tbItem.tbParam = tbItem.tbParam or {}
	local wuxing = tbItem.tbProp[5] or 0
	if wuxing == -1 then
		wuxing = random(0,4)
	end
	local nX32,nY32,nMapIndex = GetNpcPos(nNpcIndex)
	
	return DropItemEx(
		nMapIndex,
		nX32,
		nY32,
		nBelongerIndex, 
		tbItem.nVersion or 4,
		format("%u", tbItem.nRandSeed or 0),
		tbItem.nQuality or 0,
		tbItem.tbProp[1] or 0,
		(tbItem.tbProp[2] or 0) - nRow,
		tbItem.tbProp[3] or 0,
		tbItem.tbProp[4] or 0,
		wuxing,
		tbItem.tbProp[6] or 0,
		tbItem.tbParam[1] or 0,
		tbItem.tbParam[2] or 0,
		tbItem.tbParam[3] or 0,
		tbItem.tbParam[4] or 0,
		tbItem.tbParam[5] or 0,
		tbItem.tbParam[6] or 0)
end


function tbDropTemplet:GiveAwardByList(nNpcIndex, nBelongerIndex, tbItem, szLogTitle, nAwardCount)
	if not tbItem then --ÎïÆ·±íÎª¿Õ
		self:Debug("B¶ng vËt phÈm trèng.")
		return 0
	end
	nAwardCount = nAwardCount or 1
	if type(tbItem[1]) == "table" then -- Èç¹ûÊÇ¶à¸öÎïÆ·
		if tbItem[1].nRate then --°´¸ÅÂÊ¸øÄ³Ò»¸ö
			for i = 1, nAwardCount do
				self:GiveAwardByRate(nNpcIndex, nBelongerIndex, tbItem, szLogTitle, 1)
			end
			return 1
		else --°´Ë³Ğò¸øÈ«²¿
			for i = 1,  getn(tbItem) do
				self:GiveAwardByList(nNpcIndex, nBelongerIndex, tbItem[i], szLogTitle, nAwardCount)
			end	
			return 1;
		end
	end
	local tbItemProp	= tbItem.tbProp;
	local nItemCount	= tbItem.nCount or 1
	nItemCount = nItemCount * nAwardCount
	
	local szNpcName = GetNpcName(nNpcIndex)
	if tbItemProp then --ÎïÆ·
		local nItemIndex	= 0;
		local szItemName = nil
		for i = 1, nItemCount do
						
			nItemIndex = self:DropItem(nNpcIndex, nBelongerIndex, tbItem)
			
			if nItemIndex > 0 then
				if tbItem.nExpiredTime then
					ITEM_SetExpiredTime(nItemIndex, tbItem.nExpiredTime)-- ÉèÖÃÓĞĞ§ÆÚ
					--SyncItem(nItemIndex) --Í¬²½¿Í»§¶ËÎŞĞèÍ¬²½
				end
				
				if tbItem.nLeftUsageTime then
					ITEM_SetLeftUsageTime(nItemIndex,tbItem.nLeftUsageTime)
					--SyncItem(nItemIndex) --Í¬²½¿Í»§¶Ë ÎŞĞèÍ¬²½ 
				end
				
				if tbItem.nUsageTime then
					ITEM_SetLeftUsageTime(nItemIndex,tbItem.nLeftUsageTime)
				end
				
				if tbItem.nBindState then
					SetItemBindState(nItemIndex, tbItem.nBindState)--¸ù¾İnBindState°ó¶¨ÎïÆ·
				end
				if type(tbItem.CallBack) == "function" then
					tbItem.CallBack(nItemIndex)
				end
	
				szItemName = tbItem.szName or GetItemName(nItemIndex)
			end
		end
		
		self:WriteLog(szLogTitle, format("npcname(%s) drop %d item %s", szNpcName, nItemCount, szItemName))
	end
	if tbItem.nJxb then --½£ÏÀ±Ò
		local nAddJxb = tbItem.nJxb * nItemCount
		
		NpcDropMoney(nNpcIndex, nAddJxb, nBelongerIndex)
		self:WriteLog(szLogTitle, format("npcname(%s) drop %d Jxb", szNpcName, nAddJxb ))
	end
	
	if type(tbItem.pFun) == "function" then
		tbItem:pFun(nItemCount, szLogTitle, nBelongerIndex)
	end
	return 1
end

function tbDropTemplet:WriteLog(szLogTitle, szMsg)
	if szLogTitle then
		
		if type(szLogTitle) == "table" then
			local event_name = szLogTitle.szEventName or ""
			local action = szLogTitle.szAction or ""
			local quantity = szLogTitle.szQuantity or ""
			local item_name = szLogTitle.szItemName or ""
			local item_code = szLogTitle.szItemCode or ""
			local tong_name = GetTongName()
			local bug_desc = szbug_desc or ""
			local string_1 = szstring_1 or ""
			local string_2 = szstring_2 or ""
			local string_3 = szstring_3 or ""
			
			local strLogs = "["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3;	
			
		else
			WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t%s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szMsg))
		end
		
		
		
	else
		self:Debug("Hµm r¬i vËt phÈm kh«ng cã log")
	end
end


end