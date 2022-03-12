-- description	: 龙舟活动触发器，由Relay每小时触发
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\settings\\trigger_include.lua")

function OnTrigger()
	-- 重启missions
	close_missions(map_map, MISSION_MATCH, VARV_STATE);
	start_missions(map_map, MISSION_MATCH);
end

OnTrigger();
