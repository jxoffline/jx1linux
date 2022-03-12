--ÔÂ±ý
--zhongchaolong
--ÐÔÖÊ£º
--¿ÉÒÔ£º¶ªÆú£¬½»Ò×£¬°ÚÌ¯£¬Âôµê£¨0Á½£©£¬µþ¼Ó 
--ÎïÆ·ÉÏµÄËµÃ÷£º
--¡°Ò»ÖÖÆÕÍ¨µÄÔÂ±ý¡±
--Ê¹ÓÃ·½·¨£º ÓÒ¼üµã»÷Ê¹ÓÃ
--Ê¹ÓÃ½ØÖ¹Ê±¼ä£º 2008Äê10ÔÂ31ÈÕ24µã
--ÏÞÖÆ£º 
--50¼¶ÒÔÉÏµÄ³äÖµÍæ¼Ò²ÅÄÜÊ¹ÓÃ
--Ã¿¸ö½ÇÉ«×î¶àÖ»ÄÜÍ¨¹ýÊ¹ÓÃ¡¾ ÍûÔÂÔÂ±ý ¡¿»ñµÃ2ÒÚ¾­Ñé 





Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("VËt phÈm nµy ®· qu¸ h¹n.",0)
		return 0;
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("§Ó tr¸nh mÊt m¸t tµi s¶n, h·y b¶o ®¶m hµnh trang cßn ®ñ %d « trèng.", nCellFreeLimit),0)
		return 1
	end
	
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Yªu cÇu ®¨ng cÊp ph¶i trªn 50 vµ ®· qua n¹p thÎ.", 0)
		return 1
	end
	local nCurExp = GetTask(zhongqiu0808_TSK_jiansanyue)
	
	if nCurExp >= zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) then
		Say(format("Sö dông vËt phÈm nµy ®· ®¹t giíi h¹n %u kinh nghiÖm.", 1e6 * zhongqiu0808_TSKV_jiansanyue * (GetTask(zhongqiu0808_TSK_mingyuejiu) + 1) ), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(zhongqiuyubing_tbAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_jiansanyue, nCurExp + floor(zhongqiuyubing_tbAward[1].nExp/1e6))
end