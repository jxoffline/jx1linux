Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>Mçi ngµy Huµn Nhan Qu¶ng D­¬ng ®Òu luyÖn c«ng ë ®©y, «ng ta cÊt gi÷ mét sè l­¬ng lín kho b¸u, Dôc §å §«ng S¬n T¸i Khëi, T¸i §é C«ng Tèng, tiÓu hiÖp ng­¬i nhÊt ®Þnh ph¶i ®¸nh b¹i h¾n."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)	
	
	tbDailog:AddOptEntry("Chç nµy ®¸ng sî qu¸, ta muèn rêi khái n¬i quû qu¸i nµy", OnLeave)
	tbDailog:Show()
end

function OnLeave()
	Game:MoveTo(934, "\\settings\\maps\\tianchimijing\\common\\exit.txt")
end