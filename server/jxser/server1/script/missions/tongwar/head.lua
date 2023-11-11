Include("\\script\\event\\tongwar\\headinfo.lua")
MISSIONID = 33
FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ			
TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 15* 6 * 60  * FRAME2TIME; -- ½»Õ½Ê±¼äÎª2Ð¡Ê±
RUNGAME_TIME = 30 * 60 * FRAME2TIME / TIMER_1; --±¨Ãû30·ÖÖÓÖ®ºó£¬×Ô¶¯½øÈëÕ½¶·½×¶Î

MAX_MEMBERCOUNT = 150
MIN_MEMBERCOUNT = 5
TIME_PLAYER_STAY = 120
TONGWAR_MAXDEATH = 10

BONUS_KILLPLAYER = 75
BONUS_MAXSERIESKILL = 150

tbNPCPOS = {"npcpos1", "npcpos2"}
TNPC_DOCTOR1 = 55;--¾üÒ½µÄNpcÄ£°åIDºÅ
TNPC_DOCTOR2 = 49;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
TNPC_DEPOSIT = 625;
	
TNPC_FLAG0 = 626;
TNPC_FLAG1 = 628;
TNPC_FLAG2 = 627;
	
	
tbTONGWAR_SIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
	
tbTONGWARMAP = {
						{605, 608, 609},
						{606, 610, 611},
						{607, 612, 613},
							}	

----------------Title Value-------------------------------------
	RA_KILL_PL_RANK = {10, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	--7 Íæ¼ÒÊ¿±ø	--7/3 Íæ¼ÒÐ£Î¾	--14/15 Íæ¼ÒÍ³Áì	--21/25 Íæ¼Ò¸±½«	--14/25 Íæ¼Ò´ó½«	--7/20 Íæ¼ÒÔªË§
 	
 	RANK_PKBONUS = {
 	{1,	6/5,7/5	,8/5,2	},
	{4/5,1,	6/5,7/5,8/5	},
	{3/5,4/5,1,	6/5,7/5	},
	{2/5,3/5,4/5,1,	6/5	},
	{1/5,2/5,3/5,4/5,1},
	};
	
	TAB_SERIESKILL =    --¼ÇÂ¼²»Í¬rankµÄÍæ¼Ò£¬ÔÚPKÊ±£¬ÊÇ·ñ¼ÇÂ¼Êµ¼ÊÁ¬Õ¶µÄ±í£¬1±íÊ¾¼ÇÂ¼£¬0±íÊ¾²»¼ÇÂ¼
	{
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,1},
		{0,0,1,1,1},
	};
	
	BALANCE_MAMCOUNT = 15
	TAB_RANKBONUS = {0, 1000, 3000, 6000,10000};
	RANK_SKILL = 661;
	TAB_RANKMSG = {
	"B¹n ®­îc phong lµ <color=white>Binh SÜ<color>!",
	"B¹n ®­îc phong lµ <color=0xff>HiÖu óy<color>! Sinh lùc t¨ng20%",
	"B¹n ®­îc phong lµ <color=0xff>Thèng LÜnh<color>! Sinh lùc t¨ng 30%, phßng thñ t¨ng 5%",
	"B¹n ®­îc phong lµ <color=yellow>Phã T­íng<color>! Sinh lùc t¨ng 40%, phßng thñ t¨ng 10% ",
	"B¹n ®­îc phong lµ <color=yellow><bclr=red>§¹i T­íng<bclr><color>! Sinh lùc t¨ng 50%, phßng thñ t¨ng 15%.",
	"B¹n ®­îc phong lµ <color=yellow>Nguyªn So¸i<color=>!"}
	
	tbRANKNAME={"<color=white>Binh SÜ<color>", "<color=0xa0ff>HiÖu óy<color>", "<color=0xff>Thèng LÜnh<color>", "<color=yellow>Phã T­íng<color>", "<color=yellow><bclr=red>§¹i T­íng<bclr><color>" , "<color=black>Nguyªn So¸i<color>"}
	
	TITLE_BONUSRANK1 = 0		--³ÉÎªÏàÓ¦Í·ÏÎËùÐè»ý·ÖÖµ
	TITLE_BONUSRANK2 = 10000
	TITLE_BONUSRANK3 = 20000
	TITLE_BONUSRANK4 = 40000
	TITLE_BONUSRANK5 = 60000
	TITLE_BONUSRANK6 = 80000
	
	TITLE_PL2RANK1_N = 400		--ÏàÓ¦Í·ÏÎµÄÍæ¼Ò×î´óÈËÊý
	TITLE_PL2RANK2_N = 60
	TITLE_PL2RANK3_N = 25
	TITLE_PL2RANK4_N = 10
	TITLE_PL2RANK5_N = 5
	TITLE_PL2RANK6_N = 1
	
---------------------------------------------------------------

FILE_HOMETRAP1 = "\\script\\missions\\tongwar\\match\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\missions\\tongwar\\match\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\missions\\tongwar\\match\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\missions\\tongwar\\match\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\missions\\tongwar\\match\\homeouttrap2.lua"

FILE_DOCTOR1 = 	"\\script\\missions\\tongwar\\npc\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\missions\\tongwar\\npc\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\missions\\tongwar\\npc\\openbox.lua"
FILE_DEATH = "\\script\\missions\\tongwar\\match\\npcdeath.lua"






