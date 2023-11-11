--°Ù±¦Ïä¾«Á¶Ê¯°ü
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\common.lua")

local tbItem = 
{
	["6,1,3060"] = {szName="Hçn Nguyªn Linh Lé", tbProp={6,1,2312,1,0,0}},
}

local _GetItem = function (nCount)
	AskClientForNumber("refining_box_getpotion", 0, nCount, "Xin mêi nhËp sè cÇn rót")
end

local _OpenBox = function (nPlayerIndex, szName, nCount)
	if DynamicExecuteByPlayer(nPlayerIndex, "", "GetName") ~= szName then
		return
	end	
	
	lib:DoFunByPlayer(nPlayerIndex, %_GetItem, nCount)
	
end

function main(nItemIndex)
	local nCount = GetItemParam(nItemIndex, 1);
	
	if nCount == 0 then
		Say("§· nhËn hÕt Hçn Nguyªn Linh Lé bªn trong, cã thÓ hñy ®i.", 0)
		return 0
	end
	
	SetTaskTemp(114, nItemIndex)
	if GetFightState() == 1 then
		tbProgressBar:OpenByConfig(12, %_OpenBox, {PlayerIndex, GetName(), nCount})
	else
		AskClientForNumber("refining_box_getpotion", 0,nCount, "Xin mêi nhËp sè cÇn rót")
	end
	
	return 1
end


function refining_box_getpotion(nPickCount)
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount / 50 then
		nPickCount = nFreeItemCellCount * 50
	end
	local nItemIndex = GetTaskTemp(114)
	if IsMyItem(nItemIndex) == 1 then
		local Gid, Did, Pid = GetItemProp(nItemIndex);
		local szItemId = format("%d,%d,%d",Gid, Did, Pid)
		if not %tbItem[szItemId] then  --ÊÇ²»ÊÇÕâÀàµÀ¾ß
			return
		end
		
		local nCount = GetItemParam(nItemIndex, 1);
		if nPickCount > nCount then
			nPickCount = nCount
		end
		
		local nBindState = GetItemBindState(nItemIndex);
		local tbPotion = clone(%tbItem[szItemId]);
		tbPotion.nCount = nPickCount;
		tbPotion.nBindState = nBindState;
		if tbAwardTemplet:GiveAwardByList(tbPotion, "Hçn Nguyªn Linh Lé") == 1 then
			nCount = nCount - nPickCount
			if nCount <= 0 then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, 1, nCount)
				SyncItem(nItemIndex) --Í¬²½¿Í»§¶Ë
				SetItemBindState(nItemIndex, nBindState)
			end
		end
	else
		print("VËt phÈm kh«ng ë trªn ng­êi")
	end
end

function GetDesc(nItemIndex)
	local nCount= GetItemParam(nItemIndex, 1);

	return format("Cßn d­:  <color=yellow>%d<color>", nCount)
end