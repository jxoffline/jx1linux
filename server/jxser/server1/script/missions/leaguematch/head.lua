
--if (WLLS_HEAD) then
--	return
--end
--
--WLLS_HEAD = 1


IL("FILESYS");
IL("ITEM");
IL("LEAGUE");
IL("SETTING");
IL("TITLE");
IL("RELAYLADDER");

Include("\\script\\lib\\common.lua")

-- 2006/04/21 ¼ÓÈë×°±¸Éı¼¶ÈÎÎñ - ÅåÀ×Ë¹
--Include("\\script\\task\\equipex\\head.lua");
Include("\\script\\tong\\tong_award_head.lua");--°ï»áÖÜÄ¿±ê
Include("\\script\\task\\task_addplayerexp.lua")  --¸øÍæ¼ÒÀÛ¼Ó¾­ÑéµÄ¹«¹²º¯Êı

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

WLLS_TAB = {}

--Global Value--
GLB_WLLS_PHASE	= 820	--±ÈÈüµ±Ç°Ëù´¦½×¶Î
GLB_WLLS_SID	= 821	--µ±Ç°Èü¼¾±àºÅ
GLB_WLLS_MATCHID= 822	--µ±Ç°±ÈÈü±àºÅ
GLB_WLLS_TYPE	= 823	--µ±Ç°Èü¼¾µÄÁªÈüÄ£Ê½
GLB_WLLS_NEXT	= 824	--ÏÂÒ»Èü¼¾µÄÁªÈüÄ£Ê½
GLB_WLLS_TIME	= 825	--¼ÆÊ±Æ÷¼ÆÊı
GLB_WLLS_CLOSE	= 826	--¹Ø±Õ¸ß¼¶ÁªÈü£¨2£© + ¹Ø±ÕĞÂĞãÁªÈü£¨1£©

--LG Task ID--
WLLS_LGTASK_MTYPE	= 11	--±ÈÈüÀàĞÍ
WLLS_LGTASK_LAST	= 1		--Ëù²Î¼ÓµÄ×îºóÒ»³¡±ÈÈü±àºÅ£¨½øÈë×¼±¸³¡¾ÍËã£©	
WLLS_LGTASK_SVRID	= 2 	--Ëù²Î¼ÓµÄ×îºóÒ»³¡±ÈÈü·şÎñÆ÷
WLLS_LGTASK_MSCAMP	= 3 	--Ëù²Î¼ÓµÄ×îºóÒ»³¡±ÈÈüMSÕóÓª
WLLS_LGTASK_POINT	= 4		--Õ½¶Ó»ñµÃ»ı·Ö
WLLS_LGTASK_RANK	= 5		--Õ½¶ÓÅÅÃû
WLLS_LGTASK_WIN		= 6		--Ê¤Àû´ÎÊı
WLLS_LGTASK_TIE		= 7		--Æ½¾Ö´ÎÊı
WLLS_LGTASK_TOTAL	= 8		--²ÎÈü´ÎÊı£¨Ê§°Ü´ÎÊı = TOTAL - WIN - TIE£©
WLLS_LGTASK_JOIN	= 9		--ÒÑ¾­½øÈë×¼±¸³¡µÄÈËÊı
WLLS_LGTASK_TIME	= 10	--Õ½¶·Ê±¼ä×Ü¼Æ
WLLS_LGTASK_STYPE	= 12	--×é½¨Ê±µÄÁªÈüÄ£Ê½
WLLS_LGTASK_EMY1	= 13	--×îºóµÄÒ»³¡±ÈÈüÓöµ½µÄ¶ÔÊÖ£¨Õ½¶ÓÃûString2ID£©
WLLS_LGTASK_EMY2	= 14	--µ¹ÊıµÚ¶ş³¡±ÈÈüÓöµ½µÄ¶ÔÊÖ
WLLS_LGTASK_EMY3	= 15	--µ¹ÊıµÚÈı³¡±ÈÈüÓöµ½µÄ¶ÔÊÖ
WLLS_LGTASK_TOTAL_EX= 16	--Ê¹ÓÃÑªÕ½ÁîÆìµÄ¸öÊı
WLLS_LGTASK_USE_LingQi_COUNT= 17	--À©Õ¹´ÎÊı²Î¼ÓµÄ¼¸´Î


WLLS_LGMTASK_JOB	= 1	--Ö°Î»:0¡¢¶ÓÔ±£»1¡¢¶Ó³¤
WLLS_LGMTASK_STATE	= 2	--Õ½¶Ó³ÉÔ±×´Ì¬£º0¡¢ÔÚ³¡Íâ£»1¡¢½øÈë×¼±¸³¡£»2¡¢±ÈÈüÖĞ
WLLS_LGMTASK_ADDSID	= 3	--ÔÚÄÄ¸öÈü¼¾¼ÓÈëÁË±¾Õ½¶Ó
WLLS_LGMTASK_WIN	= 4	--ĞèÒª²¹¼ÓµÄÊ¤Àû´ÎÊı
WLLS_LGMTASK_TIE	= 5	--ĞèÒª²¹¼ÓµÄÆ½¾Ö´ÎÊı
WLLS_LGMTASK_TOTAL	= 6	--ĞèÒª²¹¼ÓµÄ²ÎÈü´ÎÊı
WLLS_LGMTASK_OVER	= 7	--ÔÚÄÄ¸öÈü¼¾¼¶·¢ÉúÔ½¼¶

--Task ID--
WLLS_TB	=	1715
WLLS_TASKID_FROMMAP	= WLLS_TB	--À´×ÔµØÍ¼ID
WLLS_TASKID_FROM_X	= WLLS_TB+1	--À´×Ô×ø±êX
WLLS_TASKID_FROM_Y	= WLLS_TB+2	--À´×Ô×ø±êY
WLLS_TASKID_ORGCAMP	= WLLS_TB+3	--±ÈÈüÖĞÎÒ·½µÄMission Camp
WLLS_TASKID_GOTAWARD= WLLS_TB+4	--×îºóÒ»´ÎÁìÈ¡µÄ½±Àø Type:Level:Award:SID

WLLS_TASKID_WIN		= WLLS_TB+5	--¸öÈËÊ¤Àû´ÎÊı
WLLS_TASKID_TIE		= WLLS_TB+6	--¸öÈËÆ½¾Ö´ÎÊı
WLLS_TASKID_TOTAL	= WLLS_TB+7	--¸öÈË²ÎÈü´ÎÊı
WLLS_TASKID_POINT	= 2500		--¸öÈËÀÛ¼Æ»ı·Ö
WLLS_TASKID_HONOUR	= 2501		--¸öÈËÈÙÓşµãÊı£¨¿ÉÏûºÄ»ı·Ö£©

--WLLS_TASKID_AWIN	= WLLS_TB+8		--ÓÃÓÚÁìÈ¡²ÎÓë½±ÀøµÄÊ¤Àû¼ÆÊı
--WLLS_TASKID_ATOTAL	= WLLS_TB+9		--ÓÃÓÚÁìÈ¡²ÎÓë½±ÀøµÄ²ÎÈü¼ÆÊı
--WLLS_TASKID_AWARD	= WLLS_TB+10	--ÒÑ¾­ÁìÈ¡ÁËÄÄ¸öÂí£¬0¡¢ÎŞ£»1¡¢120¼¶£»2¡¢150¼¶

WLLS_TASKID_LGTYPE	= WLLS_TB+11	--Õ½¶ÓÀàĞÍ
WLLS_TASKID_LGPOINT	= WLLS_TB+12	--Õ½¶Ó»ı·Ö
WLLS_TASKID_LGRANK	= WLLS_TB+13	--Õ½¶ÓÅÅÃû
WLLS_TASKID_LGWIN	= WLLS_TB+14	--Õ½¶ÓÊ¤Àû´ÎÊı
WLLS_TASKID_LGTIE	= WLLS_TB+15	--Õ½¶ÓÆ½¾Ö´ÎÊı
WLLS_TASKID_LGTOTAL	= WLLS_TB+16	--Õ½¶Ó²ÎÈü´ÎÊı
WLLS_TASKID_LGTIME	= WLLS_TB+17	--Õ½¶ÓÕ½¶·Ê±¼ä	(1732)
WLLS_TASKID_EX		= WLLS_TB+18	--¶îÍâ±äÁ¿£¨0~10£©
WLLS_TASKID_SWITCH	= WLLS_TB+19	--¿ª¹Ø£º1.¼Ó¾­Ñé£¬2.¿Û³ı²¿·Ö¾­Ñé
WLLS_TASKID_AWARDEX	= WLLS_TB+20	-- »»/¸ø ½±Àø (Type:Level:AwardErr:Award)

WLLS_TEMPTASK		= 246
WLLS_STRINGTASK		= 5

--Mission--
WLLS_MSID_SCHEDULE	= 24	-- ×¼±¸³¡ MissionID
WLLS_MSID_COMBAT	= 25	-- ±ÈÈü³¡ MissionID
WLLS_MSID_GLB		= 26	-- È«¾Ö MissionID

WLLS_MSV_MSID	= 1	--±¾MissionµÄMissionID

--Mission Timer--
WLLS_TIMERID_SCHEDULE	= 50	--È«¾Ö¼ÆÊ±Æ÷
WLLS_TIMERID_COMBAT		= 51	--±ÈÈü³¡¼ÆÊ±Æ÷

WLLS_FRAME2TIME = 18	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
WLLS_TIMER_PREP_FREQ	= 10	--×¼±¸³¡¼ÆÊ±Æ÷´¥·¢ÆµÂÊ10Ãë
WLLS_TIMER_PREP_TOTAL	= 24	--×¼±¸Ê±¼ä4·ÖÖÓ£¨24¸ö±¨¸æÕ½¿öÊ±¼ä£©
WLLS_TIMER_FIGHT_FREQ	= 5		--Õ½¶·³¡±¨¸æÕ½¿öÆµÂÊ5Ãë
WLLS_TIMER_FIGHT_PREP	= 2		--Õ½¶·×¼±¸Ê±¼ä10Ãë £¨2¸ö±¨¸æÕ½¿öÊ±¼ä£©
WLLS_TIMER_FIGHT_TOTAL	= 120	--Õ½¶·Ê±¼ä10·ÖÖÓ £¨10*60/5¸ö±¨¸æÕ½¿öÊ±¼ä£©

--Const Value--
WLLS_LGTYPE		= 5	--Õ½¶ÓÀàĞÍ
WLLS_REG_LGTYPE	= 2	--µÇ¼Ç´¦Õ½¶ÓÀàĞÍ

WLLS_LEVEL_JUNIOR	= 80	--²Î¼ÓĞÂĞãÈüËùĞè×îĞ¡¼¶±ğ
WLLS_LEVEL_SENIOR	= 120	--²Î¼ÓÎäÁÖÈüËùĞè×îĞ¡¼¶±ğ

WLLS_MIN_TEAM	= 2	--±ÈÈü³¡ÖÁÉÙ¶àÉÙ²ÎÈü¶ÓÎé²Å¿ÉÒÔ¿ªÕ½

WLLS_MAPPOS_SIGN	= { 1523, 3024 }	--»á³¡½øÈë×ø±ê
WLLS_MAPPOS_PRE		= { 1596, 2977 }	--×¼±¸³¡½øÈë×ø±ê

WLLS_LingQi_PerCOUNT = 4

--ËÄ¸ö³ÇÊĞµÄÏàÓ¦µØÍ¼ĞÅÏ¢
WLLS_CITY_INDEX	= {
	[37]	= {1,1},
	[176]	= {1,2},
	[78]	= {1,3},
	[162]	= {2,1},
	[80]	= {2,2},
	[1]	= {2,3},
	[11]	= {2,4},
}

WLLS_MAX_COUNT	= 200	--Ã¿¸ö×¼±¸³¡×î¶àÈİÄÉ¶àÉÙÕ½¶Ó

WLLS_FILE_DEATHSCRIPT = "\\script\\missions\\leaguematch\\combat\\playerdeath.lua"

--Î¥½ûÒ©Æ·
WLLS_FORBID_ITEM = {
	{	"C«ng Tèc hoµn", {6, 1, 218, -1, 0, 0}, 511	},
	{	"Bµo Tèc hoµn", {6, 1, 219, -1, 0, 0}, 512	},
	{	"Phæ Phßng hoµn", {6, 1, 220, -1, 0, 0}, 513	},
	{	"§éc Phßng hoµn", {6, 1, 221, -1, 0, 0}, 514	},
	{	"B¨ng Phßng hoµn", {6, 1, 222, -1, 0, 0}, 515	},
	{	"Háa Phßng hoµn", {6, 1, 223, -1, 0, 0}, 516	},
	{	"L«i Phßng hoµn", {6, 1, 224, -1, 0, 0}, 517	},
	{	"Gi¶m Th­¬ng hoµn", {6, 1, 225, -1, 0, 0}, 518	},
	{	"Gi¶m H«n hoµn", {6, 1, 226, -1, 0, 0}, 519	},
	{	"Gi¶m §éc hoµn", {6, 1, 227, -1, 0, 0}, 520	},
	{	"Gi¶m B¨ng hoµn", {6, 1, 228, -1, 0, 0}, 521	},
	{	"Phæ C«ng hoµn", {6, 1, 229, -1, 0, 0}, 522	},
	{	"§éc C«ng hoµn", {6, 1, 230, -1, 0, 0}, 523	},
	{	"B¨ng C«ng hoµn", {6, 1, 231, -1, 0, 0}, 524	},
	{	"Háa C«ng hoµn", {6, 1, 232, -1, 0, 0}, 525	},
	{	"L«i C«ng hoµn", {6, 1, 233, -1, 0, 0}, 526	},
	{	"Tr­êng MÖnh hoµn", {6, 1, 234, -1, 0, 0}, 527	},
	{	"Tr­êng Néi hoµn", {6, 1, 235, -1, 0, 0}, 528	},
	{	"Yªn Hång ®an", {6, 1, 115, -1, 0, 0}, 450	},
	{	"X¸ Lam ®an", {6, 1, 116, -1, 0, 0}, 451	},
	{	" Néi Phæ hoµn", {6, 1, 117, -1, 0, 0}, 453	},
	{	" Néi §éc hoµn", {6, 1, 118, -1, 0, 0}, 454	},
	{	" Néi B¨ng hoµn", {6, 1, 119, -1, 0, 0}, 455	},
	{	" Néi Háa hoµn", {6, 1, 120, -1, 0, 0}, 456	},
	{	" Néi §iÖn hoµn", {6, 1, 121, -1, 0, 0}, 457	},
	{	"Tr­êng MÖnh hoµn", {6, 0, 1, -1, 0, 0}, 256	},
	{	"Gia Bµo hoµn", {6, 0, 2, -1, 0, 0}, 257	},
	{	"§¹i Lùc hoµn", {6, 0, 3, -1, 0, 0}, 258	},
	{	"Cao ThiÓm hoµn", {6, 0, 4, -1, 0, 0}, 259	},
	{	"Cao Trung hoµn", {6, 0, 5, -1, 0, 0}, 260	},
	{	"Phi Tèc hoµn", {6, 0, 6, -1, 0, 0}, 261	},
	{	"B¨ng Phßng hoµn", {6, 0, 7, -1, 0, 0}, 262	},
	{	"L«i Phßng hoµn", {6, 0, 8, -1, 0, 0}, 263	},
	{	"Háa Phßng hoµn", {6, 0, 9, -1, 0, 0}, 264	},
	{	"§éc Phßng hoµn", {6, 0, 10, -1, 0, 0}, 265	},
	{	"B¸nh ch­ng H¹t dÎ ", {6, 0, 60, -1, 0, 0}, 401	},
	{	"B¸nh ch­ng ThŞt heo", {6, 0, 61, -1, 0, 0}, 402	},
	{	"B¸nh ch­ng ThŞt bß ", {6, 0, 62, -1, 0, 0}, 403	},
	{	"B¸ch Qu¶ Lé ", {6, 1, 73, -1, 0, 0}, 442	},
	{	"C¸t t­êng hång bao", {6, 1, 19, -1, 0, 0}, 442	},
	{	"Hoµng Kim B¶o H¹p",	{6,	1,	69,	-1,	0,	0},	442},
	{	"Tİn Sø Méc yªu bµi",	{6,	1,	885,	-1,	0	,0},	542},
	{	"Tİn Sø §ång yªu bµi",	{6,	1,	886,	-1,	0	,0},	543},
	{	"Tİn Sø Ng©n yªu bµi",	{6,	1,	887,	-1,	0	,0},	544},
	{	"Tİn Sø Kim yªu bµi",	{6,	1,	888,	-1,	0	,0},	545},
	{	"Ngù Tø Tİn Sø yªu bµi",	{6,	1,	889,	-1,	0	,0},	546},
	{	"Bao D­îc hoµn ",	{6,	1,	910,	-1,	0	,0},	635},
	{	"Hép lÔ vËt Hång bao thÇn bİ",	{6,	1,	1074,	-1,	0	,0},	635},
	{	"Hép lÖ vËt [qu¶ Huy Hoµng]",	{6,	1,	1075,	-1,	0	,0},	635},
	{	"H×nh ném",		{6,	1,	1389,	-1,	0,	0},	635	},
	--tinhpn 20100720: forbid item
	{	"CÈm nang thay ®æi trêi ®Êt", {6, 1, 1781, -1, 0, 0},635},	
	{	"Méc ChÕ B¶o H¹p", {6, 1, 2318, -1, 0, 0},635},	
	{	"§ång ChÕ B¶o H¹p", {6, 1, 2319, -1, 0, 0},635},	
	{	"Ng©n ChÕ B¶o H¹p", {6, 1, 2320, -1, 0, 0},635},	
	{	"Hoµng Kim B¶o r­¬ng", {6, 1, 2321, -1, 0, 0},635},	
	{	"B¶o r­¬ng B¹ch Kim", {6, 1, 2322, -1, 0, 0},635},	
	{	"S¸t Thñ Bİ B¶o", {6, 1, 2347, -1, 0, 0},635},	
	{	"B¶o r­¬ng thÇn bİ cña D· TÈu", {6, 1, 2374, -1, 0, 0},635},	
	{	"Chİ T«n Bİ B¶o", {6, 1, 2375, -1, 0, 0},635},	
	{	"Tµi B¶o Thñy TÆc", {6, 1, 2376, -1, 0, 0},635},	
	{	"Håi thiªn t¸i t¹o lÔ bao", {6, 1, 2527, -1, 0, 0},635},
	{	"Phi tèc hoµn lÔ bao", {6, 1, 2520, -1, 0, 0},635},
	{	"§¹i lùc hoµn lÔ bao", {6, 1, 2517, -1, 0, 0},635},
	--Updated by DinhHQ - 20110425
	{	"C«ng Thµnh ChiÕn LÔ Bao", {6, 1, 2377, -1, 0, 0},635},
	{	"§éc phßng hoµn lÔ bao", {6, 1, 2524, -1, 0, 0},635},
	{	"Tr­êng mÖnh hoµn lÔ bao", {6, 1, 2515, -1, 0, 0},635},
	{	"Gia tèc hoµn lÔ bao", {6, 1, 2516, -1, 0, 0},635},
	{	"Cao thiÓm hoµn lÔ bao", {6, 1, 2518, -1, 0, 0},635},
	{	"Cao trung hoµn lÔ bao", {6, 1, 2519, -1, 0, 0},635},
	{	"Phi tèc hoµn lÔ bao", {6, 1, 2520, -1, 0, 0},635},
	{	"B¨ng phßng hoµn lÔ bao", {6, 1, 2521, -1, 0, 0},635},
	{	"L«i phßng hoµn lÔ bao", {6, 1, 2522, -1, 0, 0},635},
	{	"Háa phßng hoµn lÔ bao", {6, 1, 2523, -1, 0, 0},635},
	{	"§éc phßng hoµn lÔ bao", {6, 1, 2524, -1, 0, 0},635},
	{	"LÖnh bµi vi s¬n ®¶o lÔ bao", {6, 1, 2525, -1, 0, 0},635},
	{	"Hoµn Hån §¬n LÔ Bao", {6, 1, 2830, -1, 0, 0},635},
	{	"Tiªu Diªu T¸n", {6, 1, 2831, -1, 0, 0},635},
	{	"Hoµn Hån §¬n", {6, 1, 2837, -1, 0, 0},635},
}

WLLS_FORBID_STATES = {
	{"BÊt ®éng Minh V­¬ng ",	15},
	{"Nh­ Lai Thiªn DiÖp ",	273},
	{"TÜnh T©m QuyÕt",	33},
	{"Kim Chung Tr¸o",	42},
	{"Cöu Thiªn Cuång L«i ",	67},
	{"Xİch DiÖm Thùc Thiªn",	70},
	{"B¨ng Lam HuyÒn Tinh",	64},
	{"Xuyªn Y Ph¸ Gi¸p ",	356},
	{"V¹n §éc Thùc T©m",	73},
	{"Xuyªn T©m §éc Thİch",	72},
	{"§o¹n C©n Hñ Cèt ",	390},
	{"B¨ng T©m Tr¸i ¶nh",	269},
	{"Hé ThÓ Hµn B¨ng ",	100},
	{"TuyÕt ¶nh",	109},
	--´Ë¼¼ÄÜÒÑ¸ÄÎª±»¶¯¼¼ÄÜ£¬²»ÔÙÇå³ı	{"´ò¹·Õó",	124},
	{"Ho¹t BÊt L­u Thñ ",	277},
	{"Tóy §iÖp Cuång Vò ",	130},
	{"Háa Liªn PhÇn Hoa",	136},
	{"¶o ¶nh Phi Hå ",	137},
	{"Thiªn Ma Gi¶i ThÓ ",	150},
	{"Täa Väng V« Ng· ",	157},
	{"Thanh Phong phï ",	171},
	{"Ki B¸n phï ",	174},
	{"NhÊt Khİ Tam Thanh",	178},
	{"B¾c Minh §¸o H¶i",	393},
	{"Thiªn Thanh §Şa Träc",	173},
	{"Khi Hµn Ng¹o TuyÕt",	175},
	{"Tóy Tiªn T¸ Cèt",	394},
	{"lÖnh bµi kü n¨ng 1",	631},
	{"lÖnh bµi kü n¨ng 2",	632},
	{"lÖnh bµi kü n¨ng 3",	633},
	{"lÖnh bµi kü n¨ng 4",	634},
	{"lÖnh bµi kü n¨ng 5",	635},
	-- ¹úÕ½ËÎ½ğ¼¼ÄÜ²»ÄÜÔÚÁªÈüÖĞÊ¹ÓÃ=====>
	{"Kü n¨ng Tiªn Phong",	958},
	{"Kü n¨ng Nguyªn So¸i",959},		
	{"Kü n¨ng Thõa T­íng",	960},
	{"Kü n¨ng Hoµng §Õ",	961},
	{"Kü n¨ng Thiªn Tö",	962},
	{"Hoµn Hån §¬n kü n¨ng",	462},
	{"Tiªu Diªu T¸n kü n¨ng",	1052},
	-- ¹úÕ½ËÎ½ğ¼¼ÄÜ²»ÄÜÔÚÁªÈüÖĞÊ¹ÓÃ<=====
	--CËp nhËt thªm tr¹ng th¸i ©m d­¬ng ho¹t huyÕt ®¬n vµ kİch c«ng trî lùc hoµn - Modified By DinhHQ - 20110810
	{"Kİch C«ng Trî Lùc Hoµn",	1120},
	{"Kİch C«ng Trî Lùc Hoµn",261},		
	{"Kİch C«ng Trî Lùc Hoµn",	258},
	{"Kİch C«ng Trî Lùc Hoµn",	260},
	{"¢m D­¬ng Ho¹t HuyÕt §¬n",	1121},
	{"¢m D­¬ng Ho¹t HuyÕt §¬n",	256},
	{"¢m D­¬ng Ho¹t HuyÕt §¬n",	259},
	{"¢m D­¬ng Ho¹t HuyÕt §¬n",	257},
}

WLLS_LEVEL_DESC = {"Vâ l©m liªn ®Êu", "Vâ l©m liªn ®Êu"}
WLLS_AWARD_TITLE = {85, 81}	--ĞÂĞã¡¢¸ß¼¶³ÆºÅ½±Àø·Ö±ğÊÇ 85 86 87 88 ºÍ 81 82 83 84


WLLS_AWARD_TITLE_EX = 
{
	[1] = {204,205,206,207},
	[2] = {200,201,202,203},
	[3] = {200,201,202,203},
	[4] = {204,205,206,207},
	[5] = {204,205,206,207},
	[6] = {200,201,202,203},
	[7] = {81, 82, 83,84},
}


--Include("\\script\\missions\\leaguematch\\macthtype\\double.lua")
--
--
--Include("\\script\\missions\\leaguematch\\macthtype\\faction.lua")
--
--
--Include("\\script\\missions\\leaguematch\\macthtype\\teacher.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\three.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\single.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\series.lua")
--
--Include("\\script\\missions\\leaguematch\\macthtype\\mixeddoubles.lua")


----º¯Êı¶¨Òå----

--·µ»Øµ±Ç°½ÇÉ«Ó¦¸ÃÊôÓÚµÄ±ÈÈüÀàĞÍ£¬0Îª²»ÄÜ±ÈÈü
function wlls_player_type()
	local n_nexttype = GetGlbValue(GLB_WLLS_NEXT)
	return WLLS_TAB[n_nexttype].player_type()
end

--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
function wlls_check_addmem(n_capidx, n_lid, n_mtype)
	local n_nexttype = GetGlbValue(GLB_WLLS_NEXT)
	return WLLS_TAB[n_nexttype].check_addmem(n_capidx, n_lid, n_mtype)
end

--Ã¿³¡½áÊø¼Ó¾­Ñé
function wlls_award_pl_exp(n_rate, n_alevel)
	if (GetUUID() == 0) then	--ÏÂÏßµÄ²»¸ø¾­ÑéÁË
		wlls_award_log("Bëi v× ng­êi ch¬i ®· tho¸t m¹ng, kh«ng thÓ nhËn phÇn th­ëng kinh nghiÖm.")
		return
	end
	local n_level = GetLevel()
	if (n_level >= WLLS_LEVEL_SENIOR) then
		n_level = WLLS_LEVEL_SENIOR + n_alevel - 2
	elseif (n_level < 90) then
		n_level = 90
	end
	local n_exp = (700+floor((n_level*4-350)/5)*100)*60*0.6*n_rate
	wlls_add_exp(n_exp)
	local str = "NhËn ®­îc phÇn th­ëng thi ®Êu——<color=yellow>"..n_exp.."<color>®iÓm kinh nghiÖm"
	wlls_award_log(str)
	Msg2Player(str)
end

--¸ù¾İ²ÎÈüÀàĞÍ£¬È·¶¨±ÈÈü¼¶±ğ£¨1¡¢ĞÂĞã£»2¡¢ÁªÈü£©
function wlls_get_level(n_mtype)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	return WLLS_TAB[n_type].match_type[n_mtype].level
end

--Èç¹ûÎªnil»ò0£¬·µ»Ø1£¬·ñÔò·µ»Ø0
function FALSE(value)
	if (value == 0 or value == nil) then
		return 1
	else
		return nil
	end
end

--·µ»Øµ±Ç°½ÇÉ«Ó¦¸ÃÊôÓÚµÄ±ÈÈü¼¶±ğ£¬0Îª²»ÄÜ±ÈÈü
function wlls_player_level()
	local n_level = GetLevel()
	if (n_level >= WLLS_LEVEL_SENIOR) then
		return 2
	elseif (n_level >= WLLS_LEVEL_JUNIOR) then
		return 1
	else
		return 0
	end
end

--µÃµ½Ö¸¶¨µØÍ¼£¬n_whichmap£º1¡¢»á³¡£»2¡¢×¼±¸³¡£»3¡¢±ÈÈü³¡
--n_mtype, n_groupidÄ¬ÈÏÎªÓëµ±Ç°µØÍ¼¶ÔÓ¦µÄ
function wlls_get_mapid(n_whichmap, n_mtype, n_groupid)
	if (FALSE(n_mtype)) then
		n_mtype, n_groupid = wlls_get_mapinfo()
		if (FALSE(n_mtype)) then
			return nil
		end
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[n_type].match_type[n_mtype]
	if (not tb) then
		return nil
	end
	tb = tb.map[n_groupid]
	if (not tb) then
		return nil
	end
	return tb[n_whichmap]
end

--µÃµ½µ±Ç°µØÍ¼µÄÏà¹ØĞÅÏ¢£¬Ä¬ÈÏÎªÈ«²¿ĞÅÏ¢
--1¡¢±ÈÈüÀàĞÍ£»2¡¢³¡µØ×é±àºÅ£»3¡¢³¡µØÀàĞÍ
function wlls_get_mapinfo(n_idx)
	local n_mapid = SubWorldIdx2ID(SubWorld)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[n_type].map_index[n_mapid]
	if (not tb) then
		return nil
	end
	if (n_idx) then
		return tb[n_idx]
	else
		return unpack(tb)
	end
end

--µÃµ½µ±Ç°³ÇÊĞµØÍ¼µÄĞÅÏ¢£¨·µ»ØÖµ£º1ĞÂĞã/2ÎäÁÖ£¬µÚ¼¸¸ö(1/2/3)£©
function wlls_getcityinfo()
	local n_mapid = SubWorldIdx2ID(SubWorld)
	local tb = WLLS_CITY_INDEX[n_mapid]
	if (not tb) then
		return nil
	end
	return unpack(tb)
end

--µÃµ½µ±Ç°/Ö¸¶¨µØÍ¼µÄºº×ÖÃèÊö
--n_style£º1¡¢¼¶±ğÃû£»2¡¢¼¶±ğÃû+ÀàĞÍÃû£»3¡¢¼¶±ğÃû+ÀàĞÍÃû+³¡µØÃû
function wlls_get_desc(n_style, n_mtype, n_group, n_type)
	if (not n_mtype) then
		n_mtype, n_group = wlls_get_mapinfo()
		if (not n_mtype) then
			return WLLS_LEVEL_DESC[wlls_getcityinfo()]
		end
	end
	if not n_type then
		n_type = GetGlbValue(GLB_WLLS_TYPE)
	end
	local tb = WLLS_TAB[n_type].match_type[n_mtype]
	if (n_style == 2) then
		return WLLS_LEVEL_DESC[tb.level] .. tb.name
	elseif (n_style == 3) then
		return WLLS_LEVEL_DESC[tb.level] .. tb.name .. tb.map[n_group][4]
	else
		return WLLS_LEVEL_DESC[tb.level]
	end
end

--¼ì²éstr_plnameÊÇ·ñÊÇÖ¸¶¨ÀàĞÍ±ÈÈüµÄ²ÎÈüÑ¡ÊÖ£¬ÊÇÔò·µ»Øn_lid£¬·ñÔò·µ»Ønil
function wlls_check_player(str_plname, n_level, n_needtype)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		return nil
	end
	local n_stype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (n_stype ~= n_type) then
		return nil
	end
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	if (n_needtype) then
		if (n_needtype ~= n_mtype) then
			return nil
		else
			return n_lid
		end
	elseif (n_level == wlls_get_level(n_mtype)) then
		return n_lid, n_mtype
	else
		return nil
	end
end

--»ñµÃµ±Ç°Íæ¼ÒËùÔÚµÄÕ½¶ÓID¡¢²ÎÈüÀàĞÍ¡¢µ£ÈÎÖ°Îñ¡¢Õ½¶ÓÃû×Ö¡¢Õ½¶ÓÈËÊı
function wlls_lg_info(str_plname)
	if (not str_plname) then
		str_plname = GetName()
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		return nil
	end
	
	local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
	local str_lgname, _, n_mcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_JOB)
	return n_lid, n_mtype, n_job, str_lgname, n_mcount
end

--»ñµÃµ±Ç°Íæ¼ÒËùÔÚµÄÕ½¶ÓĞÅÏ¢£¨ÃæÏò¶ÔÏó·ç¸ñ£©
function wlls_GetLGInfo(szPlayerName)
	if (not szPlayerName) then
		szPlayerName = GetName()
	end
	
	local tbLG	= {}
	
	tbLG.nLGID = LG_GetLeagueObjByRole(WLLS_LGTYPE, szPlayerName)
	if (FALSE(tbLG.nLGID)) then
		return nil
	end
	
	tbLG.szName, _, tbLG.nMemCount = LG_GetLeagueInfo(tbLG.nLGID)
	tbLG.nNameID= Number2Int(String2Id(tbLG.szName))
	tbLG.nMType	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_MTYPE)
	tbLG.nPoint	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_POINT)
	tbLG.nWin	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_WIN)
	tbLG.nTie	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_TIE)
	tbLG.nTotal	= LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_TOTAL)
	tbLG.tbEmys	= {}
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY1)]	= 1
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY2)]	= 2
	tbLG.tbEmys[LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY3)]	= 3
	return tbLG
end

--È¡µÃÖ¸¶¨MapÉÏµÄMissionV
function wlls_getmapmissionv(n_mapid, n_valueid)
	local OldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(n_mapid)
	local n_value = GetMissionV(n_valueid) 
	SubWorld = OldSubWorld
	return n_value
end

--ÉèÖÃÖ¸¶¨MapÉÏµÄMissionV
function wlls_setmapmissionv(n_mapid, n_valueid, n_value)
	local OldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(n_mapid)
	SetMissionV(n_valueid, n_value)
	SubWorld = OldSubWorld
end

--ÉèÖÃÍæ¼Ò×´Ì¬
function wlls_set_pl_state()
	SetTaskTemp(200, 1)		--½ûÖ¹¸ü»»ÕóÓª
	SetLogoutRV(1);		--¶ÏÏßÓëËÀÍöÎªÒ»¸öÖØÉúµã
	SetPunish(0);		--ÎŞËÀÍö³Í·£
	DisabledStall(1)	--½ûÖ¹°ÚÌ¯
	ForbitTrade(1);		--½ûÖ¹½»Ò×
	DisabledUseTownP(1)	--ÏŞÖÆÆäÔÚ×¼±¸Ï¯ºÍ±ÈÈüÓÃµØÄÚÊ¹ÓÃ»Ø³Ç·û
	SetFightState(0);	--ÖÃÎª·ÇÕ½¶·×´Ì¬
	ForbitStamina(1)	--½ûÖ¹»ØÌå
end

--»Ö¸´Íæ¼Ò×´Ì¬
function wlls_clear_pl_state()
	SetCurCamp(GetCamp());	--ÁÙÊ±ÕóÓªÓëÕæÊµÕóÓªÒ»ÖÂ
	DisabledStall(0);	--ÔÊĞí°ÚÌ¯
	SetTaskTemp(200, 0);	--ÔÊĞí¸ü»»°ïÅÉÕóÓª
	SetPunish(1);	--ÓĞËÀÍö³Í·£
	ForbitTrade(0);		--ÔÊĞí½»Ò×
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	RestoreOwnFeature();
	SetFightState(0);	--ÖÃÎª·ÇÕ½¶·×´Ì¬
	DisabledUseTownP(0)
	ForbitStamina(0)	--ÔÊĞí»ØÌå
end

--·µ»ØMissionÖĞËùÓĞ²»Îª¿ÕµÄÕóÓª
function wlls_get_ms_troop()
	local tb_troop = {}
	local n_msid = GetMissionV(WLLS_MSV_MSID);
	
	for i = 1, WLLS_MAX_COUNT do
		if (GetMSPlayerCount(n_msid, i) > 0) then
			tb_troop[getn(tb_troop)+1] = i
		end
	end
	return tb_troop
end

--µÃµ½ÕóÓªÖĞËùÓĞ³ÉÔ±
function wlls_get_ms_plidx(n_camp)
	local tb_idx = {}
	local n_msid = GetMissionV(WLLS_MSV_MSID)
	local n_idx = 0
	local n_pidx
	repeat
		n_idx, n_pidx = GetNextPlayer(n_msid, n_idx, n_camp)
		if (n_pidx > 0 ) then
			tb_idx[getn(tb_idx)+1] = n_pidx
		end
	until (n_idx == 0)
	return tb_idx
end

--ÓÉMission Camp±àºÅ£¬µÃµ½Õ½¶ÓID¡¢Ãû³Æ
function wlls_camp2league(n_camp)
	_M("wlls_camp2league", n_camp)
	local n_msid = GetMissionV(WLLS_MSV_MSID);
	local _, n_pidx = GetNextPlayer(n_msid, 0, n_camp);
	if (n_pidx <= 0) then
		wlls_error_log("wlls_camp2league", "n_pidx <= 0", n_pidx, n_camp)
		return 0, ""
	end
	
	local n_oldidx = PlayerIndex
	PlayerIndex = n_pidx
	local str_plname = GetName()
	PlayerIndex = n_oldidx
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_camp2league", "FALSE(n_lid)", str_plname)
		return 0, ""
	end

	return n_lid, LG_GetLeagueInfo(n_lid)
end

--µÃµ½Ò»¸öÕóÓªÖĞËùÓĞÍæ¼ÒµÄÓĞĞ§ÉËº¦×ÜÊı
function wlls_get_ms_damage(n_camp)
	_M("wlls_get_ms_damage", n_camp)
	
	local n_damage	= 0
	
	-- Ã¿¸öÔÚ³¡ÈËÔ±ÉËº¦ÊıÀÛ¼Ó
	local n_oldidx	= PlayerIndex
	local tb_pidx	= wlls_get_ms_plidx(n_camp);
	for i = 1, getn(tb_pidx) do
	 	PlayerIndex = tb_pidx[i];
	 	n_damage	= n_damage + ST_GetDamageCounter();
	end
	PlayerIndex	= n_oldidx
	
	return n_damage
end

--½«Ö¸¶¨ÕóÓªÖĞµÄÈ«²¿Íæ¼ÒÒÆÖÁ»á³¡
function wlls_remove_camp(n_camp)
	_M("wlls_remove_camp", n_camp)
	local tb_idx = wlls_get_ms_plidx(n_camp)
	local n_signmap = wlls_get_mapid(1)
	local n_oldidx = PlayerIndex
	for i = 1, getn(tb_idx) do
		PlayerIndex = tb_idx[i]
		SetLogoutRV(0);		--ËÀÍöÖØÉúÓë¶ÏÏßÖØÉúµã²»ÔÚÍ¬Ò»µØµã
		NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	end
	PlayerIndex = n_oldidx
end




--¸öÈË²ÎÈü¼ÇÂ¼
function wlls_award_pl(nLevel, nWin, nTie, nTotal)
	_M("wlls_award_pl", nLevel, nWin, nTie, nTotal)
	--²ÎÈü¼ÆÊı
	if (nWin > 0) then	SetTask(WLLS_TASKID_WIN, GetTask(WLLS_TASKID_WIN) + nWin) end
	if (nTie > 0) then	SetTask(WLLS_TASKID_TIE, GetTask(WLLS_TASKID_TIE) + nTie) end
	if (nWin > 0 or nTie > 0) then
		local nPoint	= wlls_GetAddPoint(nLevel, nWin, nTie)
		SetTask(WLLS_TASKID_POINT, GetTask(WLLS_TASKID_POINT) + nPoint)
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		Msg2Player(format("Chóc mõng b¹n ®· nhËn ®­îc phÇn th­ëng --- §iÓm vinh dù lµ %d ®iÓm", nPoint))
		wlls_award_log(format("Chóc mõng b¹n ®· nhËn ®­îc phÇn th­ëng liªn ®Êu - §iÓm vinh dù lµ %d ®iÓm. Tæng céng cã %d ®iÓm", nPoint, GetTask(WLLS_TASKID_HONOUR)))
	end
	SetTask(WLLS_TASKID_TOTAL, GetTask(WLLS_TASKID_TOTAL) + nTotal)
end

--¼ÇÂ¼Õ½¼¨£¬Ó°ÏìÅÅÃû
function wlls_record_one_match_result(n_level, str_lgname, n_result, n_usedtime)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	local nWin, nTie	= 0, 0
	if (n_result == 1) then	--Ê¤
		nWin = 1
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_WIN, 1)
	elseif (n_result == 0) then	--Æ½
		nTie = 1
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TIE, 1)
	end
	local n_point	= wlls_GetAddPoint(n_level, nWin, nTie)
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_POINT, n_point)
	LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TIME, n_usedtime)
	_M("Thêi gian thi ®Êu tæng céng: "..(n_usedtime/18).." gi©y ")
	
	local _, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_oldidx = PlayerIndex
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_plidx = SearchPlayer(str_plname)
		if (n_plidx > 0) then
			PlayerIndex = n_plidx
			--start
			if (n_result == 1) then	--Ê¤
				
				SetTask(WLLS_TASKID_LGWIN, GetTask(WLLS_TASKID_LGWIN) + 1)
				if n_level == 2 then --ÎäÁÖÁªÈüÈ¡µÃÊ¤Àû¼Ó»îÔ¾¶È
					DynamicExecuteByPlayer(n_plidx, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "wulinliansai")
				end
			elseif (n_result == 0) then	--Æ½
				
				SetTask(WLLS_TASKID_LGTIE, GetTask(WLLS_TASKID_LGTIE) + 1)
			else	--¸º
				
			end
			wlls_award_pl(n_level, nWin, nTie, 1)
			SetTask(WLLS_TASKID_LGPOINT, GetTask(WLLS_TASKID_LGPOINT) + n_point)
			SetTask(WLLS_TASKID_LGTOTAL, GetTask(WLLS_TASKID_LGTOTAL) + 1)
			SetTask(WLLS_TASKID_LGTIME, GetTask(WLLS_TASKID_LGTIME) + n_usedtime)
			SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_LGTIME)
			SyncTaskValueMore(WLLS_TASKID_POINT, WLLS_TASKID_HONOUR)
		else	--ÈË²»ÔÚ£¬²¹¼Ó²ÎÈü¼ÇÂ¼
			if (n_result == 1) then	--Ê¤
				LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_WIN, 1, "", "")
			elseif (n_result == 0) then	--Æ½
				LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TIE, 1, "", "")
			end
			LG_ApplyAppendMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TOTAL, 1, "", "")
		end
	end
	PlayerIndex = n_oldidx
end


function wlls_AddMatchCount(str_lgname, nCount)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	if LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL) >= 48 then --´óÓÚ48³¡µÄ»°£¬Ôö¼ÓÀ©Õ¹´ÎÊı£¬·ñÔòÔö¼ÓÒ»´Î²Î¼Ó´ÎÊı
		
		
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TOTAL_EX, nCount)
	else
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_TOTAL, nCount)	
	end
end


function wlls_award_pl_Respect(nRespect)
	
	AddRespect(nRespect)
	Msg2Player(format("Uy danh t¨ng %d", nRespect))
	wlls_award_log(format("NhËn ®­îc phÇn th­ëng 1 trËn liªn ®Êu——uy danh %d ®iÓm, tæng céng cã %d ®iÓm uy danh", nRespect, GetRespect()))
end

--Õ½¶Ó²ÎÈü¼ÇÂ¼
function wlls_award_lg(n_level, str_lgname, n_result, n_usedtime)
	
	
	
	_M("wlls_award_lg", n_level, str_lgname, n_result, n_usedtime)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if (FALSE(n_lid)) then
		wlls_error_log("wlls_award_lg: FALSE(n_lid)")
		return
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL) + 1
	local nTotalEx = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL_EX) + 1
	local nMaxCountEx = LG_GetLeagueTask(n_lid, WLLS_LGTASK_USE_LingQi_COUNT) * WLLS_LingQi_PerCOUNT
	
	wlls_AddMatchCount(str_lgname, 1)--±ØĞë×¢Òâµ÷ÓÃÊ±»ú£¬·ñÔò¿ÉÄÜ³öÏÖÎÊÌâ
	
	if n_total <= 48 then
		wlls_record_one_match_result(n_level, str_lgname, n_result, n_usedtime)
	end
	
	local _, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_oldidx = PlayerIndex
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_plidx = SearchPlayer(str_plname)
		if (n_plidx > 0) then
			PlayerIndex = n_plidx
			
			G_ACTIVITY:OnMessage("LeagueResult", n_level, n_result);
			
			tongaward_league()--°ï»áÖÜÄ¿±ê£¬ÎäÁÖÁªÈü\script\tong\tong_award_head.lua
			--start
			if (n_result == 1) then	--Ê¤
				wlls_award_pl_exp(20 * 4, n_level)
				wlls_award_pl_Respect(3)
				
				
			elseif (n_result == 0) then	--Æ½
				wlls_award_pl_exp(10 * 4, n_level)
				wlls_award_pl_Respect(2)
			else	--¸º
				wlls_award_pl_exp(8 * 4, n_level)
				wlls_award_pl_Respect(1)
			end
			--end
			
			SetTask(WLLS_TASKID_ORGCAMP, 0)
			ST_StopDamageCounter()	-- Í£Ö¹ÉËº¦¼ÆËã
			if (n_total > 48 ) then
				local szMsg = format("§· tham gia %d trËn liªn ®Êu më réng vµ cßn %d trËn më réng", nTotalEx, nMaxCountEx - nTotalEx)
				Msg2Player(szMsg)
			end
		end
	end
	PlayerIndex = n_oldidx
end

--µÃ³ö×îÖÕ±ÈÈü½á¹û
function wlls_matchresult(str_league1, str_league2, result, n_usedtime)
	_M("wlls_matchresult", str_league1, str_league2, result, n_usedtime)
	local n_mtype = wlls_get_mapinfo(1)
	local n_level = wlls_get_level(n_mtype)
	local str = wlls_get_desc(2, n_mtype)
	if (not str_league2) then
		--ÂÖ¿ÕµÄ£¨×¢Òâ£ºÕâÊ±ÈËÔÚ×¼±¸³¡£©
		str_league2 = ""
		result = 1
		str = str.." ®éi ["..str_league1.."] giµnh th¾ng lîi"
		wlls_award_lg(n_level, str_league1, 1, n_usedtime)
	else
		if (result == 1) then	--Ê¤
			str = str.." ®éi ["..str_league1.."]chiÕn th¾ng ["..str_league2.."]!"
			wlls_award_lg(n_level, str_league1, 1, n_usedtime)
			wlls_award_lg(n_level, str_league2, 2, n_usedtime)
		else		--Æ½
			str = str.." ®éi ["..str_league1.."]cïng ®éi ["..str_league2.."] hßa nhau!"
			wlls_award_lg(n_level, str_league1, 0, n_usedtime)
			wlls_award_lg(n_level, str_league2, 0, n_usedtime)
		end
	end
	Msg2SubWorld("<color=cyan>"..str)
	--Msg2MSAll(WLLS_MSID_COMBAT, "<color=cyan>"..str)
	local n_mid = GetGlbValue(GLB_WLLS_MATCHID)
	local szResult = n_mtype.." "..n_mid.." "..str_league1.." "..str_league2.." "..result 
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\log.lua", "OnReceiveMatchResult", szResult , "", "")
	WriteLog(n_mid.."\t"..szResult)
end

--¼ì²éÍæ¼ÒÊÇ·ñÔÚMissionÄÚ£¬ÊÇÔò·µ»Ømscamp
function wlls_in_mission(n_msid, str_plname)
	local n_plidx = SearchPlayer(str_plname)
	if (n_plidx > 0) then
		local n_plmsidx = PIdx2MSDIdx(n_msid, n_plidx)
		if (n_plmsidx > 0) then
			return GetMSIdxGroup(n_msid, n_plmsidx)
		end
	end
end

--²éÕÒÊÇ·ñÓĞ¶ÓÓÑÔÚÖ¸¶¨MissionÄÚ£¬ÊÇÔò·µ»Ømscamp, lgname
function wlls_findfriend(n_msid, str_plname)
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (n_lid == 0) then
		--wlls_error_log("wlls_findfriend", "n_lid == 0")
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	for i = 0, n_memcount-1 do
		local str_friendname = LG_GetMemberInfo(n_lid, i)
		local n_mscamp = wlls_in_mission(n_msid, str_friendname)
		if (n_mscamp) then
			return n_mscamp, str_lgname
		end
	end
	return nil, str_lgname
end

function OnCancel()
end

--Èë³¡¼ì²é
function wlls_en_check()
	local forbiditem_con = 0
	local forbiditem_key = 0
	local keyitem = {}
	local keyitem_g = {}
	local keyitem_d = {}
	local keyitem_p = {}
	for i = 1, 3 do
		keyitem[i] = ITEM_GetImmediaItemIndex (i)
		if (keyitem[i] ~= 0) then
			keyitem_g[i], keyitem_d[i], keyitem_p[i] = GetItemProp(keyitem[i])
		else
			keyitem_g[i] = 0
			keyitem_d[i] = 0
			keyitem_p[i] = 0
		end
	end
	for i = 1, getn(WLLS_FORBID_ITEM) do
		forbiditem_con = CalcEquiproomItemCount( WLLS_FORBID_ITEM[i][2][1], WLLS_FORBID_ITEM[i][2][2], WLLS_FORBID_ITEM[i][2][3], WLLS_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		forbiditem_con = CalcItemCount( 1, WLLS_FORBID_ITEM[i][2][1], WLLS_FORBID_ITEM[i][2][2], WLLS_FORBID_ITEM[i][2][3], WLLS_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		for j = 1, 3 do 
			if (keyitem_g[j] == WLLS_FORBID_ITEM[i][2][1] and keyitem_d[j] == WLLS_FORBID_ITEM[i][2][2] and keyitem_p[j] == WLLS_FORBID_ITEM[i][2][3]) then
				forbiditem_key = 1
				break
			end
		end
	end
	if(forbiditem_con > 0 or forbiditem_key > 0) then
		Say("Ng­¬i thËt to gan! D¸m kh«ng tu©n lÖnh cña Vâ L©m Minh Chñ, tù ı ®em d­îc phÈm cÊm vµo, mau rêi khái ®©y!", 0)
		return nil
	end
	
--	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
--		Say("»á³¡¹ÙÔ±£ºÄãµÄ¿ì½İÀ¸Ä¿Ç°Ã»ÓĞ°Ú·ÅÈÎºÎÒ©Æ·£¬Äã»¹ÊÇ°ÑÒ©Æ··ÅÈë¿ì½İÀ¸°É£¡<color=red>½ø³¡ºó½«½ûÖ¹ÒÆ¶¯ÈÎºÎÎïÆ·£¬ÇëÈ·ÈÏÄãµÄ¿ì½İÀ¸ÎïÆ·ÒÑ¾­°Ú·ÅÍê±Ï£¡<color>", 0)
--		return nil
--	end
	
	return 1
end

--Í¬²½Õ½¶ÓĞÅÏ¢µ½¸öÈË
function wlls_sync_lginfo(n_lid)
	_M("wlls_sync_lginfo("..tostring(n_lid)..")")
	if (n_lid ~= 0) then
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		SetTask(WLLS_TASKID_LGTYPE, WLLS_TAB[n_type].match_type[n_mtype].level)
		SetTask(WLLS_TASKID_LGRANK, LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK))
		SetTask(WLLS_TASKID_LGPOINT, LG_GetLeagueTask(n_lid, WLLS_LGTASK_POINT))
		SetTask(WLLS_TASKID_LGWIN, LG_GetLeagueTask(n_lid, WLLS_LGTASK_WIN))
		SetTask(WLLS_TASKID_LGTIE, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIE))
		SetTask(WLLS_TASKID_LGTOTAL, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL))
		SetTask(WLLS_TASKID_LGTIME, LG_GetLeagueTask(n_lid, WLLS_LGTASK_TIME))
		SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_LGTIME)
	else
		SetTask(WLLS_TASKID_LGTYPE, 0)
		SyncTaskValue(WLLS_TASKID_LGTYPE)
		SyncTaskValueMore(WLLS_TASKID_WIN, WLLS_TASKID_TOTAL, 1)
	end
	SyncTaskValue(WLLS_TASKID_POINT)
	-- WLLS_TASKID_HONOUR ÒÑ×Ô¶¯Í¬²½
end

--¿ÉÉı¼¶µÄ¼Ó¾­Ñé
function wlls_add_exp(n_exp)
	local n_switch	= GetTask(WLLS_TASKID_SWITCH)
	local b_expswt	= GetBit(n_switch, 1)
	local b_expsub	= GetBit(n_switch, 2)
	if (b_expswt ~= 0) then
		Msg2Player("B¹n ®· thiÕt lËp ®ãng phÇn th­ëng kinh nghiÖm liªn ®Êu, phÇn th­ëng kinh nghiÖm cña b¹n ®· bŞ hñy bá. NÕu cÇn cã thÓ ®Õn gÆp Quan viªn liªn ®Êu thay ®æi l¹i thiÕt lËp nµy.")
		return
	end
	if (b_expsub ~= 0) then
		n_exp	= n_exp - GetTaskTemp(WLLS_TEMPTASK)
		Msg2Player("B¹n chØ nhËn ®­îc trong sè ®ã"..n_exp.."®iÓm kinh nghiÖm")
	end
	tl_addPlayerExp(n_exp)
end

--Ğ´Èë½±ÀøÈÕÖ¾
function wlls_award_log(str)
	_M(str)
	WriteLog("[WLLS_AWARD]"..date("%y-%m-%d,%H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str)
end

--¼ì²éÊÇ·ñ¿ÉÒÔ²Î¼Ó±¾Èü¼¾±ÈÈü£¬²»ÄÜ²Î¼Ó·µ»ØËµÃ÷ÎÄ×Ö£¬¿ÉÒÔ²Î¼ÓÔò·µ»Ønil
function wlls_levelcheck()
	local str_myname = GetName()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_myname)
	if (FALSE(n_lid)) then
		return nil
	end
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	if (GetGlbValue(GLB_WLLS_PHASE) == 1) then	--¼äĞªÆÚËãÏÂÒ»¸öÈü¼¾
		n_sid = n_sid + 1
	end
	local tb = {}
	for i = 0, n_memcount-1 do
		local str_plname = LG_GetMemberInfo(n_lid, i)
		local n_over = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_OVER)
		if (n_over > 0 and n_sid > n_over) then	--ÒÑ¾­Ô½¼¶£¬ÇÒÊÇÔÚÒÔÇ°Èü¼¾Ô½¼¶µÄ
			if (str_plname == str_myname) then
				return "Xin lçi, t­ c¸ch tham gia cña b¹n ®· bŞ hñy bá. Nguyªn nh©n cã thÓ trong lÇn thi ®Êu cña b¹n kú tr­íc qu¸ <color=red>®¼ng cÊp h¹n chÕ<color>, ®éi thi ®Êu hoÆc <color=red>®éi tr­ëng (s­ phô) cña b¹n ®· rêi khái ®éi thi ®Êu<color>. Mêi b¹n rêi khái ®éi thi ®Êu hiÖn t¹i, nÕu kh«ng ®éi b¹n sÏ kh«ng ®­îc tham gia thi ®Êu."
			end
			tb[getn(tb)+1] = str_plname
		end
	end
	if (getn(tb) == 0) then
		return nil
	end
	return "Xin lçi! mét sè thµnh viªn trong ®éi ®· qu¸ ®¼ng cÊp h¹n chÕ trong thi ®Êu kú tr­íc: <color=red>"..join(tb, "  ").."<color><enter>Nhãm cña b¹n kh«ng thÓ tham gia mïa thi ®Êu nµy. NÕu muèn b¹n cã thÓ rêi nhãm."
end

--µÃµ½µ±Ç°·şÎñÆ÷ÉÏËùÓĞÖ¸¶¨ÀàĞÍµÄµØÍ¼£¨¸ñÊ½£º[SubWorld] = GroupIdx£©
function wlls_get_subworld(nMapType)
	local tbSub = {}
	local nSType = GetGlbValue(GLB_WLLS_TYPE)
	local tb = WLLS_TAB[nSType].match_type
	for nMType = 1, getn(tb) do
		local tbMaps = tb[nMType].map
		local nGroups	= getn(tbMaps)
		for nGroupIdx = 1, nGroups do
			local nSubIdx = SubWorldID2Idx(tbMaps[nGroupIdx][nMapType])
			if (nSubIdx >= 0) then
				tbSub[nSubIdx] = (nMType-1)*nGroups + nGroupIdx
			end
		end
	end
	return tbSub
end

--ËÍµ½½øÈëÁªÈüÖ®Ç°µÄµØ·½
function wlls_transback()
	SetLogoutRV(0);
	NewWorld(GetTask(WLLS_TASKID_FROMMAP), GetTask(WLLS_TASKID_FROM_X), GetTask(WLLS_TASKID_FROM_Y))
end

--¸ù¾İ ²ÎÈü¼¶±ğ¡¢Ê¤Æ½³¡Êı£¬¼ÆËãÓ¦µÃ»ı·Ö
function wlls_GetAddPoint(nLevel, nWin, nTie)
	return nWin * 5 * nLevel + nTie * 2 * nLevel
end

--ÅĞ¶Ïµ±Ç°ÁªÈüÊÇ·ñ¿ªÆô
function wlls_CheckIsOpen(nLevel)
	local nClose = GetGlbValue(GLB_WLLS_CLOSE)
	if (nClose) then
		if (GetBit(nClose, nLevel) ~= 0) then
			Say(wlls_npcname().."Xin lçi! M¸y chñ "..WLLS_LEVEL_DESC[nLevel].."hiÖn ®ang t¹m dõng!", 0)
			return nil
		end
	end
	return 1
end

--´íÎóÈÕÖ¾
function wlls_error_log(...)
	local str = "WLLS_ERROR["..tostring(GetName()).."]("..tostring(SubWorldIdx2ID(SubWorld))..")"..date("%y-%m-%d,%H:%M:%S")..": "..join(arg)
	WriteLog(str)
	_ERRORMESSAGE(str)
	--error(str)
end

--µ÷ÊÔÓÃÊä³ö
function _M(...)
	--local str = join(arg)
	--Msg2Player("DEBUG:<color=white>"..str)
	--str = "DEBUG["..tostring(GetName()).."]("..tostring(SubWorldIdx2ID(SubWorld))..")"..date("%y-%m-%d,%H:%M:%S")..": "..str
	--print(str)
	--WriteLog(str)
end
