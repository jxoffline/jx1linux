Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
if not tbLares then
	tbLares = {}
end
tbLares.TSK_ID = 2755
tbLares.BIT_POS = 1
tbLares.nEndDay = 20110127
tbLares.nStartDay = 20110126
function main()
	if tbLares:isActive() ~= 1 then
		return
	end
	local tbMainDialog = tbNpcHead:createDialog()
	if tbLares:getBitValue() == 1 then
		Talk(1, "", "HiÖn giê ta ®ang rÊt bËn.")
		return
	else
		tbMainDialog.szTitleMsg = "Ta ph¶i chuÈn bÞ vÒ trêi ®Ó t©u Ngäc Hoµng t×nh h×nh ë trÇn gian trong n¨m võa qua, c¸c h¹ cÇn g× th× nãi nhanh ®i!"
		tbMainDialog:AddOptEntry("Ta chØ muèn chóc ngµy th­îng lé b×nh an", tbLares.giveAward, {tbLares})
	end	
	tbMainDialog:Show()
end

function tbLares:giveAward()
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 vµ ®·  n¹p thÎ.")
		return
	end
	local nValue = GetTask(self.TSK_ID)
	nValue = SetBit(nValue, self.BIT_POS, 1)
	SetTask(self.TSK_ID, nValue)
	local tbExp = {nExp=50000000}
	tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][§­a «ng T¸o vÒ trêi]")
	Talk(2, "", "...C¸c h¹ thËt tèt bông, tÕt ®Õn råi ta còng cã mãn quµ tÆng ng­¬i.", "§a t¹ ngµy.")
end

function tbLares:getBitValue()
	local nValue = GetTask(self.TSK_ID)
	return GetBit(nValue, self.BIT_POS)
end

function tbLares:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end