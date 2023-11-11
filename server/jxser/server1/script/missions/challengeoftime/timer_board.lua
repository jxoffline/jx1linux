-- description	: Í¨¸æ¶¨Ê±Æ÷£¬Ã¿·ÖÖÓ´¥·¢Ò»´Î
-- author		: wangbin
-- datetime		: 2005-06-07

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnTimer()
	if (GetMSPlayerCount(MISSION_MATCH) ~= 0) then
		local time = GetMissionV(VARV_BOARD_TIMER) + INTERVAL_BOARD * 60;
		local batch = GetMissionV(VARV_NPC_BATCH);
		local count = GetMissionV(VARV_NPC_COUNT);
		SetMissionV(VARV_BOARD_TIMER, time);
		
		local msg = "<#> NhiÖm vô 'Th¸ch thøc Thêi gian' ®· b¾t ®Çu råi" .. floor(time / 60) 
			.. "phót, b©y giê lµ "
			.. batch
			.. "®¸m qu¸i, cßn d­ "
			.. count
			.. "Con qu¸i.";
		Msg2MSAll(MISSION_MATCH, msg);
	end
end

