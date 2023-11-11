-- description	: 龙舟活动触发器，由Relay每小时触发
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\dragonboat\\include.lua")


-- 打开地图对应的mission
function start_missions(map)
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			OpenMission(MISSION_MATCH);
		end
	end
end

-- 关闭地图对应的mission
function close_missions(map)
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			if (GetMissionV(VARV_STATE) ~= 0) then
				CloseMission(MISSION_MATCH);
			end
		end
	end
end

function OnTrigger()
	-- 重启missions
	close_missions(map_map);
	start_missions(map_map);
end

OnTrigger();