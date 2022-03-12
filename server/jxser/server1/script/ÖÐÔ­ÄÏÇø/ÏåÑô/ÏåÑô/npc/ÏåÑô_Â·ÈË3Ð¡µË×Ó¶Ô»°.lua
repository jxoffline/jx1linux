--ÖÐÔ­ÄÏÇø ÏåÑô¸® Â·ÈË3Ð¡µË×Ó¶Ô»°


Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>TiÓu ®Æng tö: Ta ®· ¨n ch¸o víi khoai h¬n mét tuÇn råi. Gi¸ mµ ¨n ®­îc mét b÷a c¬m no nª nhØ?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--µ¯³ö¶Ô»°¿ò
	tbDailog:Show()
end

