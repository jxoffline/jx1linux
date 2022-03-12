-- description	: NPCËÀÍö
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")
Include("\\script\\missions\\challengeoftime\\award.lua")

IL("RELAYLADDER");
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
Include("\\script\\activitysys\\g_activity.lua");
Include("\\script\\activitysys\\functionlib.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\event\\change_destiny\\mission.lua");	-- ÄæÌì¸ÄÃü
--120¼¶¼¼ÄÜĞŞÁ¶
Include("\\script\\task\\task_award_extend.lua")
-- Ô½ÄÏ×ÊÁÏÆ¬ÉúÈÕ»î¶¯
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
-- ´³¹Ø»î¶¯Ã¿ÈÕÅÅĞĞ°ñ
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
-- ´³¹Øµ÷Õû 2011.03.01
Include("\\script\\lib\\awardtemplet.lua")

Include("\\script\\missions\\challengeoftime\\doubleexp.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\activitysys\\config\\1005\\partysupport.lua")
Include("\\script\\activitysys\\functionlib.lua")

function UpdatePlayerScrore(time)
	local ndate = tonumber(GetLocalDate("%y%m%d"))				
	update_gbtask(time);
	if (GetTask(tsk_rank_lastdate) == ndate) then
		if (GetTask(tsk_rank_lastscore) > time) then
			SetTask(tsk_rank_lastscore, time);
		end
	else
		SetTask(tsk_rank_2thdate, GetTask(tsk_rank_lastdate));
		SetTask(tsk_rank_2thscore, GetTask(tsk_rank_lastscore));
		SetTask(tsk_rank_lastdate, ndate);
		SetTask(tsk_rank_lastscore, time);
	end
end

function Mission_Complete(npc_index)
	-- Í³¼ÆÊ±¼ä
	local time = GetMissionV(VARV_BOARD_TIMER);
	time = time + INTERVAL_BOARD * 60 - floor(GetMSRestTime(MISSION_MATCH, TIMER_BOARD) / 18);
	SetMissionV(VARV_BOARD_TIMER, time);
	
	-- ±ê¼ÇÎªÍ¨¹Ø
	SetMissionV(VARV_MISSION_RESULT, 1);
	-- Í¨¹Ø½±Àø
	award_success(npc_index, time);
	local laddertime = time;
	local teamname = GetMissionS(VARS_TEAM_NAME)
	local nLeaderFaction = GetMissionS(VARS_TEAMLEADER_FACTION)
	local nLeaderGender = GetMissionS(VARS_TEAMLEADER_GENDER)
	local MapId = SubWorldIdx2ID(SubWorld)
	
	local LadderId = nil;
	if (GetMatchLevel() == 1) then
		LadderId = 10179;
	elseif (GetMatchLevel() == 2) then
		LadderId = 10180;
	end
	
	if LadderId then
		local bfind = 0
		for i = 1, 10 do 
			name , value = Ladder_GetLadderInfo(LadderId, i)
			if (name  == teamname) then
				bfind = 1
				if ( laddertime > value) then
					Ladder_NewLadder(LadderId, teamname, -1 * laddertime, 1, nLeaderFaction, nLeaderGender)
					break
				end
			end
		end
	end
	
	if (bfind == 0) then
		Ladder_NewLadder(LadderId, teamname, laddertime, 1, nLeaderFaction, nLeaderGender)
	end
   	
   	Ladder_NewLadder(DailyRankLadderId, teamname, -1 * laddertime, 1)
	-- ¸üĞÂÃ¿ÌìµÄ³É¼¨
	if (GetMatchLevel() == 2) then
		local tbPlayerList = GetMatchPlayerList()
		for i=1, getn(tbPlayerList) do
				CallPlayerFunction(tbPlayerList[i], UpdatePlayerScore, time)
		end
	end
	
	broadcast(GetMissionS(VARS_TEAM_NAME) .. "§éi ngò ®· th¾ng lîi hoµn thµnh nhiÖm vô ®óng thêi gian, ®· dông" .. floor(time / 60) .. " phót " .. mod(time, 60) .. "gi©y! Tr­íc ®ã"..laddertime.." gi©y ");

	-- Èç¹ûÓÃÊ±ÉÙÓÚ12·ÖÖÓ£¬´ÓÒş²Ø¹Ø¿¨ÖĞËæ»úÑ¡È¡1¸ö¿ªÆô	
	kickout();

			--if (time < 20 * 60) then
			--	local tbNpcList = GetHidenNpcList()

			--	local index = random(1, getn(tbNpcList));
			--	close_board_timer();
			--	Msg2MSAll(MISSION_MATCH, "<#>NhiÖm vô bİ mËt ®· khái ®éng råi");
			--	create_all_npc(tbNpcList[index]);
			--	tbLog:TabFormatLog("challengeoftime", "Mission_Complete", "HiddenNpc", index, time)
			--else
				-- Ìß»Ø±¨Ãûµã
			--	kickout();
			--end
end

-- Åú´Î½áÊø
function batch_finish(index)
	
	if (GetMissionV(VARV_MISSION_RESULT) == 1) then
		-- Òş²ØÈÎÎñ½±Àø
		award_hidden_mission();
		
		if GetMissionV(VARV_BATCH_MODEL) == 1 and GetMissionV(VARV_BOARD_TIMER) <= CHUANGGUAN30_TIME_LIMIT  then
			add_transfer_npc()
		else
			-- Ìß»Ø±¨Ãûµã
			kickout();
		end
	else
		-- Í¨¸æ
		local batch = GetMissionV(VARV_NPC_BATCH);
		Msg2MSAll(MISSION_MATCH, GetMissionS(VARS_TEAM_NAME) .. "§éi ngò ®· tiªu diÖt toµn bé " .. batch .. "®¸m qu¸i!");
		
		-- ½±Àø
		award_batch(batch, index);
    	
		if (batch >= get_batch_count()) then
			-- ½áÊø
			Mission_Complete(index);
		else
			-- ²úÉúÏÂÒ»Åú¹Ö
			batch = batch + 1;
			SetMissionV(VARV_NPC_BATCH, batch);
			create_batch_npc(batch);
		end
	end
end
-- NPCËÀÍö½±Àø
function NpcDeathAward(index)
	local nNpcSettingIdx = GetNpcSettingIdx(index);
	tbChangeDestiny:completeMission_NieShiChen(nNpcSettingIdx);
end

function OnDeath(index)
	local _, _, nMapIndex = GetNpcPos(index)
	lib:DoFunInWorld(nMapIndex, NpcDeathAward, index)
	local count = lib:DoFunInWorld(nMapIndex, GetMissionV, VARV_NPC_COUNT) - 1;	
	if (count >= 0) then
		lib:DoFunInWorld(nMapIndex, SetMissionV, VARV_NPC_COUNT, count);
		if (count == 0) then
			lib:DoFunInWorld(nMapIndex, batch_finish, index);
		end
	end
end

