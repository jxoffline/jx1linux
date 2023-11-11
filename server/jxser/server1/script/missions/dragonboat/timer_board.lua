-- description	: 通告定时器，每分钟触发一次
-- author		: wangbin
-- datetime		: 2005-06-07

Include("\\script\\missions\\dragonboat\\include.lua")

function OnTimer()
	if (GetMSPlayerCount(MISSION_MATCH) ~= 0) then
		local time = GetMissionV(VARV_BOARD_TIMER) + INTERVAL_BOARD * 60;
		local batch = GetMissionV(VARV_NPC_BATCH);
		local count = GetMissionV(VARV_NPC_COUNT);
		SetMissionV(VARV_BOARD_TIMER, time);
		
		local msg = "<#> Х ti課 h祅h thi u r錳!" .. floor(time / 60) 
			.. "ph髏, b﹜ gi� l� "
			.. batch
			.. "m qu竔, c遪 d� "
			.. count
			.. "Con qu竔.";
		Msg2MSAll(MISSION_MATCH, msg);
	end
end

