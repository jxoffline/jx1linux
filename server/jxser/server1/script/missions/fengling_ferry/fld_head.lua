--AddEventItem(489)·çÁê¶ÉÁìÅÆ
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

MISSIONID = 15			--Î´¶¨
FRAME2TIME = 18;		--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
boatMAPS = {337, 338, 339};		--ÄÏ°¶¶É´¬µØÍ¼ÒÀË³ĞòÎª£¬337ÄÏ°¶ÉÏÓÎ¡¢338ÖĞÓÎ¡¢339ÏÂÓÎ
boatMAP_POS = {1646, 3233}
northMAP = 336
northMAP_POS = {{1158, 2964}, {1343, 2868}, {1482, 2796}}
TNPC_THIEF = {724, 725}
TNPC_THIEF_COUNT = 30
npcthiefpos = "\\settings\\maps\\ÖĞÔ­±±Çø\\¶É´¬\\¶É´¬Ë¢¹Öµã.txt"
FLD_TIMER_1 = 20 * FRAME2TIME	--Ã¿20Ãë¹«²¼Ò»ÏÂÕ½¿ö
FLD_TIMER_2 = 39 * 60 * FRAME2TIME		--´Ó±¨Ãûµ½½øÈë´ò±¦µØÍ¼40·ÖÖÓ
ENDSIGN_TIME = 10 * 60 * FRAME2TIME/FLD_TIMER_1		--±¨ÃûÊ±¼ä½áÊø
UPBOSS_TIME = 25 * 60 * FRAME2TIME/FLD_TIMER_1		--¿ª´ò15·ÖÖÓÊ±²úÉúµÚ1¸öBOSS
UPBOSS_TIME2 = 30 * 60 * FRAME2TIME/FLD_TIMER_1		--¿ª´ò20·ÖÖÓÊ±²úÉúµÚ2¸öBOSS
UPBOSS_TIME3 = 35 * 60 * FRAME2TIME/FLD_TIMER_1		--¿ª´ò25·ÖÖÓÊ±²úÉúµÚ3¸öBOSS
REPORT_TIME = 38 * 60 * FRAME2TIME/FLD_TIMER_1 
HUOYUEDU_TIME = 3 * 60 * FRAME2TIME/FLD_TIMER_1 -- »îÔ¾¶È»ñµÃÊ±¼ä£¬´¬¿ªÆôºóµÄ3·ÖÖÓ

MS_STATE = 1
MS_TIMEACC_1MIN = 2
MS_TIMEACC_20SEC = 3




function fld_cancel()
end

function fld_wanttakeboat(addr)

	-- Gia nhËp m«n ph¸i míi lªn thuyÒn Modified - by AnhHH - 20110724
	if (GetLastFactionNumber() == -1)then
		Talk(1,"","§¹i hiÖp ch­a gia nhËp m«n ph¸i kh«ng thÓ lªn thuyÒn")
		return
	end
	
	local orgworld = SubWorld
	local MapId = boatMAPS[addr]
	if (MapId <= 0) then
		print("error:fenglingdu script wrong! mapid is nil!")
		return
	end
	local idx = SubWorldID2Idx(MapId)		
	if (idx < 0) then
		Say("Xin lçi! Phİa tr­íc ®ang cã nguy hiÓm! T¹m thêi ch­a thÓ lªn thuyÒn!.",0)
		return
	end
	if (fld_haveroom() == 1) then
		return
	end
	local sz_msg = "Muèn ®ãn thuyÒn ®Õn bê B¾c Phong L¨ng §é ph¶i cã Phong L¨ng §é lÖnh bµi hoÆc ng­¬i ®­a ta <color=red>200<color> cuèn MËt ®å thÇn bİ, ta sÏ cho ng­¬i lªn thuyÒn!";
	local str = {	
		"Ta cã lÖnh bµi Phong L¨ng §é/use_lingpai",
		"Ta ®· thu thËp ®ñ 200 cuèn MËt ®å thÇn bİ/use_juanzhou",
		"§Ó ta suy nghÜ l¹i!/fld_cancel",
			};
	--§iÒu chØnh thêi gian phong l¨ng ®é tèn phİ - Modified by DinhHQ - 20110504
	if (check_new_shuizeitask() == 1) then
		sz_msg = format("Mçi ngµy vµo lóc 10:00,14:00,16:00,18:00,20:00,cÇn ph¶i cã %s míi cã thÓ ®i tham gia Bê B¾c Phong L¨ng §é, sau khi thuËn lîi v­ît qua sÏ cã phÇn th­ëng", "LÖnh Bµi Thñy TÆc");
		str = {	
		format("Ta cã %s/use_suizeilingpai", "LÖnh Bµi Thñy TÆc"),
		"§Ó ta suy nghÜ l¹i!/fld_cancel",
			};
	end
	
	if (addr == 1) then
		Say(" "..sz_msg, getn(str), str);
	elseif (addr == 2) then
		Say(" "..sz_msg, getn(str), str);
	elseif (addr == 3) then
		Say(" "..sz_msg, getn(str), str);
	end
end



function fld_TakeBoat(plindex)
	orgplayerindex = PlayerIndex
	PlayerIndex = plindex

	local orgworld = SubWorld
	if ( BOATID == 1 ) then
		boatmapid = 337
		idx = SubWorldID2Idx(boatmapid)
	elseif( BOATID == 2 ) then
		boatmapid = 338
		idx = SubWorldID2Idx(boatmapid)
	elseif ( BOATID == 3 ) then
		boatmapid = 339
		idx = SubWorldID2Idx(boatmapid)
	else
		return 0
	end

	oldsubworldindex = SubWorld
	SubWorld = SubWorldID2Idx(boatmapid)
	if (fld_haveroom() == 1) then
		return 0
	end
	t = 10 - GetMissionV(MS_TIMEACC_1MIN)
	if (t <= 0) then
		return 0
	end
	LeaveTeam()
	--DinhHQ
	--20110405: Fix bug, ngoµi thêi gian 13h, 15h, 17h, 19h bÕn 2 3 cã thÓ pk cõu s¸t
	if (check_new_shuizeitask() == 1) then
		if ( BOATID ~= 1 ) then
			SetTaskTemp(200,1);
			ForbidEnmity(1);			
		end		
	end
	SetCurCamp(1);	
--	if ( BOATID ~= 1 ) then
--		ForbidEnmity(1);
--		SetCurCamp(1);
--	end
	
--	SetTaskTemp(200,1);
	SetFightState(0)
	posx, posy = fld_getadata(npcthiefpos)
	posx = floor(posx/32)
	posy = floor(posy/32)
	AddMSPlayer(MISSIONID,1)
	NewWorld(boatmapid, posx, posy)
	Msg2Player("cßn"..t.." phót thuyÒn rêi bÕn, ®Õn bê B¾c Phong L¨ng §é")
	DisabledUseTownP(1)	--ÏŞÖÆÆäÔÚ¶É´¬ÄÚÊ¹ÓÃ»Ø³Ç·û
	SetRevPos(175,1);		--ÉèÖÃÖØÉúµãÔÚÎ÷É½´å
	SetLogoutRV(1)
	SetCreateTeam(0);
	SetDeathScript("\\script\\missions\\fengling_ferry\\fld_death.lua")
	SubWorld = oldsubworldindex
	PlayerIndex = orgplayerindex
	return 1
end

function fld_haveroom()
	if (GetMSPlayerCount(MISSIONID, 1) >= 100 ) then
		if (BOATID == 1) then
			Say("Ng­¬i ®Õn trÔ råi! ThuyÒn ®· ®Çy råi, h·y chê chuyÕn sau ®i!", 0)
			return 1
		elseif (BOATID == 2) then
			Say("Ng­¬i ®· ®Õn trÔ! ThuyÒn ®· ®Çy råi, h·y chê chuyÕn sau ®i!", 0)
			return 1
		elseif (BOATID == 3) then
			Say("Ng­¬i ®· ®Õn trÔ! ThuyÒn ®· ®Çy råi, h·y chê chuyÕn sau ®i!", 0)
			return 1
		end
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function fld_landingpos(posation)
	if (posation <= 0 and posation >3) then
		print("error: i still not know why!")
		return
	end
	return northMAP, northMAP_POS[posation][1], northMAP_POS[posation][2]
end

function fld_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

-- ÉñÃØ¾íÖá½»¸¶½çÃæ
function	use_juanzhou()	--Ê¹ÓÃÉñÃØ¾íÖá
	GiveItemUI( "Giao MËt ®å thÇn bİ ", "§Æt 200 cuèn MËt ®å thÇn bİ vµo « phİa d­íi, b¹n ph¶i chó ı, nÕu MËt ®å thÇn bİ trong « İt h¬n hoÆc nhiÒu h¬n 200 cuèn ta sÏ kh«ng nhËn.", "exchange_juanzhou", "no" );
end;

-- È·¶¨ÉñÃØ¾íÖáÊıÁ¿º¯Êı
function exchange_juanzhou(ncount)
	local scrollarray = {}
	local scrollcount = 0
	local scrollidx = {}
	local y = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype ==196) then	
			y = y + 1
			scrollidx[y] = nItemIdx;
			scrollarray[i] = GetItemStackCount(nItemIdx)
			scrollcount = scrollcount + scrollarray[i]
		end
	end
	if (y ~= ncount) then
		Say("MËt ®å thÇn bİ h×nh nh­ kh«ng ®óng! H·y kiÓm tra l¹i xem.", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./use_juanzhou", "§Ó ta kiÓm tra xem sao/no")
		return
	end
	if (scrollcount > 200) then
		Say("Ta chØ cÇn 200 cuèn MËt ®å thÇn bİ, cßn l¹i ng­¬i ®em vÒ ®i!", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./use_juanzhou", "§Ó ta kiÓm tra xem sao/no")
		return
	end
	if (scrollcount < 200) then
		Say("MËt ®å thÇn bİ ch­a ®ñ! H·y thö l¹i xem!", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./use_juanzhou", "§Ó ta kiÓm tra xem sao/no")
		return
	end
	if (scrollcount == 200) then
		if (fld_TakeBoat(PlayerIndex) ~= 1) then
			Say("Thêi gian kh«ng ®îi ai c¶! ThuyÒn ®· ®i råi, lÇn sau ng­¬i h·y quay l¹i!", 0)
			return
		end
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i])
		end
	end;		
end;


-- ·çÁê¶ÉÁîÅÆ½»¸¶½çÃæ
function	use_lingpai()	--Ê¹ÓÃ·çÁê¶ÉÁîÅÆ
	GiveItemUI( format("Giao diÖn giao phİ %s LÖnh Bµi", "LÖnh bµi Phong L¨ng §é"), format("Dïng 1 c¸i %s ®Æt vµo « trèng phİa d­íi. N?u ng­¬i lÊy nh÷ng thø r¸c r­ëi kh¸c ®Æt vµo, ta sÏ kh«ng thÌm nhËn", "LÖnh bµi Phong L¨ng §é"), "exchange_lingpai_1", "no" );
end;

function use_suizeilingpai()
--Modified By DinhHQ - 20110930
	GiveItemUI( format("Giao diÖn giao phİ %s LÖnh Bµi", "LÖnh Bµi Thñy TÆc"), format("Dïng 1 c¸i %s ®Æt vµo « trèng phİa d­íi. N?u ng­¬i lÊy nh÷ng thø r¸c r­ëi kh¸c ®Æt vµo, ta sÏ kh«ng thÌm nhËn", "LÖnh Bµi Thñy TÆc"), "exchange_lingpai_2", "no", 1 );
end

function exchange_lingpai_1(ncount)
	exchange_lingpai(ncount, 1)
end

function exchange_lingpai_2(ncount)
	exchange_lingpai(ncount, 2)
end

-- È·¶¨
function exchange_lingpai(ncount, ntype)
	if (ncount == 0) then
		Say("Hõ! Kh«ng cã lÖnh bµi mµ muèn ngåi thuyÒn?", 0)
		return
	end
	
	if (ncount > 1) then
		Say("Kh«ng ph¶i ta b¶o ng­¬i ®õng ®Æt lung tung hay sao?", 0)
		return
	end

	local nItemIdx = GetGiveItemUnit(1);
	local nStackCount = GetItemStackCount(nItemIdx);
	
	if (nStackCount > 1) then
		Say("ThuyÒn Phu Bê Nam:  Ta chØ cÇn mét c¸i LÖnh Bµi, nh÷ng thø kh¸c ta kh«ng cÇn", 0)
		return
	end
	
	local itemgenre, detailtype, particular = GetItemProp(nItemIdx);
	
	if (ntype ==1) then
		if (itemgenre ~= 4 or detailtype ~= 489) then
			Say(format("ThuyÒn Phu Bê Nam:  Ta chØ cÇn mét c¸i LÖnh Bµi, nh÷ng thø kh¸c ta kh«ng cÇn", "LÖnh bµi Phong L¨ng §é"), 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./use_lingpai", "§Ó ta kiÓm tra xem sao/no")
			return
		end
	else
		if (itemgenre ~= 6 or particular ~= 2745) then
			Say(format("ThuyÒn Phu Bê Nam:  Ta chØ cÇn mét c¸i LÖnh Bµi, nh÷ng thø kh¸c ta kh«ng cÇn", "LÖnh Bµi Thñy TÆc"), 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./use_suizeilingpai", "§Ó ta kiÓm tra xem sao/no")
			return
		end
	end
	
	if (fld_TakeBoat(PlayerIndex) ~= 1) then
		Say("Thêi gian kh«ng ®îi ai c¶! ThuyÒn ®· ®i råi, lÇn sau ng­¬i h·y quay l¹i!", 0)
		return
	end
	
	RemoveItemByIndex(nItemIdx);
	if particular == 2745 then
		AddStatData("shuizeilingpai_shiyongshuliang", 1)	--Êı¾İÂñµãµÚÒ»ÆÚ
	end
	tbLog:PlayerActionLog("EventChienThang042011","BaoDanhPhongLangDo")	-- ±¨ÃûÈÕÖ¾
	--ghi log tİnh n¨ng key - Modified By DinhHQ - 20120410
	if particular == 2745 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiThuyTac")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhPLD_SDLenhBaiPLD")
	end
end;

function check_new_shuizeitask()
	local nHour = tonumber(GetLocalDate("%H"));
	--§iÒu chØnh thêi gian phong l¨ng ®é tèn phİ - Modified by DinhHQ - 20110504
	local tb_sptime = {
		[10] = 0,
		[14] = 0,
		[16] = 0,
		[18] = 0,
		[20] = 0,
	};
	if (tb_sptime[nHour] and tb_sptime[nHour] == 1) then
		return 1
	else
		return 0
	end
end	

function no()
end;
