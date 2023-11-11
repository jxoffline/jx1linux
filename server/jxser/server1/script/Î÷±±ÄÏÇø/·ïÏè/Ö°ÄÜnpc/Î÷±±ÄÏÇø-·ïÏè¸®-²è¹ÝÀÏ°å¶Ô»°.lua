--Î÷±±ÄÏÇø ·ïÏè¸® ²è¹İÀÏ°å¶Ô»°
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	i = random(0,1)
	if (i == 0) then
		Say("Trµ cã thÓ tu t©m d­ìng t¸nh, mét ngôm trµ xanh cã thÓ khiÕn con ng­êi quªn ®i thÕ tôc.",0)
	else
		Say("Trµ cña chóng ta næi tiÕng kh¾p n¬i.", 0)
	end
end