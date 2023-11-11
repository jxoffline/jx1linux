-- ÁúÃÅÕò¡¡Â·ÈË¡¡Ã·Ïã
-- by£ºDan_Deng(2003-09-16)
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
	Talk(1,"","ChŞ cña ta chİnh lµ vî cña «ng chñ qu¸n trä Long M«n TrÊn. ChŞ Êy rÊt lîi h¹i, kh«ng ai d¸m ®ông ®Õn mét sîi tãc cña chŞ Êy")
end
