--ÖĞÔ­ÄÏÇø ÑïÖİ¸® ²è²©Ê¿¶Ô»°
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
	i = random(0,3)

	if (i == 0) then
		Say("Trµ lµ mét s¶n phÈm tao nh· trong thiªn h¹. Uèng trµ lµ mét chuyÖn tao nh· bËc nhÊt trong thiªn h¹. Ng­êi ng­êi ®Òu biÕt uèng trµ lµ mét nghÖ thuËt, c¸ch pha trµ còng lµ lo¹i häc vÊn uyªn th©m!",0)
		return
	end

	if (i == 1) then
		Say("Pha trµ chia thµnh h¹ ®Çu, trung ®Çu, th­îng ®Çu, kh«ng ®¬n gi¶n nh­ mäi ng­êi t­ëng",0)
		return
	end

	if (i == 2) then
		Say("Trµ lµ mét s¶n phÈm tao nh· trong thiªn h¹. Uèng trµ lµ mét chuyÖn tao nh· bËc nhÊt trong thiªn h¹. Ng­êi ng­êi ®Òu biÕt uèng trµ lµ mét nghÖ thuËt, c¸ch pha trµ còng lµ lo¹i häc vÊn uyªn th©m!",0)
		return
	end

	if (i == 3) then
		Say("Uèng trµ chØ th­ëng thøc cïng b¸nh ngät tr¸i c©y, cßn uèng r­îu ph¶i cã chót ®å nhÊm!.....",0)
	end

end

