--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË19ÂôË®¹ûµÄ¶Ô»°
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
Say("Tr¸i c©y võa rÎ l¹i võa t­¬i ®©y! C¸c lo¹i tr¸i c©y võa míi h¸i tõ Long TuyÒn ®©y! Cã nho, ®µo, lª… h·y chän ®i! H·y xem ®i! ",0)

end;
