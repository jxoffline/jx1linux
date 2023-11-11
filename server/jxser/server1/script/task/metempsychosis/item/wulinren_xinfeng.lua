Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")

g_tbCreateBossNpcParam = 
{
	szName = "B綾 u L穙 Nh﹏", 
	nLevel = 1,
	nNpcId = 2199,
	nTime =  10 * 60 ,		-- 存在时间 10分钟
	szDeathScript = "\\script\\task\\metempsychosis\\npc\\npcdeath_beidou_boss.lua",
	nSeries = nil, 
	tbNpcParam = 
	{
		
	},
}

g_tbMapWhiteList = 
{
	11,1,37,176,162,78,	80,
	121,153,174,99,100,101,
	20,53,54,175,55,
}	

function main(nItemIndex)
	local nFightState = GetFightState() 
	local nMapCheckFlag = in_map_white_list()
	if (nFightState == 0)  or (nMapCheckFlag == 0 ) then
		Msg2Player(TL7_CONFIG.tbLang[26])
		return 1
	end
	
	local nCheckOpenInterval, nPastTime = check_open_interval()
	if nCheckOpenInterval == 0 then
		Msg2Player(format(TL7_CONFIG.tbLang[25], OPEN_FIGHT_BOSS_INTERVAL - nPastTime))
		return 1
	end
	local nMapID, nMapX, nMapY = GetWorldPos()
	nMapX = nMapX * 32
	nMapY = nMapY *32

	local nNpcIndex = AddNpcEx(g_tbCreateBossNpcParam.nNpcId,95,3,SubWorld,nMapX,nMapY,1, g_tbCreateBossNpcParam.szName, 1)
	if type(nNpcIndex) == "number" and nNpcIndex > 0 then
		SetNpcDeathScript(nNpcIndex, g_tbCreateBossNpcParam.szDeathScript);
		SetNpcTimer(nNpcIndex, 18*g_tbCreateBossNpcParam.nTime);
		SetNpcParam(nNpcIndex, 1, mod(GetUUID(), g_nNpcParamFactor))
		local szString = TL7_CONFIG.tbLang[13]
		NpcChat(nNpcIndex, szString)
		szString = TL7_CONFIG.tbLang[14]
		NpcChat(nNpcIndex, szString, 3)
	
		local nCurTime = GetLocalTime()
		SetTask(TSK_OPEN_FIGHT_BOSS, nCurTime)
		return 1
	end
	return 1
end

function in_map_white_list()
	local nMapID, _, _ = GetWorldPos()
	for nIndex, nMapWhiteID in g_tbMapWhiteList do
		if nMapID == nMapWhiteID then
			return 1
		end
	end
	return 0
end

function check_open_interval()
	local nLastTimeOpenTime = GetTask(TSK_OPEN_FIGHT_BOSS)
	local nCurTime = GetLocalTime()
	local nDiffTime = nCurTime - nLastTimeOpenTime
	if nDiffTime >= OPEN_FIGHT_BOSS_INTERVAL then
		return 1, nDiffTime
	end
	return 0, nDiffTime
end
