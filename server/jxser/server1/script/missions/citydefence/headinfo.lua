----------------------------------------------------------------
--FileName:	headinfo.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ1£º»î¶¯Í·ÎÄ¼þ×Ô¶¨Òå³£Á¿
-----------------------------------------------------------------
IncludeLib("FILESYS");


--print(date("%w"))				--»ñµÃµ±Ç°·þÎñÆ÷ÐÇÆÚ 1--Monday£»2--Tuesday£»3--Wednesday£»4--Thursday£»5--Frieday£»6--Saturday£»0--Sunday
GV_TSK_CD_OPEN = 35
FIRE_OPENDAY_SATURDAY = 6;		--
FIRE_OPENDAY_SUNDAY = 0;		--
CD_LEVEL_LIMIT = 80		--×îµÍ²Î¼ÓÊØ³ÇµÈ¼¶
TASKID_FIRE_KEY = 1185;--random(1000000);					--Ã¿³¡´ÎµÄ¹Ø¼ü×Ö£¬ÓÉ´ËÅÐ¶ÏÊÇ·ñÎª±¾ÂÖ´Î²Î¼ÓµÄÍæ¼Ò
TASKID_FIRE_DAY = 1186;--tonumber(date("%m%d"));			--Íæ¼ÒÒ»ÌìÖ»ÄÜ²Î¼ÓÒ»³¡ÎÀ¹úÕ½Õù£¬¼ÇÂ¼ÈÕÆÚ
TASKID_FIRE_ADDR = 1187;--´«ÈëµÄµÄ³ÇÊÐID
--1189
FIRE_1RSTNPC_COUNT = 15000;
FIRE_2CNDNPC_COUNT = 2000;
FIRE_3RDNPC_COUNT = 1000;
FIRE_4THNPC_COUNT = 100;
FIRE_5THNPC_COUNT = 10;
tbNPC_COUNT = { 15000, 2000, 1000, 100, 10 }

TNPC_DOCTOR1 = 55;			--ËÎ¾üÒ½µÄNpcÄ£°åIDºÅ
TNPC_DOCTOR2 = 49;			--½ð¾üÒ½µÄNpcÄ£°åIDºÅ
TNPC_DEPOSIT = 625;			--´¢ÎïÏäNPCÄ£°åID
TNPC_CHEFU = 393;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;

					--ÁÐ±ø	Ð¡¶Ó³¤	¸±½«	´ó½«	ÔªË§
tbTNPC_SOLDIER = {	{1067,	1068,	1069,	1070,	1080},	--ËÎ
					{1072,	1073,	1074,	1075,	1090}}	--½ð
tbSOLDIER_NAME = {	"TiÓu hiÖu", "§éi tr­ëng", "Tiªn phong", "Chñ t­íng", "Chñ so¸i"	}
tbSOLDIER_LEVEL = {	95, 95, 95, 100, 120 }
tbFILE_NPCDEATH = 
	{
	"\\script\\missions\\citydefence\\npcdeath_1.lua",
	"\\script\\missions\\citydefence\\npcdeath_2.lua",
	"\\script\\missions\\citydefence\\npcdeath_3.lua",
	"\\script\\missions\\citydefence\\npcdeath_4.lua",
	"\\script\\missions\\citydefence\\npcdeath_5.lua",
	"\\script\\missions\\citydefence\\npcdeath_6.lua"
	};
tbDEFENCE_MAPID = { 516, 517 }
tbDEFENCE_SIGNMAP = { 518, 519 }
tbREVIVAL_POS = {
					{1621,3792},
					{1660,3853},
					{1646,3910},
					{1698,3898},
					{1659,3957}
				}
tbSIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}


tbDEFENCE_RETURN = {
						[1] = { 1520,3228, "Ph­îng T­êng Phñ ", 2 },	--·ïÏè
						[11] = { 3018,5089, "Thµnh §« Phñ ", 1 },	--³É¶¼
						[37] = { 1632,3185, "BiÖn Kinh Phñ ", 2 },	--ãê¾©
						[78] = { 1439,3214, "T­¬ng D­¬ng Phñ ", 1 },	--ÏåÑô
						[80] = { 1593,3197, "D­¬ng Ch©u Phñ ", 1 },	--ÑïÖÝ
						[162] = { 1470,3269, "§¹i Lý", 1 },	--´óÀí
						[176] = { 1392,3313, "L©m An Phñ ", 1 },	--ÁÙ°²
					}
					
tbDEFENCE_ANNOUNCE = {
			"Ng­êi ch¬i cã thÓ ®Õn Thµnh §« phñ, T­¬ng D­¬ng phñ, L©m An phñ, §¹i Lý phñ, D­¬ng Ch©u phñ ®èi tho¹i víi VÖ binh thµnh m«n ®Ó tham gia thñ thµnh phe Tèng.",
			"Ng­êi ch¬i cã thÓ ®Õn Ph­îng T­êng phñ, BiÖn Kinh phñ ®èi tho¹i víi VÖ binh thµnh m«n ®Ó tham gia thñ thµnh phe Kim."
}

FILE_PLAYERDEATH = 		"\\script\\missions\\citydefence\\playerdeath.lua";
FILE_DOCTOR = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_BOX = 				"\\script\\missions\\citydefence\\npc\\cd_box.lua";
FILE_DOCTOR1 = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_DOCTOR2 = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_CENTERTRAP1 = 		"\\script\\missions\\citydefence\\trap\\hometrap1.lua";
FILE_CENTERTRAP2 = 		"\\script\\missions\\citydefence\\trap\\hometrap2.lua";
FILE_CENTERTRAP3 = 		"\\script\\missions\\citydefence\\trap\\hometrap3.lua";
FILE_CD_TRANSER = 		"\\script\\missions\\citydefence\\npc\\cd_transer.lua"
FILE_SYMBOLNPC =		"";

FRAME2TIME = 18;				--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
MISSIONID = 23;					--mission±àºÅ
MAX_MEMBERCOUNT = 600;			--¹¥³ÇµØÍ¼×î´óÈËÊýÏÞÖÆ

SMALLTIMERID = 45;				--¼ÆÊ±Æ÷±àºÅ
TOTALTIMERID = 46;				--¼ÆÊ±Æ÷±àºÅ

SMALL_TIME = 20 * FRAME2TIME;				--Ã¿20Ãë¼ÆÊ±Ò»´Î
TOTAL_TIME = 150 * 60 * FRAME2TIME;			--150·ÖÖÓ¼ÆÊ±Ò»´Î£¬»î¶¯½áÊø
RUNGAME_TIME = 30 * 60 * FRAME2TIME / SMALL_TIME; --±¨Ãû30·ÖÖÓÖ®ºó£¬Æô¶¯
LASTREPORT_TIME = 145 * 60 * FRAME2TIME / SMALL_TIME;	--ÊØ³Ç×îºó5·ÖÖÓÃ»·ÖÖÓ£¬ÌáÊ¾Ò»´ÎÊ±¼ä

MS_STATE = 1;				--ÈÎÎñÖÐ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
MS_RANDKEY = 2;				--¼ÇÂ¼µ±Ç°ÈÎÎñÏÂµÄkey£¬Ëæ»úÊý
MS_OPENDAY = 3;				--¼ÇÂ¼µ±Ç°ÈÎÎñ¿ªÊ¼µÄÔÂ£¬ÈÕ
MS_CITYCAMP = 4;			--¼ÇÂ¼±¾ÕÅµØÍ¼µÄÕóÓª£¬ËÎ-1£»½ð-2
MS_SMALL_TIME = 5;			--¼ÇÂ¼smalltimer¼ÆÊ±Æ÷µÄ´ÎÊý
MS_BOSS4_DOWN = 6;			--Îª1ÒÑ²úÉúÐ¡boss£¬0»¹Î´
MS_BOSS5_DOWN	=	7;		--Îª1ÒÑ²úÉú´óboss£¬0»¹Î´
MS_TLCOUNT_COMMON = 8;		--É±ËÀµÄÆÕÍ¨¹ÖµÄ×ÜÊý
MS_CITYDEFENCE = 9;			--Îª0±íÊ¾µ½Ê±¼äÃ»ÓÐÍê³ÉÈÎÎñ£¬Îª1±íÊ¾ÈÎÎñÍê³É
MS_MISSIONID = 10;			--´æÈëµ±Ç°missionµÄID

MS_1RSTNPC_CCNT = 11;		--¼ÇÂ¼µ±Ç°10·ÖÖÓÄÚ£¬É±ËÀµÄ°×¹ÖÊýÁ¿
MS_2CNDNPC_CCNT = 12;		--¼ÇÂ¼µ±Ç°10·ÖÖÓÄÚ£¬É±ËÀµÄÀ¼¹ÖÊýÁ¿
MS_3RDNPC_CCNT = 13;			--¼ÇÂ¼µ±Ç°10·ÖÖÓÄÚ£¬É±ËÀµÄÉ±ÊÖ¼¶¹ÖÊýÁ¿
MS_4THNPC_CCNT = 14;			--¼ÇÂ¼µ±Ç°10·ÖÖÓÄÚ£¬É±ËÀµÄÐ¡BOSSÊýÁ¿
MS_5THNPC_CCNT = 15;			--¼ÇÂ¼µ±Ç°10·ÖÖÓÄÚ£¬É±ËÀµÄ´óBOSSÊýÁ¿

MS_1RSTNPC_TCNT = 16;		--¼ÇÂ¼Ò»¹²É±ËÀµÄ°×¹ÖÊýÁ¿
MS_2CNDNPC_TCNT = 17;		--¼ÇÂ¼Ò»¹²É±ËÀµÄÀ¼¹ÖÊýÁ¿
MS_3RDNPC_TCNT = 18;		--¼ÇÂ¼Ò»¹²É±ËÀµÄÉ±ÊÖ¼¶¹ÖÊýÁ¿
MS_4THNPC_TCNT = 19;		--¼ÇÂ¼Ò»¹²É±ËÀµÄÐ¡BOSSÊýÁ¿
MS_5THNPC_TCNT = 20;		--¼ÇÂ¼Ò»¹²É±ËÀµÄ´óBOSSÊýÁ¿

MS_HOMEOUT_X1 = 21;			--Ò°ÍâÍù´óÓªµÄ´«ËÍ×ø±êX£¬µÚÒ»ÀàTrap
MS_HOMEOUT_Y1 = 22;
MS_HOMEOUT_X2 = 23;			--Ò°ÍâÍù´óÓªµÄ´«ËÍ×ø±êX£¬µÚ¶þÀàTrap
MS_HOMEOUT_Y2 = 24;
MS_HOMEOUT_X3 = 25;			--Ò°ÍâÍù´óÓªµÄ´«ËÍ×ø±êX£¬µÚÈýÀàTrap
MS_HOMEOUT_Y3 = 26;

MS_CENTER_X1 = 27;			--´óÓªÍùÒ°ÍâµÄ´«ËÍ×ø±êX£¬µÚÒ»ÀàTrap
MS_CENTER_Y1 = 28;
MS_CENTER_X2 = 29;			--´óÓªÍùÒ°ÍâµÄ´«ËÍ×ø±êX£¬µÚÒ»ÀàTrap
MS_CENTER_Y2 = 30;
MS_CENTER_X3 = 31;			--´óÓªÍùÒ°ÍâµÄ´«ËÍ×ø±êX£¬µÚÒ»ÀàTrap
MS_CENTER_Y3 = 32;

MS_S_CMNPCFILE = 1;			--¼ÇÂ¼ÆÕÍ¨¹ÖµãµÄÎÄ¼þ
MS_S_JRNPCFILE = 2;			--¼ÇÂ¼Ð¡BOSS×ø±êµÄÎÄ¼þ
MS_S_SRNPCFILE = 3;			--¼ÇÂ¼´óBOSS×ø±êµÄÎÄ¼þ
MS_S_CD_NAME = 4;			--µ±Ç°ÊØ³ÇÕ½ÒÛµÄÃû×Ö
