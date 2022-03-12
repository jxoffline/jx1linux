-- description	: ±ÈÈü¶¨Ê±Æ÷
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "ÁúÖÛ±ÈÈüÈ¡Ïû£¡")
end

-- ¿ªÊ¼±ÈÈü
function start_match()
	-- ÉèÖÃÎª±ÈÈü×´Ì¬
	SetMissionV(VARV_STATE, 2);

	local player_count = GetMSPlayerCount(MISSION_MATCH);
	if (player_count == 0) then
		-- È¡Ïû±ÈÈü
		cancel_match();
	else
		-- Í¨¸æ
		broadcast("Cuéc ®ua thuyÒn Rång ®· chİnh thøc b¾t ®Çu, c¸c h¶o thñ ®ang ra søc tranh tµi!");

		-- ³õÊ¼»¯±äÁ¿
		SetMissionV(VARV_NPC_BATCH, 1);	-- ¹ÖµÄÅú´Î
    	
		-- ÇåÀíµØÍ¼
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- Éú³ÉµÚ1Åú¹Ö
		create_npc(1);
	end
	
	-- ÉèÖÃÍæ¼ÒÊıÁ¿
	SetMissionV(VARV_PLAYER_COUNT, player_count);
end

-- ¹Ø±Õ±ÈÈü¶¨Ê±Æ÷
function close_match_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_MATCH);
end

function OnTimer()
	-- ±¨Ãû½áÊø
	close_match_timer();
	-- ±ÈÈü¿ªÊ¼
	start_match();
	start_board_timer();
end
