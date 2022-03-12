TEMPLATE_MAP_ID = 977

PREPARE_TIME = 4 * 60 --准备时间，单位分钟
GAME_TIME = 16 * 60 --比赛时间，单位分钟
REFRESH_TIME = 15

MAX_GROUP_MEMBER = 15
MAX_GROUP = 10

NPC_PARAM_MAPID = 1
NPC_PARAM_COLLECTED = 2
PLANT_LIST = 
{
	["yellow"] = {nNpcId = 1930, nLevel = 1, szName = "C﹜ L骯 V祅g", szScriptPath = "\\script\\missions\\caiji\\plant.lua"},
	["green"] = {nNpcId = 1931, nLevel = 1, szName = "C﹜ L骯 Xanh", szScriptPath = "\\script\\missions\\caiji\\plant.lua"},
}

NPCID2PLANTTYPE = 
{
	[1930] = "yellow",
	[1931] = "green"
}

ITEM_PLANT = 
{
	["yellow"] = {szName = "L骯 V祅g", tbProp={6,1,3200,1,0,0}, nExpiredTime = 20120701},
	["green"] = {szName = "L骯 Xanh", tbProp={6,1,3199,1,0,0},nExpiredTime = 20120701},
}

ITEM_TOOL = 
{
	["nomal"] = {szName = "Li Li襪 S総", tbProp={6,1,3197,1,0,0}},
	["platinum"] = {szName = "Li Li襪 B筩", tbProp={6,1,3198,1,0,0}}
}


TOOL2PROGRESSID = 
{
	["nomal"] = 7,
	["platinum"] = 1,
}

RANK_AWARD = 
{
	[1] = {nExp_tl = 50000000},
	[2] = {nExp_tl = 40000000},
	[3] = {nExp_tl = 30000000},
	[4] = {nExp_tl = 25000000},
	[5] = {nExp_tl = 20000000},
	[6] = {nExp_tl = 20000000},
	[7] = {nExp_tl = 20000000},
	[8] = {nExp_tl = 20000000},
	[9] = {nExp_tl = 20000000},
	[10] = {nExp_tl = 20000000},
}