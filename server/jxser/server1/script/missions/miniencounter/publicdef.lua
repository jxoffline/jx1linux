IncludeLib("TITLE");
DungeonGlobalData = {};

DungeonGlobalData.BATTLE_NAME						= "PhÔ Li Xung ßÈt Chi’n";			 -- ’Ω“€√˚≥∆
DungeonGlobalData.MAP_WAIT_TIME					  = 180					  -- ±»»¸◊º±∏ ±º‰£∫X√Î
DungeonGlobalData.MAP_FIGHT_TIME					 = 1800;					 -- ±»»¸æ∫ºº ±º‰£∫X√Î
--DungeonGlobalData.MAP_FIGHT_TIME				   = 180;					  -- ±»»¸æ∫ºº ±º‰£∫X√Î
DungeonGlobalData.MAP_WAIT_COUNT_SECOND			  = 10;					   -- ±»»¸µπ ˝ ±º‰£∫X√Î
DungeonGlobalData.MAP_REBORN_TIME					= 3;						-- À¿Õˆ÷ÿ…˙ ±º‰£∫X√Î
DungeonGlobalData.BLACK_LIST_TIME					= 10;					   -- ∫⁄√˚µ• ±º‰£∫X∑÷÷”
DungeonGlobalData.MAP_WIN_SCORE					  = 15;					   -- ”Æµ√±»»¸“™«Ûµƒ∑÷ ˝
--DungeonGlobalData.MAP_WIN_SCORE					= 4;						-- ”Æµ√±»»¸“™«Ûµƒ∑÷ ˝
DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE		  = 150;					  --  §¿˚’Û”™π¶—´ª˘ ˝
DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE		   = 60;					   --  ß∞‹’Û”™π¶—´ª˘ ˝

DungeonGlobalData.PLAYER_POINTS_TASK_VALUE		   = 3449;					 -- ∑˚¿Î≥ÂÕª’Ω∏ˆ»Àª˝∑÷»ŒŒÒ±‰¡ø
DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE		  = 3450;					 -- ∑˚¿Î≥ÂÕª’Ω∏ˆ»Àπ¶—´»ŒŒÒ±‰¡ø
DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE = 3473;					 -- ∑˚¿Î≥ÂÕª’Ω∏ˆ»À√ø÷‹◊‹π¶—´»ŒŒÒ±‰¡ø
DungeonGlobalData.PLAYER_WEEK_EXPLOIT_TIME_TASK	  = 3474;					 -- º«¬º◊ÓΩ¸“ª¥ŒªÒµ√π¶—´µƒ÷‹ ˝
DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE  = 3452;					 -- ∑˚¿Î≥ÂÕª’Ω∏ˆ»À¿˙ ∑π¶—´◊‹∫Õ»ŒŒÒ±‰¡ø
DungeonGlobalData.BROKEN_MEDAL_USE_PER_WEEK		  = 3453;					 -- ∆∆ÀÈµƒÀŒΩ—´’¬√ø÷‹ π”√∏ˆ ˝
DungeonGlobalData.COMPLETE_MEDAL_USE_PER_WEEK		= 3454;					 -- ÕÍ’˚µƒÀŒΩ—´’¬√ø÷‹ π”√∏ˆ ˝

DungeonGlobalData.PLAYER_LEVEL_LIMIT				 = 120;					  -- 120º∂ªÚ◊™…˙ÕÊº“
DungeonGlobalData.MAX_EXPLOIT_VALUE				  = 3500;					 -- π¶—´÷µ…œœﬁ

DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR		   = 2;						-- ø≥shi÷–º‰¡˙∆ÏªÒµ√µƒ∑÷ ˝

DungeonGlobalData.TASK_SCORE_TOTAL				   = 3457;					 -- ÕÊº“Œ™º∫∑Ω∂·»°ª˝∑÷ ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_KILL_ENEMY_NUM				= 3458;					 -- ÕÊº“…±µ–ÕÊº“ ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_KILL_MIDDLE_PILLAR_NUM		= 3459;					 -- ÕÊº“∂·µ√¡˙∆Ï ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_KILL_ENEMY_PILLAR_NUM		 = 3460;					 -- ÕÊº“’∂µ–Àß∆Ï ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_GET_ENEMY_BUFF_NUM			= 3461;					 -- ÕÊº“∂·µ–’‰±¶ ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM			= 3462;					 -- ÕÊº“µ±«∞¡¨’∂ ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_CUR_TITLE_INDEX			   = 3463;					 -- ÕÊº“’Ωπ¶æ¸œŒÀ˜“˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_DEATH_TOTAL_NUM			   = 3464;					 -- ÕÊº“À¿Õˆ¥Œ ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM			= 3465;					 -- ÕÊº“◊Ó¥Û¡¨’∂ ˝(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_PERSONAL_SCORE				= 3466;					 -- ÕÊº“∏ˆ»Àª˝∑÷(∏ˆ»À–≈œ¢)
DungeonGlobalData.TASK_BATTLE_FINISH_TIME			= 3467;					 -- ’Ω≥°Ω· ¯µƒ ±º‰(µÿÕº–≈œ¢)
DungeonGlobalData.TASK_BATTLE_SONG_NUM			   = 3468;					 -- ÀŒ∑Ω‘⁄≥°»À ˝(µÿÕº–≈œ¢)
DungeonGlobalData.TASK_BATTLE_JIN_NUM				= 3469;					 -- Ω∑Ω‘⁄≥°»À ˝(µÿÕº–≈œ¢)
DungeonGlobalData.TASK_BATTLE_SONG_SCORE			 = 3470;					 -- ÀŒ∑Ω∑÷ ˝(µÿÕº–≈œ¢)
DungeonGlobalData.TASK_BATTLE_JIN_SCORE			  = 3471;					 -- Ω∑Ω∑÷ ˝(µÿÕº–≈œ¢)
DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP			= 3472;					 -- ÕÊº“’Û”™(∏ˆ»À–≈œ¢)

DungeonGlobalData.tbCampName = 
{
	[1] = "TËng",
	[2] = "Kim",
};

-- ±®√˚“‘º∞µ»¥˝ø™ ºµƒ∫œ∑®µÿÕº
DungeonGlobalData.tbLegalPrepareMapList =
{
	[1]   = " Ph≠Óng T≠Íng"  ,
	[11]  = " Thµnh ß´"  ,
	[37]  = " Bi÷n Kinh"  ,
	[80]  = " D≠¨ng Ch©u"  ,
	[78]  = " T≠¨ng D≠¨ng"  ,
	[162] = " ßπi L˝ "  ,
	[176] = " L©m An"  ,
	[20]  = "Giang T©n Th´n",
	[53]  = "Ba L®ng huy÷n",
	[54]  = "Nam Nhπc tr n",
	[99]  = "V‹nh Lπc tr n",
	[100] = "Chu Ti™n tr n",
	[101] = "ßπo H≠¨ng th´n",
	[121] = "Long M´n tr n",
	[153] = "Thπch CÊ tr n",
	[174] = "Long Tuy“n th´n",
	[325] = "ßi”m b∏o danh TËng Kim",
};

-- ∑˚¿Î≥ÂÕª’Ωø™∑≈ ±º‰
DungeonGlobalData.tbActivityTime =
{
	[1] = {9, 23},
};

-- ∑«’Ω∂∑NPCŒª÷√–≈œ¢£∫¥¢ŒÔœ‰£¨“©…Ã
DungeonGlobalData.tbNonFightNpcPos = 
{
	[1] = 
	{
		szName	   = "R≠¨ng ch¯a ÆÂ",
		nPosX		= 52096,
		nPosY		= 109920,
		nNpcId	   = 625,
		szScriptPath = "\\script\\battles\\openbox.lua",
	},	
	[2] = 
	{
		szName	   = "R≠¨ng ch¯a ÆÂ",
		nPosX		= 59488,
		nPosY		= 99328,
		nNpcId	   = 625,
		szScriptPath = "\\script\\battles\\openbox.lua",
	},
	[3] = 
	{
		szName	   = "ChÒ d≠Óc Æi’m",
		nPosX		= 51872, 
		nPosY		= 109440,
		nNpcId	   = 203,
		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
	},
	[4] = 
	{
		szName	   = "ChÒ d≠Óc Æi’m",
		nPosX		= 59840, 
		nPosY		= 99712,
		nNpcId	   = 203,
		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
	},
};

--DungeonGlobalData.tbBattleReplenishNpc = 
--{
--	[1] = 
--	{
--		szName	   = "’Ω≥°≤π∏¯…Ã",
--		nPosX		= 49568, 
--		nPosY		= 101376,
--		nNpcId	   = 2068,
--		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
--	},
--	[2] = 
--	{
--		szName	   = "’Ω≥°≤π∏¯…Ã",
--		nPosX		= 50112, 
--		nPosY		= 99040,
--		nNpcId	   = 2068,
--		szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua",
--	},
--};

-- ’Ω∂∑NPCŒª÷√–≈œ¢£∫ ø±¯
DungeonGlobalData.tbFightNpcPos = 
{
	-- ÀŒ∑Ω’Ω∂∑NPCŒª÷√
	[1] = 
--	{
--		{1659, 3382}, {1656, 3386}, {1652, 3389}, {1663, 3397}, {1164, 3392}, {1669, 3388}, {1699, 3346}, {1701, 3343},
--		{1704, 3339}, {1706, 3336}, {1704, 3333}, {1701, 3334}, {1760, 3354}, {1755, 3354}, {1757, 3359}, {1755, 3363},
--		{1753, 3361}, {1751, 3359}, {1644, 3296}, {1646, 3299}, {1647, 3302}, {1644, 3304}, {1642, 3302}, {1639, 3302},
--		{1721, 3303}, {1719, 3307}, {1715, 3308}, {1713, 3306}, {1712, 3301}, {1714, 3289}, {1741, 3266}, {1743, 3269},
--		{1745, 3273}, {1741, 3276}, {1738, 3273}, {1735, 3270}, {1669, 3355}, {1670, 3357}, {1673, 3359}, {1674, 3364},
--		{1672, 3365}, {1669, 3368},
--	},
	{
		{1667, 3371}, {1663, 3379}, {1653, 3388}, {1659, 3393}, {1662, 3394}, {1666, 3390}, {1670, 3356}, {1672, 3358}, 
		{1674, 3359}, {1673, 3364}, {1676, 3360}, {1676, 3363}, {1700, 3336}, {1703, 3334}, {1705, 3333}, {1705, 3338},
		{1704, 3339}, {1708, 3334}, {1717, 3304}, {1719, 3306}, {1718, 3309}, {1737, 3263}, {1739, 3265}, {1743, 3268},
		{1746, 3267}, {1746, 3273}, {1739, 3360}, {1766, 3228}, {1768, 3229}, {1769, 3225}, {1778, 3193}, {1779, 3191},
		{1781, 3187}, {1785, 3187}, {1787, 3189}, {1792, 3193}, {1813, 3164}, {1816, 3166}, {1830, 3227}, {1833, 3228},
		{1836, 3226}, {1835, 3216}, {1839, 3218}, {1835, 3213}, {1733, 3193}, {1735, 3184}, {1734, 3188}, {1733, 3195},
	},
	-- Ω∑Ω’Ω∂∑NPCŒª÷√
	[2] = 
--	{
--		{1835, 3134}, {1837, 3141}, {1841, 3147}, {1836, 3152}, {1838, 3152}, {1825, 3152}, {1806, 3169}, {1808, 3172},
--		{1807, 3177}, {1804, 3175}, {1806, 3182}, {1803, 3180}, {1784, 3199}, {1781, 3200}, {1779, 3198}, {1782, 3190},
--		{1784, 3188}, {1784, 3190}, {1763, 3223}, {1764, 3229}, {1764, 3232}, {1761, 3231}, {1765, 3236}, {1744, 3248},
--		{1746, 3251}, {1748, 3254}, {1747, 3255}, {1750, 3259}, {1744, 3254}, {1728, 3185}, {1731, 3185}, {1730, 3190},
--		{1727, 3189}, {1724, 3191}, {1726, 3195}, {1830, 3219}, {1833, 3221}, {1832, 3224}, {1829, 3225}, {1834, 3226},
--		{1837, 3223}, {1782, 3194}, 
--	},
	{
		{1825, 3145}, {1828, 3141}, {1836, 3139}, {1840, 3145}, {1839, 3151}, {1834, 3152}, {1808, 3168}, {1809, 3172},
		{1808, 3176}, {1806, 3175}, {1802, 3175}, {1806, 3177}, {1790, 3191}, {1791, 3194}, {1790, 3197}, {1782, 3194},
		{1788, 3199}, {1789, 3194}, {1762, 3224}, {1765, 3227}, {1766, 3230}, {1743, 3247}, {1745, 3254}, {1746, 3255},
		{1746, 3260}, {1747, 3265}, {1745, 3267}, {1738, 3265}, {1723, 3299}, {1721, 3305}, {1720, 3308}, {1706, 3327},
		{1707, 3330}, {1707, 3335}, {1707, 3339}, {1707, 3342}, {1709, 3338}, {1672, 3353}, {1675, 3353}, {1641, 3304},
		{1643, 3306}, {1645, 3303}, {1762, 3355}, {1761, 3360}, {1759, 3363}, {1757, 3364}, {1753, 3364}, {1751, 3362},
	},
};

-- ’Ω∂∑NPCŒª÷√–≈œ¢£∫’Ω∆Ï
DungeonGlobalData.tbPillarNpcPos = 
{
	-- ÀŒ∑Ω÷˘◊”NpcŒª÷√
	[1] = 
	{
		{1661, 3389},
	},
	-- Ω∑Ω÷˘◊”NpcŒª÷√
	[2] =
	{
		{1835, 3145},
	},
	-- ÷–—Î÷˘◊”NpcŒª÷√
	[3] =
	{
		{1743, 3264},
	},
};

-- ’Ω∂∑NPC–≈œ¢£∫ ø±¯
DungeonGlobalData.tbFightNpcInfo = 
{
	-- ÀŒ∑Ω’Ω∂∑NPC–≈œ¢
	[1] = 
	{
		[1] = { szName  = "TËng binh", nLevel  = 100, nNpcId  = 2025, nIsBoss = 0, nRate = 86, },
		[2] = { szName  = "TËng Hi÷u Ûy", nLevel  = 100, nNpcId  = 2026, nIsBoss = 0, nRate = 8,  },
		[3] = { szName  = "TËng ThËng l‹nh", nLevel  = 100, nNpcId  = 2027, nIsBoss = 0, nRate = 3,  },
		[4] = { szName  = "TËng Ph„ t≠Ìng", nLevel  = 100, nNpcId  = 2028, nIsBoss = 0, nRate = 2,  },
		[5] = { szName  = "TËng ßπi t≠Ìng", nLevel  = 100, nNpcId  = 2029, nIsBoss = 0, nRate = 1,  },
	},
	-- Ω∑Ω’Ω∂∑NPC–≈œ¢
	[2] = 
	{
		[1] = { szName  = "Kim binh", nLevel  = 100, nNpcId  = 2031, nIsBoss = 0, nRate = 86, },
		[2] = { szName  = "Kim Hi÷u Ûy", nLevel  = 100, nNpcId  = 2032, nIsBoss = 0, nRate = 8,  },
		[3] = { szName  = "Kim ThËng L‹nh", nLevel  = 100, nNpcId  = 2033, nIsBoss = 0, nRate = 3,  },
		[4] = { szName  = "Kim Ph„ t≠Ìng", nLevel  = 100, nNpcId  = 2034, nIsBoss = 0, nRate = 2,  },
		[5] = { szName  = "Kim ßπi t≠Ìng", nLevel  = 100, nNpcId  = 2035, nIsBoss = 0, nRate = 1,  },
	},
};

DungeonGlobalData.tbSoldierDropBuff = 
{
	["TËng binh"] = {nRate = 1, nTimes = 1, },
	["Kim binh"] = {nRate = 1, nTimes = 1, },

	["TËng Hi÷u Ûy"] = {nRate = 10, nTimes = 2, },
	["Kim Hi÷u Ûy"] = {nRate = 10, nTimes = 2, },

	["TËng ThËng l‹nh"] = {nRate = 30, nTimes = 3, },
	["Kim ThËng L‹nh"] = {nRate = 30, nTimes = 3, },

	["TËng Ph„ t≠Ìng"] = {nRate = 60, nTimes = 4, },
	["Kim Ph„ t≠Ìng"] = {nRate = 60, nTimes = 4, },

	["TËng ßπi t≠Ìng"] = {nRate = 100, nTimes = 5, },
	["Kim ßπi t≠Ìng"] = {nRate = 100, nTimes = 5, },
};

-- ’Ω∂∑NPC–≈œ¢£∫’Ω∆Ï
DungeonGlobalData.tbPillarNpcInfo = 
{
	-- ÀŒ∑Ω÷˘◊”Npc–≈œ¢
	[1] = 
	{
		[1]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2037, nIsBoss = 1, },   -- …Ë≥…boss”–π‚ª∑
		[2]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2038, nIsBoss = 1, },
		[3]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2039, nIsBoss = 1, },
		[4]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2040, nIsBoss = 1, },
		[5]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2041, nIsBoss = 1, },
		[6]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2042, nIsBoss = 1, },
		[7]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2043, nIsBoss = 1, },
		[8]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2044, nIsBoss = 1, },
		[9]  = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2045, nIsBoss = 1, },
		[10] = { szName  = "CÍ Nguy™n So∏i phe TËng", nLevel  = 100, nNpcId  = 2046, nIsBoss = 1, },
	},
	-- Ω∑Ω÷˘◊”Npc–≈œ¢
	[2] =
	{
		[1]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2047, nIsBoss = 1, },
		[2]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2048, nIsBoss = 1, },
		[3]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2049, nIsBoss = 1, },
		[4]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2050, nIsBoss = 1, },
		[5]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2051, nIsBoss = 1, },
		[6]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2052, nIsBoss = 1, },
		[7]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2053, nIsBoss = 1, },
		[8]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2054, nIsBoss = 1, },
		[9]  = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2055, nIsBoss = 1, },
		[10] = { szName  = "CÍ Nguy™n So∏i phe Kim", nLevel  = 100, nNpcId  = 2056, nIsBoss = 1, },
	},
	-- ÷–—Î÷˘◊”NpcŒª÷√
	[3] =
	{
		[1]  = { szName  = "CÍ RÂng", nLevel  = 100, nNpcId  = 2057, nIsBoss = 1, },
	},
};

-- ’Ω≥°∏ˆ»Àª˝∑÷≥∆∫≈–≈œ¢
DungeonGlobalData.tbBattleTitle = 
{
	-- ÀŒ∑Ω≥∆∫≈–≈œ¢
	[1] = 
	{
		[1] = {"Binh s‹ phe TËng", 306},
		[2] = {"Hi÷u Ûy phe TËng", 307},
		[3] = {"ThËng l‹nh phe TËng", 308},
		[4] = {"Ph„ t≠Ìng phe TËng", 309},
		[5] = {"ßπi t≠Ìng phe TËng", 310},
	},
	-- Ω∑Ω≥∆∫≈–≈œ¢
	[2] =
	{
		[1] = {"Binh s‹ phe Kim", 311},
		[2] = {"Hi÷u Ûy phe Kim", 312},
		[3] = {"ThËng l‹nh phe Kim", 313},
		[4] = {"Ph„ t≠Ìng phe Kim", 314},
		[5] = {"ßπi t≠Ìng phe Kim", 315},
	},
};

-- ’Ω≥°∏ˆ»Àª˝∑÷µ»º∂–≈œ¢£∫∏˘æ›≥∆∫≈ ˝ƒøªÆ∑÷Œ™ŒÂ∏ˆµ»º∂
DungeonGlobalData.tbBattleTitleLvInfo = 
{
	[1] = {0 , 20},
	[2] = {20, 38},
	[3] = {38, 54},
	[4] = {54, 68},
	[5] = {68, -1},
};

-- ––∫≈£∫…±»À’ﬂµƒ≥∆∫≈µ»º∂£¨¡– ˝£∫±ª…±’ﬂµƒ≥∆∫≈µ»º∂
DungeonGlobalData.tbIncreaseScore =
{
	[1] = {2, 4, 6, 8, 10},
	[2] = {0, 2, 4, 6, 8},
	[3] = {0, 0, 2, 4, 6},
	[4] = {0, 0, 1, 2, 4},
	[5] = {0, 0, 0, 1, 2},
};

-- ––∫≈£∫…±»À’ﬂµƒ≥∆∫≈µ»º∂£¨¡– ˝£∫±ª…±’ﬂµƒ≥∆∫≈µ»º∂
DungeonGlobalData.tbDecreaseScore =
{
	[1] = {0, 2, 3, 4, 5},
	[2] = {0, 1, 2, 3, 4},
	[3] = {0, 0, 1, 2, 3},
	[4] = {0, 0, 0, 1, 2},
	[5] = {0, 0, 0, 0, 1},
};

-- ––∫≈£∫…±»À’ﬂµƒ≥∆∫≈µ»º∂£¨¡– ˝£∫±ª…±’ﬂµƒ≥∆∫≈µ»º∂
DungeonGlobalData.tbValidCombo = 
{
	[1] = {1, 1, 1, 1, 1},
	[2] = {0, 1, 1, 1, 1},
	[3] = {0, 0, 1, 1, 1},
	[4] = {0, 0, 0, 1, 1},
	[5] = {0, 0, 0, 0, 1},
};

-- π¶—´º∆À„π´ Ω÷–Fn“Ú◊”
DungeonGlobalData.tbFn = 
{
	[1] = -0.1,
	[2] = 0,
	[3] = 0.1,
	[4] = 0.3,
	[5] = 0.5,
};

DungeonGlobalData.tbBuff = 
{
	[1]  = {szName = "T®ng Sinh l˘c (%) "	, tbProp = {6, 1, 3534, 1, 0, 0}, nBuffID = 1298, },
	[2]  = {szName = "T®ng NÈi l˘c (%) "	, tbProp = {6, 1, 3535, 1, 0, 0}, nBuffID = 1299, },
	[3]  = {szName = "Gi∂m th‰ th≠¨ng"			, tbProp = {6, 1, 3536, 1, 0, 0}, nBuffID = 1300, },
	[4]  = {szName = "Gi∂m thÍi gian trÛng ÆÈc"			, tbProp = {6, 1, 3537, 1, 0, 0}, nBuffID = 1301, },
	[5]  = {szName = "Gi∂m thÍi gian tr◊ ho∑n"			, tbProp = {6, 1, 3538, 1, 0, 0}, nBuffID = 1302, },
	[6]  = {szName = "Gi∂m thÍi gian cho∏ng"			, tbProp = {6, 1, 3539, 1, 0, 0}, nBuffID = 1303, },
	[7]  = {szName = "T®ng kh∏ng hoµn toµn"			  , tbProp = {6, 1, 3540, 1, 0, 0}, nBuffID = 1304, },
	[8]  = {szName = "N©ng cao giÌi hπn m∏u trong cÒa b∂n th©n", tbProp = {6, 1, 3541, 1, 0, 0}, nBuffID = 1305, },
	[9]  = {szName = "T®ng tËc ÆÈ chπy"				, tbProp = {6, 1, 3542, 1, 0, 0}, nBuffID = 1306, },
	[10] = {szName = "T®ng n– tr∏nh"				, tbProp = {6, 1, 3543, 1, 0, 0}, nBuffID = 1307, },
	[11] = {szName = "HÓp thµnh k‹ n®ng c´ng k›ch"		  , tbProp = {6, 1, 3544, 1, 0, 0}, nBuffID = 1310, },
	[12] = {szName = "HÓp thµnh k‹ n®ng c´ng k›ch"		  , tbProp = {6, 1, 3545, 1, 0, 0}, nBuffID = 1310, },
	[13] = {szName = "T®ng tÿ l÷ tr‰ng k›ch"			, tbProp = {6, 1, 3546, 1, 0, 0}, nBuffID = 1311, },
	[14] = {szName = "T®ng tÿ l÷ tr‰ng k›ch ÆËi kh∏ng"		, tbProp = {6, 1, 3547, 1, 0, 0}, nBuffID = 1312, },
};

DungeonGlobalData.tbValidWaitMap = 
{
	[1] = {1  , 43 },
	[2] = {45 , 196},
	[3] = {198, 207},
	[4] = {224, 234},
	[5] = {319, 325},
	[6] = {332, 333},
	[7] = {340, 340},
};

DungeonGlobalData.tbGameServerInfo =
{
	[1] = 11,				   -- ≥…∂º
	[2] = 162,				  -- ¥Û¿Ì∏Æ
	[3] = 80,				   -- —Ô÷›
	[4] = 78,				   -- œÂ—Ù
	[5] = 1,					-- ∑ÔœË
	[6] = 37,				   -- „Íæ©
	[7] = 59,				   -- ÃÏÕı∞Ô
	[8] = 176,				  -- ¡Ÿ∞≤
};

function DungeonGlobalData:BubbleSort(t, func)
	local n = getn(t);
	for i = 1, n do
		for j = 1, n - i do
			if func(t[j], t[j + 1]) then
				t[j + 1], t[j] = t[j], t[j + 1];
			end
		end
	end
end

function DungeonGlobalData:IsInValidWaitMap(nMapId)
	print("[Function Stack] - DungeonGlobalData:IsInValidWaitMap(szRoleName) - publicdef.lua");

	local nValidWaitMapGroupNum = getn(DungeonGlobalData.tbValidWaitMap);
	for i = 1, nValidWaitMapGroupNum do
		local tbValidWaitMapInterval = DungeonGlobalData.tbValidWaitMap[i];
		if nMapId >= tbValidWaitMapInterval[1] and nMapId <= tbValidWaitMapInterval[2] then
			return 1;
		end
	end
	
	return
end

function DungeonGlobalData:CheckPlayerState()
	local nMapId = GetWorldPos()
	if not DungeonGlobalData:IsInValidWaitMap(nMapId) then
		print(">> Debug : player is in invalid map:"..nMapId);
		return nil;
	end

	if ST_GetOffliveState() == 1 or
	   GetOnlineCommissionStatus() == 1 or
	   GetStallState() == 1 then
	   return nil;
	end
	return 1;
end

function DungeonGlobalData:GetFnByTitle(nTitleLv)
	return DungeonGlobalData.tbFn[nTitleLv];
end

function DungeonGlobalData:GetIncreaseScorePoint(nKillerRank, nDeadthRank)
--	print("[Function Stack] - DungeonGlobalData:GetIncreaseScorePoint(nKillerRank, nDeadthRank) - publicdef.lua");
--	print(">> Debug : nKillerRank = "..nKillerRank);
--	print(">> Debug : nDeadthRank = "..nDeadthRank);
	
	if nKillerRank == nil or nDeadthRank == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank] == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank] == nil then
		return 0;
	end

	return DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank];
end

function DungeonGlobalData:GetDecreaseScorePoint(nKillerRank, nDeadthRank)
--	print("[Function Stack] - DungeonGlobalData:GetDecreaseScorePoint(nKillerRank, nDeadthRank) - publicdef.lua");
--	print(">> Debug : nKillerRank = "..nKillerRank);
--	print(">> Debug : nDeadthRank = "..nDeadthRank);
	if nKillerRank == nil or nDeadthRank == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank] == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank] == nil then
		return 0;
	end

	return DungeonGlobalData.tbDecreaseScore[nKillerRank][nDeadthRank];
end

function DungeonGlobalData:GetValidCombo(nKillerRank, nDeadthRank)
--	print("[Function Stack] - DungeonGlobalData:GetValidCombo(nKillerRank, nDeadthRank) - publicdef.lua");
--	print(">> Debug : nKillerRank = "..nKillerRank);
--	print(">> Debug : nDeadthRank = "..nDeadthRank);
	if nKillerRank == nil or nDeadthRank == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank] == nil or
	   DungeonGlobalData.tbIncreaseScore[nKillerRank][nDeadthRank] == nil then
		return 0;
	end

	return DungeonGlobalData.tbValidCombo[nKillerRank][nDeadthRank];
end

-- ∏˘æ›∏ˆ»Àª˝∑÷ªÒ»°≥∆∫≈µ»º∂
function DungeonGlobalData:ChooseTitleLv(nBattleScore)
	print("[Function Stack] - DungeonGlobalData:ChooseTitleLv(nBattleScore) - publicdef.lua");
	if nBattleScore == nil or nBattleScore < 0 then
		return 1;
	end

	local tbLvInfo = DungeonGlobalData.tbBattleTitleLvInfo;
	local nLvNum   = getn(tbLvInfo);
	for i = 1, nLvNum do
		if i == nLvNum and nBattleScore >= tbLvInfo[i][1] then
			return i;
		end

		if nBattleScore < tbLvInfo[i][2] and nBattleScore >= tbLvInfo[i][1] then
			return i;
		end
	end

	return 1;
end

function DungeonGlobalData:CreatePillarNpc(nMapID)
	print("[Function Stack] - DungeonGlobalData:CreatePillarNpc(nMapID) - publicdef.lua");

	if nMapID == nil or nMapID < 0 then
		print(">> Error : nMapID is invalid!");
		return nil;
	end
	print(">> Debug : nMapID = "..nMapID);

	local nMapIdx = SubWorldID2Idx(nMapID);
	if nMapIdx < 0 then
		print(">> Error : nMapIdx is invalid!");
		return nil;
	end
	print(">> Debug : nMapIdx = "..nMapIdx);

	-- ¥¥Ω®ÀŒ∑Ω÷˘◊”npc
	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[1];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[1];

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nMapIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- …Ë÷√¡Ÿ ±’Û”™
		SetTmpCamp(1, nNpcIdx);
		-- …Ë÷√À¿ÕˆΩ≈±æ
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_songpillar.lua");
	end

	-- ¥¥Ω®Ω∑Ω÷˘◊”npc
	tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[2];
	tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[2];

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nMapIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- …Ë÷√¡Ÿ ±’Û”™
		SetTmpCamp(2, nNpcIdx);
		-- …Ë÷√À¿ÕˆΩ≈±æ
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_jinpillar.lua");
	end

	-- ¥¥Ω®÷–—Î÷˘◊”
	tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[3];
	tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[3];

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nMapIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- …Ë÷√À¿ÕˆΩ≈±æ
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_middlepillar.lua");
	end

	return 1;
end

function DungeonGlobalData:CreateFightNpc(nMapID)
	print("[Function Stack] - DungeonGlobalData:CreateFightNpc(nMapID) - publicdef.lua");
	print(">> Debug : nMapID = "..nMapID);
	
	local nMapIdx = SubWorldID2Idx(nMapID);
	if nMapIdx < 0 then
		return nil;
	end
	print(">> Debug : nMapIdx = "..nMapIdx);

	-- ¥¥Ω®ÀŒ∑Ωnpc
	local tbNpcPos  = DungeonGlobalData.tbFightNpcPos[1];
	local tbNpcInfo = DungeonGlobalData.tbFightNpcInfo[1];
	local rtotal = 10000000;
	local i = 1;
	local j = 1;

	for i = 1, getn(tbNpcPos) do
		-- ÀÊª˙
		local rcur  = random(1, rtotal);
		local rstep = 0;

		for j = 1, getn(tbNpcInfo) do
			rstep = rstep + floor(tbNpcInfo[j].nRate * rtotal / 100);
			if(rcur <= rstep) then
				local nNpcIdx = AddNpcEx(
					tbNpcInfo[j].nNpcId,
					tbNpcInfo[j].nLevel,
					random(0, 4),
					nMapIdx,
					tbNpcPos[i][1] * 32,
					tbNpcPos[i][2] * 32,
					1,
					tbNpcInfo[j].szName,
					tbNpcInfo[j].nIsBoss
				);
				
				if nNpcIdx ~= nil and nNpcIdx > 0 then
					-- …Ë÷√¡Ÿ ±’Û”™
					SetTmpCamp(1, nNpcIdx);
					-- …Ë÷√À¿ÕˆΩ≈±æ
					SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_songsoldier.lua");
				end

				break;
			end
		end
	end

	-- ¥¥Ω®Ω∑Ωnpc
	tbNpcPos  = DungeonGlobalData.tbFightNpcPos[2];
	tbNpcInfo = DungeonGlobalData.tbFightNpcInfo[2];

	for i = 1, getn(tbNpcPos) do
		-- ÀÊª˙
		local rcur  = random(1, rtotal);
		local rstep = 0;

		for j = 1, getn(tbNpcInfo) do
			rstep = rstep + floor(tbNpcInfo[j].nRate * rtotal / 100);
			if(rcur <= rstep) then
				local nNpcIdx = AddNpcEx(
					tbNpcInfo[j].nNpcId,
					tbNpcInfo[j].nLevel,
					random(0, 4),
					nMapIdx,
					tbNpcPos[i][1] * 32,
					tbNpcPos[i][2] * 32,
					1,
					tbNpcInfo[j].szName,
					tbNpcInfo[j].nIsBoss
				);
				
				if nNpcIdx ~= nil and nNpcIdx > 0 then
					-- …Ë÷√¡Ÿ ±’Û”™
					SetTmpCamp(2, nNpcIdx);
					-- …Ë÷√À¿ÕˆΩ≈±æ
					SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_jinsoldier.lua");
				end

				break;
			end
		end
	end

	return 1;
end

function DungeonGlobalData:CheckActivityTime()					  -- ºÏ≤È «∑Ò‘⁄’Ω“€ø™∆Ù ±º‰
	local nCurTime = tonumber(GetLocalDate("%H"));
	for i = 1, getn(DungeonGlobalData.tbActivityTime) do
		if self.tbActivityTime[i] ~= nil		 and
		   nCurTime <= self.tbActivityTime[i][2] and 
		   nCurTime >= self.tbActivityTime[i][1] then
			return 1;
		end
	end

	return nil;
end

function DungeonGlobalData:CheckLegalPrepareMap(nCurMapID)		  -- ºÏ≤È≤Œ’Ω∫œ∑®µÿÕº
	if nCurMapID == nil then
		return nil;
	end

	if self.tbLegalPrepareMapList[nCurMapID] ~= nil then
		return 1;
	end

	return nil;
end

