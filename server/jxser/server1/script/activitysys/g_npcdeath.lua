

-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æ´óÂ½°æ - 
-- ÎÄ¼þÓÃÍ¾£ºÈ«¾ÖNPCËÀÍö¶¼»áµô¸Ã½Å±¾µÄOnGlobalNpcDeathº¯Êý
-- ´´½¨Õß¡¡£ºZERO.SYS
-- ´´½¨Ê±¼ä£º2009-09-28 17:57:03

-- ======================================================
--Ä¬ÈÏÈ«¾ÖPlayerIndexÎªÎïÆ·ËùÓÐÕß, PlayerIndex
--nNpcIndex ËÀÍöµÄnpcµÄNpcIndex
--nAttackerIndex ×îºóÒ»»÷Õß µÄPlayerIndex£¬, 
IncludeLib("NPCINFO")
Include("\\script\\lib\\string.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\missions\\boss\\bigboss.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
--tinhpn 20100706: Vo Lam Minh Chu
Include("\\script\\bonusvlmc\\killmonster.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function OnGlobalNpcDeath(nNpcIndex, nAttackerIndex)
	if PlayerIndex and PlayerIndex > 0 then
		--PlayerEvent:OnEvent("OnKillNpc", nNpcIndex, nAttackerIndex)

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
		EventSys:GetType("NpcDeath"):OnEvent(szNpcName, nNpcIndex, nAttackerIndex, PlayerIndex)
		
		local nTeamSize = GetTeamSize()
		if nTeamSize > 0 then
			for i=1, nTeamSize do
				local nPlayerIndex = GetTeamMember(i)
				lib:DoFunByPlayer(nPlayerIndex, tbKillMonster.KillMonster, tbKillMonster, nNpcIndex)
				--tinhpn 20100706: VLMC
				lib:DoFunByPlayer(nPlayerIndex, VLMC.KillMonster, VLMC, nNpcIndex)
			end
		else
			tbKillMonster:KillMonster(nNpcIndex)
			--tinhpn 20100706: VLMC
			VLMC:KillMonster(nNpcIndex)
		end
		tbKillDailyTask:OnKillMonster(nNpcIndex)		
		G_ACTIVITY:OnMessage("NpcOnDeath", nNpcIndex)
		G_TASK:OnMessage("Thóy Yªn", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Nga Mi", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("§­êng M«n", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("C¸i Bang", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Ngò §éc", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Thiªn NhÉn", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("ThiÕu L©m", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Vâ §ang", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Thiªn V­¬ng", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("C«n L«n", nNpcIndex, "KillNpc")
		DynamicExecute("\\script\\missions\\tianchimijing\\floor4\\bossdeath.lua", "OnDeath", nNpcIndex, PlayerIndex)
		-- ´³¹Øµ÷Õû 2011.03.03
		DynamicExecute("\\script\\missions\\challengeoftime\\chuangguang30.lua", "ChuangGuan30:OnNpcDeath", nNpcIndex, PlayerIndex)
		-- ×ªÉú4¹ÖÎïËÀÍöµôÂäÅùö¨µ¯
		DynamicExecute("\\script\\task\\metempsychosis\\npcdeath_translife_4.lua", "OnNpcDeath", nNpcIndex, PlayerIndex)
		
		-- Á¶½ð»î¶¯µôÂä
		if NpcFunLib:CheckBoatBoss(nNpcIndex) == 1 and tbRefiningIron:IsCarryOn() == 1 then
			tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, {tbProp={6,1, 2293, 1,0,0,},nExpiredTime=tbRefiningIron.nCloseDate,}, "Thñy tÆc ®Çu lÜnh r¬i ë ho¹t ®éng luyÖn kim", 1)
		end
		
		if (DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\main.lua", "FreedomEvent2010:IsActive1") == 1) then
			DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\soldier\\main.lua", "Soldier2010:MonsterDrop", nNpcIndex, PlayerIndex);
		end
		-- »îÔ¾¶ÈÊÀ½çÊ®´óboss
		DynamicExecute("\\script\\huoyuedu\\worldtop10.lua", "checkworldtop10", nNpcIndex, PlayerIndex)
	end
end
