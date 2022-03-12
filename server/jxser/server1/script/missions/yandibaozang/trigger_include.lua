-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..


-- 打开地图对应的mission
function YDBZ_ready_missions(map, mission)
	local oldsubworld = SubWorld
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		--print("open mission map:"..index)
		if (index >= 0) then
			SubWorld = index;
			OpenMission(mission);
		end
	end
	SubWorld = oldsubworld
end

-- 关闭地图对应的mission
function YDBZ_ready_close_missions(map, mission, status)
	local oldsubworld = SubWorld
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			--if (GetMissionV(status) ~= 0) then
				CloseMission(mission);
			--end
		end
	end
	SubWorld = oldsubworld
end
