Include("\\script\\misc\\eventsys\\eventsys.lua")
local tbEvent = 
{
	["YanDiBaoZang"] = 
	{
		"OnEnter",
		"OnPass",
		"OnLastBigBossDeath",
	},
	["ChuanGuan"] = 
	{
		"OnEnter",
		"OnPass"
	},
	["SongJin"] = 
	{
		"OnFinish",
		"BattlePointRank",		--单场积分排行
		"OnKillPlayer",			--杀人 	--nDeathPlayerIndex, nKillCount, nSeriesKill
		"ProtectMarshal",		--保卫了元帅
	},
	["FengLingDu"] = 
	{
		"OnBoard",
		"OnLanding",
		"OnFinishShuiZeiTask",	--完成水贼任务
		"OnShuiZeiDeath",	--水贼死亡
	},
	["Messenger"] = 
	{
		"OnFinish"
	},
	["KillerBoss"] = 
	{
		"OnFinish",		--杀死booss的那个队伍的人
		"OnKillBoss",	--最后一击杀死boss的那个人
	},
	["LeagueMatch"] = 
	{
		"MatchResult",	--联赛打完一场, nType, nLevel, nResult
	},
	
	["SwordBurialMaze"] = 
	{
		"OnSingleFinish",	--(单人)通关
		"OnSinglePass",		--(单人)完成一个房间, nPassRoomCount, nTaskId
		"OnTeamFinish",		--(多人)通关
		"OnTeamPass",		--(多人)完成一个房间, nPassRoomCount, nTaskId
	},
	
	["LongMenExpress"] = 
	{
		"OnFinish",
	},
	["SevenCity"] = 
	{
		"OnFinish",
		"OnKillPlayer",		--nDeathPlayerIndex, nKillCount
	},
	["TongCastle"] = 
	{
		"OnFinish",
		"OnKillPlayer",		--nDeathPlayerIndex, nKillCount
	},
	["Fuli"] = 
	{
		"OnFinish",			--结束 nResult(0负, 1胜, 3平), nPoint(本场)
		"OnKillPlayer",		--杀人 	--nDeathPlayerIndex, nKillCount, nSeriesKill
	},
	["SiGuoYa"] = 
	{
		"OnPickFragment",	--拾取碎片  nPickCount, nTodayCount
	},
	["BloodyBattle"] = 
	{
		"OnFinish",
		"OnFastFinish",
		"OnCampPointFinish",
		"OnConKillTop",
		"PersonPointRank",
		"ConKillRank",
		"OnGetPrize",
	},
	
	["WuLinMengZhu"] = 
	{
		"OnFinishTask",
	},
	
	["WorldBoss"] = 
	{
		"OnLiBaiBossDeath", --李白BOSS
		"OnBossDeath", --十大黄金BOSS死亡
	},
	
	["TongGuTaAward"] = 
	{
		"OnOpenGoldBox",
	},
	
	["OpenFuncAwardBox"] = 
	{
		"OpenAwardBoxEvent",
	},
}

for key, value in tbEvent do
	EventSys:NewType(key)
end