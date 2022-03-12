		IncludeLib("FILESYS");
		IncludeLib("TITLE");
		IncludeLib("SETTING");
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")	--HUANGZHIZHANG
Include("\\script\\missions\\boss\\bigboss.lua")	-- big boss
Include("\\script\\battles\\lang.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\battles\\battle_rank_award.lua")



Include("\\script\\bonusvlmc\\head.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");

Include("\\script\\battles\\doubleexp.lua")
FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
BAOMING_TIME = 10		-- 10·ÖÖÓ±¨ÃûÊ±¼ä	
FIGHTING_TIME = 60		-- 60·ÖÖÓ±ÈÈüÊ±¼ä
ANNOUNCE_TIME = 20		-- 20Ãë¹«²¼Ò»ÏÂÕ½¿ö

TIMER_1 = ANNOUNCE_TIME * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = (FIGHTING_TIME + BAOMING_TIME) * 60  * FRAME2TIME; -- ½»Õ½Ê±¼äÎª1Ð¡Ê±
RUNGAME_TIME = BAOMING_TIME * 60 * FRAME2TIME / TIMER_1; --±¨Ãû10·ÖÖÓÖ®ºó£¬×Ô¶¯½øÈëÕ½¶·½×¶Î
GO_TIME =  BAOMING_TIME * 60 * FRAME2TIME  / TIMER_1; -- ±¨ÃûÊ±¼äÎª10·ÖÖÓ

SONGJIN_SIGNUP_FEES = 3000  -- ±¨Ãû·Ñ

JUNGONGPAI = 1773 --ËÎ½ð¾ü¹¦ÅÆID 6£¬1£¬1477
EXPIRED_TIME = 24*60  --ËÎ½ð¾ü¹¦ÅÆ¹ýÆÚ
JUNGONGPAI_Task_ID = 1830 -- --ËÎ½ð¾ü¹¦ÅÆÈÎÎñ±äÁ¿

TIME_GAME_LIMIT = 5 * 60	--Íæ¼ÒÄÜ¹»ÔÚºóÓªÍ£ÁôµÄÊ±¼ä£¬³¬¹ýÊ±¼ä½«ÍË³öÕ½³¡»Øµ½±¨Ãûµã

----------------------------------------------------------ÒÔÏÂby ÁÎÖ¾É½
TIME_EXHIBIT_BOSS = 18 * 60 * (20 + BAOMING_TIME) / (20 * 18)--±ÈÈü20·ÖÖÓ,¼´¿ªÊ¼±¨Ãûºó50·ÖÖÓ
-------------------------------------------------
--BOSSINFO = {BOSSID, BOSSNAME, LEVEL, SERIES}
-----------------------------------------------
BOSSINFO = {
	[1] = {511, "Tr­¬ng T«ng ChÝnh", 95, 4},
	[2] = {513, "DiÖu Nh­ ", 95, 2},
	[3] = {523, "LiÔu Thanh Thanh", 95, 1}
}
----------------------------------------------------
--BOSSEXHIBITPOSITION = {MAPID, POSX, POSY, MAPNAME}
----------------------------------------------------
BOSSEXHIBITPOSITION = {
	{	386	,	1411	,	2691	,	"CÇu ranh giíi (cao cÊp) "	}	,
	{	355	,	1391	,	2745	,	"Doanh tr¹i (cao cÊp) "	}	,
	{	352	,	1413	,	2921	,	"Th©m l©m (cao cÊp) "	}	,
	{	380	,	1439	,	3335	,	"Xung phong (Cao cÊp) "	}	,
	{	328	,	1348	,	2853	,	"Khu vùc b×nh nguyªn (cao cÊp) "	}	,
	{	331	,	1385	,	2796	,	"Khu vùc Hµ T©n (cao cÊp) "	}	,
	{	346	,	1914	,	3512	,	"Thµnh trÊn (cao cÊp) "	}	,
	{	349	,	1367	,	2827	,	"S¬n cèc (cao cÊp) "	}	,
	{	383	,	1855	,	2872	,	"Th©m l©m (cao cÊp) "	}	
}
function ExhibitBoss()
	local ExhibitArray_Index = 0;
	local PosArray_Count = getn(BOSSEXHIBITPOSITION);
	for i = 1, PosArray_Count do
		if (BOSSEXHIBITPOSITION[i][1] == SubWorldIdx2ID(SubWorld)) then
			ExhibitArray_Index = i;
			break;
		end
	end;
	if (0 == ExhibitArray_Index) then	-- Èç¹û²»ÊÇ¸ß¼¶µØÍ¼Ôò½øÐÐBOSSÏÔÊ¾
		return	
	end;
	local BossID_Index = random(1, 3);
	npcindex = AddNpcEx(BOSSINFO[BossID_Index][1], BOSSINFO[BossID_Index][3], BOSSINFO[BossID_Index][4],
			 SubWorld, BOSSEXHIBITPOSITION[ExhibitArray_Index][2] * 32, 
			 BOSSEXHIBITPOSITION[ExhibitArray_Index][3] * 32, 1, BOSSINFO[BossID_Index][2], 1);
	SetNpcDeathScript(npcindex, "\\script\\battles\\bossdeath.lua");
	
	WriteLog(BOSSINFO[BossID_Index][1]..",".. BOSSINFO[BossID_Index][3]..",".. BOSSINFO[BossID_Index][4]..",".. SubWorldIdx2ID(SubWorld)..",".. BOSSEXHIBITPOSITION[ExhibitArray_Index][2] ..","..	 BOSSEXHIBITPOSITION[ExhibitArray_Index][3]..",".. BOSSINFO[BossID_Index][2]);
			 
	local NewsStr = "Theo b¸o c¸o cña th¸m tö tiÒn tuyÕn "..BOSSINFO[BossID_Index][2].." ®· xuÊt hiÖn t¹i khu vùc cao cÊp!";
	AddGlobalNews(NewsStr);	
end
----------------------------------------------------------ÒÔÉÏby ÁÎÖ¾É½

		PL_TOTALPOINT = 1
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		--Íæ¼ÒÕû¸öÕ½¾ÖµÄ×î´óÁ¬Õ¶Êý
		PL_SERIESKILL = 14			--Íæ¼Òµ±Ç°µÄÁ¬Õ¶Êý
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22	-- ÓÃÓÚ¼ÇÂ¼¶áÆìµÄ×ø±êX
		PL_PARAM2 = 23	-- ÓÃÓÚ¼ÇÂ¼¶áÆìµÄ×ø±êY
		PL_PARAM3 = 24	-- ÓÃÓÚ¼ÇÂ¼ËÍÁ¸
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 ±íÊ¾Íæ¼Òµ±Ç°µÄ¹ÙÖ°£¬Ä¿Ç°Ê¹ÓÃµÚ6ºÅ²ÎÊý
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 --¼ÇÂ¼Íæ¼ÒÉÏÒ»´Î²Î¼ÓÕ½ÒÛµÄÕ½ÒÛÁ÷Ë®ºÅ
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	--¼ÇÂ¼Íæ¼Ò±¾Õ½ÒÛµÄ×Ü»ý·Ö£¬×Ü»ý·ÖÊÇÍæ¼ÒËù²Î¼ÓµÄ¸÷³¡Õ½¾ÖµÄ»ý·Ö×ÜºÍ, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48
		
		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5	-- ËÎ·½¶áÆìÊýÁ¿£¨ËÍÁ¸ÊýÁ¿£©
		GAME_CAMP2 = 6	-- ½ð·½¶áÆìÊýÁ¿£¨ËÍÁ¸ÊýÁ¿£©
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14
		
		tbRANKNAME={"<color=white>Binh SÜ<color>", "<color=0xa0ff>HiÖu óy<color>", "<color=0xff>Thèng LÜnh<color>", "<color=yellow>Phã T­íng<color>", "<color=yellow><bclr=red>§¹i T­íng<bclr><color>" , "<color=black>Nguyªn So¸i<color>"}

		MS_STATE = 1
		
		MS_TRANK1_S = 30; --ËÎ1¼¶NpcµÄÄ£°åIDµÄMissionV ID
		MS_TRANK1_J = MS_TRANK1_S + 6; --½ð·½1¼¶NpcµÄÄ£°åIDµÄMissionV ID	36
		MS_RANK1LVL_S = MS_TRANK1_J + 6;--ËÎ·½1¼¶NpcµÄµÈ¼¶ MissionV ID		42
		MS_RANK1LVL_J = MS_RANK1LVL_S + 6;--½ð·½1¼¶NpcµÄµÈ¼¶ MissionV ID	48
		MS_NPCCOUNT1_S = MS_RANK1LVL_J + 6;							--		54
		MS_NPCCOUNT1_J = MS_NPCCOUNT1_S + 6;						--		60
		MS_CALLNPCCOUNT_S = MS_NPCCOUNT1_J + 6 --¼ÇÂ¼ËÎ·½ÕÙ»½NpcµÄ´ÎÊý	--	66
		MS_CALLNPCCOUNT_J = MS_CALLNPCCOUNT_S + 1 --¼ÇÂ¼½ð·½ÕÙ»½NpcµÄ´ÎÊý	67
		
		MS_PL2RANK1_S = 70		--µ±Ç°mission£¬ËÎ·½ÖÐÒÑ¾­³ÉÎª"Ê¿±ø"Í·ÏÎµÄÈËÊý
		MS_PL2RANK2_S = 71
		MS_PL2RANK3_S = 72
		MS_PL2RANK4_S = 73
		MS_PL2RANK5_S = 74
		MS_PL2RANK6_S = 75
	
		MS_PL2RANK1_J = 76		--µ±Ç°mission£¬½ð·½ÖÐÒÑ¾­³ÉÎª"Ê¿±ø"Í·ÏÎµÄÈËÊý
		MS_PL2RANK2_J = 77		--Ð£Î¾
		MS_PL2RANK3_J = 78		--Í³Áì
		MS_PL2RANK4_J = 79		--¸±½«
		MS_PL2RANK5_J = 80		--´ó½«
		MS_PL2RANK6_J = 81		--ÔªË§
	
		MS_HUANGZHIZHANG = 90	--»ÍÖ®ÕÂ»î¶¯½±Àø±¶Êý
		MS_WUXINGZHUCNT_S = 91 --¼ÇÂ¼ËÎ·½ÕÙ»½ÎåÐÐÖùµÄÊýÁ¿	68
		MS_WUXINGZHUCNT_J = 92 --¼ÇÂ¼½ð·½ÕÙ»½ÎåÐÐÖùµÄÊýÁ¿	69
	
		MAX_CALLNPCCOUNT = 10;	
		MAX_CALLWUXINGZHU	= 4;
		GLB_BATTLESTATE = 30
		GLB_FORBIDBATTLE = 31;--µ±¸ÃÖµ1Ê±±íÊ¾Í£Ö¹Õ½ÒÛµÄÆô¶¯
	--Èý¸öµÈ¼¶±¨ÃûµãµÄ×ø±ê
	S_SIGNUPTAB = {};
	
	TV_LASTDEATHTIME = 2306	
	TV_LASTDEATHMAPX = 2307
	TV_LASTDEATHMAPY = 2308
	
	function bt_CheckDeathValid()
		local nowW, nowMapX , nowMapY = GetWorldPos();
		if (nowMapX == GetTask(TV_LASTDEATHMAPX) and nowMapY == GetTask(TV_LASTDEATHMAPY)) then
			return 0
		else
			SetTask(TV_LASTDEATHMAPX, nowMapX) 
			SetTask(TV_LASTDEATHMAPY, nowMapY)
			return 1
		end
		
--		local nowTime = GetCurServerTime()
	--	if (nowTime < GetTask(TV_LASTDEATHTIME)) then
		--	SetTask(TV_LASTDEATHTIME, nowTime)
			--return 1
		--end
		
		--if (nowtime - GetTask(TV_LASTDEATHTIME) < MAX_CHECKDEATHTIME) then
			--return 0
		--else
--			SetTask(TV_LASTDEATHTIME, nowTime)
	--	end
	end
	
	function bt_CheckLifeMax()
		if (GetLife(0) < GetLife(1)) then
			Msg2Player("Xin h·y håi phôc ®Çy ®ñ sinh lùc, sau ®Êy h·y ra §¹i Doanh!");
			return 0
		end
		return 1
	end
	
	BONUS_KILLPLAYER = 75
	BONUS_SNAPFLAG = 600
	BONUS_KILLNPC = 1
	BONUS_KILLRANK1 = 5
	BONUS_KILLRANK2 = 30
	BONUS_KILLRANK3 = 150
	BONUS_KILLRANK4 = 250
	BONUS_KILLRANK5 = 500
	BONUS_KILLRANK6 = 1000
	BONUS_KILLRANK7 = 500
	BONUS_MAXSERIESKILL = 150
	BONUS_GETITEM = 25
	BONUS_1VS1 = 400
	
	RA_KILL_PL_RANK = {10, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	--7 Íæ¼ÒÊ¿±ø	--7/3 Íæ¼ÒÐ£Î¾	--14/15 Íæ¼ÒÍ³Áì	--21/25 Íæ¼Ò¸±½«	--14/25 Íæ¼Ò´ó½«	--7/20 Íæ¼ÒÔªË§
 	
 	RANK_PKBONUS = {
 	{1,		6/5,	7/5,	8/5,	2	}, 
	{4/5,	1,		6/5,	7/5,	8/5	},
	{3/5,	4/5,	1,		6/5,	7/5	},
	{2/5,	3/5,	4/5,	1,		6/5	},
	{1/5,	2/5,	3/5,	4/5,	1	},
	};
	
	TAB_SERIESKILL =    --¼ÇÂ¼²»Í¬rankµÄÍæ¼Ò£¬ÔÚPKÊ±£¬ÊÇ·ñ¼ÇÂ¼Êµ¼ÊÁ¬Õ¶µÄ±í£¬1±íÊ¾¼ÇÂ¼£¬0±íÊ¾²»¼ÇÂ¼
	{
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,1},
		{0,0,1,1,1},
	};
	
	BALANCE_MAMCOUNT = 5;	--ËÎ½ðË«·½ÈËÊý²îµ÷ÕûÎª5ÈË
	BALANCE_GUOZHAN_MAXCOUNT = 100; -- ¹úÕ½ËÎ½ð×î¶àÔÊÐíµÄµ¥±ßÈËÊý
	TAB_RANKBONUS = {0, 1000, 3000, 6000,10000};
	RANK_SKILL = 661;
	TAB_RANKMSG = {
	"B¹n ®­îc phong lµ <color=white>Binh SÜ<color>!",
	"B¹n ®­îc phong lµ <color=0xff>HiÖu óy<color>! Sinh lùc t¨ng20%",
	"B¹n ®­îc phong lµ <color=0xff>Thèng LÜnh<color>! Sinh lùc t¨ng 30%, phßng thñ t¨ng 5%",
	"B¹n ®­îc phong lµ <color=yellow>Phã T­íng<color>! Sinh lùc t¨ng 40%, phßng thñ t¨ng 10% ",
	"B¹n ®­îc phong lµ <color=yellow><bclr=red>§¹i T­íng<bclr><color>! Sinh lùc t¨ng 50%, phßng thñ t¨ng 15%.",
	"B¹n ®­îc phong lµ <color=yellow>Nguyªn So¸i<color=>!"}
	
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

	TV_SERIESKILL_REALY = 2305  --Íæ¼Òµ±Ç°µÄÊµ¼ÊÁ¬Õ¶Öµ£¨¸ß¼¶É±±È½ÏµÍ¼¶µÄÍæ¼Ò£¬¼ÆÁ¬Õ¶£¬µ«²»¼ÆÕæÊµÁ¬Õ¶£©

	
	tbGAME_SIGNMAP = {323, 324, 325} --¼ÇÂ¼¸÷µÈ¼¶±¨ÃûµãµÄµØÍ¼IDºÅ £¬µÈ¼¶°´µÍ¼¶Ïò¸ß¼¶ÅÅ²¼
	tbSIGNMAP_POS = {{1541, 3178} , {1570, 3085}}
	szGAME_GAMELEVEL = {"ChiÕn tr­êng S¬ cÊp", "ChiÕn tr­êng Trung cÊp", "ChiÕn tr­êng Cao cÊp"}
	
	tbBATTLEMAP = {44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 868, 869, 870,876,877,878,879,880,881,883,884,885, 898, 899, 900, 902, 903, 904,970,971};--ËùÓÐÕ½ÒÛÓÃµ½µÄµØÍ¼ÁÐ±í
	tbNPCPOS = {"npcpos1", "npcpos2"}
	TNPC_DOCTOR1 = 55;--¾üÒ½µÄNpcÄ£°åIDºÅ
	TNPC_DOCTOR2 = 49;
	TNPC_SYMBOL1 = 629;
	TNPC_SYMBOL2 = 630;
	TNPC_DEPOSIT = 625;
	
	TNPC_FLAG0 = 626;
	TNPC_FLAG1 = 628;
	TNPC_FLAG2 = 627;

	TNPC_TRANSPORT1 = 55; -- ´«ËÍÔ±µÄNpcÄ£°åIDºÅ
	TNPC_TRANSPORT2 = 49;
	
	
	tbTNPC_SOLDIER = {{631,632,633,634,635,636}, {637, 638, 639, 640, 641, 642}}
	BATTLES_WINGAME_POINT	= 1200;	--„ÙÀû·½·e·Öª„„î
	BATTLES_LOSEGAME_POINT	= 600;	--Ê§”¡·½·e·Öª„„î
	BATTLES_TIEGAME_POINT	= 900;	--Æ½¾Öëp·½·e·Öª„„î

--¸ù¾Ý±¨ÃûµØÍ¼µÄid£¬»ñµÃËùÊôµÄÕ½ÒÛµÈ¼¶
function bt_map2battlelevel(mapid)
	for i = 1, getn(tbGAME_SIGNMAP) do 
		if (mapid == tbGAME_SIGNMAP[i])	then
			return i
		end
	end
	return 0
end

function bt_camp_getbonus(camp, bonus,strmsg, percent)
	local OldPlayerIndex = PlayerIndex
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, camp);
 		if (pidx > 0) then
   			PlayerIndex = pidx;
			local n_bonus = bt_addtotalpoint(bonus)
	   		Msg2Player(strmsg..n_bonus.."<color> ®iÓm tÝch lòy) ")
			Say("§ît nµy b¹n nhËn ®­îc <color=yellow> "..n_bonus.."<color> ®iÓm tÝch lòy", 0)
		end
 		if (idx <= 0) then 
			break
		end;
	end
	PlayerIndex = OldPlayerIndex
end;

--»ñµÃÄ³¸öµÈ¼¶±¨ÃûµãµÄ×ø±ê
function bt_getsignpos(camp)
	if (camp <= 0 or camp > 2) then
		camp = 1
	end
	
	level = GetLevel();
	
	if (level < 80)  then
		return tbGAME_SIGNMAP[1], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	elseif (level < 120) then
		return tbGAME_SIGNMAP[2], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	else
		return tbGAME_SIGNMAP[3], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	end
end;
		
		
--¸ù¾ÝtrapfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬²úÉúËùÓÐµÄtrapµã£¬²¢¹ØÁªscriptfileµÄ½Å±¾		
function bt_addtrap(trapfile, scriptfile)
	local count = GetTabFileHeight(trapfile);
	scriptid = FileName2Id(scriptfile);
	
	ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count - 1 do
		x = GetTabFileData(trapfile, i + 1, 1);
		y = GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile);
	end;
end;	

--"123,234" -> 123 , 234,½«Ò»¸ö×Ö·û´®Ð´³ÉµÄ×ø±êÊý¾Ý×ª»¯³ÉÁ½¸öÊý×Ö±äÁ¿
function bt_str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end

--´Ó×ø±êÎÄ¼þÖÐËæ»ú»ñµÃÒ»¸ö×ø±ê
function bt_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

--¸ù¾ÝnpcfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬²úÉúËùÓÐµÄnpcÄ£°åºÅÎªtnpcidµÄ¶Ô»°npc£¬²¢¹ØÁªscriptfileµÄ½Å±¾		
function bt_adddiagnpc(npcfile, scriptfile, tnpcid, name)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	for i = 1, count - 1 do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	
function bt_add_a_diagnpc(scriptfile, tnpcid, x, y, name)
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y )
		end
		
		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
		return npcidx
end

--¸ù¾ÝnpcfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬²úÉúËùÓÐµÄnpcÄ£°åºÅÎªtnpcidµÄÕ½¶·ÀàÐÍnpc
function bt_addfightnpc (npcfile, tnpcid, level, camp, removewhendeath, name, boss)
	addcount = 0;
	local count = GetTabFileHeight(npcfile) - 1;
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end
	
	for i = 1, count  do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	


--¸ù¾ÝnpcfileµÄÎÄ¼þµÄ×ø±ê¼¯ºÏ±í£¬ Ëæ»úµÄ²úÉúÒÔnpcÄ£°åºÅÎªtnpcidµÄÕ½¶·ÀàÐÍnpc
function bt_addrandfightnpc(npcfile, tnpcid, level, camp,count, deathscript, removewhendeath, name, boss)
	addcount = 0;
	
	if (count <= 0) then
		return
	end
	
	local totalcount = GetTabFileHeight(npcfile) - 1;
	if (totalcount <= 0 ) then
		return
	end
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end

	for i = 1, count do
		id = random(totalcount)
		x = GetTabFileData(npcfile, id + 1, 1);
		y = GetTabFileData(npcfile, id + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			SetNpcDeathScript(npcidx, deathscript) 
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	

function delnpcsafe(nNpcIndex)
if (nNpcIndex <= 0 )  then
	return
end

PIdx = NpcIdx2PIdx(nNpcIndex);
if (PIdx > 0) then 
	WriteLog("Lçi!!! DelNpc muèn xãa bá mét gamer ");
	return
end;

DelNpc(nNpcIndex)
end;


-------------------------------------------------------------------------
--Camp±íÊ¾¶Ô»°µÄÖ÷¹ÜÊÇÄÄ·½µÄ£¬1ÎªËÎ£¬2Îª½ð·½
--Èç¹ûµÈÓÚ1 ±íÊ¾ÒÑ¾­ÔÚ±¾³¡Õ½¾ÖÖÐ±¨¹ýÃûÁË£¬²¢ÇÒÊôÓÚÕâ¸öÕóÓª
--Èç¹ûµÈÓÚ2 ±íÊ¾ÒÑ¾­ÔÚ±¾³¡Õ½¾ÖÖÐ±¨¹ýÃûÁË£¬µ«ÊÇ²»ÊôÓÚÕâ¸öÕóÓª
--Èç¹ûµÈÓÚ0 ±íÊ¾ÉÐÎ´±¨Ãû¡£

function bt_checklastbattle(Camp)

local MKey = BT_GetGameData(GAME_KEY); --µ±Ç°Õ½ÒÛµÄÎ¨Ò»KeyÂë
local BattleId = BT_GetGameData(GAME_BATTLEID); --¸ÃÕ½ÒÛÀàÐÍµÄID
local RuleId = BT_GetGameData(GAME_RULEID);

if ( MKey == BT_GetData(PL_KEYNUMBER) and BattleId == BT_GetData(PL_BATTLEID) and BT_GetData(PL_ROUND) == BT_GetGameData(GAME_ROUND) ) then
	if (Camp == BT_GetData(PL_BATTLECAMP)) then
		return 1
	else
		return 2
	end
else
	return 0
end;

end
-------------------------------------------------------------------------
function bt_setnormaltask2type()
--701ÒÑ¾­±»Õ¼ÓÃ£¬ËùÒÔ¸ü»»µ½751
BT_SetType2Task(1, 751)
for i = 2, 50 do 
	BT_SetType2Task(i, 700 + i);
end
end
--------------------------------------------------------------------------
-- ½«×Ö·û´®°´·Ö¸î·û·Ö¸î£¬·µ»Ø¸÷·Ö¸î¶Î×é³ÉµÄÊý×é
-- Àý1£ºstrsplit( "abc,bcd,efg", "," ) -> { "abc", "bcd", "efg" }
-- Àý2£ºstrsplit( ",abc,,bcd,,,efg,,", ",," ) -> { ",abc", "bcd", ",efg" }
function strsplit( strText, strSeparator )
	local arySlice = {};
	local nSliceCount = 0;
	local nStartIdx, nEndIdx;
	while( 1 ) do
		nStartIdx, nEndIdx = strfind( strText, strSeparator, 1, 1 );
		if( nStartIdx == nil ) then
			break
		end
		if( nStartIdx > 1 ) then
			nSliceCount = nSliceCount + 1;
			arySlice[nSliceCount] = strsub( strText, 1, nStartIdx - 1 );
		end
		strText = strsub( strText, nEndIdx + 1 );
	end
	if( strlen( strText ) > 0 ) then
		arySlice[nSliceCount+1] = strText;
	end
	return arySlice;
end
--------------------------------------------------------------------------------
function getNpcInfo( strNpcInfo )
	local arystrInfo = strsplit( strNpcInfo, "," );
	return tonumber( arystrInfo[1] ), tonumber( arystrInfo[2] ), tonumber( arystrInfo[3] );
end
---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function sf_callnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "Phong V©n LuËn KiÕm b¸o c¸o: Nguyªn So¸i qu©n Tèng ®· xuÊt hiÖn!");
				end
			end
		end
	end
	
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "Phong V©n LuËn KiÕm b¸o c¸o: Nguyªn So¸i qu©n Kim ®· xuÊt hiÖn!");
				end
			end
		end
	end
end;
---------------------------------------------------------------------------------------------------------
function test_callnpc(count, time)
t = 0;

for i = 1, time do
	last = floor((i - 1) / time * count )
	now = floor(i / time * count )
	c = now - last
	t = t + c
	print(c)
end;

print("total:"..t)
end;
------------------------------------------------------------------------------------------------------------
function sf_buildfightnpcdata()
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i);
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_S + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_S + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_S + i - 1, count)
	end
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i + 6 );
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_J + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_J + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_J + i - 1, count)
	end
	
	--¿ªÊ¼Ê±Ê¿±øÒ»´ÎÈ«²¿³öÏÖ¡ª¡ª¡ª¡ªËÎ
	npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S), GetMissionV(MS_RANK1LVL_S), 1, GetMissionV(MS_NPCCOUNT1_S), tabFILE_NPCDEATH[1], 0)
	
	--¿ªÊ¼Ê±Ê¿±øÒ»´ÎÈ«²¿³öÏÖ¡ª¡ª¡ª¡ª½ð
	npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J), GetMissionV(MS_RANK1LVL_J), 2, GetMissionV(MS_NPCCOUNT1_J), tabFILE_NPCDEATH[1], 0)

end
------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function bt_addtotalpoint(point)
	if (point == 0) then
		return
	end

	local nWeekDay = tonumber(GetLocalDate("%w"));
	if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
		point = BigBoss:AddSongJinPoint(point);	
		point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
	else
		local nHour = tonumber(GetLocalDate("%H%M"))
		--DinhHQ
		--20110406: kh«ng kÝch ho¹t hiÖu øng x2 x3 ®iÓm khi sö dông mÆt n¹  trong TK  Thiªn tö 
		if( nHour < 2045 or nHour >= 2250)then
			point = BigBoss:AddSongJinPoint(point);	
			point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
			point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
		end
	end
	-- µ÷ÕûÕ½³¡Ó¢ÐÛÃæ¾ß
--	local nHour = tonumber(GetLocalDate("%H"));
--	if nWeekDay ~=1 and nHour ~= 21 then
--		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
--	end
	
	--tinhpn 20100706: Vo Lam Minh Chu
	local nHour = tonumber(date("%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d"))	
	if (GetTask(TSK_Get2ExpTK) == nDate) then
		if (nHour >= 2100 and nHour <= 2300) then
			if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
				point = point*2
			end
		end
	end
	
	--tinhpn 20100804: IPBonus
	local nDay = tonumber(date("%w"))
	if nDay == 0 or nDay == 5 or nDay == 6  then
		if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then
			point = floor(point*1.5)
		end
	end
	point = Songjin_checkdoubleexp(point)
	
	-- »ý·Ö¼ì²é
	if BT_GetData(PL_BATTLEPOINT) > 1000000 then
		
		local szName		= GetName();					-- ½ÇÉ«Ãû
		local nGameLevel 	= BT_GetGameData(GAME_LEVEL);	-- ËÎ½ðµÈ¼¶
		local nSubWorldID 	= SubWorldIdx2ID();				-- µØÍ¼ID

		local nAddPoint		= point;						-- ±¾´ÎÔö¼ÓµÄ»ý·Ö
		local nTotalPoint	= BT_GetData(PL_TOTALPOINT);	-- ±¾³¡»ý·Ö
		local nBattlePoint	= BT_GetData(PL_BATTLEPOINT);	-- ½ÇÉ«»ý·Ö
		local nKillPlayer	= BT_GetData(PL_KILLPLAYER);	-- É±ÈËÊý
		
		WriteLog(format("Warning[Too Much Battle Point] %s in Level_%d Battle(%d) want to add %d Ponit. Now Total Point is %d, Battle Point is %d, Kill %d Players!", 
			szName, nGameLevel, nSubWorldID, nAddPoint, nTotalPoint, nBattlePoint, nKillPlayer));
	end
	

	BT_SetData(PL_TOTALPOINT, BT_GetData(PL_TOTALPOINT) + point)
	BT_SetData(PL_BATTLEPOINT, BT_GetData(PL_BATTLEPOINT) + point)
	
	bt_JudgePLAddTitle()
	--Storm ¼Ó»ý·Ö
	storm_addpoint(1, point)
	return point
end

function bt_assignrank(camp)--¸Ã¹¦ÄÜÒÑÎÞÐ§
	camptab={}
	--Çå³ýµ±Ç°µÄ¹ÙÎ»Êý¾Ý
	for tt = 70 , 81 do 
		SetMissionV(tt,0)
	end
		
	idx = 0
	pidx = 0
	
	count = 1
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, camp);
 		
 		if (pidx > 0) then
	 		camptab[count] = pidx;
	 		count = count + 1
	 	end;
	 	if (idx == 0) then 
	 		break
	 	end;
	end;

	for tj = 1, getn(camptab) do 
		
		nTopData = 0
		nTopPlayer = 0;
		nTopIndex = 0
		for i = 1, getn(camptab) do 
			if (camptab[i] ~= 0) then
				PlayerIndex = camptab[i];
				if (BT_GetData(PL_BATTLEPOINT)>= nTopData) then
					nTopPlayer = PlayerIndex
					nTopData = BT_GetData(PL_BATTLEPOINT)
					nTopIndex = i
				end
			end
		end
		
		if (nTopData > 0) then
			PlayerIndex = nTopPlayer
			camptab[nTopIndex] = 0;
			if (camp == 1) then
				JudgePLAddTitle()
			else
				JudgePLAddTitle()
			end
		end
	end
end
--------------------------¼ÆËã»ý·ÖÏµÊý£¬ÖØÖÃ»ý·Ö---------------------------------------
function ResetBonus()
	CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
	CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
	AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	
	-- ¹úÕ½ËÎ½ðºöÂÔË«·½Æ½ºâ
	if BT_GetGameData(GAME_BATTLEID) == 2 then
		bonuscff1 = 1
		bonuscff2 = 1
	end
	
	--µ±ÍíÈç¹û´¦ÓÚ»ÍÖ®ÕÂ»î¶¯ÖÐ£¬½±Àø·­±¶
	bonuscff1 = bonuscff1 * bt_getgn_awardtimes()
	bonuscff2 = bonuscff2 * bt_getgn_awardtimes()
	
	BT_SetTypeBonus(PL_KILLPLAYER, 1, floor(BONUS_KILLPLAYER*bonuscff1))
	BT_SetTypeBonus(PL_SNAPFLAG, 1, floor(BONUS_SNAPFLAG*bonuscff1))
	BT_SetTypeBonus(PL_KILLNPC, 1, floor(BONUS_KILLNPC*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK1, 1, floor(BONUS_KILLRANK1*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK2, 1, floor(BONUS_KILLRANK2*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK3, 1, floor(BONUS_KILLRANK3*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK4, 1, floor(BONUS_KILLRANK4*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK5, 1, floor(BONUS_KILLRANK5*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK6, 1, floor(BONUS_KILLRANK6*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK7, 1, floor(BONUS_KILLRANK7*bonuscff1))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 1, floor(BONUS_MAXSERIESKILL*bonuscff1))
	BT_SetTypeBonus(PL_GETITEM, 1, floor(BONUS_GETITEM*bonuscff1))
	BT_SetTypeBonus(PL_1VS1, 1, floor(BONUS_1VS1*bonuscff1))

	BT_SetTypeBonus(PL_KILLPLAYER, 2, floor(BONUS_KILLPLAYER*bonuscff2))
	BT_SetTypeBonus(PL_SNAPFLAG, 2, floor(BONUS_SNAPFLAG*bonuscff2))
	BT_SetTypeBonus(PL_KILLNPC, 2, floor(BONUS_KILLNPC*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK1, 2, floor(BONUS_KILLRANK1*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK2, 2, floor(BONUS_KILLRANK2*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK3, 2, floor(BONUS_KILLRANK3*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK4, 2, floor(BONUS_KILLRANK4*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK5, 2, floor(BONUS_KILLRANK5*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK6, 2, floor(BONUS_KILLRANK6*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK7, 2, floor(BONUS_KILLRANK7*bonuscff2))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 2, floor(BONUS_MAXSERIESKILL*bonuscff2))
	BT_SetTypeBonus(PL_GETITEM, 2, floor(BONUS_GETITEM*bonuscff2))
	BT_SetTypeBonus(PL_1VS1, 2, floor(BONUS_1VS1*bonuscff2))
end
------------------------------------------------------------------------------------

---------------------½øÈëÕ½³¡Ê±¸³¸øÍæ¼ÒÏàÓ¦Í·ÏÎ BEGIN------------------------------------------
function bt_JudgePLAddTitle()
--»ñµÃµ±Ç°µÄRank£¬Èç¹û»ý·Ö´ïµ½ÁËÏÂÒ»¼¶RankµÄÒªÇóÖµÔò¸ø¸ÃÍæ¼Ò¸ÃRank,Èç¹ûRankÖµÒÑ¾­´ïµ½ÉÏÏÞÔò²»¼Ó
	local nCurRank = BT_GetData(PL_CURRANK)
	if ( nCurRank >= getn(TAB_RANKBONUS)) then
		return
	end
	if (BT_GetData(PL_TOTALPOINT) < TAB_RANKBONUS[nCurRank + 1]) then
		return	
	end
	local nRankCount = getn(TAB_RANKBONUS)
	for i = 1, getn(TAB_RANKBONUS) do 
		if (BT_GetData(PL_TOTALPOINT) >= TAB_RANKBONUS[nRankCount - i + 1] ) then
				bt_RankEffect(nRankCount - i + 1)
				return
		end
	end
end

--¸øÓÚÍ·ÏÎ
function bt_RankEffect(rank)
	if (rank == 0) then
		rank = 1
	end
	local campnum = 89
	if (GetCurCamp() == 2) then
		campnum = campnum + 5
	end
	Title_AddTitle(campnum + rank - 1, 0, 9999999)
	Title_ActiveTitle(campnum + rank - 1)
	AddSkillState(RANK_SKILL, rank - 1, 0, 999999);
	Msg2Player(TAB_RANKMSG[rank]);
	BT_SetData(PL_CURRANK, rank);
end

-------------------------½øÈëÕ½³¡Ê±¸³¸øÍæ¼ÒÏàÓ¦Í·ÏÎ ENDING----------------------------------


function bt_autoselectmaparea(mapfile,areacount)		--Ëæ»úÑ¡Ôñ³¡µØÖÐ£¬Ë«·½ËùÔÚµÄÕóÓªµØ
	local s_area = 0
	local j_area = 0
	local areatmp = random(areacount);
	local wwt = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
	if (wwt == 0 or wwt == 1) then
		s_area = areatmp
		while(j_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= s_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 2) then
					j_area = areatmp
				end
			end
		end
	else
		j_area = areatmp
		while(s_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= j_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 1) then
					s_area = areatmp
				end
			end
		end
	end
	return s_area,j_area
end


function bt_exchangeexp(level, mark)
		if (level < 40) then
			return 0
		end
		local base_exp = (( 700 + floor(( level - 40 ) / 5 ) * 100 ) * 60 * 7 / 3000 );	-- 1¸ö»ý·ÖµãµÄ»ù´¡¾­ÑéÖµ
		local bonus = floor( mark * base_exp )
		
		-- ËÎ½ðµ÷Õû By ²¯ÁÑÆßÏÒ 09/07/27
		if (level >= 120) then
			bonus = floor( bonus * 2.5 * 2 )
		end
		
		return bonus
end
-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

function bt_pop2signmap()	--²»ÔÊÐíÍæ¼ÒÔÚºóÓªÍ£Áô5·ÖÖÓ£¬ÔÚ¶áÆìÄ£Ê½£¬ºÍÔªË§Ä£Ê½£¬É±Â¾Ä£Ê½ÒòÎª2·ÖÖÓ»á½«Íæ¼Ò¶ªµ½Õ½³¡£¬ËùÒÔ²»×ö´¦Àí
	local oldPlayerIndex = PlayerIndex
	local tbPlayer = {}
	local count = 0

	local idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer( MISSIONID,idx, 0 );
		if( pidx > 0 ) then
		 	PlayerIndex = pidx
		 	if ( GetFightState() == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_GAME_LIMIT ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
		 	end
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 

	local game_level = BT_GetGameData(GAME_LEVEL);
	if ( count > 0 ) then
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
		 	local l_curcamp = GetCurCamp();

			SetTaskTemp(200,0);
			SetLogoutRV(0);
			SetCreateTeam(1);
			SetDeathScript("");
			SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬£¨by Dan_Deng£©
			SetPunish(1)
			ForbidChangePK(0);
			SetPKFlag(0)
			Msg2Player("Thêi gian l­u l¹i trong Doanh tr¹i ®· v­ît qu¸ 5 phót, b¹n bÞ ®Èy ra chiÕn tuyÕn")
			if (l_curcamp == 1) then
				SetRevPos(tbGAME_SIGNMAP[game_level], 1)
				NewWorld(bt_getsignpos(1))
			else	
				SetRevPos(tbGAME_SIGNMAP[game_level], 2)
				NewWorld(bt_getsignpos(2))
			end;
			
			local camp = GetCamp();
			SetCurCamp(camp);
			
		end
	end

	PlayerIndex = oldPlayerIndex
end

function bt_getgn_awardtimes()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		--DinhHQ
		--20110409: kh«ng kÝch ho¹t hiÖu øng x4 ®iÓm tÝch lòy cña TK Thiªn Tö trong c¸c giê TK th­êng
		if( nHour >= 2045 and nHour < 2250)then
			return 4
		end
	end
	if (GetMissionV(MS_HUANGZHIZHANG) == 0 or GetMissionV(MS_HAUNGZHIZHANG) == 1) then
		return 1
	else
		return GetMissionV(MS_HUANGZHIZHANG)
	end
end

function check_pl_level(pl_level)
	if (GetLevel() >= 40 and GetLevel() < 80) then
		return 1		
	end
	if (GetLevel() >= 80 and GetLevel() < 120) then
		return 2
	end
	if (GetLevel() >= 120 ) then
		return 3
	end
end

---ÐÂ¼ÓÈëStart
--ËÎ½ðÈÙÓþ»ý·ÖÅÅÐÐ£¬½ö¸ß¼¶ËÎ½ð
--Ã¿³¡±ÈÈü½áÊøÊ±£¬¼´Ê±Õ½±¨ÅÅÐÐµÄÃû´ÎºÍ»ý·Ö£¬
--	´æÔÚÕ½¶ÓÍ³¼Æ£¨LEAGUERESULT£©ÖÐÓëÒÑÓÐ³É¼¨ÅÅÐò£¬±£ÁôÇ°10Ãû
--	¸üÐÂÅÅÐÐ°ñ£¨·çÔÆÅÅÐÐ°ñ10250£©£¬°´Ãû´Î
--ÔÚÖÜÈÕÍí23Ê±£¬½«Õ½¶ÓÅÅÐòµÄ½á¹û£¨Ç°5Ãû£©±£´æÔÚÅÅÐÐ°ñ£¨10239£©ÖÐ£¬¹©Áì½±
--Í¬Ê±£¬Çå³ýÕ½¶ÓÍ³¼Æ£¨LEAGUERESULT£©ÖÐµÄ³É¼¨
--2545
 LG_SONGJINHONOUR = 535;
 LG_TSK_HONOURPOINT = 1;
 LG_TSK_TOTALPOINT = 2;
 LG_TSK_SECT = 3;	--ÃÅÅÉ
 LG_TSK_GENDER = 4; --ÐÔ±ð
function bt_sortbthonour()
	--±¾´Î½á¹û
	local tbCurPlayer = {};
	for i = 1, 10 do
		local szname, npoint, nsect, ngender = BT_GetTopTenInfo(i, PL_TOTALPOINT);
		if (szname ~= nil) then
			tbCurPlayer[ getn(tbCurPlayer)+1 ] = {szname, (11-i), npoint, nsect, ngender};
		end;
	end;
	
	if (tbCurPlayer == {}) then
		print("Battle Have No Player JoinIN!! SO , not do bt_sortbthonour!");
		return 0;
	end;
	
	bt_reportworldresult(tbCurPlayer);	--½«±¾´ÎÅÅÃû³É¼¨¹«¸æÊÀ½ç£¨ËùÓÐ·þÎñÆ÷£©
	
	local tbNewPlayer = {};
	local nlg_idx = LG_GetFirstLeague(LG_SONGJINHONOUR);
	while(nlg_idx ~= nil and nlg_idx ~= 0) do
		local szlgname = LG_GetLeagueInfo(nlg_idx);
		local nhonour = LG_GetLeagueTask(nlg_idx, LG_TSK_HONOURPOINT);
		local npoint = LG_GetLeagueTask(nlg_idx, LG_TSK_TOTALPOINT);
		local nsect = LG_GetLeagueTask(nlg_idx, LG_TSK_SECT);
		local ngender = LG_GetLeagueTask(nlg_idx, LG_TSK_GENDER);
		tbNewPlayer[ getn(tbNewPlayer)+1 ] = {szlgname, nhonour, npoint, nsect, ngender};
		nlg_idx = LG_GetNextLeague(LG_SONGJINHONOUR, nlg_idx);
	end;
	
	local nnewcount = getn(tbNewPlayer);
	for i = 1, getn(tbCurPlayer) do
		local bP = 0;
		for k = 1, nnewcount do
			if (tbCurPlayer[i][1] == tbNewPlayer[k][1]) then
				tbNewPlayer[k][2] = tbCurPlayer[i][2] + tbNewPlayer[k][2];
				tbNewPlayer[k][3] = tbCurPlayer[i][3] + tbNewPlayer[k][3];
				tbNewPlayer[k][4] = tbCurPlayer[i][4];
				tbNewPlayer[k][5] = tbCurPlayer[i][5];
				bP = 1;
				break
			end;
		end;
		if (bP == 0) then
			tbNewPlayer[getn(tbNewPlayer)+1] = tbCurPlayer[i];
		end;
	end;
	
	--²åÈëµ½Ö®Ç°µÄ½á¹û
	for i = 1, getn(tbCurPlayer) do
		local nlg_idx = LG_GetLeagueObj(LG_SONGJINHONOUR, tbCurPlayer[i][1]);
		if (nlg_idx == nil or nlg_idx == 0) then	--Èç¹ûÃ»ÓÐÔò´´½¨£¬²»ÔÙ´ÎÅÅÐò
			if (bt_createleague(tbCurPlayer[i][1]) == 1) then	--´´½¨³É¹¦
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_SECT, tbCurPlayer[i][4]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_GENDER, tbCurPlayer[i][5]);
			end;
		else										--Èç¹û´æÔÚ¾ÍÀÛ¼Æ
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
		end;
	end;
	
	Ladder_ClearLadder(10250);	--ÇåÅÅÃû

	if (getn(tbNewPlayer) >= 1) then
		sort(tbNewPlayer, bt_sortmaxhonour);
		for i = 1, 10 do			--ÖØÐ´ÅÅÃû
			if (tbNewPlayer[i]) then
				Ladder_NewLadder(10250, tbNewPlayer[i][1],tbNewPlayer[i][2], 0, tbNewPlayer[i][4], tbNewPlayer[i][5]);
			end;
		end;
	end;
end;



function bt_sortmaxhonour(tb1, tb2)
	if (tb1[2] ~= tb2[2]) then
		return tb1[2] > tb2[2];
	else
		return tb1[3] > tb2[3];
	end;
end;

function bt_createleague(szlgname)
	local nNewLeagueID = LG_CreateLeagueObj()	--Éú³ÉÉçÍÅÊý¾Ý¶ÔÏó(·µ»Ø¶ÔÏóID)
	LG_SetLeagueInfo(nNewLeagueID, LG_SONGJINHONOUR, szlgname)	--ÉèÖÃÉçÍÅÐÅÏ¢(ÀàÐÍ¡¢Ãû³Æ)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end;

function bt_reportworldresult(tbPlayer)
	local ncount = getn(tbPlayer);
	if (ncount <= 0) then
		return 0;
	else
		if (ncount > 3) then
			ncount = 3;
		end;
	
		local szParam = "Phong V©n LuËn KiÕm cao cÊp ®· kÕt thóc, Top"..ncount.." gåm: <enter>";
		for i = 1, ncount do
			if (tbPlayer[i][1]) then
				szParam = format("%s   XÕp h¹ng %d <color=green>%s<color>  %d<enter>",
				szParam,i,safeshow(tbPlayer[i][1]),tbPlayer[i][3]);
			end;
		end;
		LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szParam , "", "")
	end;
end
---ÐÂ¼ÓÈëEnd


--by zero 2007-7-30 ·µ»Ø»ý·ÖÆ½ºâ±ÈÀý ËÎ£¬½ð
function bonus_rate()
	CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
	CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
	AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	return bonuscff1,bonuscff2
end

function mar_addmissionpoint(totalpoint, nCurCamp)
	if (totalpoint == 0) then
		return
	end
	local nWeekDay = tonumber(GetLocalDate("%w"));
	--tinhpn 20100706: Vo Lam Minh Chu
	local nHour = tonumber(date("%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d"))	
	if (GetTask(TSK_Get2ExpTK) == nDate) then
		if (nHour >= 2100 and nHour <= 2300) then
			if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then	
				totalpoint = totalpoint*2
			end
		end
	end
	
	--tinhpn 20100804: IPBonus
	local nDay = tonumber(date("%w"))
	if nDay == 0 or nDay == 5 or nDay == 6  then
		if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then
			totalpoint = floor(totalpoint*1.5)
		end
	end
		
	
	if (not nCurCamp) then
		nCurCamp = GetCurCamp();
	elseif (nCurCamp ~=1 and nCurCamp ~= 2) then
		return
	end
	
	if (nCurCamp == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
	end
end


-- ÊµÊ±ÏÔÊ¾Õ½³¡µÄ¸÷ÖÖÅÅÃûÐÅÏ¢ by ²¯ÁÑÆßÏÒ 09/07/27
function bt_announce (lsf_level, n_time)
	
	-- Ã¿10·ÖÖÓ(30´Î*¼ä¸ô20Ãë)¹«²¼Ò»´ÎÐÅÏ¢
	if (mod(n_time, 30) ~= 0) then
		return
	end
	
	-- ½ö¸ß¼¶Õ½³¡¹«²¼ÐÅÏ¢
	if (lsf_level ~= 3) then
		return
	end
	
	local old_player = PlayerIndex;
	
	local nStrLen_Total = 31;
	local nStrLen_Sort_Title	= 5;
	local nStrLen_Name_Title	= 5;
	local nStrLen_Camp_Title	= 10;
	local nStrLen_Score_Title	= 11;
	local nStrLen_Sort_Text		= 3;
	local nStrLen_Name_Text		= 16;
	local nStrLen_Camp_Text		= 6;
	local nStrLen_Score_Text	= 6;
	
	-- Á¬Õ¶ÅÅÃû
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("Top liªn tr¶m", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("Tªn", nStrLen_Name_Title)..strfill_center("Phe ph¸i", nStrLen_Camp_Title)..strfill_center("Liªn tr¶m", nStrLen_Score_Title));
	for i = 1, 5 do
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_MAXSERIESKILL);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "Vµng (T)" or "TÝm (K)";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- PKÍæ¼ÒÅÅÃû
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP PK", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("Tªn", nStrLen_Name_Title)..strfill_center("Phe ph¸i", nStrLen_Camp_Title)..strfill_center("PK", nStrLen_Score_Title));
	for i = 1, 5 do 
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_KILLPLAYER);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "Vµng (T)" or "TÝm (K)";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- ÍÀÉ±NPCÅÅÃû ½öÔªË§±£ÎÀÄ£Ê½
	if (MISSIONID == 16) then
		tbPlayer = {};
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC);
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP NPC", nStrLen_Total));
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("Tªn", nStrLen_Name_Title)..strfill_center("Phe ph¸i", nStrLen_Camp_Title)..strfill_center("NPC", nStrLen_Score_Title));
		for i = 1, 5 do 
			if tbPlayer[i] and tbPlayer[i] > 0 then
				PlayerIndex = tbPlayer[i];
				local szname, npoint = GetName(), BT_GetData(PL_KILLNPC);
				local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "Vµng (T)" or "TÝm (K)";
				if (szname and szname ~= "") then
					Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
				end
			end
		end
	end
	
	
	PlayerIndex = old_player;
end