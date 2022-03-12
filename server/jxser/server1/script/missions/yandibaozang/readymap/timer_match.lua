-- description	: ±ÈÈü¶¨Ê±Æ÷
-- author		: wangbin
-- datetime		: 2005-06-04
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")

-- Ñ×µÛ±¦²Ø
-- by Ğ¡ÀË¶à¶à
-- 2007.10.24
-- ÎÒ..
-- ÕıÔÚ³¢ÊÔ×Å..
-- Ñ°ÕÒ×ÅÊôÓÚÎÒµÄÌìµØ..

function YDBZ_cancel_match()
	-- Msg2SubWorld(date("[%H:%M:%S]") .. "±ÈÈüÈ¡Ïû£¡")
end

-- ¿ªÊ¼±ÈÈü
function YDBZ_ready_start_match()
	-- ÉèÖÃÎª±ÈÈü×´Ì¬
	local oldworld = SubWorld
	SetMissionV(YDBZ_READY_STATE, 3);

	local player_count = GetMSPlayerCount(YDBZ_READY_MISSION);
	local teams_count = GetMissionV(YDBZ_READY_TEAM)
	if (player_count == 0 or teams_count < YDBZ_TEAM_START_LIMIT) then
		-- È¡Ïû±ÈÈü
		Msg2MSAll(YDBZ_READY_MISSION,"Do v× tæ ®éi kh«ng ®ñ, kh«ng thÓ më b¶o tµng Viªm §Õ")
		YDBZ_cancel_match();
	else
		broadcast("Ho¹t ®éng b¶o tµng Viªm §Õ ®· chİnh thøc b¾t ®Çu, c¸c cao thñ ®ang trong tr¹ng th¸i thi ®Êu");
		SubWorld = oldworld
		YDBZ_ready_start_missions(YDBZ_MAP_MAP, SubWorld,YDBZ_MISSION_MATCH,YDBZ_READY_MISSION);	
		
		-- Æô¶¯±ÈÈü½áÊø¶¨Ê±Æ÷
--		YDBZ_start_close_timer();
		
		-- Í¨¸æ
		SubWorld = oldworld
		

		-- ³õÊ¼»¯±äÁ¿
--		SetMissionV(VARV_NPC_BATCH, 1);	-- ¹ÖµÄÅú´Î
--		SetMissionV(VARV_MISSION_RESULT, 0);
--		SetMissionV(VARV_PLAYER_USE_INDEX, 0);
--		SetMissionV(VARV_NPC_USE_INDEX, 0);
		
--		-- ±£´æÍæ¼ÒĞÅÏ¢
--		save_player_info();
--    	
--		-- ÇåÀíµØÍ¼
		SetMissionV(YDBZ_READY_STATE, 0);
		SetMissionV(YDBZ_READY_TEAM, 0);
		--YDBZ_ready_close_match()
--    	
--		-- Éú³ÉµÚ1Åú¹Ö
--		create_batch_npc(1);
	end
	
	-- ÉèÖÃÍæ¼ÒÊıÁ¿
	--SetMissionV(VARV_PLAYER_COUNT, player_count);
	YDBZ_ready_close_match_timer()
	YDBZ_ready_close_match()
end
function YDBZ_ready_match()
	broadcast(format("Thêi gian b¸o danh v­ît ¶i b¶o tµng viªm ®Õ ®· kÕt thóc, xin mêi c¸c vâ l©m nh©n sü h·y chuÈn bŞ lÇn cuèi, cßn %s b¾t ®Çu.",YDBZ_READY_LIMIT_WAIT));
	Msg2MSAll(YDBZ_READY_MISSION,format("Thêi gian b¸o danh b¶o tµng Viªm §Õ kÕt thóc, xin mêi c¸c vŞ vâ l©m cao thñ chuÈn bŞ lÇn cuèi. Cßn <color=yellow>%s gi©y<color> b¾t ®Çu tranh ®o¹t.",YDBZ_READY_LIMIT_WAIT))
	StartMissionTimer(YDBZ_READY_MISSION, YDBZ_READY_TIMER, YDBZ_READY_LIMIT_WAIT * 18);
	SetMissionV(YDBZ_READY_STATE, 2);
end

function YDBZ_ready_broad_talk()
	local broadstate = GetMissionV(YDBZ_READY_BROAD_STATE)
	local nlimittime = floor((YDBZ_READY_LIMIT_SIGNUP - (broadstate * YDBZ_READY_LIMIT_BROAD))/60)
	Msg2MSAll(YDBZ_READY_MISSION,format("V­ît ¶i b¶o tµng viªm ®Õ cßn <color=yellow>%s phót<color> kÕt thóc thêi gian b¸o danh, h·y nhanh nhanh b¸o danh.",nlimittime))
	SetMissionV(YDBZ_READY_BROAD_STATE,broadstate + 1)
end
-- ¹Ø±Õ±ÈÈü¶¨Ê±Æ÷
function YDBZ_ready_close_match_timer()
	StopMissionTimer(YDBZ_READY_MISSION, YDBZ_READY_TIMER);
end

function OnTimer()
	local state = GetMissionV(YDBZ_READY_STATE)
	local broadstate = GetMissionV(YDBZ_READY_BROAD_STATE)
	if state == 1 then
		-- ±¨Ãû½áÊø
		if ( broadstate * YDBZ_READY_LIMIT_BROAD ) >= YDBZ_READY_LIMIT_SIGNUP then
			YDBZ_ready_close_match_timer();
			-- ×¼±¸½×¶Î
			YDBZ_ready_match();
			--print("±¨Ãû½áÊø")
		else
			YDBZ_ready_broad_talk()
		end
	elseif state == 2 then
		--print("×¼±¸½áÊø")
		YDBZ_ready_close_match_timer();
		YDBZ_ready_start_match();
	end
--	start_board_timer();
end
