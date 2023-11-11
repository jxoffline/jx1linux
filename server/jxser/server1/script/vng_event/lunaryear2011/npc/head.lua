Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
if not tbNpcHead then
	tbNpcHead = {}
end
function tbNpcHead:createDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end