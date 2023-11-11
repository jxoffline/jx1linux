--ÖÐÔ­ÄÏÇø ÏåÑô¸® æÎ¿Í2¶Ô»°
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>Thêi cuéc b©y giê nh÷ng con d©n b¸ t¸nh ngay c¬m còng kh«ng cã mµ ¨n cho ®ñ no, quan l¹i th× t¸c l¹c kh¾p n¬i."
		G_TASK:OnMessage("Thóy Yªn", tbDailog, "DialogWithNpc")
		tbDailog:Show() 
end;


