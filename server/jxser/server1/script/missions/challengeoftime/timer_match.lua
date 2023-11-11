-- description	: ±ÈÈü¶¨Ê±Æ÷
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")

function cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "±ÈÈüÈ¡Ïû£¡")
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
		-- Æô¶¯±ÈÈü½áÊø¶¨Ê±Æ÷
		start_close_timer();
		
		-- Í¨¸æ
		broadcast("NhiÖm vô 'Th¸ch thøc Thêi gian' ®· chİnh thøc b¾t ®Çu, anh hïng c¸c n¬i ®ang ra søc tranh tµi");

		-- ³õÊ¼»¯±äÁ¿
		SetMissionV(VARV_NPC_BATCH, 1);	-- ¹ÖµÄÅú´Î
		SetMissionV(VARV_MISSION_RESULT, 0);
		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
		-- Ğ¡Äôß±³¾³öÏÖµÄ¹Ø¿¨
		local nBossBatch = random(5, 15)
		SetMissionV(VARV_XIAONIESHICHEN_BATCH, nBossBatch)	-- ´Ó5µ½15Ëæ»ú²úÉúÒ»¸ö¹Ø¿¨
		WriteLog(format("TiÓu NhiÕp Thİ TrÇn xuÊt hiÖn thÎ ¶i lµ %d",nBossBatch))
		
		-- ±£´æÍæ¼ÒĞÅÏ¢
		save_player_info();
    	
		-- ÇåÀíµØÍ¼
		world = SubWorldIdx2ID(SubWorld);
		ClearMapNpc(world);
		ClearMapTrap(world); 
		ClearMapObj(world);
    	
		-- Éú³ÉµÚ1Åú¹Ö
		create_batch_npc(1);
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
