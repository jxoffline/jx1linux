Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
ITEM_STORE_PARAM_ID = 1
BIND_STATE_PARAM_ID = 2
EXPIREDTIME_PARAM_ID = 3
function main(nIdx)
	local nItemCount = tonumber(GetItemParam(nIdx, ITEM_STORE_PARAM_ID))
	if nItemCount <= 0 then
		Msg2Player("HÈ Mπch ß¨n L‘ Bao Æ∑ rÛt h’t, c„ th” v¯t Æi")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then	szNpcName = NpcName2Replace(szNpcName)end
	local tbMainDialog = DailogClass:new(szNpcName)	
	tbMainDialog:AddOptEntry("Ta muËn rÛt", WithrawItem, {nIdx})	
	tbMainDialog.szTitleMsg = format("L‘ bao cﬂn ch¯a <color=yellow>%d<color> HÈ Mπch ß¨n.", nItemCount)
	tbMainDialog:Show()
	return 1
end

function WithrawItem(nBoxIdx)
	local nItemCount = tonumber(GetItemParam(nBoxIdx, ITEM_STORE_PARAM_ID))	
	local nMaxCount = nItemCount
	if nItemCount > 5000 then
		nMaxCount = 5000
	end	
	g_AskClientNumberEx(1, nMaxCount, "NhÀp sË c«n rÛt", {GetNumberCallBack,{nBoxIdx}})
end

function GetNumberCallBack(nBoxIdx, nCount)
	local tbAward = {szName = "HÈ Mπch ß¨n", tbProp = {6,1,3203,1,0,0}, nCount = 1}
	local nItemCount = tonumber(GetItemParam(nBoxIdx,ITEM_STORE_PARAM_ID))
	local nItemBindState = tonumber(GetItemParam(nBoxIdx,BIND_STATE_PARAM_ID))
	local nItemExpiredTime = tonumber(GetItemParam(nBoxIdx,EXPIREDTIME_PARAM_ID))
	if nItemBindState == 1 then
		tbAward.nBindState = -2
	end
	if nItemExpiredTime > 0 then
		tbAward.nExpiredTime = nItemExpiredTime
	end
	if ( ceil(nCount/500) > CalcFreeItemCellCount() ) then
		Talk(1,"",format("Hµnh trang kh´ng ÆÒ %d ´ trËng ..",ceil(nCount/500)))
		return
	end
	
	if (IsMyItem(nBoxIdx) ~=1) then
		return
	end
	
	if ( nCount > nItemCount ) then
		Talk(1,"",format("Hi÷n tπi bπn chÿ cﬂn %d HÈ Mπch ß¨n ..",nItemCount))
		return	
	end
	
	local ntemp =  nItemCount - nCount
	
	if (ntemp <= 0) then
		RemoveItemByIndex(nBoxIdx)
	else
		SetSpecItemParam(nBoxIdx,1,ntemp)
		SyncItem(nBoxIdx)
		SetItemBindState(nBoxIdx, -2)
	end
	tbAward.nCount = nCount
	tbAwardTemplet:Give(tbAward, 1,{"DenBuChinhDo","SuDungHoMachDonLeBao", "Rut: "..nCount, "Con lai: "..ntemp})
end