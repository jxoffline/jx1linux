SCRIPT_WARRIORDEATH = "\\script\\missions\\sevencity\\warrior_death.lua"	-- Íæ¼ÒËÀÍö½Å±¾
SCRIPT_MONSTERDEATH	= "\\script\\missions\\sevencity\\monster_death.lua"	-- ÁúÖùËÀÍö½Å±¾

FIELD_CHENGDU	= 926	-- ³É¶¼Õ½³¡
FIELD_BIANJING	= 927	-- ãê¾©Õ½³¡
FIELD_DALI		= 928	-- ´óÀíÕ½³¡
FIELD_FENGXIANG	= 929	-- ·ïÏèÕ½³¡
FIELD_LINAN 	= 930	-- ÁÙ°²Õ½³¡
FIELD_XIANGYANG	= 931	-- ÏåÑôÕ½³¡
FIELD_YANGZHOU	= 932	-- ÑïÖÝÕ½³¡

FIELD_LIST = {
	FIELD_CHENGDU,		-- ³É¶¼Õ½³¡
	FIELD_BIANJING,		-- ãê¾©Õ½³¡
	FIELD_DALI,			-- ´óÀíÕ½³¡
	FIELD_FENGXIANG,	-- ·ïÏèÕ½³¡
	FIELD_LINAN,		-- ÁÙ°²Õ½³¡
	FIELD_XIANGYANG,	-- ÏåÑôÕ½³¡
	FIELD_YANGZHOU,		-- ÑïÖÝÕ½³¡
}

BATTLE_LIST = {
	[11	] = FIELD_CHENGDU,		-- ³É¶¼Õ½³¡
	[37	] = FIELD_BIANJING,		-- ãê¾©Õ½³¡
	[162] = FIELD_DALI,			-- ´óÀíÕ½³¡
	[1	] = FIELD_FENGXIANG,	-- ·ïÏèÕ½³¡
	[176] = FIELD_LINAN,		-- ÁÙ°²Õ½³¡
	[78	] = FIELD_XIANGYANG,	-- ÏåÑôÕ½³¡
	[80	] = FIELD_YANGZHOU,		-- ÑïÖÝÕ½³¡
}

PARAM_LIST = {
	FIELD_TONGMEMBER 	= 100, 			-- Ã¿¸ö³¡µØÃ¿¸ö°ï»á×î´óÈËÊýÏÞÖÆ
	WORLD_TONGMEMBER 	= 200,			-- Õû¸ö³ÇÕ½Ã¿¸ö°ï»á×î´óÈËÊýÏÞÖÆ
	EXPTIMER_INTERVAL	= 1 * 60 * 18,	-- ¸ø¾­Ñé½±ÀøµÄ¼ä¸ô£¨Ö¡Êý£©
	TIMEOUT_MONSTER		= 35 * 60 * 18,	-- ÁúÖùÎÞµÐÊ±¼ä£¨Ö¡Êý£©
	TIMEOUT_SCORE		= 300 * 18,		-- ÁúÖù»ý·Ö½±ÀøÊ±¼ä£¨Ö¡Êý£©
}

CAMP_MONSTER 				= 1
SIGNUP_MONEY 				= 20000000
SIGNUP_TIAOZHANLINGCOUNT	= 2000
TIMEAWARD_EXP				= 500000
TIMEAWARD_SCORE				= 1

MAP_INFO = {
	[FIELD_FENGXIANG] = {
		CityIndex = 1,
		CityName = "Ph­îng T­êng",
		Name = "ChiÕn tr­êng Ph­îng T­êng",
		OutPos = {1, 1643, 3271},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {56608, 112416},		-- ÁúÖù×ø±ê
		},
	[FIELD_CHENGDU	] = {
		CityIndex = 2,
		CityName = "Thµnh §«",
		Name = "ChiÕn tr­êng Thµnh §«",
		OutPos = {11, 3187, 5183},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {54976, 105600},		-- ÁúÖù×ø±ê
		},
	[FIELD_DALI		] = {
		CityIndex = 3,
		CityName = "§¹i Lý",
		Name = "ChiÕn tr­êng §¹i Lý",
		OutPos = {162, 1681, 3277},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {55040, 105568},		-- ÁúÖù×ø±ê
		},
	[FIELD_BIANJING	] = {
		CityIndex = 4,
		CityName = "BiÖn Kinh",
		Name = "ChiÕn tr­êng BiÖn Kinh",
		OutPos = {37, 1693, 3213},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {56192, 108384},		-- ÁúÖù×ø±ê
		},
	[FIELD_XIANGYANG] = {
		CityIndex = 5,
		CityName = "T­¬ng D­¬ng",
		Name = "ChiÕn tr­êng T­¬ng D­¬ng",
		OutPos = {78, 1583, 3381},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {54944, 105568},		-- ÁúÖù×ø±ê
		},
	[FIELD_YANGZHOU	] = {
		CityIndex = 6,
		CityName = "D­¬ng Ch©u",
		Name = "ChiÕn tr­êng D­¬ng Ch©u",
		OutPos = {80, 1693, 3219},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {55008, 105568},		-- ÁúÖù×ø±ê
		},
	[FIELD_LINAN	]= {
		CityIndex = 7,
		CityName = "L©m An",
		Name = "ChiÕn tr­êng L©m An",
		OutPos = {176, 1690, 3290},			-- ³öÕ½³¡Î»ÖÃ
		MonsterPos = {56160, 108512},		-- ÁúÖù×ø±ê
		},
}
