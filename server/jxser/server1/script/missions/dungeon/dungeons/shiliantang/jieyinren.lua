Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")

function main()	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>Xin chµo vﬁ Æπi hi÷p, ng≠¨i c„ th” tham gia th› luy÷n, Æ∑ c„ th› luy÷n thi’p cÒa bÊn minh ch≠a?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog:AddOptEntry("Ch›nh x∏c, xin Æπi nh©n h∑y d…n ta vµo.",enter_shiliantang)
	
	--µØ≥ˆ∂‘ª∞øÚ
	tbDailog:Show()
end

function enter_shiliantang_callback(nPlayerIndex, tbDungeonData, bSaved)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	if (tbDungeonData == nil) then
		if (PlayerFunLib:CheckItemInBag("return {tbProp={6,1,2317,-1,-1,0},}", 1, "L«n tuy”n ch‰n nµy c˘c k˙ quan tr‰ng, xin h∑y xu t tr◊nh th› luy÷n thi’p mÌi c„ th” tham gia") ~= 1) then
			return
		end
	end
	
	tbDungeonManager:OpenDungeon("Th› Luy÷n ß≠Íng");
			
	PlayerIndex = nOldPlayer;
end
function enter_shiliantang()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th› Luy÷n ß≠Íng", 1);
	if (tbDungeon == nil) then
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CheckExist", {925, GetName()},
			"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua", "enter_shiliantang_callback", {PlayerIndex});
	else
		tbDungeonManager:EnterDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end