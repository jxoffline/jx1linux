--zhongchaolong
--Ã÷ÔÂ¾Æ
--½ÇÉ«Ê¹ÓÃÃ÷ÔÂ¾Æºó»áÁ½±¶À©Õ¹Í¨¹ı2ÖĞÔÂ±ı¡¾ ¼ûÔÂÔÂ±ı ¡¿ºÍ¡¾ ÉÍÔÂÔÂ±ı ¡¿µÄ¾­ÑéÏŞÖÆ £¨´Ó15ÒÚµ½30ÒÚ¾­Ñé¡£
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function main()
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
	if GetTask(zhongqiu0808_TSK_mingyuejiu) == 1 then
		Say("B¹n ®· sö dông ®¹o cô nµy råi.")
		return 1
	end
	
	SetTask(zhongqiu0808_TSK_mingyuejiu, 1)
	Msg2Player("Sau khi sö dông Minh NguyÖt töu, møc giíi h¹n kinh nghiÖm tõ 2 lo¹i b¸nh Trung thu KiÕn NguyÖt vµ b¸nh Trung thu Th­ëng NguyÖt sÏ t¨ng lªn møc 3 tû ®iÓm.")
end