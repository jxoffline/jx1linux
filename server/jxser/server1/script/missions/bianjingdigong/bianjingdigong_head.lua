--======================================================================
--Author:   Tan Qingyu
--Date:     2012-4-1 18:23:50
--Describe: ãê¾©µØ¹¬ ±äÁ¿¶¨Òå
--======================================================================

BJDG_HEAD = {}

BJDG_HEAD.tbInDungeonPlayerList = {}		-- role name is the key, value is 1
BJDG_HEAD.nDailyLimitTime = 2 * 60 * 60
BJDG_HEAD.nInDungeonTimeTaskId = 3412
BJDG_HEAD.nLastResetDateTaskId = 3413
BJDG_HEAD.nTimeInterval_Dungeon = 10
BJDG_HEAD.tbEntrancePos = {37, 1692, 2917}
BJDG_HEAD.tbLeaveTargetPos = {37, 1695, 2914}
BJDG_HEAD.tbCallBigBossTime = {[11] = 1, [19] = 1}
BJDG_HEAD.nLitterBossCount = 3
BJDG_HEAD.nMapId = 985
BJDG_HEAD.nTimeInterval_Boss = 3600
BJDG_HEAD.nRevMinDisThreshold = 50
BJDG_HEAD.nIsOpen = 1
BJDG_HEAD.tbOpenDate = {nBegin = 0, nEnd = 0}	-- Left close, right open

BJDG_HEAD.tbOpenTime = {
	[00] = 1, [01] = 1, [02] = 0, [03] = 0, [04] = 0, [05] = 0, 
	[06] = 0, [07] = 0, [08] = 0, [09] = 0, [10] = 1, [11] = 1, 
	[12] = 1, [13] = 1, [14] = 1, [15] = 1, [16] = 1, [17] = 1, 
	[18] = 1, [19] = 1, [20] = 1, [21] = 1, [22] = 1, [23] = 1, 
}

BJDG_HEAD.tbPosName = {
	"Thanh Long TrËn",
	"B¹ch Hæ TrËn",
	"Chu T­íc TrËn",
	"HuyÒn Vò TrËn",
}

BJDG_HEAD.tbPos = {
	["Thanh Long TrËn"] = {BJDG_HEAD.nMapId, 2177, 3859},
	["B¹ch Hæ TrËn"] = {BJDG_HEAD.nMapId, 1742, 3400},
	["Chu T­íc TrËn"] = {BJDG_HEAD.nMapId, 1741, 3867},
	["HuyÒn Vò TrËn"] = {BJDG_HEAD.nMapId, 2188, 3414},
}

BJDG_HEAD.tbEntryNpc = {
	nNpcId = 1926,
	szName = "Phong Th¸i Linh",
	nLevel = 95,
	bNoRevive = 1,
	szScriptPath = "\\script\\missions\\bianjingdigong\\npc_dialog\\on_entry_dialog.lua"
}

BJDG_HEAD.tbFakeBigBoss = {
	nNpcId = 1921,
	szName = "§¨ng §iÖp",
	nLevel = 95,
	bNoRevive = 1,
	nIsboss = 1,
	szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\false_boss.lua",
	szScriptPath = "\\script\\missions\\bianjingdigong\\npc_fight\\false_boss.lua",
	nTime = 2 * 3600,
}

BJDG_HEAD.tbBigBoss = {
	nNpcId = 1921,
	szName = "§¨ng §iÖp",
	nLevel = 95,
	bNoRevive = 1,
	nIsboss = 1,
	szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\true_boss.lua",
	szScriptPath = "\\script\\missions\\bianjingdigong\\npc_fight\\true_boss.lua",
	nTime = 2 * 3600,
}

BJDG_HEAD.tbMonsterPosFile = 
{
	[1] = "\\settings\\maps\\bianjingdigong\\pos_lingdie.txt",
	[2] = "\\settings\\maps\\bianjingdigong\\pos_xiaodie.txt",
	[3] = "\\settings\\maps\\bianjingdigong\\pos_midie.txt",
}

BJDG_HEAD.tbEliteMonster = {
	{
		nNpcId = 1918,
		szName = "Linh §iÖp Tinh Anh",
		nLevel = 95,
		bNoRevive = 1,
		nIsboss = 1,
		szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\litter_boss.lua",
		szScriptPath = "\\script\\missions\\bianjingdigong\\npc_fight\\litter_boss.lua",
		nTime = 3600,
	},
	{
		nNpcId = 1919,
		szName = "Kiªu §iÖp Tinh Anh",
		nLevel = 95,
		bNoRevive = 1,
		nIsboss = 1,
		szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\litter_boss.lua",
		szScriptPath = "\\script\\missions\\bianjingdigong\\npc_fight\\litter_boss.lua",
		nTime = 3600,
	},
	{
		nNpcId = 1920,
		szName = "Mª §iÖp Tinh Anh",
		nLevel = 95,
		bNoRevive = 1,
		nIsboss = 1,
		szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\litter_boss.lua",
		szScriptPath = "\\script\\missions\\bianjingdigong\\npc_fight\\litter_boss.lua",
		nTime = 3600,
	},
}

BJDG_HEAD.tbNpcTypeList = --npcµÄÀàÐÍ
{
	["Linh §iÖp"] = 
	{
		nNpcId = 1915,
		szName = "Linh §iÖp",
		nLevel = 95,
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = BJDG_HEAD.tbMonsterPosFile[1],
		szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\monster.lua",
	},
	["Kiªu §iÖp "] = 
	{
		nNpcId = 1916,
		szName = "Kiªu §iÖp ",
		nLevel = 95,
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = BJDG_HEAD.tbMonsterPosFile[2],
		szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\monster.lua",
	},
	["Mª §iÖp "] = 
	{
		nNpcId = 1917,
		szName = "Mª §iÖp ",
		nLevel = 95,
		bNoRevive = 0,
		nIsboss = 1,
		szPosPath = BJDG_HEAD.tbMonsterPosFile[3],
		szDeathScript = "\\script\\missions\\bianjingdigong\\npc_fight\\monster.lua",
	},
	["§iÓm NPC truyÒn tèng trong néi tr­êng"] =
	{
		nNpcId = 1925,
		szName = "Kú Lôc Nh©n",
		nLevel = 95,
		bNoRevive = 1,
		szPosPath = "\\settings\\maps\\bianjingdigong\\pos_qiluren.txt",
		szScriptPath = "\\script\\missions\\bianjingdigong\\npc_dialog\\on_dungeon_dialog.lua"
	},
	["D­îc §iÕm"] = 
	{
		nNpcId = 203,
		szName = "Chñ d­îc ®iÕm",
		nLevel = 95,
		szScriptPath = "\\script\\missions\\bianjingdigong\\npc_dialog\\npc_yaodian.lua",
		szPosPath = "\\settings\\maps\\bianjingdigong\\pos_yaodian.txt",
	},
	["R­¬ng chøa ®å"] = 
	{
		nNpcId = 625,
		szName = "R­¬ng chøa ®å",
		nLevel = 95,
		szScriptPath = "\\script\\missions\\bianjingdigong\\npc_dialog\\npc_chuwuxiang.lua",	
		szPosPath = "\\settings\\maps\\bianjingdigong\\pos_chuwuxiang.txt",
	},
}

BJDG_HEAD.tbTrapList = 
{
	["safetofight"] = 
	{
		szPosPath = "\\settings\\maps\\bianjingdigong\\trap_safe2fight.txt",
		szTrapFile = "\\script\\missions\\bianjingdigong\\npc_player\\on_trap_s2f.lua",
	},
	["fighttosafe"] = 
	{
		szPosPath = "\\settings\\maps\\bianjingdigong\\trap_fight2safe.txt",
		szTrapFile = "\\script\\missions\\bianjingdigong\\npc_player\\on_trap_f2s.lua",
	},
}

BJDG_HEAD.tbBigBossPos = {
	[1] = {
		{x = 61248, y = 115360}, 
		{x = 62400, y = 117472}, 
		{x = 64096, y = 112000}, 
		{x = 64800, y = 107104}, 
		{x = 64512, y = 114688}, 
	},
	[2] = {
		{x = 62528, y = 126784}, 
		{x = 63776, y = 122944}, 
		{x = 69984, y = 115616}, 
		{x = 71968, y = 117632}, 
		{x = 74208, y = 116000}, 
	},
	[3] = {
		{x = 53984, y = 114112}, 
		{x = 54720, y = 119200}, 
		{x = 57760, y = 115744}, 
		{x = 58336, y = 119616}, 
		{x = 59360, y = 123712}, 
	},
}

function BJDG_HEAD:CopyTo(tbTarget)
	for k, v in BJDG_HEAD do
		tbTarget[k] = v
	end
	tbTarget["CopyTo"] = nil
end
