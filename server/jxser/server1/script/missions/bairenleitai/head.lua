-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æ´óÂ½°æ - °ÙÈËÀÞÌ¨Í·ÎÄ¼þ
-- ÎÄ¼þÃû¡¡£ºhead.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2011-04-24 15:08:47

-- ======================================================

tbArena_Info = {
	
	[1] = {
		nIndex = 1,
		InPos = {1784,3099},	-- ½øÀÞÌ¨×ø±ê
		OutPos = {
					{1776,3087},
					{1776,3115},
					{1796,3086},
					{1796,3116},
				},	-- ³öÀÞÌ¨×ø±ê
		NpcPos = {1789,3103},	-- ÀÞÌ¨Ë¢NPCµã
		RevivalPos = {1749, 3135},
	},
	[2] = {
		nIndex = 2,
		InPos = {1744,3061},
		OutPos = {
					{1737,3051},
					{1737,3077},
					{1757,3050},
					{1758,3077},
				},
		NpcPos = {1750,3065},
		RevivalPos = {1749, 3135},
	},
	[3] = {
		nIndex = 3,
		InPos = {1822,3138},
		OutPos = {
					{1816,3125},
					{1814,3153},
					{1836,3127},
					{1835,3153},

		},
		NpcPos = {1828,3142},
		RevivalPos = {1749, 3135},

	},
	[4] = {
		nIndex = 4,
		InPos = {1705,3101},

		OutPos = {
					{1699,3087},
					{1698,3116},
					{1720,3088},
					{1719,3117},

		},
		NpcPos = {1710,3104},
		RevivalPos = {1749, 3135},

	},
	[5] = {
		nIndex = 5,
		InPos = {1781,3178},

		OutPos = {
					{1774,3192},
					{1776,3163},
					{1795,3164},
					{1795,3190},

		},	-- 
		NpcPos = {1788,3181},	-- 
		RevivalPos = {1749, 3135},
	},
};


tbTimerInfo = {
	nApply = 30*18,		-- ÀÞÖ÷ÉÏÌ¨£¬µÈ´ýÊ±¼ä
	nPrepare = 3*18,		-- ÌôÀÞ×¼±¸Ê±¼ä
	nFight = 3*60*18,--3*60*18,	-- ±ÈÈüÊ±¼ä
	nSchedule = 1*60*18,	-- µ÷¶ÈÊ±¼ä
	
};

tbTrapFile = {
	szPosFile = "\\settings\\maps\\missions\\bairenleitai\\arena%d.txt",
	szScriptFile = "\\script\\missions\\bairenleitai\\trap_arena.lua",
	
	szBeautyFile = "\\settings\\maps\\missions\\bairenleitai\\drummer.txt",
	szObstacleFile = "\\settings\\maps\\missions\\bairenleitai\\obstacle.txt",
	szEnterMapFile = "\\settings\\maps\\missions\\bairenleitai\\inmap.txt",
};

tbNpcFile = {
	szFightNpc = "\\script\\missions\\bairenleitai\\npc_death.lua",
	szTranserNpc = "\\script\\missions\\bairenleitai\\npc_trans.lua",
	szBeautyNpc = "\\script\\missions\\bairenleitai\\npc_beauty.lua",
	szBox = "\\script\\missions\\bairenleitai\\npc_chuwuxiang.lua",
	szDrugstore = "\\script\\missions\\bairenleitai\\npc_store.lua",
	
};

tbNpcTypeList = {--npcµÄÀàÐÍ
	[1] = {
			nNpcId = 1786,
			szName = "Cao thñ Thiªn V­¬ng B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 0,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[2] = {
			nNpcId = 1787,
			szName = "Cao thñ ThiÕu L©m B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 0,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[3] = {
			nNpcId = 1788,
			szName = "Cao thñ Ngò §éc B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 1,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[4] = {
			nNpcId = 1789,
			szName = "Cao thñ §­êng M«n B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 1,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[5] = {
			nNpcId = 1790,
			szName = "Cao thñ Nga Mi B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 2,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[6] = {
			nNpcId = 1791,
			szName = "Cao thñ Thóy Yªn B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 2,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[7] = {
			nNpcId = 1792,
			szName = "Cao thñ Thiªn NhÉn B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 3,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[8] = {
			nNpcId = 1793,
			szName = "Cao thñ C¸i Bang B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 3,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[9] = {
			nNpcId = 1794,
			szName = "Cao thñ Vâ §ang B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 4,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[10] = {
			nNpcId = 1795,
			szName = "Cao thñ C«n L«n B¸ch Nh©n L«i §µi",
			nLevel = 90,
			nSeries = 4,
			nIsboss = 1, --¶Ô»°npc¿ÉÒÔ²»ÐèÒªÕâ¸ö
	},
	[11] = {
			nNpcId = 1571,
			szName = "Cæ Thñ",
			nLevel = 90,
			szScriptPath = tbNpcFile.szBeautyNpc,
			nTime = 15*60,
	},
};

TSK_LEAVERMAPID = 2323	--´æ´¢Àë¿ª±¨ÃûµãµÄmapid
TSK_LEAVERPOSX = 2324	--´æ´¢Àë¿ª±¨ÃûµãµÄx×ø±êµã
TSK_LEAVERPOSY = 2325	--´æ´¢Àë¿ª±¨ÃûµãµÄy×ø±êµã

HA_MAXSTAYTIME = 90*60	-- 90·ÖÖÓ×î³¤Í£ÁôÊ±¼ä
HA_DOUBLETIME = 30*60	-- 30·ÖÖÓË«±¶Ð§¹û
