-- ÌìÂ»Ê÷Ö®ÖÖ
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\tianlu_tree\\tree.lua")
Include("\\script\\activitysys\\g_activity.lua")
--New eventsys action - modified by DinhHQ - 20130625
Include("\\script\\misc\\eventsys\\eventsys.lua")

local TSK_DAYLY_PLANT_NUM = 4015  -- Ã¿ÈÕÖÖÊ÷ÊýÁ¿
local TSK_PLANT_TIME = 4016   -- ÖÖÊ÷Ê±¼ä
local MAX_LIMIT_PLANT_NUM = 40 -- Ã¿ÈÕÖÖÊ÷ÉÏÏÞ
local PLANT_DELTA_TIME = 50  -- ÖÖÊ÷¼ä¸ôÊ±¼ä
local MAX_LIMIT_PLANT_NUM_2 = 80

function main(nItemIndex)
	-- Change limit use by level - modified by DinhHQ - 20130531
	local nMaxLimit 
	local nTranslifeCount = ST_GetTransLifeCount() 
	if nTranslifeCount > 4 or (nTranslifeCount == 4 and GetLevel() >= 180) then
		nMaxLimit = %MAX_LIMIT_PLANT_NUM_2
	else
		nMaxLimit = %MAX_LIMIT_PLANT_NUM
	end
	if not PlayerFunLib:CheckTaskDaily(%TSK_DAYLY_PLANT_NUM, nMaxLimit, "H«m nay ®¹i hiÖp ®· trång "..nMaxLimit.." c©y, kh«ng thÓ trång thªm n÷a, nghØ ng¬i råi ngµy mai l¹i ®Õn.", "<") then
		return 1
	end
	-- ¼ì²éÖÖÊ÷Î»ÖÃ
	local szMapList = "11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53,175"
	local _,_,nMapIndex = GetPos()
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if lib:CheckInList(szMapList, nMapId) then
		-- ¼ì²éÖÖÊ÷¼ä¸ôÊ±¼ä
		local deltaTime = GetCurServerTime() - GetTask(%TSK_PLANT_TIME)  
--		if GetTask(%TSK_PLANT_TIME)~=0 and deltaTime<%PLANT_DELTA_TIME then
--			Msg2Player("§¹i hiÖp ng­¬i mÖt qu¸ råi ®ã, nghØ ng¬i mét l¸t råi h·y tiÕp tôc.")
--			return 1
--		end
		-- ÖÖÊ÷
		SetTask(%TSK_PLANT_TIME, GetCurServerTime()) -- ÉèÖÃÖÖÊ÷Ê±¼ä
		PlayerFunLib:AddTaskDaily(%TSK_DAYLY_PLANT_NUM, 1) -- ¸üÐÂÖÖÊ÷ÊýÁ¿		
		--New eventsys action - modified by DinhHQ - 20130625
		EventSys:GetType("HarvestPlants"):OnPlayerEvent("use_tianlu_seed", PlayerIndex)
		G_ACTIVITY:OnMessage("Use_Tianlu_Seed");
		--B¸ch niªn héi ngé lÖnh bµi 2012 - modified by DinhHQ - 20120927
		DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\1005\\personal_quest.lua", "tbPVLB_Quest:AddTreeQuest")
		-- ÔÚÕâÀïµ÷ÓÃÖÖÊ÷½Ó¿Ú
		%CreateTree(PlayerIndex)
		return 0
	else
		Talk(1, "","§¹o cô nµy chØ ®­îc sö dông t¹i c¸c thµnh thÞ vµ th«n trÊn.")
		return 1
	end
end