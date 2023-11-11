----------------------------------------------------------------
--FileName:	headinfo.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ1£º»î¶¯Í·ÎÄ¼þ×Ô¶¨Òå³£Á¿
-----------------------------------------------------------------
IncludeLib("FILESYS");
--IncludeLib("BATTLE");
IncludeLib("TITLE");
IncludeLib("RELAYLADDER")
Include( "\\script\\task\\system\\task_string.lua" );

--print(date("%w"))				--»ñµÃµ±Ç°·þÎñÆ÷ÐÇÆÚ 1--Monday£»2--Tuesday£»3--Wednesday£»4--Thursday£»5--Frieday£»6--Saturday£»0--Sunday
GV_TSK_CD_OPEN = 35
FIRE_OPENDAY_SATURDAY = 6;		--
FIRE_OPENDAY_SUNDAY = 0;		--
CD_LEVEL_LIMIT = 80		--×îµÍ²Î¼ÓÊØ³ÇµÈ¼¶
TASKID_FIRE_KEY = 1185;--random(1000000);					--Ã¿³¡´ÎµÄ¹Ø¼ü×Ö£¬ÓÉ´ËÅÐ¶ÏÊÇ·ñÎª±¾ÂÖ´Î²Î¼ÓµÄÍæ¼Ò
TASKID_FIRE_DAY = 1186;--tonumber(date("%m%d"));			--Íæ¼ÒÒ»ÌìÖ»ÄÜ²Î¼ÓÒ»³¡ÎÀ¹úÕ½Õù£¬¼ÇÂ¼ÈÕÆÚ
TASKID_FIRE_ADDR = 1187;--´«ÈëµÄµÄ³ÇÊÐID
--1189
TSKID_FIRE_SIGNLVL = 1867	--±¨ÃûÊ±µÈ¼¶
TSKID_FIRE_SIGNEXP = 1868	--±¨ÃûÊ±¾­ÑéÖµ
TSKID_FIRE_SUMEXP = 1869	--»ñµÃµÄ¾­ÑéÖµ
TSKID_PLAYER_ZHANGONG = 1879 --»ñµÃµÄÕ½¹¦Öµ
FIRE_JOINUP_FEE = 100000;			--±¨Ãû·ÑÓÃ10wÁ½
PL_TOTALPOINT = 1
--LADDER_ID_TEMP = 10255	--ÔÝ´æÅÅÐÐ°ñ
--LADDER_ID_FANIEL = 10256--×îÖÕÅÅÐÐ

MAX_NPC_COUNT = 500--1000--5000;	--ÏÞÖÆµØÍ¼ÖÐ×î¶àÓÐ5000¸önpc

FIRE_1RSTNPC_COUNT = 13500--15000;
FIRE_2CNDNPC_COUNT = 3000--2000;
FIRE_3RDNPC_COUNT = 1500--1000;
FIRE_4THNPC_COUNT = 120;
FIRE_5THNPC_COUNT = 10;

TNPC_DOCTOR1 = 55;			--ËÎ¾üÒ½µÄNpcÄ£°åIDºÅ
TNPC_DOCTOR2 = 49;			--½ð¾üÒ½µÄNpcÄ£°åIDºÅ
TNPC_DEPOSIT = 625;			--´¢ÎïÏäNPCÄ£°åID
TNPC_CHEFU = 393;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
RANK_SKILL = 661;		--³ÆºÅ¹â»·
					--ÁÐ±ø	Ð¡¶Ó³¤	¸±½«	´ó½«	ÔªË§ Õ¨µ¯³µ
tbTNPC_SOLDIER = {	{1067,	1068,	1069,	1070,	1080, 1337},	--ËÎ
										{1072,	1073,	1074,	1075,	1090, 1337}}	--½ð
tbSOLDIER_NAME = {	"TiÓu hiÖu", "§éi tr­ëng", "Tiªn phong", "Chñ t­íng", "Chñ so¸i", "C«ng Thµnh ChiÕn Xa"	}
tbPlAYERER_NAME 		= {"Binh sÜ ","HiÖu óy ","Thèng LÜnh ","Phã t­íng ","§¹i t­íng "} --Õ½¹¦´ïµ½³ÆÎ½¹â»·
tbPlAYERER_ZHANGONG = {     0,   300,   500,  1000,  2000} --´óÓÚ0ÎªÊ¿±ø£¬´óÓÚ300ÎªÐ£Î¾....
tbPlAYERER_GUANGHUAN= { {89,   90,   91,   92,   93}, --ËÎ³ÆºÅID
												{94,   95,   96,   97,   98}} --½ð
					--ÎÀ±ø	½«¾ü ÊØ³Ç²¿·ÖµÄ¹Ì¶¨npc
tbTNPC_SOLDIER1 = {	{1067,	1068},	--ËÎ
					{1072,	1073}}	--½ð
tbSOLDIER_NAME1 = {	"VÖ binh", "T­íng qu©n"}

tbSOLDIER_LEVEL = {	95, 95, 95, 100, 100 ,95}
tbSOLDIER_LEVEL1 = {	95, 95}--ÊØ³Ç¹Ù±øµÄ¼¶±ð
                  --Ð¡Ð£	¶Ó³¤	ÏÈ·æ	Ö÷½«	Ö÷Ë§ Õ¨µ¯³µ È¡±¦
tbKILLNPC_AWARD = {2,8,10,40,60,30,10}	--É±ËÀnpc»ñµÃÕ½¹¦
tbKILLNPC_SHAREAWARD = {1,5,5,20,30,15,0}--¶ÓÓÑ»ñµÃÕ½¹¦
tbFILE_NPCDEATH = 
	{
	"\\script\\missions\\newcitydefence\\npcdeath_1.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_2.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_3.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_4.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_5.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_6.lua",	
	};
FILE_SHOUCHENG_DEATH = {
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath1.lua",
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath2.lua",
	}

tbDEFENCE_MAPID = { 580, 581 }	--ÐÂËÎ½ðµØÍ¼£¬byÁÎÖ¾É½
tbDEFENCE_SIGNMAP = { 518, 519 }
tbREVIVAL_POS = {
					{1528,3321},
					{1557,3330},
					{1567,3358},
					{1537,3369},
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

FILE_PLAYERDEATH = 		"\\script\\missions\\newcitydefence\\playerdeath.lua";
FILE_DOCTOR = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_BOX = 				"\\script\\missions\\newcitydefence\\npc\\cd_box.lua";
FILE_DOCTOR1 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_DOCTOR2 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_CENTERTRAP1 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap1.lua";
FILE_CENTERTRAP2 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap2.lua";
FILE_CD_TRANSER = 		"\\script\\missions\\newcitydefence\\npc\\cd_transer.lua"
FILE_SYMBOLNPC =		"";

FRAME2TIME = 18;				--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
MISSIONID = 27;					--mission±àºÅ
MAX_MEMBERCOUNT = 400;			--¹¥³ÇµØÍ¼×î´óÈËÊýÏÞÖÆ

SMALLTIMERID = 52;				--¼ÆÊ±Æ÷±àºÅ
TOTALTIMERID = 53;				--¼ÆÊ±Æ÷±àºÅ

SMALL_TIME = 20 * FRAME2TIME;				--Ã¿20Ãë¼ÆÊ±Ò»´Î
TOTAL_TIME = 150 * 60 * FRAME2TIME;			--150·ÖÖÓ¼ÆÊ±Ò»´Î£¬»î¶¯½áÊø
RUNGAME_TIME = 30 * 60 * FRAME2TIME / SMALL_TIME; --±¨Ãû30·ÖÖÓÖ®ºó£¬Æô¶¯
LASTREPORT_TIME = 145 * 60 * FRAME2TIME / SMALL_TIME;	--ÊØ³Ç×îºó5·ÖÖÓÃ»·ÖÖÓ£¬ÌáÊ¾Ò»´ÎÊ±¼ä
CALLBOSS_ZHUSHUAI = 120 * 60 * FRAME2TIME / SMALL_TIME;	--Ö÷Ë§³öÏÖÊ±¼ä

NHOMEDEFENCE = 24 --³Ç·À³õÊ¼Öµ
NHOMEDEFENCE_DAMAGE = 1  --³Ç·ÀÉËº¦Öµ£¬¹¥³Ç³µ¶Ô³Ç·À

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

MS_MAXCOUNTNPC_1 = 11;		--Ð¡Ð£Ê£ÓàÊýÁ¿
MS_MAXCOUNTNPC_2 = 12;		--¶Ó³¤Ê£ÓàÊýÁ¿
MS_MAXCOUNTNPC_3 = 13;			--ÏÈ·æÊ£ÓàÊýÁ¿
MS_MAXCOUNTNPC_4 = 14;			--Ö÷½«Ê£ÓàÊýÁ¿
MS_MAXCOUNTNPC_5 = 15;			--Ö÷Ë§Ê£ÓàÊýÁ¿

MS_RESTCOUNTNPC_1 = 16;		--¼ÇÂ¼Ò»¹²É±ËÀµÄ°×¹ÖÊýÁ¿
MS_RESTCOUNTNPC_2 = 17;		--¼ÇÂ¼Ò»¹²É±ËÀµÄÀ¼¹ÖÊýÁ¿
MS_RESTCOUNTNPC_3 = 18;		--¼ÇÂ¼Ò»¹²É±ËÀµÄÉ±ÊÖ¼¶¹ÖÊýÁ¿
MS_RESTCOUNTNPC_4 = 19;		--¼ÇÂ¼Ò»¹²É±ËÀµÄÐ¡BOSSÊýÁ¿
MS_RESTCOUNTNPC_5 = 20;		--¼ÇÂ¼Ò»¹²É±ËÀµÄ´óBOSSÊýÁ¿

MS_HOMEOUT_X1 = 21;			--Ò°ÍâÍù´óÓªµÄ´«ËÍ×ø±êX£¬µÚÒ»ÀàTrap
MS_HOMEOUT_Y1 = 22;
MS_HOMEOUT_X2 = 23;			--Ò°ÍâÍù´óÓªµÄ´«ËÍ×ø±êX£¬µÚ¶þÀàTrap
MS_HOMEOUT_Y2 = 24;

MS_CENTER_X1 = 27;			--´óÓªÍùÒ°ÍâµÄ´«ËÍ×ø±êX£¬µÚÒ»ÀàTrap
MS_CENTER_Y1 = 28;
MS_CENTER_X2 = 29;			--´óÓªÍùÒ°ÍâµÄ´«ËÍ×ø±êX£¬µÚÒ»ÀàTrap
MS_CENTER_Y2 = 30;

MS_SHOUCHENGWEIBING = 33
MS_SHOUCHENGJIANGJUN = 34

MS_HOMEDEFENCE = 35	--³Ç·À

MS_S_GUAI1 = 1;			--¼ÇÂ¼µÚÒ»¸öË¢¹Öµã
MS_S_GUAI2 = 2;			--¼ÇÂ¼µÚ¶þ¸öË¢¹Öµã
MS_S_GUAI3 = 3;			--¼ÇÂ¼µÚÈý¸öË¢¹Öµã
MS_S_CD_NAME = 4;			--µ±Ç°ÊØ³ÇÕ½ÒÛµÄÃû×Ö

CD_BASE_VALUE = 1000000

TB_CD_AWARDEXP = {600, 700, 800, 900, 1000}
TB_CD_AWARDITEM = {
			--{ itemname, itemvalue, itemlist},
				{"Tiªn Th¶o Lé ",0.719012,{ 6,1,71,0,1,1,1 }},
				{"B¸ch Qu¶ Lé ",0.02,{ 6,1,73,0,1,1,1 }},
				{"Thiªn s¬n  B¶o Lé ",0.02,{ 6,1,72,0,1,1,1 }},
				{"HuyÒn Tinh cÊp 4",0.02,{ 6,1,147,0,4,1,1 }},
				{"HuyÒn Tinh cÊp 5",0.003,{ 6,1,147,0,5,1,1 }},
				{"HuyÒn Tinh cÊp 6",0.001,{ 6,1,147,0,6,1,1 }},
				{"HuyÒn Tinh cÊp 7",0.0003,{ 6,1,147,0,7,1,1 }},
				{"HuyÒn Tinh cÊp 8",0.0001,{ 6,1,147,0,8,1,1 }},
				{"§¹i Lùc hoµn",0.02,{ 6,0,3,0,1,1,1 }},
				{"Phi Tèc hoµn",0.02,{ 6,0,6,0,1,1,1 }},
				{"§éc Phßng hoµn",0.02,{ 6,0,10,0,1,1,1 }},
				{"B¨ng Phßng hoµn",0.02,{ 6,0,7,0,1,1,1 }},
				{"Háa Phßng hoµn",0.02,{ 6,0,9,0,1,1,1 }},
				{"L«i Phßng hoµn",0.02,{ 6,0,8,0,1,1,1 }},
				{"Cao Trung hoµn",0.02,{ 6,0,5,0,1,1,1 }},
				{"Gia Bµo hoµn",0.02,{ 6,0,2,0,1,1,1 }},
				{"Cao ThiÓm hoµn",0.02,{ 6,0,4,0,1,1,1 }},
				{"Tr­êng MÖnh hoµn",0.02,{ 6,0,1,0,1,1,1 }},
				{"Bµn Nh­îc T©m Kinh",0.0005,{ 6,1,12,0,1,1,1 }},
				{"Lam Thñy Tinh",0.001,{ 238 }},
				{"Lôc Thñy Tinh",0.001,{ 240 }},
				{"Tö Thñy Tinh",0.001,{ 239 }},
				{"Vâ L©m MËt TÞch",0.0001,{ 6,1,26,0,1,1,1 }},
				{"TÈy Tñy Kinh",0.0001,{ 6,1,22,0,1,1,1 }},
				{"M¶nh HiÖp Cèt ThiÕt HuyÕt Sam (1/4) /4)",0.0001,{ 903 }},
				{"M¶nh HiÖp Cèt ThiÕt HuyÕt Sam (2/4) /4)",0.0001,{ 904 }},
				{"M¶nh HiÖp Cèt ThiÕt HuyÕt Sam (3/4) /4)",0.0001,{ 905 }},
				{"M¶nh HiÖp Cèt ThiÕt HuyÕt Sam (4/4) /4)",0.0001,{ 906 }},
				{"M¶nh HiÖp Cèt §a T×nh Hoµn (1/4) /4)",0.0002,{ 907 }},
				{"M¶nh HiÖp Cèt §a T×nh Hoµn (2/4) /4)",0.0002,{ 908 }},
				{"M¶nh HiÖp Cèt §a T×nh Hoµn (3/4) /4)",0.0002,{ 909 }},
				{"M¶nh HiÖp Cèt §a T×nh Hoµn (4/4) /4)",0.0002,{ 910 }},
				{"M¶nh HiÖp Cèt §an Tam Giíi (1/4) /4)",0.0002,{ 911 }},
				{"M¶nh HiÖp Cèt §an Tam Giíi (2/4) /4)",0.0002,{ 912 }},
				{"M¶nh HiÖp Cèt §an Tam Giíi (3/4) /4)",0.0002,{ 913 }},
				{"M¶nh HiÖp Cèt §an Tam Giíi (4/4) /4)",0.0002,{ 914 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (1/6) /6)",0.00002,{ 771 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (2/6) /6)",0.00002,{ 772 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (3/6) /6)",0.00002,{ 773 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (4/6) /6)",0.00002,{ 774 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (5/6) /6)",0.00002,{ 775 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (6/6) /6)",0.00002,{ 776 }},
				{"M¶nh C©n Quèc Nghª Th­êng (1/6) /6)",0.00001,{ 777 }},
				{"M¶nh C©n Quèc Nghª Th­êng (2/6) /6)",0.00001,{ 778 }},
				{"M¶nh C©n Quèc Nghª Th­êng (3/6) /6)",0.00001,{ 779 }},
				{"M¶nh C©n Quèc Nghª Th­êng (4/6) /6)",0.00001,{ 780 }},
				{"M¶nh C©n Quèc Nghª Th­êng (5/6) /6)",0.00001,{ 781 }},
				{"M¶nh C©n Quèc Nghª Th­êng (6/6) /6)",0.00001,{ 782 }},
				{"M¶nh Nhu T×nh Thôc N÷ H¹ng Liªn (1/4) /4)",0.0002,{ 915 }},
				{"M¶nh Nhu T×nh Thôc N÷ H¹ng Liªn (2/4) /4)",0.0002,{ 916 }},
				{"M¶nh Nhu T×nh Thôc N÷ H¹ng Liªn (3/4) /4)",0.0002,{ 917 }},
				{"M¶nh Nhu T×nh Thôc N÷ H¹ng Liªn (4/4) /4)",0.0002,{ 918 }},
				{"M¶nh Nhu T×nh  Phông Nghi Giíi ChØ (1/4) /4)",0.0002,{ 919 }},
				{"M¶nh Nhu T×nh  Phông Nghi Giíi ChØ (2/4) /4)",0.0002,{ 920 }},
				{"M¶nh Nhu T×nh  Phông Nghi Giíi ChØ (3/4) /4)",0.0002,{ 921 }},
				{"M¶nh Nhu T×nh  Phông Nghi Giíi ChØ (4/4) /4)",0.0002,{ 922 }},
				{"M¶nh Nhu T×nh  TuÖ T©m Ngäc Béi (1/4) /4)",0.00002,{ 923 }},
				{"M¶nh Nhu T×nh  TuÖ T©m Ngäc Béi (2/4) /4)",0.00002,{ 924 }},
				{"M¶nh Nhu T×nh  TuÖ T©m Ngäc Béi (3/4) /4)",0.00002,{ 925 }},
				{"M¶nh Nhu T×nh  TuÖ T©m Ngäc Béi (4/4) /4)",0.00002,{ 926 }},
				{"M¶nh §Þnh Quèc Thanh Sa Tr­êng Sam (1/4) /4)",0.0001,{ 927 }},
				{"M¶nh §Þnh Quèc Thanh Sa Tr­êng Sam (2/4) /4)",0.0001,{ 928 }},
				{"M¶nh §Þnh Quèc Thanh Sa Tr­êng Sam (3/4) /4)",0.0001,{ 929 }},
				{"M¶nh §Þnh Quèc Thanh Sa Tr­êng Sam (4/4) /4)",0.0001,{ 930 }},
				{"M¶nh §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa (1/4) /4)",0.0002,{ 931 }},
				{"M¶nh §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa (2/4) /4)",0.0002,{ 932 }},
				{"M¶nh §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa (3/4) /4)",0.0002,{ 933 }},
				{"M¶nh §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa (4/4) /4)",0.0002,{ 934 }},
				{"M¶nh §Þnh Quèc Tö §»ng Hé uyÓn (1/4) /4)",0.0002,{ 935 }},
				{"M¶nh §Þnh Quèc Tö §»ng Hé uyÓn (2/4) /4)",0.0002,{ 936 }},
				{"M¶nh §Þnh Quèc Tö §»ng Hé uyÓn (3/4) /4)",0.0002,{ 937 }},
				{"M¶nh §Þnh Quèc Tö §»ng Hé uyÓn (4/4) /4)",0.0002,{ 938 }},
				{"M¶nh §Þnh Quèc Ng©n Tµm Yªu ®¸i (1/4) /4)",0.0002,{ 939 }},
				{"M¶nh §Þnh Quèc Ng©n Tµm Yªu ®¸i (2/4) /4)",0.0002,{ 940 }},
				{"M¶nh §Þnh Quèc Ng©n Tµm Yªu ®¸i (3/4) /4)",0.0002,{ 941 }},
				{"M¶nh §Þnh Quèc Ng©n Tµm Yªu ®¸i (4/4) /4)",0.0002,{ 942 }},
				{"M¶nh TrÝch Tinh Hoµn (1/6) /6)",0.00005,{ 711 }},
				{"M¶nh TrÝch Tinh Hoµn (2/6) /6)",0.00005,{ 712 }},
				{"M¶nh TrÝch Tinh Hoµn (3/6) /6)",0.00005,{ 713 }},
				{"M¶nh TrÝch Tinh Hoµn (4/6) /6)",0.00005,{ 714 }},
				{"M¶nh TrÝch Tinh Hoµn (5/6) /6)",0.00005,{ 715 }},
				{"M¶nh TrÝch Tinh Hoµn (6/6) /6)",0.00005,{ 716 }},
				{"M¶nh §­êng Nghª Gi¸p (1/6) /6)",0.00005,{ 717 }},
				{"M¶nh §­êng Nghª Gi¸p (2/6) /6)",0.00005,{ 718 }},
				{"M¶nh §­êng Nghª Gi¸p (3/6) /6)",0.00005,{ 719 }},
				{"M¶nh §­êng Nghª Gi¸p (4/6) /6)",0.00005,{ 720 }},
				{"M¶nh §­êng Nghª Gi¸p (5/6) /6)",0.00005,{ 721 }},
				{"M¶nh §­êng Nghª Gi¸p (6/6) /6)",0.00005,{ 722 }},
				{"M¶nh Lôc PhØ Thóy Hé Th©n Phï (1/6) /6)",0.000005,{ 723 }},
				{"M¶nh Lôc PhØ Thóy Hé Th©n Phï (2/6) /6)",0.000005,{ 724 }},
				{"M¶nh Lôc PhØ Thóy Hé Th©n Phï (3/6) /6)",0.000005,{ 725 }},
				{"M¶nh Lôc PhØ Thóy Hé Th©n Phï (4/6) /6)",0.000005,{ 726 }},
				{"M¶nh Lôc PhØ Thóy Hé Th©n Phï (5/6) /6)",0.000005,{ 727 }},
				{"M¶nh Lôc PhØ Thóy Hé Th©n Phï (6/6) /6)",0.000005,{ 728 }},
				{"M¶nh B¹ch Kim Yªu ®¸i (1/6) /6)",0.00001,{ 729 }},
				{"M¶nh B¹ch Kim Yªu ®¸i (2/6) /6)",0.00001,{ 730 }},
				{"M¶nh B¹ch Kim Yªu ®¸i (3/6) /6)",0.00001,{ 731 }},
				{"M¶nh B¹ch Kim Yªu ®¸i (4/6) /6)",0.00001,{ 732 }},
				{"M¶nh B¹ch Kim Yªu ®¸i (5/6) /6)",0.00001,{ 733 }},
				{"M¶nh B¹ch Kim Yªu ®¸i (6/6) /6)",0.00001,{ 734 }},
				{"M¶nh Thiªn Tµm Hé UyÓn (1/6) /6)",0.00001,{ 735 }},
				{"M¶nh Thiªn Tµm Hé UyÓn (1/6) /6)",0.00001,{ 736 }},
				{"M¶nh Thiªn Tµm Hé UyÓn (1/6) /6)",0.00001,{ 737 }},
				{"M¶nh Thiªn Tµm Hé UyÓn (1/6) /6)",0.00001,{ 738 }},
				{"M¶nh Thiªn Tµm Hé UyÓn (1/6) /6)",0.00001,{ 739 }},
				{"M¶nh Thiªn Tµm Hé UyÓn (1/6) /6)",0.00001,{ 740 }},
				{"M¶nh Thiªn Tµm Ngoa (1/6) /6)",0.00001,{ 741 }},
				{"M¶nh Thiªn Tµm Ngoa (2/6) /6)",0.00001,{ 742 }},
				{"M¶nh Thiªn Tµm Ngoa (3/6) /6)",0.00001,{ 743 }},
				{"M¶nh Thiªn Tµm Ngoa (4/6) /6)",0.00001,{ 744 }},
				{"M¶nh Thiªn Tµm Ngoa (5/6) /6)",0.00001,{ 745 }},
				{"M¶nh Thiªn Tµm Ngoa (6/6) /6)",0.00001,{ 746 }},
				{"M¶nh B¨ng Tinh Th¹ch H¹ng Liªn (1/6) /6)",0.0001,{ 747 }},
				{"M¶nh B¨ng Tinh Th¹ch H¹ng Liªn (2/6) /6)",0.0001,{ 748 }},
				{"M¶nh B¨ng Tinh Th¹ch H¹ng Liªn (3/6) /6)",0.0001,{ 749 }},
				{"M¶nh B¨ng Tinh Th¹ch H¹ng Liªn (4/6) /6)",0.0001,{ 750 }},
				{"M¶nh B¨ng Tinh Th¹ch H¹ng Liªn (5/6) /6)",0.0001,{ 751 }},
				{"M¶nh B¨ng Tinh Th¹ch H¹ng Liªn (6/6) /6)",0.0001,{ 752 }},
				{"M¶nh Cóc Hoa Th¹ch ChØ Hoµn (1/6) /6)",0.0001,{ 753 }},
				{"M¶nh Cóc Hoa Th¹ch ChØ Hoµn (2/6) /6)",0.0001,{ 754 }},
				{"M¶nh Cóc Hoa Th¹ch ChØ Hoµn (3/6) /6)",0.0001,{ 755 }},
				{"M¶nh Cóc Hoa Th¹ch ChØ Hoµn (4/6) /6)",0.0001,{ 756 }},
				{"M¶nh Cóc Hoa Th¹ch ChØ Hoµn (5/6) /6)",0.0001,{ 757 }},
				{"M¶nh Cóc Hoa Th¹ch ChØ Hoµn (6/6) /6)",0.0001,{ 758 }},
				{"M¶nh §iÒn Hoµng Th¹ch Ngäc Béi (1/6) /6)",0.0001,{ 759 }},
				{"M¶nh §iÒn Hoµng Th¹ch Ngäc Béi (2/6) /6)",0.0001,{ 760 }},
				{"M¶nh §iÒn Hoµng Th¹ch Ngäc Béi (3/6) /6)",0.0001,{ 761 }},
				{"M¶nh §iÒn Hoµng Th¹ch Ngäc Béi (4/6) /6)",0.0001,{ 762 }},
				{"M¶nh §iÒn Hoµng Th¹ch Ngäc Béi (5/6) /6)",0.0001,{ 763 }},
				{"M¶nh §iÒn Hoµng Th¹ch Ngäc Béi (6/6) /6)",0.0001,{ 764 }},
				{"M¶nh Kª HuyÕt Th¹ch Giíi ChØ (1/6) /6)",0.0001,{ 765 }},
				{"M¶nh Kª HuyÕt Th¹ch Giíi ChØ (2/6) /6)",0.0001,{ 766 }},
				{"M¶nh Kª HuyÕt Th¹ch Giíi ChØ (3/6) /6)",0.0001,{ 767 }},
				{"M¶nh Kª HuyÕt Th¹ch Giíi ChØ (4/6) /6)",0.0001,{ 768 }},
				{"M¶nh Kª HuyÕt Th¹ch Giíi ChØ (5/6) /6)",0.0001,{ 769 }},
				{"M¶nh Kª HuyÕt Th¹ch Giíi ChØ (6/6) /6)",0.0001,{ 770 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (1/6) /6)",0.0001,{ 783 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (2/6) /6)",0.0001,{ 784 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (3/6) /6)",0.0001,{ 785 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (4/6) /6)",0.0001,{ 786 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (5/6) /6)",0.0001,{ 787 }},
				{"M¶nh HiÖp Cèt T×nh ý KÕt (6/6) /6)",0.0001,{ 788 }},
				{"M¶nh Kim Ti ChÝnh Hång Cµ Sa (1/6) /6)",0.00001,{ 789 }},
				{"M¶nh Kim Ti ChÝnh Hång Cµ Sa (2/6) /6)",0.00001,{ 790 }},
				{"M¶nh Kim Ti ChÝnh Hång Cµ Sa (3/6) /6)",0.00001,{ 791 }},
				{"M¶nh Kim Ti ChÝnh Hång Cµ Sa (4/6) /6)",0.00001,{ 792 }},
				{"M¶nh Kim Ti ChÝnh Hång Cµ Sa (5/6) /6)",0.00001,{ 793 }},
				{"M¶nh Kim Ti ChÝnh Hång Cµ Sa (6/6) /6)",0.00001,{ 794 }},
				{"M¶nh HuyÒn Vò Hoµng Kim Kh¶i (1/6) /6)",0.00001,{ 795 }},
				{"M¶nh HuyÒn Vò Hoµng Kim Kh¶i (2/6) /6)",0.00001,{ 796 }},
				{"M¶nh HuyÒn Vò Hoµng Kim Kh¶i (3/6) /6)",0.00001,{ 797 }},
				{"M¶nh HuyÒn Vò Hoµng Kim Kh¶i (4/6) /6)",0.00001,{ 798 }},
				{"M¶nh HuyÒn Vò Hoµng Kim Kh¶i (5/6) /6)",0.00001,{ 799 }},
				{"M¶nh HuyÒn Vò Hoµng Kim Kh¶i (6/6) /6)",0.00001,{ 800 }},
				{"M¶nh TÈy T­îng Ngäc KhÊu (1/6) /6)",0.00001,{ 801 }},
				{"M¶nh TÈy T­îng Ngäc KhÊu (2/6) /6)",0.00001,{ 802 }},
				{"M¶nh TÈy T­îng Ngäc KhÊu (3/6) /6)",0.00001,{ 803 }},
				{"M¶nh TÈy T­îng Ngäc KhÊu (4/6) /6)",0.00001,{ 804 }},
				{"M¶nh TÈy T­îng Ngäc KhÊu (5/6) /6)",0.00001,{ 805 }},
				{"M¶nh TÈy T­îng Ngäc KhÊu (6/6) /6)",0.00001,{ 806 }},
				{"M¶nh Hång Truy NhuyÔn Th¸p Hµi (1/6) /6)",0.00001,{ 807 }},
				{"M¶nh Hång Truy NhuyÔn Th¸p Hµi (2/6) /6)",0.00001,{ 808 }},
				{"M¶nh Hång Truy NhuyÔn Th¸p Hµi (3/6) /6)",0.00001,{ 809 }},
				{"M¶nh Hång Truy NhuyÔn Th¸p Hµi (4/6) /6)",0.00001,{ 810 }},
				{"M¶nh Hång Truy NhuyÔn Th¸p Hµi (5/6) /6)",0.00001,{ 811 }},
				{"M¶nh Hång Truy NhuyÔn Th¸p Hµi (6/6) /6)",0.00001,{ 812 }},
				{"M¶nh Thanh T©m H­íng ThiÖn Ch©u (1/6) /6)",0.00001,{ 813 }},
				{"M¶nh Thanh T©m H­íng ThiÖn Ch©u (2/6) /6)",0.00001,{ 814 }},
				{"M¶nh Thanh T©m H­íng ThiÖn Ch©u (3/6) /6)",0.00001,{ 815 }},
				{"M¶nh Thanh T©m H­íng ThiÖn Ch©u (4/6) /6)",0.00001,{ 816 }},
				{"M¶nh Thanh T©m H­íng ThiÖn Ch©u (5/6) /6)",0.00001,{ 817 }},
				{"M¶nh Thanh T©m H­íng ThiÖn Ch©u (6/6) /6)",0.00001,{ 818 }},
				{"M¶nh BÝch H¶i Hång Linh Ba (1/6) /6)",0.00001,{ 819 }},
				{"M¶nh BÝch H¶i Hång Linh Ba (2/6) /6)",0.00001,{ 820 }},
				{"M¶nh BÝch H¶i Hång Linh Ba (3/6) /6)",0.00001,{ 821 }},
				{"M¶nh BÝch H¶i Hång Linh Ba (4/6) /6)",0.00001,{ 822 }},
				{"M¶nh BÝch H¶i Hång Linh Ba (5/6) /6)",0.00001,{ 823 }},
				{"M¶nh BÝch H¶i Hång Linh Ba (6/6) /6)",0.00001,{ 824 }},
				{"M¶nh U Lung Kim Xµ Ph¸t §¸i (1/6) /6)",0.00001,{ 825 }},
				{"M¶nh U Lung Kim Xµ Ph¸t §¸i (2/6) /6)",0.00001,{ 826 }},
				{"M¶nh U Lung Kim Xµ Ph¸t §¸i (3/6) /6)",0.00001,{ 827 }},
				{"M¶nh U Lung Kim Xµ Ph¸t §¸i (4/6) /6)",0.00001,{ 828 }},
				{"M¶nh U Lung Kim Xµ Ph¸t §¸i (5/6) /6)",0.00001,{ 829 }},
				{"M¶nh U Lung Kim Xµ Ph¸t §¸i (6/6) /6)",0.00001,{ 830 }},
				{"M¶nh U Lung MÆc Thï NhuyÔn Lý (1/6) /6)",0.00001,{ 831 }},
				{"M¶nh U Lung MÆc Thï NhuyÔn Lý (2/6) /6)",0.00001,{ 832 }},
				{"M¶nh U Lung MÆc Thï NhuyÔn Lý (3/6) /6)",0.00001,{ 833 }},
				{"M¶nh U Lung MÆc Thï NhuyÔn Lý (4/6) /6)",0.00001,{ 834 }},
				{"M¶nh U Lung MÆc Thï NhuyÔn Lý (5/6) /6)",0.00001,{ 835 }},
				{"M¶nh U Lung MÆc Thï NhuyÔn Lý (6/6) /6)",0.00001,{ 836 }},
				{"M¶nh Chó Ph­îc DiÖt L«i C¶nh Phï (1/6) /6)",0.00001,{ 837 }},
				{"M¶nh Chó Ph­îc DiÖt L«i C¶nh Phï (2/6) /6)",0.00001,{ 838 }},
				{"M¶nh Chó Ph­îc DiÖt L«i C¶nh Phï (3/6) /6)",0.00001,{ 839 }},
				{"M¶nh Chó Ph­îc DiÖt L«i C¶nh Phï (4/6) /6)",0.00001,{ 840 }},
				{"M¶nh Chó Ph­îc DiÖt L«i C¶nh Phï (5/6) /6)",0.00001,{ 841 }},
				{"M¶nh Chó Ph­îc DiÖt L«i C¶nh Phï (6/6) /6)",0.00001,{ 842 }},
				{"M¶nh §Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn (1/6) /6)",0.00001,{ 843 }},
				{"M¶nh §Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn (2/6) /6)",0.00001,{ 844 }},
				{"M¶nh §Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn (3/6) /6)",0.00001,{ 845 }},
				{"M¶nh §Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn (4/6) /6)",0.00001,{ 846 }},
				{"M¶nh §Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn (5/6) /6)",0.00001,{ 847 }},
				{"M¶nh §Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn (6/6) /6)",0.00001,{ 848 }},
				{"M¶nh §ång Cõu Gi¸ng Long C¸i Y (1/6) /6)",0.00001,{ 849 }},
				{"M¶nh §ång Cõu Gi¸ng Long C¸i Y (2/6) /6)",0.00001,{ 850 }},
				{"M¶nh §ång Cõu Gi¸ng Long C¸i Y (3/6) /6)",0.00001,{ 851 }},
				{"M¶nh §ång Cõu Gi¸ng Long C¸i Y (4/6) /6)",0.00001,{ 852 }},
				{"M¶nh §ång Cõu Gi¸ng Long C¸i Y (5/6) /6)",0.00001,{ 853 }},
				{"M¶nh §ång Cõu Gi¸ng Long C¸i Y (6/6) /6)",0.00001,{ 854 }},
				{"M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (1/6) /6)",0.00001,{ 855 }},
				{"M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (2/6) /6)",0.00001,{ 856 }},
				{"M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (3/6) /6)",0.00001,{ 857 }},
				{"M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (4/6) /6)",0.00001,{ 858 }},
				{"M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (5/6) /6)",0.00001,{ 859 }},
				{"M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (6/6) /6)",0.00001,{ 860 }},
				{"M¶nh Ma Hoµng Kim Gi¸p Kh«i (1/6) /6)",0.00001,{ 861 }},
				{"M¶nh Ma Hoµng Kim Gi¸p Kh«i (2/6) /6)",0.00001,{ 862 }},
				{"M¶nh Ma Hoµng Kim Gi¸p Kh«i (3/6) /6)",0.00001,{ 863 }},
				{"M¶nh Ma Hoµng Kim Gi¸p Kh«i (4/6) /6)",0.00001,{ 864 }},
				{"M¶nh Ma Hoµng Kim Gi¸p Kh«i (5/6) /6)",0.00001,{ 865 }},
				{"M¶nh Ma Hoµng Kim Gi¸p Kh«i (6/6) /6)",0.00001,{ 866 }},
				{"M¶nh Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn (1/6) /6)",0.00001,{ 867 }},
				{"M¶nh Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn (2/6) /6)",0.00001,{ 868 }},
				{"M¶nh Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn (3/6) /6)",0.00001,{ 869 }},
				{"M¶nh Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn (4/6) /6)",0.00001,{ 870 }},
				{"M¶nh Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn (5/6) /6)",0.00001,{ 871 }},
				{"M¶nh Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn (6/6) /6)",0.00001,{ 872 }},
				{"M¶nh Ma ThÞ S¬n H¶i Phi Hång Lý (1/6) /6)",0.00001,{ 873 }},
				{"M¶nh Ma ThÞ S¬n H¶i Phi Hång Lý (1/6) /6)",0.00001,{ 874 }},
				{"M¶nh Ma ThÞ S¬n H¶i Phi Hång Lý (1/6) /6)",0.00001,{ 875 }},
				{"M¶nh Ma ThÞ S¬n H¶i Phi Hång Lý (1/6) /6)",0.00001,{ 876 }},
				{"M¶nh Ma ThÞ S¬n H¶i Phi Hång Lý (1/6) /6)",0.00001,{ 877 }},
				{"M¶nh Ma ThÞ S¬n H¶i Phi Hång Lý (1/6) /6)",0.00001,{ 878 }},
				{"M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (1/6) /6)",0.00001,{ 879 }},
				{"M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (2/6) /6)",0.00001,{ 880 }},
				{"M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (3/6) /6)",0.00001,{ 881 }},
				{"M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (4/6) /6)",0.00001,{ 882 }},
				{"M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (5/6) /6)",0.00001,{ 883 }},
				{"M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (6/6) /6)",0.00001,{ 884 }},
				{"M¶nh CËp Phong Tam Thanh Phï (1/6) /6)",0.00001,{ 885 }},
				{"M¶nh CËp Phong Tam Thanh Phï (2/6) /6)",0.00001,{ 886 }},
				{"M¶nh CËp Phong Tam Thanh Phï (3/6) /6)",0.00001,{ 887 }},
				{"M¶nh CËp Phong Tam Thanh Phï (4/6) /6)",0.00001,{ 888 }},
				{"M¶nh CËp Phong Tam Thanh Phï (5/6) /6)",0.00001,{ 889 }},
				{"M¶nh CËp Phong Tam Thanh Phï (6/6) /6)",0.00001,{ 890 }},
				{"M¶nh L«i Khung Thiªn §Þa Hé phï (1/6) /6)",0.00001,{ 891 }},
				{"M¶nh L«i Khung Thiªn §Þa Hé phï (2/6) /6)",0.00001,{ 892 }},
				{"M¶nh L«i Khung Thiªn §Þa Hé phï (3/6) /6)",0.00001,{ 893 }},
				{"M¶nh L«i Khung Thiªn §Þa Hé phï (4/6) /6)",0.00001,{ 894 }},
				{"M¶nh L«i Khung Thiªn §Þa Hé phï (5/6) /6)",0.00001,{ 895 }},
				{"M¶nh L«i Khung Thiªn §Þa Hé phï (6/6) /6)",0.00001,{ 896 }},
				{"M¶nh Vô ¶o B¾c Minh §¹o Qu¸n (1/6) /6)",0.00001,{ 897 }},
				{"M¶nh Vô ¶o B¾c Minh §¹o Qu¸n (2/6) /6)",0.00001,{ 898 }},
				{"M¶nh Vô ¶o B¾c Minh §¹o Qu¸n (3/6) /6)",0.00001,{ 899 }},
				{"M¶nh Vô ¶o B¾c Minh §¹o Qu¸n (4/6) /6)",0.00001,{ 900 }},
				{"M¶nh Vô ¶o B¾c Minh §¹o Qu¸n (5/6) /6)",0.00001,{ 901 }},
				{"M¶nh Vô ¶o B¾c Minh §¹o Qu¸n (6/6) /6)",0.00001,{ 902 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (1/9) /9)",0.000002,{ 540 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (2/9) /9)",0.000002,{ 541 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (3/9) /9)",0.000002,{ 542 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (4/9) /9)",0.000002,{ 543 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (5/9) /9)",0.000002,{ 544 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (6/9) /9)",0.000002,{ 545 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (7/9) /9)",0.000002,{ 546 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (8/9) /9)",0.000002,{ 547 }},
				{"M¶nh trang bÞ B¾c Kinh chi Méng (9/9) /9)",0.000002,{ 548 }},
				{"M¶nh Ngò S¾c Ngäc Béi (1/9) /9)",0.000002,{ 549 }},
				{"M¶nh Ngò S¾c Ngäc Béi (2/9) /9)",0.000002,{ 550 }},
				{"M¶nh Ngò S¾c Ngäc Béi (3/9) /9)",0.000002,{ 551 }},
				{"M¶nh Ngò S¾c Ngäc Béi (4/9) /9)",0.000002,{ 552 }},
				{"M¶nh Ngò S¾c Ngäc Béi (5/9) /9)",0.000002,{ 553 }},
				{"M¶nh Ngò S¾c Ngäc Béi (6/9) /9)",0.000002,{ 554 }},
				{"M¶nh Ngò S¾c Ngäc Béi (7/9) /9)",0.000002,{ 555 }},
				{"M¶nh Ngò S¾c Ngäc Béi (8/9) /9)",0.000002,{ 556 }},
				{"M¶nh Ngò S¾c Ngäc Béi (9/9) /9)",0.000002,{ 557 }},
				{"M¶nh Nh· §iÓn Chi Hån (1/9) /9)",0.000002,{ 558 }},
				{"M¶nh Nh· §iÓn Chi Hån (2/9) /9)",0.000002,{ 559 }},
				{"M¶nh Nh· §iÓn Chi Hån (3/9) /9)",0.000002,{ 560 }},
				{"M¶nh Nh· §iÓn Chi Hån (4/9) /9)",0.000002,{ 561 }},
				{"M¶nh Nh· §iÓn Chi Hån (5/9) /9)",0.000002,{ 562 }},
				{"M¶nh Nh· §iÓn Chi Hån (6/9) /9)",0.000002,{ 563 }},
				{"M¶nh Nh· §iÓn Chi Hån (7/9) /9)",0.000002,{ 564 }},
				{"M¶nh Nh· §iÓn Chi Hån (8/9) /9)",0.000002,{ 565 }},
				{"M¶nh Nh· §iÓn Chi Hån (9/9) /9)",0.000002,{ 566 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (1/9) /9)",0.000004,{ 567 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (2/9) /9)",0.000004,{ 568 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (3/9) /9)",0.000004,{ 569 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (4/9) /9)",0.000004,{ 570 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (5/9) /9)",0.000004,{ 571 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (6/9) /9)",0.000004,{ 572 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (7/9) /9)",0.000004,{ 573 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (8/9) /9)",0.000004,{ 574 }},
				{"M¶nh B«n L«i Toµn Long th­¬ng (9/9) /9)",0.000004,{ 575 }},
				{"M¶nh Phôc Ma Tö Kim C«n (1/9) /9)",0.00001,{ 576 }},
				{"M¶nh Phôc Ma Tö Kim C«n (2/9) /9)",0.00001,{ 577 }},
				{"M¶nh Phôc Ma Tö Kim C«n (3/9) /9)",0.00001,{ 578 }},
				{"M¶nh Phôc Ma Tö Kim C«n (4/9) /9)",0.00001,{ 579 }},
				{"M¶nh Phôc Ma Tö Kim C«n (5/9) /9)",0.00001,{ 580 }},
				{"M¶nh Phôc Ma Tö Kim C«n (6/9) /9)",0.00001,{ 581 }},
				{"M¶nh Phôc Ma Tö Kim C«n (7/9) /9)",0.00001,{ 582 }},
				{"M¶nh Phôc Ma Tö Kim C«n (8/9) /9)",0.00001,{ 583 }},
				{"M¶nh Phôc Ma Tö Kim C«n (9/9) /9)",0.00001,{ 584 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (1/9) /9)",0.00001,{ 585 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (2/9) /9)",0.00001,{ 586 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (3/9) /9)",0.00001,{ 587 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (4/9) /9)",0.00001,{ 588 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (5/9) /9)",0.00001,{ 589 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (6/9) /9)",0.00001,{ 590 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (7/9) /9)",0.00001,{ 591 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (8/9) /9)",0.00001,{ 592 }},
				{"M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (9/9) /9)",0.00001,{ 593 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (1/9) /9)",0.000004,{ 594 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (2/9) /9)",0.000004,{ 595 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (3/9) /9)",0.000004,{ 596 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (4/9) /9)",0.000004,{ 597 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (5/9) /9)",0.000004,{ 598 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (6/9) /9)",0.000004,{ 599 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (7/9) /9)",0.000004,{ 600 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (8/9) /9)",0.000004,{ 601 }},
				{"M¶nh §¹i Nh·n ThÇn Chïy (9/9) /9)",0.000004,{ 602 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (1/9) /9)",0.000004,{ 603 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (2/9) /9)",0.000004,{ 604 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (3/9) /9)",0.000004,{ 605 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (4/9) /9)",0.000004,{ 606 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (5/9) /9)",0.000004,{ 607 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (6/9) /9)",0.000004,{ 608 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (7/9) /9)",0.000004,{ 609 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (8/9) /9)",0.000004,{ 610 }},
				{"M¶nh B«n L«i Toµn Long Th­¬ng (9/9) /9)",0.000004,{ 611 }},
				{"M¶nh L­îng Ng©n B¶o §ao (1/9) /9)",0.00001,{ 612 }},
				{"M¶nh L­îng Ng©n B¶o §ao (2/9) /9)",0.00001,{ 613 }},
				{"M¶nh L­îng Ng©n B¶o §ao (3/9) /9)",0.00001,{ 614 }},
				{"M¶nh L­îng Ng©n B¶o §ao (4/9) /9)",0.00001,{ 615 }},
				{"M¶nh L­îng Ng©n B¶o §ao (5/9) /9)",0.00001,{ 616 }},
				{"M¶nh L­îng Ng©n B¶o §ao (6/9) /9)",0.00001,{ 617 }},
				{"M¶nh L­îng Ng©n B¶o §ao (7/9) /9)",0.00001,{ 618 }},
				{"M¶nh L­îng Ng©n B¶o §ao (8/9) /9)",0.00001,{ 619 }},
				{"M¶nh L­îng Ng©n B¶o §ao (9/9) /9)",0.00001,{ 620 }},
				{"M¶nh V« Gian û Thiªn KiÕm (1/9) /9)",0.00001,{ 621 }},
				{"M¶nh V« Gian û Thiªn KiÕm (2/9) /9)",0.00001,{ 622 }},
				{"M¶nh V« Gian û Thiªn KiÕm (3/9) /9)",0.00001,{ 623 }},
				{"M¶nh V« Gian û Thiªn KiÕm (4/9) /9)",0.00001,{ 624 }},
				{"M¶nh V« Gian û Thiªn KiÕm (5/9) /9)",0.00001,{ 625 }},
				{"M¶nh V« Gian û Thiªn KiÕm (6/9) /9)",0.00001,{ 626 }},
				{"M¶nh V« Gian û Thiªn KiÕm (7/9) /9)",0.00001,{ 627 }},
				{"M¶nh V« Gian û Thiªn KiÕm (8/9) /9)",0.00001,{ 628 }},
				{"M¶nh V« Gian û Thiªn KiÕm (9/9) /9)",0.00001,{ 629 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (1/9) /9)",0.00001,{ 630 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (2/9) /9)",0.00001,{ 631 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (3/9) /9)",0.00001,{ 632 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (4/9) /9)",0.00001,{ 633 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (5/9) /9)",0.00001,{ 634 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (6/9) /9)",0.00001,{ 635 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (7/9) /9)",0.00001,{ 636 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (8/9) /9)",0.00001,{ 637 }},
				{"M¶nh Tª Hoµng Phông NghÜa §ao (9/9) /9)",0.00001,{ 638 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (1/9) /9)",0.00001,{ 639 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (2/9) /9)",0.00001,{ 640 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (3/9) /9)",0.00001,{ 641 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (4/9) /9)",0.00001,{ 642 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (5/9) /9)",0.00001,{ 643 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (6/9) /9)",0.00001,{ 644 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (7/9) /9)",0.00001,{ 645 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (8/9) /9)",0.00001,{ 646 }},
				{"M¶nh BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao (9/9) /9)",0.00001,{ 647 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (1/9) /9)",0.00001,{ 648 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (2/9) /9)",0.00001,{ 649 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (3/9) /9)",0.00001,{ 650 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (4/9) /9)",0.00001,{ 651 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (5/9) /9)",0.00001,{ 652 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (6/9) /9)",0.00001,{ 653 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (7/9) /9)",0.00001,{ 654 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (8/9) /9)",0.00001,{ 655 }},
				{"M¶nh Minh ¶o Tµ S¸t §éc NhËn (9/9) /9)",0.00001,{ 656 }},
				{"M¶nh Hoa Vò M¹n Thiªn (1/9) /9)",0.00001,{ 657 }},
				{"M¶nh Hoa Vò M¹n Thiªn (2/9) /9)",0.00001,{ 658 }},
				{"M¶nh Hoa Vò M¹n Thiªn (3/9) /9)",0.00001,{ 659 }},
				{"M¶nh Hoa Vò M¹n Thiªn (4/9) /9)",0.00001,{ 660 }},
				{"M¶nh Hoa Vò M¹n Thiªn (5/9) /9)",0.00001,{ 661 }},
				{"M¶nh Hoa Vò M¹n Thiªn (6/9) /9)",0.00001,{ 662 }},
				{"M¶nh Hoa Vò M¹n Thiªn (7/9) /9)",0.00001,{ 663 }},
				{"M¶nh Hoa Vò M¹n Thiªn (8/9) /9)",0.00001,{ 664 }},
				{"M¶nh Hoa Vò M¹n Thiªn (9/9) /9)",0.00001,{ 665 }},
				{"M¶nh Phi Tinh §o¹t Hån (1/9) /9)",0.00001,{ 666 }},
				{"M¶nh Phi Tinh §o¹t Hån (2/9) /9)",0.00001,{ 667 }},
				{"M¶nh Phi Tinh §o¹t Hån (3/9) /9)",0.00001,{ 668 }},
				{"M¶nh Phi Tinh §o¹t Hån (4/9) /9)",0.00001,{ 669 }},
				{"M¶nh Phi Tinh §o¹t Hån (5/9) /9)",0.00001,{ 670 }},
				{"M¶nh Phi Tinh §o¹t Hån (6/9) /9)",0.00001,{ 671 }},
				{"M¶nh Phi Tinh §o¹t Hån (7/9) /9)",0.00001,{ 672 }},
				{"M¶nh Phi Tinh §o¹t Hån (8/9) /9)",0.00001,{ 673 }},
				{"M¶nh Phi Tinh §o¹t Hån (9/9) /9)",0.00001,{ 674 }},
				{"M¶nh Lôc Ngäc Tr­îng (1/9) /9)",0.00001,{ 675 }},
				{"M¶nh Lôc Ngäc Tr­îng (2/9) /9)",0.00001,{ 676 }},
				{"M¶nh Lôc Ngäc Tr­îng (3/9) /9)",0.00001,{ 677 }},
				{"M¶nh Lôc Ngäc Tr­îng (4/9) /9)",0.00001,{ 678 }},
				{"M¶nh Lôc Ngäc Tr­îng (5/9) /9)",0.00001,{ 679 }},
				{"M¶nh Lôc Ngäc Tr­îng (6/9) /9)",0.00001,{ 680 }},
				{"M¶nh Lôc Ngäc Tr­îng (7/9) /9)",0.00001,{ 681 }},
				{"M¶nh Lôc Ngäc Tr­îng (8/9) /9)",0.00001,{ 682 }},
				{"M¶nh Lôc Ngäc Tr­îng (9/9) /9)",0.00001,{ 683 }},
				{"M¶nh U Minh Th­¬ng (1/9) /9)",0.00001,{ 684 }},
				{"M¶nh U Minh Th­¬ng (2/9) /9)",0.00001,{ 685 }},
				{"M¶nh U Minh Th­¬ng (3/9) /9)",0.00001,{ 686 }},
				{"M¶nh U Minh Th­¬ng (4/9) /9)",0.00001,{ 687 }},
				{"M¶nh U Minh Th­¬ng (5/9) /9)",0.00001,{ 688 }},
				{"M¶nh U Minh Th­¬ng (6/9) /9)",0.00001,{ 689 }},
				{"M¶nh U Minh Th­¬ng (7/9) /9)",0.00001,{ 690 }},
				{"M¶nh U Minh Th­¬ng (8/9) /9)",0.00001,{ 691 }},
				{"M¶nh U Minh Th­¬ng (9/9) /9)",0.00001,{ 692 }},
				{"M¶nh Ch©n Vò KiÕm (1/9) /9)",0.000004,{ 693 }},
				{"M¶nh Ch©n Vò KiÕm (2/9) /9)",0.000004,{ 694 }},
				{"M¶nh Ch©n Vò KiÕm (3/9) /9)",0.000004,{ 695 }},
				{"M¶nh Ch©n Vò KiÕm (4/9) /9)",0.000004,{ 696 }},
				{"M¶nh Ch©n Vò KiÕm (5/9) /9)",0.000004,{ 697 }},
				{"M¶nh Ch©n Vò KiÕm (6/9) /9)",0.000004,{ 698 }},
				{"M¶nh Ch©n Vò KiÕm (7/9) /9)",0.000004,{ 699 }},
				{"M¶nh Ch©n Vò KiÕm (8/9) /9)",0.000004,{ 700 }},
				{"M¶nh Ch©n Vò KiÕm (9/9) /9)",0.000004,{ 701 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (1/9) /9)",0.00001,{ 702 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (2/9) /9)",0.00001,{ 703 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (3/9) /9)",0.00001,{ 704 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (4/9) /9)",0.00001,{ 705 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (5/9) /9)",0.00001,{ 706 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (6/9) /9)",0.00001,{ 707 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (7/9) /9)",0.00001,{ 708 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (8/9) /9)",0.00001,{ 709 }},
				{"M¶nh Thiªn Niªn Hµn ThiÕt (9/9) /9)",0.00001,{ 710 }},
	}