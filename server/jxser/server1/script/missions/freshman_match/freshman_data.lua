LEVELTOP10 = "\\data\\bestlevel.dat"
MISSIONID_OUTER = 18
MISSIONID_INNER = 19

FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ

TITLETIME = 30 * 24 * 60 * 60 * 18

TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TRYOUT_TIMER_2 = 3 * 60 * 60 * FRAME2TIME; --Îª4Ð¡Ê±
TIMERID_SMALL_OUTER = 33
TIMERID_TOTAL_OUTER = 34


MATCH_TIMER_1 = 10 * FRAME2TIME; --5Ãë¹«²¼Ò»ÏÂÕ½¿ö
MATCH_TIMER_2 = 15 * 60 * FRAME2TIME; --Îª10·ÖÖÓ
TIMERID_SMALL_INNER = 35
TIMERID_TOTAL_INNER = 36


CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

FactionData = {
			{	"\\data\\shaolin_fresh.dat", "ShaoLin_Top5", "ThiÕu L©m"	},
			{	"\\data\\tianwang_fresh.dat", "TianWang_Top5", "Thiªn V­¬ng"	},
			{	"\\data\\tangmen_fresh.dat", "TangMen_Top5", "§­êng M«n"	},
			{	"\\data\\wudu_fresh.dat", "Wudu_Top5", "Ngò §éc"	},
			{	"\\data\\emei_fresh.dat", "EMei_Top5", "Nga Mi"	},
			{	"\\data\\cuiyan_fresh.dat", "CuiYan_Top5", "Thóy Yªn"	},
			{	"\\data\\gaibang_fresh.dat", "GaiBang_Top5", "C¸i Bang"	},
			{	"\\data\\tianren_fresh.dat", "TianRen_Top5", "Thiªn NhÉn"	},
			{	"\\data\\wudang_fresh.dat", "WuDang_Top5", "Vâ §ang"	},
			{	"\\data\\kunlun_fresh.dat", "KunLun_Top5", "C«n L«n"	}
		  }

FactionTitle = {
				"ThiÕu L©m kiÖt xuÊt",
				"Thiªn V­¬ng kiÖt xuÊt",
				"§­êng M«n  kiÖt xuÊt",
				"Ngò §éc kiÖt xuÊt",
				"Nga Mi  kiÖt xuÊt",
				"Thóy Yªn kiÖt xuÊt",
				"C¸i Bang kiÖt xuÊt",
				"Thiªn NhÉn  kiÖt xuÊt",
				"Vâ §ang  kiÖt xuÊt",
				"C«n L«n  kiÖt xuÊt"
				}
				
CP_MAPTAB = {
				{	396, 397, "ThiÕu L©m"	},
				{	398, 399, "Thiªn V­¬ng"	},
				{	400, 401, "§­êng M«n"	},
			 	{	402, 403, "Ngò §éc"	},
			 	{	404, 405, "Nga Mi"	},
			 	{	406, 407, "Thóy Yªn"	},
			 	{	408, 409, "C¸i Bang"	},
			 	{	410, 411, "Thiªn NhÉn"	},
			 	{	412, 413, "Vâ §ang"	},
			 	{	414, 415, "C«n L«n"	}
			 }

CP_TASKID_REGIST = 1095		--1£º±¨¹ýÃû£»9£ºÈ¡ÏûÁËÔ¤Ñ¡Èü×Ê¸ñ
CP_TASKID_POINT = 1096		--¼ÇÂ¼Ô¤Ñ¡ÈüµÃ·Ö
CP_TASKID_TITLE = 1097		--9£º¼ÇÂ¼ÒÑÈ¡µÃ¾öÈüÈ¦×Ê¸ñ
CP_TASKID_BID = 1098		--
CP_TASKID_ENEMY = 1099		--Ô¤ÈüÊ±¶ÔÊÖµÄÕóÓªºÅ
CP_TASKID_ROUND = 1100		--²ÎÈüµÄ´ÎÊý
CP_TASKID_WIN = 1101		--Ó®µÄ´ÎÊý
CP_TASKID_LOSE = 1102		--ÊäµÄ´ÎÊý£»µôÏßÅÐÊä£¬µ«ÎÞ·¨¼ÇÂ¼
CP_TASKID_TIE = 1103		--Æ½¾ÖµÄ´ÎÊý
CP_TASKID_FLAG = 1104		--Õý³£ÍË³öÈü³¡µÄ±ê¼Ç£¬ÔÚÏÂÒ»Èë³¡Ê±Ë¢ÐÂ
CP_TASKID_BACKCONT = 1105	--¶ÔÓÚ²ÎÓëÍ¶±êµÄÍæ¼Ò¸ù¾ÝÍ¶±ê×Ü½ð¶î£¬ÅÐ¶ÏÄÜÈ¡¼¸´Î
CP_TASKID_LOGOUT = 1094		--Îª 0 Ê±±íÃ÷Õý³£ÍË³ö£¬Îª 1 Ê±±íÊ¾·ÇÕý³£ÍË³ö£¨Èçµ±»ú¡¢Î´±£´æÊý¾Ý¡¢·þÎñÆ÷Ô­Òò£©
CP_CASH = 100000
CP_MAXROUND = 40
CP_PLNUM_LIMT = 4
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}

CP_AWARD_ITEM = {
					{"Tö Thñy Tinh", {4, 239}, 2},
					{"Lam Thñy Tinh", {4, 238}, 2},
					{"Lôc Thñy Tinh", {4, 240}, 2},
					{"Tinh Hång B¶o Th¹ch", {4, 353}, 2},
					{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 4", {6, 1, 147, 4, 0, 0}, 200},
					{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 5", {6, 1, 147, 5, 0, 0}, 50},
					{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", {6, 1, 147, 6, 0, 0}, 1},
					{"§¹i Phóc Duyªn Lé ", {6, 1, 124, 1, 0, 0}, 50},
					{"Trung  Phóc Duyªn Lé ", {6, 1, 123, 1, 0, 0}, 100},
					{"TiÓu Phóc Duyªn Lé ", {6, 1, 122, 1, 0, 0}, 200},
					{"Tiªn Th¶o Lé ", {6, 1, 71, 1, 0, 0}, 1500},
					{"Thiªn s¬n  B¶o Lé ", {6, 1, 72, 1, 0, 0}, 1991},
					{"§¹i B¹ch C©u hoµn", {6, 1, 130, 1, 0, 0}, 100},
					{"Hoa hång", {6, 0, 20, 1, 0, 0}, 2000},
					{"T©m T©m T­¬ng ¸nh phï ", {6, 1, 18, 1, 0, 0}, 2000},
					{"LÖnh bµi Phong L¨ng §é", {4, 489}, 100},
					{"Ph¸o Hoa", {6, 0, 11, 1, 0, 0}, 1700},
				}

CP_FORBID_ITEM = {
					{	"C«ng Tèc hoµn", {6, 1, 218, 1, 0, 0}, 511	},
					{	"Bµo Tèc hoµn", {6, 1, 219, 1, 0, 0}, 512	},
					{	"Phæ Phßng hoµn", {6, 1, 220, 1, 0, 0}, 513	},
					{	"§éc Phßng hoµn", {6, 1, 221, 1, 0, 0}, 514	},
					{	"B¨ng Phßng hoµn", {6, 1, 222, 1, 0, 0}, 515	},
					{	"Háa Phßng hoµn", {6, 1, 223, 1, 0, 0}, 516	},
					{	"L«i Phßng hoµn", {6, 1, 224, 1, 0, 0}, 517	},
					{	"Gi¶m Th­¬ng hoµn", {6, 1, 225, 1, 0, 0}, 518	},
					{	"Gi¶m H«n hoµn", {6, 1, 226, 1, 0, 0}, 519	},
					{	"Gi¶m §éc hoµn", {6, 1, 227, 1, 0, 0}, 520	},
					{	"Gi¶m B¨ng hoµn", {6, 1, 228, 1, 0, 0}, 521	},
					{	"Phæ C«ng hoµn", {6, 1, 229, 1, 0, 0}, 522	},
					{	"§éc C«ng hoµn", {6, 1, 230, 1, 0, 0}, 523	},
					{	"B¨ng C«ng hoµn", {6, 1, 231, 1, 0, 0}, 524	},
					{	"Háa C«ng hoµn", {6, 1, 232, 1, 0, 0}, 525	},
					{	"L«i C«ng hoµn", {6, 1, 233, 1, 0, 0}, 526	},
					{	"Tr­êng MÖnh hoµn", {6, 1, 234, 1, 0, 0}, 527	},
					{	"Tr­êng Néi hoµn", {6, 1, 235, 1, 0, 0}, 528	},
					{	"Yªn Hång ®an", {6, 1, 115, 1, 0, 0}, 450	},
					{	"X¸ Lam ®an", {6, 1, 116, 1, 0, 0}, 451	},
					{	"Néi Phæ hoµn", {6, 1, 117, 1, 0, 0}, 453	},
					{	"Néi §éc hoµn", {6, 1, 118, 1, 0, 0}, 454	},
					{	"Néi B¨ng hoµn", {6, 1, 119, 1, 0, 0}, 455	},
					{	"Néi Háa hoµn", {6, 1, 120, 1, 0, 0}, 456	},
					{	"Néi L«i hoµn", {6, 1, 121, 1, 0, 0}, 457	},
					{	"Tr­êng MÖnh hoµn", {6, 0, 1, 1, 0, 0}, 256	},
					{	"Gia Bµo hoµn", {6, 0, 2, 1, 0, 0}, 257	},
					{	"§¹i Lùc hoµn", {6, 0, 3, 1, 0, 0}, 258	},
					{	"Cao ThiÓm hoµn", {6, 0, 4, 1, 0, 0}, 259	},
					{	"Cao Trung hoµn", {6, 0, 5, 1, 0, 0}, 260	},
					{	"Phi Tèc hoµn", {6, 0, 6, 1, 0, 0}, 261	},
					{	"B¨ng Phßng hoµn", {6, 0, 7, 1, 0, 0}, 262	},
					{	"L«i Phßng hoµn", {6, 0, 8, 1, 0, 0}, 263	},
					{	"Háa Phßng hoµn", {6, 0, 9, 1, 0, 0}, 264	},
					{	"§éc Phßng hoµn", {6, 0, 10, 1, 0, 0}, 265	},
					{	"B¸nh ch­ng H¹t dÎ ", {6, 0, 60, 1, 0, 0}, 401	},
					{	"B¸nh ch­ng ThÞt heo", {6, 0, 61, 1, 0, 0}, 402	},
					{	"B¸nh ch­ng ThÞt bß ", {6, 0, 62, 1, 0, 0}, 403	},
					{	"B¸ch Qu¶ Lé ", {6, 1, 73, 1, 0, 0}, 442	},
					{	"C¸t t­êng hång bao", {6, 1, 19, 1, 0, 0}, 442	},
					{"Hoµng Kim B¶o r­¬ng",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\freshman_match\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\freshman_match\\trap\\trap_placetolinan.lua"


CP_UPTO_TRYOUT = 5060120
CP_END_TRYOUT = 5061023