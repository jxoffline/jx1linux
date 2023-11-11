Include ("\\script\\event\\eventhead.lua")

ARENACOUNT = 8;
ARENAWLDIDXBEGIN = 213;
CITYWARIDX = 221;
CITYCOUNT = 7

function OnTimer()
	--检测擂台赛的情况,当符合条件时自动开启擂台赛
	for i = 1, ARENACOUNT do 
		if (IsArenaBegin(i - 1) == 1) then 
			WorldIdx = SubWorldID2Idx(ARENAWLDIDXBEGIN + i - 1)
			if (WorldIdx >= 0) then
				SubWorld = WorldIdx
				if (GetMissionV(1) == 0) then
					OpenMission(5)
				end;
			end
		end;
	end;
	
	--检测城战的情况,当符合条件时自动开启城战
	for i = 1, CITYCOUNT do 
		if (HaveBeginWar(i) == 1) then
			WorldIdx = SubWorldID2Idx(CITYWARIDX);
			if (WorldIdx >= 0) then 
				SubWorld = WorldIdx
				if (GetMissionV(1) == 0) then 
					OpenMission(6)
--					SetMissionV(MS_GAMERULE, 0); --设置为旧版游戏规则
					RunMission(6)
				end
			end
		end;
	end;
end;
