Include("\\script\\event\\menglan_2006\\menglan_2006.lua"); -- By ÁÎÖ¾É½(Ô½ÄÏ06ÓÛÀ¼½Ú);
Include("\\script\\lib\\gb_taskfuncs.lua");	 				-- By ÁÎÖ¾É½»Ô»ÍÖ®ÖÖ;
Include("\\script\\lib\\gb_modulefuncs.lua"); 				-- By ÁÎÖ¾É½»Ô»ÍÖ®ÖÖ;
Include("\\script\\global\\skills_table.lua");
Include("\\script\\battles\\battlehead.lua");
Include("\\script\\event\\mid_autumn\\mooncake_head.lua");
Include("\\script\\missions\\leaguematch\\wlls_gmscript.lua");
Include("\\script\\event\\wulin_2nd\\wulin_gmscript.lua");
Include("\\script\\event\\tongwar\\tongwar_gmscript.lua");

-- Í¬°éÏµÍ³µÄÍ·ÎÄ¼þ
IncludeLib("PARTNER");

-- ÎÄ¼þÏµÍ³µÄÍ·ÎÄ¼þ
IncludeLib("FILESYS");

-- ÈÎÎñÏµÍ³
IncludeLib("TASKSYS");

-- Í¬°é¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include ("\\script\\task\\partner\\task_head.lua");
Include("\\script\\missions\\boss\\callboss_incity.lua");

Include("\\script\\task\\random\\treasure_head.lua");  -- ²Ø±¦Í¼¹¦ÄÜ

-- ¶ÁÈëËæ»úÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\system\\task_main.lua");
-- »Ô»ÍÖ®Ò¹
Include("\\script\\event\\great_night\\lantern\\create_lanterns.lua");
--ÌØÊâÑÌ»¨
Include("\\script\\item\\fireworks_callback.lua");
--ÇéÈË½Ú»î¶¯2006
Include("\\script\\item\\valentine_callback.lua");

if (GetProductRegion() == "cn_ib") then
	--IB·þÎñÆ÷Ë¢bossÐÂ¹æÔò
	Include([[\script\event\ib\ib_seed_boss.lua]]);
end

-- ¼Ó¸÷ÃÅ¼¼ÄÜÊ±£¬Ö±½ÓÊ¹ÓÃº¯Êý£ºadd_tw(90) ×¢Òâ¸÷ÃÅÅÉËõÐ´²»Í¬¡£ÈëÃÅÎª10,10¼¶¼¼ÄÜÎª20...ÕòÅÉ¾øÑ§Îª70,90¼¶¼¼ÄÜÎª90¡£¸Ãº¯Êý²»×Ô¶¯Í¶µã
--------------------- Dan_Deng's cmd ---------------------
function ShowTask(i)			-- ÏÔÊ¾Íæ¼ÒÄ³¸öÈÎÎñ±äÁ¿µÄÖµ
	Msg2Player(GetTask(i))
end



GLB_CURITERATOR = 49
GLB_CURMATCHTYPE = 50
GLB_MATCHPHASE = 51
GLB_MATCHLEAGUEINFO = 52
MAX_LEAGUECOUNT = 210
WL_SIGNMAP_PREMAP = 
{
{458, 458},
{461, 461},
{464, 464},
{467, 467},
{470, 470},
{473, 473},
{476, 476},
{479, 479},
{482, 482},
{485, 485},
{488, 491},
{489, 492},
{490, 493},
{497, 503},
{498, 504},
{499, 505},
{500, 506},
{501, 507},
{502, 508},
}

WL_MAPTAB_ZONE = {
					{	584, {572, 573, 596}	},
					{	585, {574, 575, 597}	},
					{	586, {576, 577, 598}	},
					{	587, {578, 579, 599}	},
					{	588, {580, 581, 600}	},
					{	589, {582, 583, 601}	},
					}

WL_TAB_ZONEINFO = {
"1-1",
"1-2",
"1-3",
"2-1",
"2-2",
"2-3",
"3-1",
"3-2",
"3-3",
"4-1",
"4-2",
"4-3",
"5-1",
"5-2",
"6-1",
"6-2",
"6-3",
"7-1",
"7-2",
"7-3",
"8-1",
"8-2",
"9-1",
"9-2",
"10-1",
"10-2",
"11-1",
"11-2",
"11-3",
"12-1",
"12-2",
"13-1",
"13-2",
"14-1",
"15-1",
"16-1",
"17-1",
"18-1",
"19-1",
"20-1",
"20-2",
"22-1",
}
function gw_msg2player(rolename, str)
	local playeridx = SearchPlayer(rolename)
	if (playeridx > 0) then
		local old = PlayerIndex 
		PlayerIndex = playeridx
		Msg2Player(str)
		PlayerIndex = old
	end
end

function wulin_signmap2premap( signmapid )
	for i = 1, getn(WL_SIGNMAP_PREMAP) do
		if ( WL_SIGNMAP_PREMAP[i][1] == signmapid ) then
			return WL_SIGNMAP_PREMAP[i][2]
		end
	end
end
function wulin_newmatchinfocome(matchtype, map, who, oppt)
	print("newmatchinfo"..matchtype..","..map..","..who.."vs"..oppt)
--ÃÅÅÉÈüÊ±£¬GLB_MATCHLEAGUEINFO -> GLB_MATCHLEAGUEINFO + 10*2Ö®¼ä´æ·Å£¬Ã¿Ïî±ÈÈüËùÔÚµÄ±¨ÃûµØÍ¼±àºÅ
--µ±who == 9999Ê±£¬±íÊ¾ÃÅÅÉÈü£¬´ËÊ±²»´æ·Å×ÔÒÑºÍ¶ÔÊÖÐÅÏ¢£¬ÒòÎªÃ¿Ïî±ÈÈüµÄÑ¡ÊÖÔÚÍ¬Ò»µØÍ¼±ÈÈü
	if (who == 9999) then
		if (matchtype > 0 and matchtype <= 10) then
			SetGlbValue(GLB_MATCHLEAGUEINFO + (matchtype - 1) * 2, map)
			--SetGlbValue(GLB_MATCHLEAGUEINFO + (matchtype - 1) * 2 + 1, 0)
			print("TrËn m«n ph¸i: type"..matchtype.."Khu vùc lµ "..map)
		end
		return
	end
--µ±ÃÅÅÉÈüwho~=9999£¬Ôò±íÊ¾ÊÇÌÔÌ­Èü£¬ÔòÊÇÃ¿ÏîÃÅÅÉÈü×î´ó32¸ö¶ÓÎé£¬ËùÒÔÃ¿¸öÃÅÅÉÐÅÏ¢Õ¼32*2¸öTaskValue£¬°´Ë³ÐòÅÅ¿ª
	if (matchtype >= 1 and matchtype <= 10) then
		for i = 1, 32 do 
			if (GetGlbValue(GLB_MATCHLEAGUEINFO + 20 + (matchtype - 1)  * 32 * 2 + i * 2 ) == 0) then
				SetGlbValue(GLB_MATCHLEAGUEINFO + 20 + (matchtype - 1)  * 32 * 2 + i * 2, who)
				SetGlbValue(GLB_MATCHLEAGUEINFO + 20 + (matchtype - 1)  * 32 * 2 + i * 2 + 1, oppt)
				print("TrËn thanh trõ m«n ph¸i: type"..matchtype.." "..who.." VS "..oppt)
				return
			end
		end
	else 
--·ÇÃÅÅÉÈüÊ±£¬GLB_MATCHLEAGUEINFO -> GLB_MATCHLEAGUEINFO + N * 2´æ·Å±ÈÈüµÄÐÅÏ¢ µÚn¸ö´æ·ÅÕ½¶ÓºÅnµÄËùÔÚ±¨ÃûµØÍ¼ÒÔ¼°¶ÔÊÖµÄÕ½¶Ó±àºÅ
		SetGlbValue(GLB_MATCHLEAGUEINFO + ( who - 1) * 2 , map)
		SetGlbValue(GLB_MATCHLEAGUEINFO + ( who - 1) * 2 + 1,oppt)
		print("Thi ®Êu"..matchtype.." map:"..map.." "..who.." VS "..oppt)
	end
end

function wulin_openzonematch(signmapid, matchphase, zoneid1, zoneid2)
	SetGlbValue(GLB_CURMATCHTYPE ,15)
	SetGlbValue(GLB_MATCHPHASE, matchphase)
	SetGlbValue(GLB_MATCHLEAGUEINFO + (zoneid1 - 1)*2, signmapid)
	SetGlbValue(GLB_MATCHLEAGUEINFO + (zoneid1 - 1)*2 + 1, zoneid2)
	SetGlbValue(GLB_MATCHLEAGUEINFO + (zoneid2 - 1)*2, signmapid)
	SetGlbValue(GLB_MATCHLEAGUEINFO + (zoneid2 - 1)*2 + 1, zoneid1)
	
	subWorld = SubWorldID2Idx(signmapid)
	local tongname1 = ""
	local tongname2 = ""
	if (WL_TAB_ZONEINFO[zoneid1]) then
		tongname1 = WL_TAB_ZONEINFO[zoneid1]
	end
	if (WL_TAB_ZONEINFO[zoneid2]) then
		tongname2 = WL_TAB_ZONEINFO[zoneid2]
	end
	
	local resultstr = "HiÖn t¹i, trËn ®oµn thÓ khu vùc §¹i héi Vâ L©m ®· b¾t ®Çu! Khu vùc ®èi chiÕn lµ: ["..tongname1.."] vµ ["..tongname2.."], Xin tuyÓn thñ khu vùc 2 phe khÈn tr­¬ng ®Õn c¸c thµnh thÞ vµo trËn!";
	Msg2SubWorld(resultstr)
	--µ±Ç°·þÎñÆ÷´æÔÚ¸Ã±¨ÃûµãµØÍ¼
	if (subWorld >=0) then
		oldSubWorld = SubWorld
		local nMatchMap = -1
		--ÕÒµ½¸Ã±¨ÃûµãµØÍ¼Ëù¹ÜÏ½µÄÕ½³¡µØÍ¼¿ÕÏÐµÄ£¬ÓÃËüÀ´´òÕâ¸ö±ÈÈü
		for i = 1, getn(WL_MAPTAB_ZONE) do 
			if (WL_MAPTAB_ZONE[i][1] == signmapid) then
				for j = 1, getn(WL_MAPTAB_ZONE[i][2]) do 
					subWorld = SubWorldID2Idx(WL_MAPTAB_ZONE[i][2][j])
					if (subWorld >= 0) then
						SubWorld = subWorld
						if (GetMissionV(1) == 0) then
							nMatchMap = subWorld
							break
						end
					end
				end
			end
		end
		if (nMatchMap < 0) then
			return
		end
		SubWorld = nMatchMap
			
		OpenMission(41)
		SetMissionS(3, tongname1)
		SetMissionS(4, tongname2)
		AddGlobalNews(resultstr) 		
		SetMissionV(41, zoneid1)
		SetMissionV(42, zoneid2)
		SubWorld = oldSubWorld
	end
end

--´ò¿ª±ÈÈü
function wulin_openmatch(matchtype, signmapid, matchphase)
	print("openmatch"..matchtype..","..signmapid..","..matchphase)
	--Èç¹ûmatchtype==0ÔòÇå³ýËùÓÐÊý¾Ý
	if (matchtype == 0) then
		for i = 0, 32 * 10 * 2 + 20 * 2 do
			SetGlbValue(GLB_MATCHLEAGUEINFO + i, 0)
		end
		return 
	end
	SetGlbValue(GLB_CURMATCHTYPE, matchtype)
	SetGlbValue(GLB_MATCHPHASE, matchphase)
	if (matchtype > 0 and matchtype <= 10 and matchphase > 0) then
		SetGlbValue(GLB_MATCHLEAGUEINFO + (matchtype - 1) * 2 + 1, matchphase)
	end
	
	if (matchtype == 9999) then 
		return
	end
	sub = SubWorldID2Idx(signmapid)
	OldSubWorld = SubWorld
	if (sub > 0) then
		SubWorld = sub
		local missionid = 21
		if (matchphase == 1) then --Ô¤Èü
			if (matchtype <= 10) then
				missionid = 21
			else
				missionid = 21 + (matchtype - 10) * 4
			end
		else
			if (matchtype <= 10) then
				missionid = 23
			else
				missionid = 23 + (matchtype - 10) * 4
			end
		end
		print("openmission"..missionid.." map"..signmapid)
		local premap = wulin_signmap2premap( signmapid )
		local presub = SubWorldID2Idx(premap)
		--´ò¿ª×¼±¸³¡µÄMission
		SubWorld = presub
		OpenMission(missionid)
	end
	SubWorld = OldSubWorld
end

function BT_LoginBattle(camp)
	 BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	 BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	 BT_SetData(PL_ROUND, BT_GetGameData(GAME_ROUND))
	 BT_SetData(PL_BATTLECAMP, camp) 
end;

function PowerUp(lvl)
	for i=1,lvl do AddOwnExp(9999999) end	-- ¼Ó¾­Ñéµ½Ö¸¶¨¼¶±ð
	AddItem(0,10,5,5,0,0,0)	-- ¶¥¼¶°×ÂíÒ»Æ¥
	AddProp(200000);AddStrg(50000);AddDex(50000);AddVit(50000);AddEng(50000)	-- Á¦Á¿¡¢Éí·¨¡¢Íâ¹¦¡¢ÄÚ¹¦¸÷1000
	AddMagic(160,60)	-- ÌÝÔÆ×Ý
	AddMagic(21,60)		-- Ò×½î¾­
	AddMagic(36,60)		-- ÌìÍõÕ½Òâ
	AddMagic(92,60)		-- ÍûÔÂ£¨»ØÑª¹â»·£©
	AddMagic(282,60)		-- ÃÎµû£¨»ØÄÚ¹â»·£©
	AddMagic(332,60)		-- ´Èº½ÆÕ¶É£¨´ó²¹Ñª£©
	AddMagic(712,60)		-- ´Èº½ÆÕ¶É£¨´ó²¹Ñª£©
	AddMagic(130,60)	-- ×íµû¿ñÎè
	AddMagic(75,60)		-- Îå¶¾Ææ¾­
	AddMagic(156,60)		-- ´¿ÑôÐÄ·¨
	AddMagic(161,60)		-- Á½ÒÇÐÄ·¨
	AddMagic(166,60)		-- Ì«¼«Éñ¹¦
	Earn(10000000)			-- 1000WÒø×Ó
end

function BuildTong(bGoTo)			-- Íê³É½¨°ïµÄ×¼±¸¹¤×÷
	SetCurCamp(4)
	SetCamp(4)
	if bGoTo then
		Earn(10^9)
		AddLeadExp(10011100)
		AddRepute(500)
		AddEventItem(195)
		NewWorld(2,2350,3493)
	else
		SetTask(99, 1)
		CreateTong(1)
		-- ÓÃÓÚµ±³¤ÀÏ
		AddLeadExp(10011100)
		AddRepute(500)
	end
end;

------------------ End of Dan_Deng's cmd ------------------
function GetPlayerInfo()
str="Name Is "..GetName().."Life Is"..GetLife().."SwordOnline!";
Say(str,0);
end;

function RunStation()
CurStation = 3;
main();
end;

function ShowOnline()
Msg2Player("Srv:["..GetServerName().."] Online:"..GetPlayerCount());
end;
function ShowGMCmd()
Say("GM Command List",7,"DoSct","RunSctFile","ReloadSct","ReloadAll","ShowGMCmd","GetPlayerInfo","Woooo!");
end;

function RESTORE()
RestoreMana();
RestoreLife();
RestoreStamina();
end;

function GotoFight()
--RESTORE();
SetPos(1474, 3284);
--Say("3",1,"sdfsd");
end;


function GenRandomNpc(Level, Width,Height, NpcNum, NpcFrom, NpcTo)
x ,y, worldindex = GetPos();

if (Width <= 0 or Height <=0 or NpcNum <=0 or NpcFrom <=0  or NpcTo <=0) then
return
end;

if (x == nil) then 
return
end;

PerWidth = Width/sqrt(NpcNum);
PerHeight = Height / sqrt(NpcNum);

for i = 1, NpcNum do 
	Npctemp = random(NpcFrom, NpcTo);
	
	NpcIndex = AddNpc(Npctemp, Level, worldindex, (x - Width/2) +  mod(i, sqrt(NpcNum)) * PerWidth, (y - Height/2) + i/sqrt(NpcNum) * PerHeight);

	if (NpcIndex>0) then
	random(1,2)
		if (random(1,2) == 1) then
		SetNpcCurCamp(NpcIndex, 1)
		else
		SetNpcCurCamp(NpcIndex, 2)
		end;
	end;

end;

end;

function MoveTestPlayer(NpcFrom ,NpcTo, x, y ,worldindex, Width, Height)
Msg2Player(x.." "..y.." "..worldindex);
if (Width <= 0 or Height <=0 or NpcFrom <=0  or NpcTo <=0) then
return
end;

if (x == nil) then 
return
end;

NpcNum = NpcTo - NpcFrom + 1;
Msg2Player("sdfsdf"..NpcNum);
PerWidth = Width/sqrt(NpcNum);
PerHeight = Height / sqrt(NpcNum);
nCount = 1;

for i = 1, NpcNum do 

	PlayerIndex = NpcFrom + i - 1;
	Msg2SubWorld("f"..PlayerIndex);
	if (strfind(GetName(), "test")) then
	PosX = (x - Width/2) +  mod(nCount, sqrt(NpcNum)) * PerWidth;
	PosY = (y - Height/2) + nCount / sqrt(NpcNum) * PerHeight;
	Msg2SubWorld("world"..worldindex.." ["..x..","..y.."]to["..PosX..","..PosY.."]");
	NewWorld(worldindex, PosX/32, PosY/32);
	Msg2SubWorld(GetName().."Have Move");
	nCount = nCount + 1;
	end;

end;

end;

function SPos()
x,y = GetPos();
Msg2Player((x)..","..(y))
end;

function LEVERUP(nLevel)
for i = 1, nLevel do 
AddOwnExp(1000000);
end;
end;

function GotoStation(nStation)
Msg2Player("Ngåi yªn ch­a? Chóng ta ®i "..GetStationName(nStation))
nW , nX, nY = GetStationPos(nStation);
NewWorld(nW, nX , nY );
end;

function GotoTermini(nTermini)
Msg2Player("Goto "..GetWayPointName(nTermini));
nW, nX, nY = GetWayPointPos(nTermini);
NewWorld(nW, nX, nY);
end;

function GotoPlace(nPlace)
NewWorld(Place[nPlace].W, Place[nPlace].X, Place[nPlace].Y);
end;

function ShowWorldPos()
w,x,y = GetWorldPos();
return "NewWorld("..w..","..x..","..y..")";
end;

function JoinJ()
NewWorld(44, 1245, 3753);
AddMagic(54,5);
AddMSPlayer(1,2);
SetCurCamp( 2);
SetFightState( 0);
SetPunish( 0)
SetDeathScript("\\script\\missions\\ËÎ½ðÕ½³¡pkÕ½\\Ö÷½ÇËÀÍö1.lua");
SetPos(47584/32, 106880/32);
SetMissionV(6, GetMissionV( 6 ) + 1);
SetTask(230, 20);
SetTask(232, GetMissionV( 7 ));
SetTask(231, 2);
end;

function JoinS()
NewWorld(44, 1245, 3753);
AddMagic(54,5);
AddMSPlayer(1,1);
SetCurCamp(1);
SetFightState(0);
SetDeathScript("\\script\\missions\\ËÎ½ðÕ½³¡pkÕ½\\Ö÷½ÇËÀÍö.lua");
SetPunish(0)
SetPos(31168/32, 133472/32);
SetMissionV(5, GetMissionV(5) + 1);
SetTask(230, 20);
SetTask(232, GetMissionV(7));
SetTask(231, 2);
end;

function AddSkills(Party,Level)
	local skillMap ={
		sl={
			{14,20},
			{8,20},
			{10,20},
			{4,20},
			{6,20},
			{15,20},
			{16,20},
			{20,20},
			{271,20},
			{11,20},
			{19,20},
			{273,30},
			{21,20},
			{318,20},
			{319,20},
			{321,20},
			{709,20},
			{1055,20},
			{1056,20},
			{1057,20},
		},
		tw={
			{34,20},
			{30,20},
			{29,20},
			{26,20},
			{23,20},
			{24,20},
			{33,20},
			{37,20},
			{35,20},
			{31,20},
			{40,20},
			{42,20},
			{36,30},
			{32,20},
			{41,20},
			{324,20},
			{322,20},
			{323,20},
			{325,20},
			{708,20},
			{1058,20},
			{1059,20},
			{1060,20},
		},
		em={
			{85,20},
			{80,20},
			{77,20},
			{79,20},
			{93,20},
			{385,20},
			{82,20},
			{89,20},
			{86,20},
			{92,20},
			{252,30},
			{88,20},
			{91,20},
			{282,20},
			{328,20},
			{380,20},
			{332,20},
			{712,20},
			{1061,20},
			{1062,20},
			{1114,20},
		},
		cy={
			{99,20},
			{102,20},
			{95,20},
			{97,20},
			{269,20},
			{105,20},
			{113,20},
			{100,20},
			{109,20},
			{114,30},
			{108,20},
			{111,20},
			{336,20},
			{337,20},
			{713,20},
			{1063,20},
			{1065,20},
		},
		tm={
			{45,20},
			{43,20},
			{347,20},
			{303,20},
			{50,20},
			{54,20},
			{47,20},
			{343,20},
			{345,20},
			{349,20},
			{48,30},
			{249,20},
			{58,20},
			{341,20},
			{339,20},
			{302,20},
			{342,20},
			{351,20},
			{710,20},
			{1069,20},
			{1070,20},
			{1071,20},
			{1110,20},
		},
		wu={
			{63,20},
			{65,20},
			{62,20},
			{60,20},
			{67,20},
			{70,20},
			{66,20},
			{68,20},
			{384,20},
			{64,20},
			{69,20},
			{356,20},
			{73,20},
			{72,20},
			{75,30},
			{71,20},
			{74,20},
			{353,20},
			{355,20},
			{390,20},
			{711,20},
			{1066,20},
			{1067,20},
		},
		gb={
			{122,20},
			{119,20},
			{116,20},
			{115,20},
			{129,20},
			{274,20},
			{124,20},
			{277,20},
			{128,20},
			{125,20},
			{130,30},
			{360,20},
			{357,20},
			{359,20},
			{714,20},
			{1073,20},
			{1074,20},
		},
		tr={
			{135,20},
			{145,20},
			{132,20},
			{131,20},
			{136,20},
			{137,20},
			{141,20},
			{138,20},
			{140,20},
			{364,20},
			{143,20},
			{150,30},
			{142,20},
			{148,20},
			{361,20},
			{362,20},
			{391,20},
			{715,20},
			{1075,20},
			{1076,20},
		},
		wd={
			{153,20},
			{155,20},
			{152,20},
			{151,20},
			{159,20},
			{164,20},
			{158,20},
			{160,20},
			{157,20},
			{166,30},
			{165,20},
			{267,20},
			{365,20},
			{368,20},
			{716,20},
			{1078,20},
			{1079,20},
		},
		kl={
			{169,20},
			{179,20},
			{167,20},
			{168,20},
			{392,20},
			{171,20},
			{174,20},
			{178,20},
			{172,20},
			{393,20},
			{173,20},
			{175,20},
			{181,20},
			{176,20},
			{90,20},
			{275,30},
			{182,20},
			{372,20},
			{375,20},
			{394,20},
			{717,20},
			{1080,20},
			{1081,20},
		}
	}
	if(Level~=nil) then
		for party ,each in skillMap do
			for i=1, getn(skillMap[party]) do
				skillMap[party][i][2]=Level
			end
		end
	end
	if(Party ==nil) then
		Msg2Player("Muèn ng¨n chÆn ta µ, kh«ng dÔ dµng thÕ ®©u!")
	else
		if(skillMap[Party]==nil) then
			Msg2Player("NhËp tªn m«n ph¸i bÞ sai!")
			return
		end
		for i=1,getn(skillMap[Party]) do
			AddMagic(skillMap[Party][i][1],skillMap[Party][i][2])
		end
	end
	return
end
function DelSkills(Party)
	local skillMap ={
		sl={
			{14,20},
			{8,20},
			{10,20},
			{4,20},
			{6,20},
			{15,20},
			{16,20},
			{20,20},
			{271,20},
			{11,20},
			{19,20},
			{273,30},
			{21,20},
			{318,20},
			{319,20},
			{321,20},
			{709,20},
		},
		tw={
			{34,20},
			{30,20},
			{29,20},
			{26,20},
			{23,20},
			{24,20},
			{33,20},
			{37,20},
			{35,20},
			{31,20},
			{40,20},
			{42,20},
			{36,30},
			{32,20},
			{41,20},
			{324,20},
			{322,20},
			{323,20},
			{325,20},
			{708,20},
		},
		em={
			{85,20},
			{80,20},
			{77,20},
			{79,20},
			{93,20},
			{385,20},
			{82,20},
			{89,20},
			{86,20},
			{92,20},
			{252,30},
			{88,20},
			{91,20},
			{282,20},
			{328,20},
			{380,20},
			{332,20},
			{712,20},
		},
		cy={
			{99,20},
			{102,20},
			{95,20},
			{97,20},
			{269,20},
			{105,20},
			{113,20},
			{100,20},
			{109,20},
			{114,30},
			{108,20},
			{111,20},
			{336,20},
			{337,20},
			{713,20},
		},
		tm={
			{45,20},
			{43,20},
			{347,20},
			{303,20},
			{50,20},
			{54,20},
			{47,20},
			{343,20},
			{345,20},
			{349,20},
			{48,30},
			{249,20},
			{58,20},
			{341,20},
			{339,20},
			{302,20},
			{342,20},
			{351,20},
			{710,20},
		},
		wu={
			{63,20},
			{65,20},
			{62,20},
			{60,20},
			{67,20},
			{70,20},
			{66,20},
			{68,20},
			{384,20},
			{64,20},
			{69,20},
			{356,20},
			{73,20},
			{72,20},
			{75,30},
			{71,20},
			{74,20},
			{353,20},
			{355,20},
			{390,20},
			{711,20},
		},
		gb={
			{122,20},
			{119,20},
			{116,20},
			{115,20},
			{129,20},
			{274,20},
			{124,20},
			{277,20},
			{128,20},
			{125,20},
			{130,30},
			{360,20},
			{357,20},
			{359,20},
			{714,20},
		},
		tr={
			{135,20},
			{145,20},
			{132,20},
			{131,20},
			{136,20},
			{137,20},
			{141,20},
			{138,20},
			{140,20},
			{364,20},
			{143,20},
			{150,30},
			{142,20},
			{148,20},
			{361,20},
			{362,20},
			{391,20},
			{715,20},
		},
		wd={
			{153,20},
			{155,20},
			{152,20},
			{151,20},
			{159,20},
			{164,20},
			{158,20},
			{160,20},
			{157,20},
			{166,30},
			{165,20},
			{267,20},
			{365,20},
			{368,20},
			{716,20},
		},
		kl={
			{169,20},
			{179,20},
			{167,20},
			{168,20},
			{392,20},
			{171,20},
			{174,20},
			{178,20},
			{172,20},
			{393,20},
			{173,20},
			{175,20},
			{181,20},
			{176,20},
			{90,20},
			{275,30},
			{182,20},
			{372,20},
			{375,20},
			{394,20},
			{717,20},
		}
	}
	if(Party ==nil) then
		for  party,each in skillMap do
			for  i=1,getn(skillMap[party]) do
				DelMagic(skillMap[party][i][1])
			end
		end
	else
		if(skillMap[Party]==nil) then
			return
		end
		for i=1,getn(skillMap[Party]) do
			DelMagic(skillMap[Party][i][1])
		end
	end
	UpdateSkill()
	return
end

function CallNpc(Series,NpcID,NpcLvl,Name,Revive,IsBoss)
	local w,x,y = GetWorldPos()
	
	local 	mapindex = SubWorldID2Idx(w)
	if (mapindex < 0 ) then
		Msg2Player("Get MapIndex Error.")
		return
	end;
	local posx = x*32
	local posy = y*32
	if (not NpcLvl) then
		NpcLvl = 100
	end
	if(not Series) then
		Series=0
	end
	if(not NpcID) then
		NpcID = 576
	end
	if(not Name) then
		Name = " [%s]NPC l©m thêi [%s, %s]"
	end	;
	function Revive2Str(r)
		if (r ~= 0) then
			return "cã thÓ t¸i sinh"
		end
		return "kh«ng thÓ t¸i sinh"
	end
	function IsBoss2Str(b)
		if(b==0) then
			return "NPC phæ th«ng"
		end
		return "BOSS"
	end
	function Name2Str(s,id,r,b)
		return format(s,id,r,b)
	end
	if(not Revive) then
		Revive = 0
	end
	if( not IsBoss) then
		IsBoss = 0
	end
	AddNpcEx(NpcID,NpcLvl,Series,mapindex,posx,posy,Revive, Name2Str(Name,NpcID,Revive2Str(Revive),IsBoss2Str(IsBoss)), IsBoss)

end

--GV_TSK_CD_OPEN = 35

function CityDefence_OpenMain(citycamp)
	SetGlbValue( 35, citycamp )
	local oldSubWorld = SubWorld
	local mapid = 516	--ËÎ·½ÊØ³ÇµØÍ¼
	if (citycamp == 2) then
		mapid = 517		--½ð·½ÊØ³ÇµØÍ¼
	end
	sidx = SubWorldID2Idx( mapid )
	if ( sidx >= 0 ) then
		SubWorld = sidx
		OpenMission( 23 )
		SubWorld = oldSubWorld
	end
end

function CityDefence_CloseMain()
	SetGlbValue( 35, 0 )
end


-- 2005-09ÖÐÇï»î¶¯¶Ò»»ÔÂ±ý²ÄÁÏ
function ExchangeMoonCakeMaterial(mapid, delay_minute, material_type, material_count)
	-- ÅÐ¶ÏµØÍ¼ÊÇ·ñ´æÔÚ
	if (SubWorldID2Idx(mapid) >= 0) then
		if (material_type == 0) then
			-- ¹Ø±Õ¶Ò»»
			StopGlbMSTimer(MISSION_MOONCAKE_EXCHANGE, TIMER_MOONCAKE_EXCHANGE)
			SetGlbValue(GBL_VAR_MOONCAKE_EXCHANGING, 0)
		else
			-- ÉèÖÃ¶Ò»»²ÄÁÏÀà±ð
			SetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_TYPE, material_type)
			-- ÉèÖÃ¶Ò»»²ÄÁÏÊýÄ¿
			SetGlbValue(GBL_VAR_MOONCAKE_MARTERIAL_COUNT, material_count)
			-- ÉèÖÃ¶Ò»»²ÄÁÏµÄ³ÇÊÐ
			SetGlbValue(GBL_VAR_MOONCAKE_CITY, mapid)
			-- DEBUG
			print(format("Mooncake exchange => %d : %d", material_type, material_count))
			-- Æô¶¯ÑÓ³Ù¶Ò»»¶¨Ê±Æ÷
			StartGlbMSTimer(MISSION_MOONCAKE_EXCHANGE, TIMER_MOONCAKE_EXCHANGE, delay_minute * 60 * 18)
		end
	end
end




function Global_GreatSeedExecute(mapid, seedlevel, count, SeedPosFile,szMapName, nBatch)	--TASK GREATE SEED
	-- ÅÐ¶ÏµØÍ¼ÊÇ·ñ´æÔÚ
	local worldidx = SubWorldID2Idx(mapid)
	if (worldidx < 0) then	--Èç¹ûÔÚ¸Ã×é·þÎñÆ÷ÉÏ
		return
	end;
	local nRetCode = TabFile_Load(SeedPosFile, SeedPosFile); --Èç¹û¶ÁÎÄ¼þ³É¹¦;
	if (nRetCode == 0)then
		print("Read file"..SeedPosFile.."Failed in function 'Global_GreatSeedExecute()'");
		return
	end;
	--´´½¨ºÍÉ¾³ý»î¶¯NPC
	ShowSeed(worldidx, mapid, seedlevel, count, SeedPosFile,szMapName,nBatch)
	
	TabFile_UnLoad(NPCPosFile);
end;

function ShowSeed(worldidx, mapid, seedlevel, count, SeedPosFile,szMapName, nBatch)
	--
	local nCurDate = tonumber(GetLocalDate("%m%d"))
	--ÖÖ×Ó¶Ô°×
	local szScriptFile = "\\script\\event\\great_night\\npc_great_seed.lua"
	--ÆÕÍ¨¹ûÊµ¶Ô°×
	local szGrowScriptFile = "\\script\\event\\great_night\\npc_great_fruit.lua"
	--»Æ½ðÖÖ×Ó¶Ô°×
	local szGoldFruitScriptFile = "\\script\\event\\great_night\\golden_fruit.lua";
	
	local nBeginNumber = gb_GetTask("h¹t Huy Hoµng",12)
	local nNpcTmpl = 1110
	local szNpcScriptFile = szScriptFile
	local szNpcName = "h¹t Huy Hoµng"
	if mod(nBatch	,2 ) == 0 then
		--Èç¹ûÎª¹ûÊµÅú´Î£¬ÔòÇå³ýÖÖ×ÓNPC
		ClearMapNpcWithName(mapid, "h¹t Huy Hoµng")
		ClearMapNpcWithName(mapid, "H¹t Hoµng Kim ");
		if seedlevel == 4  then
			nNpcTmpl = 1118
			szNpcScriptFile = szGoldFruitScriptFile
			szNpcName = "Qu¶ Hoµng Kim"
		else
			nNpcTmpl = 1111
			szNpcScriptFile = szGrowScriptFile
			szNpcName = "Qu¶ Huy Hoµng"
		end
	elseif seedlevel ==  4 then
			nNpcTmpl = 1117
			szNpcName = "H¹t Hoµng Kim "
	end
	--
	local nLineCount = TabFile_GetRowCount(SeedPosFile) - 1;
	--Èç¹û·¢·ÅÊýÁ¿´óÓÚ×ø±êÊýÁ¿Ôò¿³È¥¶àÓàµÄ²¿·Ö
	count = (nLineCount < count ) and nLineCount or  count 
	for i = 1, count do
			nPosX = tonumber(TabFile_GetCell(SeedPosFile, i + 1, "nPosX"));
			nPosY = tonumber(TabFile_GetCell(SeedPosFile, i + 1, "nPosY"));
			if (nil ~= nPosX and nil ~= nPosY) then
				local nNPCIndex = AddNpc(nNpcTmpl , 1, worldidx, nPosX * 32, nPosY * 32);
				if (nNPCIndex > 0) then
					nBeginNumber = nBeginNumber + 1
					gb_SetTask("h¹t Huy Hoµng",12,nBeginNumber)
					SetNpcScript(nNPCIndex, szNpcScriptFile );
					SetNpcParam(nNPCIndex, 1, seedlevel);
					SetNpcParam(nNPCIndex, 2, nBeginNumber*10000 +  nCurDate ); --  nCurDate --¼ÓÉÏµ±Ç°ÈÕÆÚ
					if szNpcName == "Qu¶ Hoµng Kim" or szNpcName == "H¹t Hoµng Kim " then
						Msg2SubWorld("<color=yellow>"..szNpcName.."<color>".." xuÊt hiÖn t¹i "..szMapName.." ("..floor(nPosX / 8)..","..floor(nPosY / 16)..") . ")
					end
				end;
			end;
	end;
end;

--GV_TSK_CD_OPEN = 35

function NewCityDefence_OpenMain(citycamp)
	SetGlbValue( 35, citycamp )
	local oldSubWorld = SubWorld
	local mapid = 580	--ËÎ·½ÊØ³ÇµØÍ¼
	if (citycamp == 2) then
		mapid = 581		--½ð·½ÊØ³ÇµØÍ¼
	end
	sidx = SubWorldID2Idx( mapid )
	if ( sidx >= 0 ) then
		SubWorld = sidx
		OpenMission( 27 )
		SubWorld = oldSubWorld
	end
end

function festival_shrewmouse(nMapID)
    local nMapIndex = SubWorldID2Idx(nMapID);
    
    if (nMapIndex < 0) then
        return
    end;
    local FESTIVAL_06_GAMEMAPID = 585;
    local FESTIVAL_06_PREPAREMISSIONID = 30;
    local FESTIVAL_06_MISSIONID = 31;
    local FESTIVAL_06_GLOBALVALUE = 848;
    local FESTIVAL_06_STATESTART = 1;
    
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(FESTIVAL_06_GAMEMAPID);
	CloseMission(FESTIVAL_06_MISSIONID);
	
	SubWorld = nMapIndex;
	CloseMission(FESTIVAL_06_PREPAREMISSIONID);
	local nState = gb_GetModule("Ho¹t ®éng xu©n 2006") 
    if (nState == 1) then
	OpenMission(FESTIVAL_06_PREPAREMISSIONID);
	SetGlbValue(FESTIVAL_06_GLOBALVALUE, FESTIVAL_06_STATESTART); 
	SubWorld = OldSubWorld;
    end
end;

function chrismas_shrewmouse(mapid)
	local WorldIdx = SubWorldID2Idx(mapid);
	
	if (mapid < 0) then
		return
	end;
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(583);
	CloseMission(28);
	SubWorld = SubWorldID2Idx(mapid);
	CloseMission(29);
	OpenMission(29);
	SetGlbValue(848, 1); --ÕâÀïÒªÈ·¶¨ÊÇ¶àÉÙ
	SubWorld = OldSubWorld;
end;
