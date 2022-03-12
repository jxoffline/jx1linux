Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
tbVNG_Vip_NpcHead = {}

function tbVNG_Vip_NpcHead:CreateDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbVNG_Vip_NpcHead:GiveAward(tbItem, strLog)
	tbAwardTemplet:GiveAwardByList(tbItem, strLog)
end