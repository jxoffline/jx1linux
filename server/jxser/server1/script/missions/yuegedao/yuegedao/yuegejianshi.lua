Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>ThŞ phi thµnh b¹i chuyÓn ®Çu kh«ng, biÕt bao nhiªu vâ l©m cao thñ ®· bŞ ch«n vïi t¹i chèn nµy, ®¸ng tiÕc lµ khi luËn kiÕm, chØ v× muèn ®¹t ®­îc bİ kİp tuyÖt vâ häc, kh«ng İt hiÖp sÜ vÉn kh«ng ng¹i hiÓm nguy. §¹i hiÖp tuæi h½ng cßn trÎ, xin h·y thËn träng mµ hµnh xö."
	G_TASK:OnMessage("NguyÖt Ca §¶o", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end