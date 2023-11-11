TONGWAR_LGTASK_CAMP = 8
TONGWAR_LGTASK_MAP = 9
MS_TONGWAR_S = 21
MS_S_CITYNAME_S = 3
MS_TONGWAR_J = 22
MS_S_CITYNAME_J = 4
IL("BATTLE")

function tongwar_start(...)
	local szParam = arg
	local tb_mapid = {}
	local tb_cityid = {}
	if (getn(szParam) ~= 9) then
		for i = 1, 7 do
			lgname_s = GetCityAreaName(i)
			LG_ApplySetLeagueTask(10, lgname_s, TONGWAR_LGTASK_CAMP, 0)
			LG_ApplySetLeagueTask(10, lgname_s, TONGWAR_LGTASK_MAP, 0)
			
		end
		SetGlbValue(850, 0)
		return
	end
	tb_cityid[1]	=	{szParam[1], szParam[2]}
	tb_mapid[1]	=	szParam[3] + 604
	tb_cityid[2]	=	{szParam[4], szParam[5]}
	tb_mapid[2]	=	szParam[6] + 604
	tb_cityid[3]	=	{szParam[7], szParam[8]}
	tb_mapid[3]	=	szParam[9] + 604

	oldSubWorld = SubWorld
	for i = 1, 3 do
		local mapid = tb_mapid[i]
		local mapidx = SubWorldID2Idx(mapid)

		if (mapidx >= 0) then
			SubWorld = mapidx
			lgname_s = GetCityAreaName(tb_cityid[i][1])
			LG_ApplySetLeagueTask(10, lgname_s, TONGWAR_LGTASK_CAMP, 1)
			LG_ApplySetLeagueTask(10, lgname_s, TONGWAR_LGTASK_MAP, mapid)

			lgname_j = GetCityAreaName(tb_cityid[i][2])
			LG_ApplySetLeagueTask(10, lgname_j, TONGWAR_LGTASK_CAMP, 2)
			LG_ApplySetLeagueTask(10, lgname_j, TONGWAR_LGTASK_MAP, mapid)
			
			OpenMission(33)
			BT_SetGameData(2, 33)
			SetMissionV(MS_TONGWAR_S, tb_cityid[i][1])
			SetMissionS(MS_S_CITYNAME_S, lgname_s)
			SetMissionV(MS_TONGWAR_J, tb_cityid[i][2])
			SetMissionS(MS_S_CITYNAME_J, lgname_j)
		end
	end
	SetGlbValue(850, 1)
	SubWorld = oldSubWorld
end