--ÖĞÔ­ÄÏÇø ÏåÑô¸® ïÚÍ·¶Ô»°
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
Say("Tiªu Côc uy vò ta næi tiÕng ë T­¬ng Ng¹c. C¸c b»ng h÷u h¾c b¹ch ®¹o rÊt nhiÒu. Ngay c¶ quan phñ còng th­êng nhê bän ta.Ha ha! ChØ cÇn cã tiÒn nhiÒu, hµng g× bän ta còng d¸m nhËn!", 0);
end;


