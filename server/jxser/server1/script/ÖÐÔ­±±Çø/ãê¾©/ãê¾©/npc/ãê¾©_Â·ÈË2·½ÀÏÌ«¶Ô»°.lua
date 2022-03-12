--ÖÐÔ­±±Çø ãê¾©¸® Â·ÈË2·½ÀÏÌ«¶Ô»°
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
	Say("Ph­¬ng l·o th¸i: Th¶m häa TÜnh Khang n¨m ®ã suèt ®êi ta kh«ng thÓ quªn, n¨m ®ã ta míi 18 tuæi, võa míi ®Ýnh h«n cßn ch­a qua nhµ chång. VÞ h«n phu bÞ b¾t ra chiÕn tr­êng ®¸nh trËn, kh«ng ngê mét ®i kh«ng trë l¹i, d¸ng th­¬ng cho ta ®· thñ tiÕt ®îi chµng s",0)
end

