--ÍûÔÂ
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
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Yªu cÇu ®¨ng cÊp ph¶i trªn 50 vµ ®· qua n¹p thÎ.", 0)
		return 1
	end
	local nCurExp = GetTask(zhongqiu0808_TSK_Wangyue)
	if nCurExp >= zhongqiu0808_TSKV_Wangyue then
		Say(format("Sö dông vËt phÈm nµy ®· ®¹t giíi h¹n %d kinh nghiÖm.", zhongqiu0808_TSKV_Wangyue), 0)
		return 1
	end
	
	local tbAward = {nExp = 500000}
	tbAwardTemplet:GiveAwardByList(tbAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_Wangyue, nCurExp + tbAward.nExp)
end