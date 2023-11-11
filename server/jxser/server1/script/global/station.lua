Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_city\\head.lua");
Include("\\script\\missions\\clearskill\\clearhole.lua");
Include("\\script\\task\\tollgate\\messenger\\wagoner.lua");  --ÌØÊâÐÅÊ¹µØÍ¼

Include("\\script\\task\\newtask\\map_index.lua"); -- ÓÃÓÚ»ñÈ¡ÈÎÎñÁ´µØÍ¼µÄÐÅÏ¢
Include("\\script\\task\\tollgate\\messenger\\wagoner.lua") --ÓÃÓÚÁ¬½ÓÌØÊâÐÅÊ¹ÈÎÎñµÄ½Å±¾
Include("\\script\\global\\judgeoffline_special.lua")	--ÓÃÓÚÎÞÃû¹È¡ª¡ªÍÐ¹Ü·þÎñÆ÷µØÍ¼

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\head.lua")

Include("\\script\\event\\great_night\\great_night_head.lua")	--Ë«Áú¶´»Æ½ðÖ®ºË
--§iÒu chØnh reset 5h ch¬i - Modified by DinhHQ - 20110630
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")
szStationOp = 
	{
		"Nh÷ng n¬i ®· ®i qua/WayPointFun", 		-- 1
		"Nh÷ng thµnh thÞ ®· ®i qua/StationFun",		-- 2
		"Trë l¹i ®Þa ®iÓm cò /TownPortalFun", 	-- 3
		"§i Hoa s¬n c¶nh kü tr­êng/go_HSBattle", 	-- 4
		"§i ChiÕn tr­êng c«ng thµnh/GoCityWar",			-- 5
		"§i chiÕn tr­êng huÊn luyÖn/GoDemoWar",		-- 6
		"§i ®¶o TÈy Tñy/GotoClearSkillMap",	-- 7
		"§i ®Õn n¬i lµm nhiÖm vô D· TÈu/tl_moveToTaskMap",			-- 8
		"§i n¬i ®Æc biÖt lµm NhiÖm vô TÝn Sø /messenger_wagoner",      -- 9
		--"È¥ÎÞÃû¹È/GotoAnonymVale"			--10
	};

function return_1()
	return 1
end

function return_0()
	return 0
end

-- ¶ÔÓ¦ÉÏ¸öÊý×éµÄÌõ¼þÅÐ¶Ï
aryCondition = {

	[1] = {checkState = return_1},     -- Â·¾­µÄµØ·½
	[2] = {checkState = return_1},     -- Â·¾­µÄ³ÇÊÐ
	[3] = {checkState = return_1},     -- ·µ»ØµÄµØµã
	[4] = {checkState = return_1},     -- È¥»ªÉ½¾º¼¼³¡
	[5] = {checkState = function()                      -- È¥¹¥³ÇÕ½³¡
				return (WhichWarBegin()~= 0 and 1) or 0;
		   end;
		  },
	[6] = {checkState = function()                      -- È¥¹¥³ÇÑµÁ·Õ½³¡
				return (GetGlbValue(2)==1 and 1) or 0;
		   end;
		  },
	[7] = {checkState = return_1},     -- È¥Ï´Ëèµº
	[8] = {checkState = function()                      -- È¥Ò°ÛÅÈÎÎñËùÔÚµØ
				return (GetTask(1021)==4 and 1) or 0;
		   end;
		  },
	[9] = {checkState = function()                      -- È¥ÌØÊâÐÅÊ¹ÈÎÎñËùÔÚµØµã
				return (GetTask(1204)~= 0 and 1) or 0;
		   end;
		  },
	--[10] = {checkState = return_1},    -- ½øÈëÎÞÃû¹È
	[10] = {checkState = return_1},     -- Â·¾­µÄµØ·½
	[11] = {checkState = return_1},
	[12] = {checkState = return_1},
}

szStationOp_Cancel = "Kh«ng cÇn ®©u/StationOnCancel";

function go_HSBattle()
	Msg2Player("Ngåi ch¾c nhÐ! Chóng ta ®i ®Õn Hoa s¬n c¶nh kü tr­êng")
	NewWorld(2,2605,3592)
end

function WayPointFun()			-- ¼Ó·µ»ØÒª800Á½Òø×Ó£¨¶´¿Ú£©¡¡¡¡¡¡£¨BY£º Dan_Deng 2004-04-30£©
	p1 = GetWayPoint(1);
	p2 = GetWayPoint(2);
	p3 = GetWayPoint(3);
	HaveBin={};
	i = 1;
	if (p1 ~= 0)  then
		name = GetWayPointName(p1);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	if (p2 ~= 0)  then
		name = GetWayPointName(p2);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	if (p3 ~= 0)  then
		name = GetWayPointName(p3);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	HaveBin[i] = "Kh«ng ®i ®©u c¶ /OnCancel";
	if (i == 1) then 
		Say("Xin lçi!  Ta chØ cã thÓ ®­a ng­¬i ®Õn nh÷ng n¬i ®· ®i qua nh­ng ng­¬i ch­a ®i ®©u c¶! ",0);
	else
		Say("Xin lùa chän: ", i, HaveBin);
	end;
end;

function WharfFun()
Count = GetWharfCount(CurWharf);
Num = Count;

WharfB = {};
nValidCount = 1;

for i = 1, Num do
WharfId = GetWharf(CurWharf, i);
if (WharfId ~= 0) then
	nPrice = GetWharfPrice(CurWharf, WharfId);
	WharfB[nValidCount] = GetWharfName(WharfId) .. "[" .. nPrice .. " l­îng]" .. "/SelWharf";
	nValidCount = nValidCount + 1;
end;
end;

WharfB[nValidCount] = "Kh«ng ngåi/OnCancel";

if (nValidCount == 1) then 
Say("Xin lçi!  Ng­¬i ch­a ®i ®©u c¶! ", 0);
else
Say("Kh¸ch quan muèn ®i ®©u?", nValidCount, WharfB);
end;

end;

function SelWharf(nSel)

nWharfId = GetWharf( CurWharf, nSel + 1);
nPrice = 0;
if (nWharfId ~= 0) then 
	nPrice = GetWharfPrice(CurWharf, nWharfId);
else
	return
end;

if (PrePay(nPrice) == 1 or GetCamp() == 6 ) then
Msg2Player("Ngåi yªn ch­a? Chóng ta ®i "..GetWharfName(nWharfId))
nW , nX, nY = GetWharfPos(nWharfId);
nResult = NewWorld(nW, nX , nY );
if (nResult == 2) then
Msg2Player("§ang chuyÓn ®æi Server...")
end
if (nResult == 0) then
Msg2Player("NhËp ®iÓm cã sai sãt!")
end
else
Say("Kh«ng tiÒn kh«ng thÓ ngåi thuyÒn", 0);
end;
end;


function StationFun()
	for j = 1, 16 do
		AddStation(j)
	end
	Count = GetStationCount();
	Num = Count;
	if (Count > 10) then
		Num = 10
	end
	StationB = {}
	nValidCount = 1

	for i = 1, Num do
		StationId = GetStation(i, CurStation)
		if (StationId ~= 0) then
			nPrice = GetPrice2Station(CurStation, StationId)
			StationB[nValidCount] = GetStationName(StationId) .. "[" .. nPrice .. " l­îng]" .. "/SelStation"
			nValidCount = nValidCount + 1
		end
	end
	StationB[nValidCount] = "Kh«ng ®i ®©u c¶ /OnCancel";

	if (nValidCount == 1) then 
		Say("Xin lçi!  Ta chØ cã thÓ ®­a ng­¬i ®Õn nh÷ng n¬i ®· ®i qua nh­ng ng­¬i ch­a ®i ®©u c¶! ", 0);
	else
		Say("Xin lùa chän: ", nValidCount, StationB);
	end
end

function SelStation(nSel)
	Count = GetStationCount()
	nStation = GetStation(nSel + 1, CurStation)
	nPrice = GetPrice2Station(CurStation, nStation)
	if (PrePay(nPrice) == 1 or GetCamp() == 6) then
		nW, nX, nY = GetStationPos(nStation);
		nResult = NewWorld(nW, nX , nY );
		Msg2Player("Ngåi yªn ch­a? Chóng ta ®i "..GetStationName(nStation))
		if (nResult == 2) then
			--Msg2Player("·þÎñÆ÷×ª»»ÖÐ...")
		end
		if (nResult == 0) then
			Msg2Player("NhËp ®iÓm cã sai sãt!")
		end
	--§iÒu chØnh reset 5h ch¬i - Modified by NgaVN - 20121015
	--local nSongJinCount = PlayerFunLib:GetTaskDailyCount(1926)
	--if nSongJinCount >= 1 or tbCOT_Party:GetDailyTaskCount() >= 1 then
	SetTireTime(0)
	--end

	else
		Say("Kh«ng tiÒn kh«ng thÓ ngåi xe! ", 0)
	end
end

function TownPortalFun()			-- ·µ»ØÒª2000Á½Òø×Ó£¨Ô­µØµã£©¡¡¡¡£¨BY: Dan_Deng 2004-04-30£©
--	if (PrePay(2000) == 1 or GetCamp() == 6) then
		ReturnFromPortal()
--	else
--		Say("²»ºÃÒâË¼£¬Ã»Ç®¿É×ø²»ÁË³µ£¬Äú»¹ÊÇ×ßÈ¥°É£¡", 0)
--	end
end;

function SelWayPoint(nSel)			-- ·µ»ØÒª1000Á½Òø×Ó£¨¶´¿Ú£©¡¡¡¡¡¡£¨BY£ºDan_Deng 2004-04-30£©
--	if (PrePay(1000) == 1 or GetCamp() == 6) then
		nWayPoint = GetWayPoint(nSel + 1);
		if (nWayPoint ~= 0) then
			nW, nX, nY = GetWayPointPos(nWayPoint)
			nFightState = GetTerminiFState(nWayPoint)
			nResult = NewWorld(nW, nX, nY)
			SetFightState(nFightState)
--			Msg2Player("Goto"..GetWayPointName(nWayPoint)..nW..nX..nY);
			if (nResult == 2) then
--				Msg2Player("·þÎñÆ÷×ª»»ÖÐ...")
			end
			if (nResult == 0) then
--				Msg2Player("´«ÈëµãÓÐ´íÎó.")
			end
		end;
--	else									-- ²»¹»Ç®¾Í¾Ü¾ø
--		Say("²»ºÃÒâË¼£¬Ã»Ç®¿É×ø²»ÁË³µ£¬Äú»¹ÊÇ×ßÈ¥°É£¡", 0);
--	end;
end

--³ÇÕ½ÊÇ·ñ¿ªÊ¼ÁË
function WhichWarBegin()
	for i = 1,7 do
		if (HaveBeginWar(i) ~= 0) then
			return i;
		end;
	end;
	return 0;
end;

function CancelGoCityWar()
	Say("ChiÕn tr­êng §ao KiÕm v« t×nh!  Xin nghÜa sÜ h·y quay vÒ ®Ó b¶o toµn tÝnh m¹ng", 0);
end;

function GoCityWar()
	CityID = WhichWarBegin();
	if (CityID >= 1 and CityID <= 7) then
		Tong1, Tong2 = GetCityWarBothSides(CityID);
		str = format("HiÖn t¹i %s ®ang tiÕn hµnh c«ng thµnh chiÕn, bªn c«ng<%s>, bªn thñ<%s>, xin hái ng­¬i muèn tham chiÕn bªn nµo?", GetCityAreaName(CityID), Tong1, Tong2);
		Say(str , 3, "Bªn c«ng/GoCityWarAttack", "Bªn thñ /GoCityWarDefend", "Kh«ng bªn nµo hÕt/CancelGoCityWar");
	end;
end;

--È¥¹¥³ÇÕ½ÊØ·½Èë¿Ú
function GoCityWarDefend()
	CityID = WhichWarBegin();
	if (CityID == 0 ) then 
		return
	end;

	TongName, result = GetTong()
	Tong1, Tong2 = GetCityWarBothSides(CityID);
	if (Tong2 ~= TongName and GetItemCountEx(CardTab[CityID * 2]) < 1) then 
		if (GetTask(TV_CITYID) ~= CityID or GetTask(TV_VALUE) ~= 1 or GetTask(TV_TASKID) ~= MISSIONID) then
			Say("Th©n phËn nghÜa sÜ ch­a phï hîp!  T¹i h¹ kh«ng d¸m m¹o muéi ®­a vµo!  Xin nghÜa sÜ quay vÒ! ", 0);
			return
		end;
	end;
	
	if (random(0,1) == 1) then
		NewWorld(222, 1614, 3172);
	else
		NewWorld(222, 1629, 3193);
	end;
end;

--È¥¹¥³ÇÕ½¹¥·½Èë¿Ú
function GoCityWarAttack()
	CityID = WhichWarBegin();
	if (CityID == 0) then 
		return
	end;

	TongName, result = GetTong()
	Tong1, Tong2 = GetCityWarBothSides(CityID);
	if (Tong1 ~= TongName and GetItemCountEx(CardTab[CityID * 2 - 1]) < 1) then
		if (GetTask(TV_CITYID) ~= CityID or GetTask(TV_VALUE) ~= 2 or GetTask(TV_TASKID) ~= MISSIONID) then
			Say("Th©n phËn nghÜa sÜ ch­a phï hîp!  T¹i h¹ kh«ng d¸m m¹o muéi ®­a vµo!  Xin nghÜa sÜ quay vÒ! ", 0);
			return
		end
	end
	
	if (random(0,1) == 1) then
		NewWorld(223, 1614, 3172);
	else
		NewWorld(223, 1629, 3193);
	end;

end;

function GoDemoWar()
	Say("C«ng thµnh ®ang s¾p b¾t ®Çu!  Ng­¬i cã muèn tham gia kh«ng?", 3,"Ta tham gia bªn thñ!/GotoDefend", "Ta tham gia bªn c«ng/GotoAttack", "Ch­a chuÈn bÞ tèt, lÇn sau ®i!/OnCancel") 
end;

function GotoDefend()
if (random(0,1) == 1) then
	NewWorld(222, 1614, 3172);
else
	NewWorld(222, 1629, 3193);
end;
end;

function GotoAttack()
	if (random(0,1) == 1) then
		NewWorld(223, 1614, 3172);
	else
		NewWorld(223, 1629, 3193);
	end;
end;

-- È¥Ï´µãµØÍ¼
function GotoClearSkillMap()
	-- ÔÝÊ±ÆÁ±ÎÈ¥Ï´µãµØÍ¼µÄ¹¦ÄÜ
	-- Say("³µ·ò£ºÃâ·ÑÈ¥Ï´ËèµºµÄ»ú»áÖ»ÓÐÒ»´Î¡£Äã×îºÃ»¹ÊÇÏÈÊìÏ¤Ò»ÏÂÕâ´ÎµÄ¼¼ÄÜµ÷Õû£¬³ÙÒ»µãÔÙÈ¥°É¡£", 1, "ÖªµÀÁË/gotocsm_no")

	nSubWorldID = SubWorldIdx2ID();
	nCityIndex = CSP_GetCityIndexByCityMap(nSubWorldID);
	if (nCityIndex == -1) then
		return -1;
	end
	
	CSP_EnterClearMap(nCityIndex);	
end;

function gotocsm_no()
end;

function OnCancel()
end;

function goto_shijiangu()
	NewWorld(949, floor(51264 / 32), floor(102368 / 32))
end

function _GoELangGu()
	Msg2Player("§· ®Õn ¸c Lang Cèc!")
	local tbTargetMapList = {[11] = 950, [1] = 951, [37] = 952, 
										[176] = 953, [162] = 954, [78] = 955, [80] = 956,}
	local nMapId = GetWorldPos()
	if tbTargetMapList[nMapId] then
 		NewWorld(tbTargetMapList[nMapId], 1592, 3195)
 	end
end

CITY_OPTIONS =
{
	{"Nh÷ng n¬i ®· ®i qua", 				WayPointFun}, 			-- 1
	{"Nh÷ng thµnh thÞ ®· ®i qua",				StationFun},			-- 2
	{"Trë l¹i ®Þa ®iÓm cò ",				TownPortalFun}, 		-- 3
	{"§i Hoa s¬n c¶nh kü tr­êng",			go_HSBattle}, 			-- 4
	{"§i ChiÕn tr­êng c«ng thµnh",				GoCityWar},				-- 5
	{"§i chiÕn tr­êng huÊn luyÖn",			GoDemoWar},				-- 6
	{"§i ®¶o TÈy Tñy",				GotoClearSkillMap},		-- 7
	{"§i ®Õn n¬i lµm nhiÖm vô D· TÈu",		tl_moveToTaskMap},		-- 8
	{"§i n¬i ®Æc biÖt lµm NhiÖm vô TÝn Sø ",	messenger_wagoner},     -- 9
	--"È¥ÎÞÃû¹È",				GotoAnonymVale"			--10
	{"Xin h·y ®­a ta ®Õn ChiÕn Long §éng",		OnGoToNewLiangShuiDong},-- 10
	--{"§i ThÝ LuyÖn Cèc",				goto_shijiangu},		-- 11
	{"§i ¸c Lang Cèc",				_GoELangGu},
}

-- ³ÇÊÐ³µ·òÍ¨ÓÃ½Å±¾
-- ×¢Òâ£º¹¥³ÇÕ½Î´Ê¹ÓÃ´Ëº¯ÊýµÄ½Å±¾ [script\missions\citywar_city\zhongzhuan_map\chefu.lua]
function CityStationCommon(szMsg)	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = szMsg

	--µ¯³ö¶Ô»°¿ò
	for i = 1, getn(CITY_OPTIONS) do
		local tb = CITY_OPTIONS[i]
		-- µ÷ÓÃ aryCondition ÄÚµÄ checkState ¹ý³Ì£¬¼ì²é´Ë¶Ô»°Ñ¡ÏîÊÇ·ñ·ûºÏÌõ¼þ
		if aryCondition[i].checkState() == 1 then
			tbDailog:AddOptEntry(tb[1], tb[2])
		end
	end
	tbDailog:Show()
end;

-- ÐÂÊÖ´å³µ·òÍ¨ÓÃ½Å±¾ (×¢Òâ£ºÄÏÔÀÕò²»ÊÇÐÂÊÖ´å£¬²»µ÷´Ëº¯Êý)
function NewcomerStationCommon(szMsg)
--	check_update()					-- ¼¼ÄÜ¸üÐÂ¡¢ÃÅÅÉ¼Ó±êÊ¶£¨2004-05-31£©
	if (GetLevel() >= 5) then
		if (WhichWarBegin() ~= 0) then
			Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[5], szStationOp_Cancel)
		elseif (GetGlbValue(2) == 1) then -- ¹¥³ÇÑµÁ·Õ½³¡
			Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[6], szStationOp_Cancel)
		else
			if (GetTask(1021) == 4) then -- Èç¹û½ÓÊÜÁËÒ°ÛÅÈÎÎñÖÐÑ°ÕÒµØÍ¼Ö¾µÄÈÎÎñ
				Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[8], szStationOp_Cancel)
			else
				Say(szMsg, 4, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp_Cancel)
			end
		end;
	else		
		Talk(1,"","Bªn ngoµi rÊt lo¹n l¹c, xem bé d¹ng kh«ng c¶n ®­îc giã cña ng­¬i th× khã mµ b¶o toµn tÝnh m¹ng! ")
	end
end;

function  StationOnCancel()
   Talk(1,"","Cã tiÒn th× h·y quay l¹i nhÐ! ")
end;

----------------------------------------------

CP_MAPPOS_IN = {1508,3026}
CP_MAPTAB = {
				{396, 397, "ThiÕu L©m"},
				{398, 399, "Thiªn V­¬ng"},
				{400, 401, "§­êng M«n"},
			 	{402, 403, "Ngò §éc"},
			 	{404, 405, "Nga Mi"},
			 	{406, 407, "Thóy Yªn"},
			 	{408, 409, "C¸i Bang"},
			 	{410, 411, "Thiªn NhÉn"},
			 	{412, 413, "Vâ §ang"},
			 	{414, 415, "C«n L«n"}
			 }

function transtoplace()
	Say("Héi tr­êng thi ®Êu vâ l©m 'KiÖt xuÊt' sÏ tiÕn hµnh trËn ®Êu c¸c m«n ph¸i, ng­¬i muèn vµo kh«ng?", 2, "Ta muèn vµo khu vùc thi ®Êu thi ®Êu 'KiÖt xuÊt'/transtoplace_sure", "§îi mét l¸t ®i!/OnCancel")
end

function transtoplace_sure()

	if (GetLastFactionNumber() == -1) then
		Say("Vâ l©m minh chñ cã lÖnh: Gi¶i thi ®Êu 'KiÖt xuÊt' cña vâ l©m m«n ph¸i chØ h¹n chÕ cho 10 ®¹i m«n ph¸i tham gia. Ng­¬i kh«ng cã m«n ph¸i nµo hÕt trong vâ l©m, kh«ng thÓ tïy tiÖn tham gia ®­îc, mau gia nhËp thËp ®¹i m«n ph¸i, råi ®Õn ®¨ng ký sau!", 0)
		return
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÉÙÁÖ
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌìÍõ
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌÆÃÅ
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Îå¶¾
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--¶ëáÒ
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--´äÑÌ
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Ø¤°ï
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌìÈÌ
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Îäµ±
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--À¥ÂØ
		end
		Msg2Player("B¹n ®· vµo ®Êu tr­êng Vâ l©m kiÖt xuÊt")
	end
end

-- ÓÃÓÚ´¦ÀíÒ»¶ÑÑ¡ÏîµÄ¶Ô»°º¯Êý Say(""...);
-- Edited by peres
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end
	dostring(strMsg)
end


