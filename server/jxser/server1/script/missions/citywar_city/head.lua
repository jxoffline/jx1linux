--1¡¢Èë³¡µØµã±ØÐëÔÚÍ³Ò»µÄÒ»¸öµØµã£¬¿ÉÒÔÓëÄÃÆ±µÄnpcÍ³Ò»µÄÒ»¸ö
--2¡¢Æ±µÄÊµÏÖ·½·¨£¿ÔÝÊ±²»·ÅÁË£¬²âÍêÕâÐ©ÔÙ¼Ó°É
--
--Ãâ·Ñ·þ ¹¥³ÇÕ½
--2006-11-22
--by ×Ó·ÇÓã
IncludeLib("FILESYS");
IncludeLib("TITLE");
IncludeLib("SETTING");
IncludeLib("BATTLE");


TSK_TEMP_CURTIME = 114
TSK_TEMP_CURCOUNT = 115

tb_CW_MEDICINE =
{
	{10, {6,1,1302,1,1,1}, 1000, "Ngò hoa ngäc lé hoµn - c«ng thµnh chiÕn."},
	{11, {6,1,1303,1,1,1}, 800, "Cöu chuyÓn hoµn hån ®¬n - c«ng thµnh chiÕn"},
	{12, {6,1,1304,1,1,1}, 800, "Thñ « hoµn hån ®¬n - c«ng thµnh chiÕn"},
	{13, {6,1,1305,1,1,1}, 800, "Long diªn hãa ®éc ®¬n - c«ng thµnh chiÕn"},
}

MISSIONID = 6;
FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
REPORTTIME 	= 60 * FRAME2TIME; --60Ãë¹«²¼Ò»ÏÂÕ½¿ö
GAMETIME 	= 90 * 60  * FRAME2TIME; -- ½»Õ½×ÜÊ±¼äÎª90·ÖÖÓ
CITYWAR_TOP10_EXP = 3000000;


MS_STATE = 1; --ÈÎÎñÖÐ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
--¸Ã±äÁ¿Ö¸ÏòµÄ×´Ì¬Öµ0±íÊ¾Õ½ÒÛÎª´ò¿ª£¬1±íÊ¾Õ½ÒÛ±¨ÃûÖÐ£¬2±íÊ¾Õ½ÒÛÕ½¶·½øÐÐÖÐ£¬3±íÊ¾Õ½ÒÛ¸Õ¸Õ½áÊøÁË
MS_STORETASKID = 240;
MS_NEWSVALUE = 10; --ÈÎÎñÖÐ´æ·ÅÐÂÎÅ±äÁ¿µÄµØ·½
MS_SYMBOLCOUNT = 3; --Ê¯±®µÄÊýÁ¿
MS_SYMBOLBEGIN = 15;--¼ÇÂ¼Ê¯±®×´Ì¬µÄ±äÁ¿IDµÚÒ»¸öÐòºÅ£¬´ÓMS_SYMBOLBEIN µ½MS_SYMBOLBEGIN + MS_SYMBOLCOUNT·Ö±ð¼ÇÂ¼¸÷¸öÊ¯±®µÄ×´Ì¬Öµ

MS_STONENPC1 = 25; 
MS_STONENPC2 = 26;
MS_STONENPC3 = 27;

MS_TSCBEGIN = 50;-- missionÖÐ¼ÇÂ¼Í¶Ê¯³µÊÇ·ñÒÑÓÐµÄ×´Ì¬±êÖ¾
g_nDoorCount = 3; --³ÇÃÅµÄ×ÜÊý
g_nMaxTscPerDoor = 3; --Ã¿¸öÃÅ×î´ó¿ÉÒÔ³öÏÖµÄÍ¶Ê¯³µÊýÁ¿
MS_GCCBEGIN = MS_TSCBEGIN + g_nDoorCount * g_nMaxTscPerDoor;
g_nMaxGccPerDoor = 1; --¹¥·½Ã¿¸öÃÅ×î¶à´æÔÚ¹¥³Ç³µµÄÊýÁ¿
--gccbegin = 59
--toolbegin = 62
--doorbegin = 62 + 6 = 68
MS_TOOLBEGIN = MS_GCCBEGIN + g_nMaxGccPerDoor * g_nDoorCount;
g_nMaxToolCount = 6; --ÊØ·½×î´óÍ¬Ê±´æÔÚµÄ¹ÍÓ¶±øÈËÊý

MS_DOORBEGIN = MS_TOOLBEGIN + g_nMaxToolCount; --¼ÇÂ¼³ÇÃÅ×´Ì¬µÄmission²ÎÊýindex
MS_KEY = 99


TV_TASKID = 230; 	--¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñID
TV_TASKVALUE = 231; 	--¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñµÄÖµ,¼ÇÂ¼ËùÊô·½,ËÎÎª1£¬½ðÎª2
TV_TASKKEY = 232; 	--¼ÇÂ¼Íæ¼Òµ±Ç°ÈÎÎñµÄkeyºÅ
TV_CITYID = 233;

CS_RevId 	= 20
CS_RevData 	= 10;

MAX_CAMP1COUNT = 200;--ÊØ³Ç·½°ï»á×î´ó¿ÉÒÔ²Î¼ÓµÄÈËÊý
MAX_CAMP2COUNT = 200;--¹¥³Ç·½°ï»á×î´ó¿ÉÒÔ²Î¼ÓµÄÈËÊý
MAX_CAMP3COUNT = 50 ;--ÔÊÐíÊØ³Ç·½×î´ó¿ÉÒÔÒªÇóÐ­ÖúµÄÆäËü°ï»áÈËÊý
MAX_CAMP4COUNT = 50 ;--ÔÊÐí¹¥³Ç·½×î´ó¿ÉÒÔÒªÇóÐ­ÖúµÄÆäËü°ï»áÈËÊý

--¹¥ÊØË«·½µÚÒ»´Î½ø³¡Ê±µÄ×ø±ê
CS_CampPos1 = {221, 1533, 3211};--ÊØ·½
CS_CampPos2 = {221, 1903, 3608};--¹¥·½

STONENPCID1 = 528;	--Ê¯0±®µÄNpcÄ£°åID
STONENPCID2 = 530;
STONELEVEL1 = 10; 	--Ê¯±®µÈ¼¶ÊØ·½µÄÊ¯Öù
STONELEVEL2 = 20;   --¹¥·½µÄÊ¯Öù
STONENAME = "Bia ®¸ ®Þnh thµnh ";
DOORNPCID =  532;
DOORLEVEL = 60;
StonePos = 
{
{x = 55232, y = 104928, Name = "§Þnh Xuyªn Trô "},
{x = 53152, y = 107040, Name = "LËp D­¬ng Trô "},
{x = 50976, y = 108992, Name = "B×nh Giang Trô "},
};


DoorPos=
{
{x = 57472, y = 106944, Name="§Þnh Xuyªn m«n"},
{x = 55296, y = 109088, Name="LËp D­¬ng m«n"},
{x = 53184, y = 111136, Name="B×nh Giang m«n"},
};

DOCTORNPCID = 230;
DoctorPos = 
{
{49184,102592,"Tïy Qu©n d­îc Y"},
{50048,103552,"Tïy Qu©n d­îc Y"},
{48480,103616,"Tïy Qu©n d­îc Y"},
{48928,104160,"Tïy Qu©n d­îc Y"},
{61184,114176,"Tïy Qu©n d­îc Y"},
{61600,114592,"Tïy Qu©n d­îc Y"},
{60128,115168,"Tïy Qu©n d­îc Y"},
{60672,115616,"Tïy Qu©n d­îc Y"},
}

--Ç°Á½¸öÊÇÍ¶Ê¯³µµÄ×ø±ê£¬ºóÁ½¸öÊÇÍ¶µãµÄ×ø±ê
TscPos=
{
{58752, 107648, 58304, 106912},
{58080, 107520, 57408, 106880},
{57952, 108480, 57408, 107872},

{56736,109824, 56192, 109024},
{55872,109728, 55232, 109056},
{55904,110592, 55040, 109056},

{54560,111808, 53312, 111136},
{53856,111776, 53120, 111104},
{53888,112448, 53248, 111936},
};

GccPos = 
{
{58048,107552 },
{55936,109664 },
{1675*32,3486*32},
};

OuterPos = 
{
{222, 1613, 3185},
{223, 1613, 3185},
}

ObstaclePos = 
{
{1793*32, 3340*32},
{1727*32, 3407*32},
{1660*32, 3469*32},

}

----------------Title Value-------------------------------------
	RA_KILL_PL_RANK = {10, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	--7 Íæ¼ÒÊ¿±ø	--7/3 Íæ¼ÒÐ£Î¾	--14/15 Íæ¼ÒÍ³Áì	--21/25 Íæ¼Ò¸±½«	--14/25 Íæ¼Ò´ó½«	--7/20 Íæ¼ÒÔªË§
 BONUS_KILLPLAYER = 75
	BONUS_MAXSERIESKILL = 150
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
	"HiÖn ®ang ®­îc tÊn phong lµm <color=0xa0ff>HiÖu óy<color>!",
	"HiÖn ®ang ®­îc tÊn phong lµm <color=0xff>Thèng lÜnh<color>!",
	"HiÖn ®ang ®­îc tÊn phong lµm <color=yellow>Phã t­íng<color>!",
	"HiÖn ®ang ®­îc tÊn phong lµm <color=yellow><bclr=red>§¹i t­íng<bclr><color>!",
	"B¹n ®­îc phong lµ <color=yellow>Nguyªn So¸i<color=>!"}
	
	tbRANKNAME={"<color=white>Binh SÜ<color>", "<color=0xa0ff>HiÖu óy<color>", "<color=0xff>Thèng LÜnh<color>", "<color=yellow>Phã T­íng<color.", "<color=yellow><bclr=red>§¹i T­íng<bclr><color>" , "<color=black>Nguyªn So¸i<color>"}
	
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
TV_LASTDEATHTIME = 2306	
TV_LASTDEATHMAPX = 2307
TV_LASTDEATHMAPY = 2308
TV_SERIESKILL_REALY = 2305  --Íæ¼Òµ±Ç°µÄÊµ¼ÊÁ¬Õ¶Öµ£¨¸ß¼¶É±±È½ÏµÍ¼¶µÄÍæ¼Ò£¬¼ÆÁ¬Õ¶£¬µ«²»¼ÆÕæÊµÁ¬Õ¶£©

	
--BATTLE TASK---------------------
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
		PL_PARAM1 = 22
		PL_PARAM2 = 23
		PL_PARAM3 = 24
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
		GAME_CAMP1 = 5
		GAME_CAMP2 = 6
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~»ªÀöµÄ·Ö¸îÏß~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function CheckWin()
	local nResult = 0;--ÊØ·½Ê¯±®µÄÊýÁ¿
	local nCount = MS_SYMBOLCOUNT;
	for i  = 1, nCount do 
		 if (GetMissionV(MS_SYMBOLBEGIN + i - 1) == 2) then 
		 	nResult = nResult + 1;
		 end;
	end
	return nResult;
end;
--------------------------------------------------------------------------------------
function GameWin(nWinner)
	if (nWinner == 1) then 
		str = "Chung cuéc" .. "phe thñ:"..GetGamerName(1).."Th¾ng lîi lín råi, tiÕp tôc duy tr×! "..GetGameCity().."Giµnh quyÒn thèng trÞ! TiÕp tôc duy tr× ";
		NotifyWarResult(GetWarOfCity(), 0)
	else
		str= "Chung cuéc" .. "phe c«ng:"..GetGamerName(2) .. "Thu ®­îc ®¹i th¾ng lîi! Th¾ng lîi råi! "..GetGameCity().."Giµnh quyÒn thèng trÞ! TiÕp tôc duy tr× ";
	
		NotifyWarResult(GetWarOfCity(), 1)
	end;
	
	WriteLog(date("%m%d-%H:%M")..str)
	AddGlobalNews(str); 
	CloseMission(MISSIONID);
end;

--------------------------------------------------------------------------------------
-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
	nRestMin = floor(nSec / 60);
	nRestSec = mod(nSec,60)
	return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
--»ñÈ¡³ÇÕ½µÄ³ÇÊÐ
function GetWarOfCity()
	for i = 1,7 do
		if (HaveBeginWar(i) ~= 0) then
			return i;
		end;
	end;
	return 0;
end;
---------------------------------------------------------------------------

function GetGamerName(nWinner)
	CityID = GetWarOfCity();
	Tong1, Tong2=GetCityWarBothSides(CityID);
	if (nWinner == 1) then 
		return Tong2;
	else 
		return Tong1;
	end;
end;
----------------------------------------------------------------------------
function GetGameCity()
	CityID = GetWarOfCity();
	return GetCityAreaName(CityID);
end;
----------------------------------------------------------------------------

function GetNearstPos(X,Y, PosTab)
	PosCount = getn(PosTab);
	PosId = 0;
	MaxDist = 999999999;

	BeyondCount = 0;--³¬¹ý×î´óÔÊÐí¾àÀëµÄÊýÁ¿,Èç¹û¶¼³¬¹ýµÄ»°£¬¾Í·µ»Ø0

	for i = 1, PosCount do 
		Dist = sqrt( (X-PosTab[i][1]) * (X-PosTab[i][1]) + (Y - PosTab[i][2]) * (Y - PosTab[i][2]))
		if (Dist >= 600) then 
			BeyondCount = BeyondCount + 1;
		end;
		if (i == 1) then 
			PosId = 1
			MaxDist = Dist
		elseif (MaxDist > Dist) then 
			PosId = i
			MaxDist = Dist
		end
	end;

	if (BeyondCount >= PosCount) then
		return 0
	else
		return PosId;
	end;
end;

function CreateObstacle(X,Y)
	for i=-10,3 do 
		AddObstacleObj(359, 221, X + i * 16 ,Y - i * 16)
	end
end;

function ClearObstacle(X,Y)
	for i=-10,3 do 
		ClearObstacleObj(221, X + i * 16 ,Y - i * 16)
	end
end;

function DelNpcSafe(nNpcIndex)
	WriteLog(GetLoop()..": DelNpcSafe:"..nNpcIndex);
	
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

function sf_onplayerleave()
	RestoreOwnFeature()
end

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
--	AddSkillState(RANK_SKILL, rank - 1, 0, 999999);
	Msg2Player(TAB_RANKMSG[rank]);
	BT_SetData(PL_CURRANK, rank);
end

-------------------------½øÈëÕ½³¡Ê±¸³¸øÍæ¼ÒÏàÓ¦Í·ÏÎ ENDING----------------------------------

function bt_addtotalpoint(point)
	if (point == 0) then
		return
	end
	BT_SetData(PL_TOTALPOINT, BT_GetData(PL_TOTALPOINT) + point)
	bt_JudgePLAddTitle()
end

--------------------------¼ÆËã»ý·Ö---------------------------------------
function ResetBonus()
	BT_SetTypeBonus(PL_KILLPLAYER, 1, floor(BONUS_KILLPLAYER))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 1, floor(BONUS_MAXSERIESKILL))
	
	BT_SetTypeBonus(PL_KILLPLAYER, 2, floor(BONUS_KILLPLAYER))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 2, floor(BONUS_MAXSERIESKILL))
end
------------------------------------------------------------------------------------
-------------------------------------------------------------------------
function bt_setnormaltask2type()
--701ÒÑ¾­±»Õ¼ÓÃ£¬ËùÒÔ¸ü»»µ½751
BT_SetType2Task(1, 751)
for i = 2, 50 do 
	BT_SetType2Task(i, 700 + i);
end
end
