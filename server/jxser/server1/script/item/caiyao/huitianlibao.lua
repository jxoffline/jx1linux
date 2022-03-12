--»ØÌìÀñ°ü
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")
local tbItem = 
{
	["6,1,2527"] = {szName="Håi Thiªn T¸i T¹o §¬n", tbProp={1, 8, 0, 4, 0, 0}},
}
	
local _AskForNumber = function(nItemIndex, nCount)
	
	local pData = {}
	local tbParam = {}
	tinsert(tbParam, nItemIndex)
	tinsert(pData, huitianjinlang_getpotion)
	tinsert(pData, tbParam)
	g_AskClientNumberEx(0, nCount, "Xin mêi nhËp sè cÇn rót", pData)
	
end

local _OpenBox = function (nPlayerIndex, szName, nCount, nItemIndex)

	if CallPlayerFunction(nPlayerIndex, GetName) ~= szName then
		return
	end
	
	CallPlayerFunction(nPlayerIndex, %_AskForNumber, nItemIndex, nCount)
	
end

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount >= 60 then
		Say("§· rót hÕt toµn bé thuèc trong ®ã råi, cã thÓ vøt ®i.", 0)
		return 0
	end
	
	SetTaskTemp(114, nItemIndex)
	AskClientForNumber("huitianjinlang_getpotion", 0,(60-nCount), "Xin mêi nhËp sè cÇn rót")
	--t¹m ®ãng tÝnh n¨ng delay khi më item - Modified by DinhHQ - 20120815
--	if GetFightState() == 1 then
--		tbProgressBar:OpenByConfig(5, %_OpenBox, {PlayerIndex, GetName(), (60-nCount), nItemIndex})
--	else
--		%_AskForNumber(nItemIndex, (60 - nCount))
--	end
	
	return 1
end

function huitianjinlang_getpotion(nPickCount)
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount then
		nPickCount = nFreeItemCellCount
	end
	local nItemIndex = GetTaskTemp(114)
	if IsMyItem(nItemIndex) == 1 then
		local Gid, Did, Pid = GetItemProp(nItemIndex);
		local szItemId = format("%d,%d,%d",Gid, Did, Pid)
		if not %tbItem[szItemId] then  --ÊÇ²»ÊÇÕâÀàµÀ¾ß
			return
		end
		
		local nCount = GetItemParam(nItemIndex, 1);
		local nLastCount = 60 - nCount;
		if nPickCount > nLastCount then
			nPickCount = nLastCount
		end
		
		
		%tbItem[szItemId].nCount = nPickCount
		if tbAwardTemplet:GiveAwardByList(%tbItem[szItemId], "Håi thiªn t¸i t¹o lÔ bao") == 1 then
			nCount = nCount + nPickCount
			if nCount >= 60 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --Í¬²½¿Í»§¶Ë
			end
		end
	else
		print("VËt phÈm kh«ng ë trªn ng­êi")
	end
end

--function huitianjinlang_getpotion(nItemIndex, nPickCount)
--	local nFreeItemCellCount = CalcFreeItemCellCount()
--	if nPickCount <= 0 then
--		return
--	end
--	if nFreeItemCellCount < nPickCount then
--		nPickCount = nFreeItemCellCount
--	end
--	--local nItemIndex = GetTaskTemp(114)
--	if IsMyItem(nItemIndex) == 1 then
--		local Gid, Did, Pid = GetItemProp(nItemIndex);
--		local szItemId = format("%d,%d,%d",Gid, Did, Pid)
--		if not %tbItem[szItemId] then  --ÊÇ²»ÊÇÕâÀàµÀ¾ß
--			return
--		end
--		
--		local nCount = GetItemParam(nItemIndex, 1);
--		local nLastCount = 60 - nCount;
--		if nPickCount > nLastCount then
--			nPickCount = nLastCount
--		end
--		
--		
--		%tbItem[szItemId].nCount = nPickCount
--		if tbAwardTemplet:GiveAwardByList(%tbItem[szItemId], "Håi thiªn t¸i t¹o lÔ bao") == 1 then
--			nCount = nCount + nPickCount
--			if nCount >= 60 then
--				RemoveItemByIndex(nItemIndex)
--			else
--				SetSpecItemParam(nItemIndex, 1, nCount)
--				SyncItem(nItemIndex) --Í¬²½¿Í»§¶Ë
--			end
--		end
--	else
--		print("VËt phÈm kh«ng ë trªn ng­êi")
--	end
--end

function GetDesc(nItemIndex)
	local nCount= GetItemParam(nItemIndex, 1);

	return format("Cßn d­:  <color=yellow>%d<color>",(60 - nCount))
end