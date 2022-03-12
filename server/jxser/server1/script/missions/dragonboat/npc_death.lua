-- description	: NPCÀ¿Õˆ
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc.lua")
IL("RELAYLADDER");

-- Ω±¿¯ÕÊº“
function award_player(player, exp, objects)
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = player;
	-- Ω±¿¯æ≠—È
	if (exp ~= 0) then
		local point = exp * 10000;
		AddOwnExp(point);
		Msg2Player("<#> Bπn nhÀn Æ≠Óc " .. point .. "Æi”m kinh nghi÷m.");
	end
	
	-- Ω±¿¯ŒÔ∆∑
	if (objects ~= nil) then
		local sum = 0;
		local num = random(1, 100);
		local obj = nil; 
		for i = 1, getn(objects) do
			obj = objects[i];
			sum = sum + obj[1];
			if (num <= sum) then
				AddItem(obj[2], obj[3], obj[4], obj[5], obj[6], obj[7]);
				Msg2Player("<#> Bπn nhÀn Æ≠Óc " .. obj[8] .. "!");
				break;
			end
		end
	end

	-- ª÷∏¥ÕÊº“À˜“˝
	PlayerIndex = OldPlayerIndex;
end

-- µÙ¬‰ŒÔ∆∑
function drop_item(index, count)
	if (count ~= 0) then
		local x, y, world = GetNpcPos(index);
		for i = 1, count do
			-- µÙ¬‰ŒÂª®
			DropItem(world, x, y, -1, 1, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0);
		end
	end
end

-- Ω±¿¯
function award(batch, npc_index)
	local item = {};
	if (advanced()) then
		item = map_haward[batch];	-- ∏ﬂº∂±»»¸Ω±¿¯
	else
		item = map_laward[batch];	-- ≥ıº∂±»»¸Ω±¿¯
	end
	
	-- ∏¯√ø∏ˆ∂”‘±æ≠—È∫ÕΩ±¿¯
	local index = 0;
	local player = 0;
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			award_player(player, item[1], item[3]);
		end
		if (index == 0) then
			break;
		end	
	end
	
	-- µÙ¬‰ŒÔ∆∑
	drop_item(npc_index, item[2]);
end

-- ±»»¸ §¿˚
function success()
	-- Õ≥º∆ ±º‰
	local time = GetMissionV(VARV_BOARD_TIMER);
	time = time + floor(GetMSRestTime(MISSION_MATCH, TIMER_BOARD) / 18);
	SetMissionV(VARV_BOARD_TIMER, time);
	local laddertime = LIMIT_SIGNUP * 60 - 300 - time;
	local teamname = GetMissionS(VARS_TEAM_NAME)
	local MapId = SubWorldIdx2ID(SubWorld)
	local LadderId = 10141
	if (map_isadvanced[MapId] == 1) then
		LadderId = 10142
	end
	
	local bfind = 0
	for i = 1, 10 do 
		name , value = Ladder_GetLadderInfo(LadderId, i)
		if (name  == teamname) then
			bfind = 1
			if ( laddertime > value) then
				Ladder_NewLadder(LadderId, teamname, laddertime,1)
				break
			end
		end
	end
	
	if (bfind == 0) then
		Ladder_NewLadder(LadderId, teamname, laddertime, 1)
	end

	-- Õ®∏Ê
	broadcast(GetMissionS(VARS_TEAM_NAME) .. "ßÈi ngÚ thæng lÓi qua ∂i, Æ∑ sˆ dÙng" .. floor(time / 60) .. "phÛt" .. mod(time, 60) .. "gi©y! Tr≠Ìc Æ„"..laddertime.." gi©y");
	
	-- Ãﬂªÿ±®√˚µ„
	kickout();
end

-- Ω· ¯
function finish(index)
	-- Õ®∏Ê
	local batch = GetMissionV(VARV_NPC_BATCH);
	Msg2MSAll(MISSION_MATCH, GetMissionS(VARS_TEAM_NAME) .. "ßÈi ngÚ Æ∑ ti™u di÷t toµn bÈ " .. batch .. "Æ∏m qu∏i!");
	
	-- Ω±¿¯
	award(batch, index);

	if (batch >= get_batch_count()) then
		-- Ω· ¯
		success();
	else
		-- ≤˙…˙œ¬“ª≈˙π÷
		batch = batch + 1;
		SetMissionV(VARV_NPC_BATCH, batch);
		create_npc(batch);
	end
end

function OnDeath(index)
	local count = GetMissionV(VARV_NPC_COUNT) - 1;	
	if (count >= 0) then
		SetMissionV(VARV_NPC_COUNT, count);
		if (count == 0) then
			finish(index);
		end
	end
end
