--zhongchaolong

--Õ½¹¦
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("VËt phÈm nµy ®· qu¸ h¹n.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Yªu cÇu ®¨ng cÊp ph¶i trªn 50 vµ ®· qua n¹p thÎ.", 0)
		return 1
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("§Ó tr¸nh mÊt m¸t tµi s¶n, h·y b¶o ®¶m hµnh trang cßn ®ñ %d « trèng.", nCellFreeLimit),0)
		return 1
	end
	
	local nCurExp = GetTask(zhongqiu0808_TSK_ZhangGongExp)
	
	if nCurExp >= zhongqiu0808_TSKV_ZhangGongMaxExp then
		Say(format("Sö dông vËt phÈm nµy ®· ®¹t giíi h¹n %d kinh nghiÖm.", zhongqiu0808_TSKV_ZhangGongMaxExp), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(tbItemAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_ZhangGongExp, nCurExp + tbItemAward[1].nExp)
end