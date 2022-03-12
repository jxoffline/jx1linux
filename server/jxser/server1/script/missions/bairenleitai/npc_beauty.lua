-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æ´óÂ½°æ - ÀÞÌ¨ÃÀÅ®
-- ÎÄ¼þÃû¡¡£ºnpc_beauty.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2011-05-03 10:26:19

-- ======================================================
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main(nNpcIndex)
	local szName = GetName();
	
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local nParam1 = GetNpcParam(nNpcIndex, 1);
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Hä nãi r»ng hÔ mµ nghe ta d¹o xong khóc nh¹c nµy ®Òu c¶m thÊy kh¶ng kh¸i tinh thÇn, khi tu luyÖn còng lµm t¨ng mét phÇn c«ng lùc, ng­¬i nghe thö xem qu¶ thËt cã chuyÖn kú l¹ nh­ vËy sao?"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tinsert(tbDailog, {"Lîi h¹i ®Õn nh­ vËy sao, vËy th× ta nghe thö xem.", onBeautyState, {szName, nParam1}});
	tinsert(tbDailog, {"Th«i th«i, ta kh«ng cã thó víi mÊy c¸i trß nµy ®©u."})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
	
end

function onBeautyState(szName, nParam1)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:AddDoubleState", szName, nParam1);
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex);
end
