IncludeLib("BATTLE");
IncludeLib("TITLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
--ÔËÁ¸Ä£Ê½ÖĞPL_PARAM3ÓÃÓÚµ±Íæ¼ÒÊôÓÚ±³Á¸Ê¿±øÊ±µÄ±ê¼Ç


function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	SetMissionV(MS_FLAGMODE , flagmode)
	
	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--ÏÔÊ¾ÓëÍ³¼Æ×Ü»ı·Ö
	BT_SetView(PL_KILLPLAYER);--É±Íæ¼ÒÊıÄ¿
	BT_SetView(PL_KILLNPC);--É±NpcÊıÄ¿
	BT_SetView(PL_BEKILLED);--±¾Íæ¼Ò±»É±´ÎÊı
	BT_SetView(PL_GETITEM);
	BT_SetView(PL_MAXSERIESKILL);--Á¬Õ¶´ÎÊı
	
	BT_SetGameData(GAME_CAMP1, 0) --ÉèÖÃµ±Ç°ËÎ·½ÈËÊı
	BT_SetGameData(GAME_CAMP2, 0) --ÉèÖÃµ±Ç°½ğ·½ÈËÊı

	subworldid = SubWorldIdx2ID(SubWorld)	
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
	
	--ÉèÖÃ»ÍÖ®ÕÂ»î¶¯½±Àø±¶Êı
	SetMissionV(MS_HUANGZHIZHANG, greatnight_huang_event(1))
	
	--»ñµÃµØÍ¼Ïà¶ÔÓ¦µÄÉè¶¨ÎÄ¼şÃû
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	

	--µÃµ½¸ÃµØÍ¼ÓĞ¼¸¸öÇøÓò
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--Ëæ»ú´ÓËùÓĞÇøÓòÖĞ³éÈ¡Á½¸ö£¬×÷ÎªË«·½µÄÖ÷ÇøÓò
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)
	
	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);

	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--¶ÁÈ¡Á½¸öÇøÓòµÄ´óÓªÄÚµã×ø±ê
	--´Ó´óÓªµ½ºóÓªÊ±µÄ×ø±êµã
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--´ÓºóÓªµ½´óÓªµÄ×ø±êµã
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
-------------------------------------------------------------------------
	
	--°Ú·ÅTrapµã
	--°Ú·ÅË«·½ºóÓªµÄTrapµã

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--°Ú·ÅË«·½¾üÓªµÄtrapµã

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP1)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP2)
	

	--°Ú·Å¶Ô»°ÀàĞÍNpc
	--¾üÒ½µÄ°Ú·Å
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "Qu©n Nhu quan (Tèng) ");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Qu©n Nhu quan (Kim) ");
	
	
	--Ë§ÆìµÄ°Ú·Å
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--ÖüÎïÏäµÄ°Ú·Å
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32,y * 32);
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32, y * 32);
	
	
	StartMissionTimer(MISSIONID, 97, TIMER_2);
	--Ëæ»úÄ£Ê½ĞèÒª´ò¿ªÃ¿X·ÖÖÓ´¥·¢Ò»´ÎµÄ´¥·¢Æ÷£¬ÒÔ²úÉúĞÂÆì
	StartMissionTimer(MISSIONID, 96, TIMER_1);
	
	SetMissionV(MS_STATE,1);--ÔÊĞí±¨ÃûÁË
	if (level == 1) then
		lvlstr = "Khu vùc S¬ cÊp "
	elseif (level == 2) then
		lvlstr = "Khu vùc Trung cÊp "
	else
		lvlstr = "Khu vùc Cao cÊp "
	end
	
	RestMin, RestSec = GetMinAndSec(1800);
	local str1 = lvlstr.."Tèng Kim ®¹i chiÕn ph­¬ng thøc VËn l­¬ng ®ang cho b¸o danh, mäi ng­êi h·y mau chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh, hoÆc cã thÓ dïng Tèng Kim chiªu th­ ®Ó trùc tiÕp ®Õn ®iÓm b¸o danh ChiÕn tr­êng Tèng Kim, thêi gian cßn l¹i lµ:"..RestMin.."phót"..RestSec.."gi©y. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40. phİ b¸o danh 3000 l­îng";
	AddGlobalNews(str1);
	CreateChannel("Phe Tèng"..szGAME_GAMELEVEL[level].."VËn l­¬ng", 9)
	CreateChannel("Phe Kim"..szGAME_GAMELEVEL[level].."VËn l­¬ng", 10)
	BT_SetMissionName("Ph­¬ng thøc VËn l­¬ng")
	BT_SetMissionDesc("Bèi c¶nh:N¨m 1160, chñ t­íng phe Kim lµ Hoµng Nhan L­îng víi ©m m­u chiÕm ®o¹t n­íc Tèng ®· xu«i qu©n Nam h¹, nh­ng khi ®Õn T­¬ng D­¬ng th× gÆp ph¶i sù chèng tr¶ quyÕt liÖt cña binh sü thµnh nµy. TrËn ®¹i chiÕn khèc liÖt ®· ®­îc ch©m ngßi tõ ®©y.<enter><enter><color=yellow>Ph­¬ng thøc VËn l­¬ng: vËn chuyÓn bao l­¬ng trªn Xe l­¬ng vÒ ®¹i b¶n doanh cña phe m×nh, bªn nµo vËn chuyÓn ®­îc nhiÒu Bao l­¬ng h¬n sÏ dµnh chiÕn th¾ng.<enter>Háa th¹ch: dïng ®Ó thiªu hñy Xe l­¬ng ®èi ph­¬ng.")
	WriteLog(lvlstr.."Tèng Kim ®¹i chiÕn ph­¬ng thøc VËn l­¬ng b¾t ®Çu cho b¸o danh. ID B¶n ®å lµ:"..subworldid..".Thêi gian:"..date("%H:%M"))
	
end;

function RunMission()
	SetMissionV(MS_STATE,2);
	
	local subworldid = SubWorldIdx2ID(SubWorld);
	local level = BT_GetGameData(GAME_LEVEL);
	if (level == 1) then
		lvlstr = "Khu vùc S¬ cÊp "
	elseif (level == 2) then
		lvlstr = "Khu vùc Trung cÊp "
	else
		lvlstr = "Khu vùc Cao cÊp "
	end
	
	WriteLog(format("%s Tèng Kim ®¹i chiÕn ph­¬ng thøc VËn l­¬ng ®· b¾t ®Çu. ID b¶n ®å lµ: %d. Thêi gian khai chiÕn: %s Tû lÖ qu©n sè Tèng vµ Kim lµ %d:%d",
				lvlstr, subworldid, GetLocalDate("%y-%m-%d %H:%M"),GetMSPlayerCount(MISSIONID, 1),GetMSPlayerCount(MISSIONID, 2)))
	
	local idx = 0;
	local pidx = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		--´ËÊ±ÎªGM·¢²¼ÃüÁî£¬ÕıÊ½´òÏìÕ½¶·
		if (pidx > 0) then
			PlayerIndex = pidx;
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() );
			PutMessage("§Şch qu©n ®· b¾t ®Çu hµnh ®éng! C¸c chiÕn sÜ! X«ng lªn!");
		end;
		if (idx <= 0) then 
			break
		end;
	end;
	PlayerIndex = oldPlayerIndex
end;

function EndMission()
	StopMissionTimer(MISSIONID, 96);
	StopMissionTimer(MISSIONID ,97);
	
	GameOver();
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("Phe Tèng"..szGAME_GAMELEVEL[level].."VËn l­¬ng")
	DeleteChannel("Phe Kim"..szGAME_GAMELEVEL[level].."VËn l­¬ng")

	SetGlbValue(GLB_BATTLESTATE, 0) --ÉèÖÃ¸ÃÈ«¾Ö±äÁ¿Îª1£¬±êÖ¾µ±Ç°·şÎñÆ÷Õı´¦ÓÚËÎ½ğÕ½ÒÛ½×¶Î£¬´ËÊ±ÏåÑô»òÖìÏÉÕòµÄ³ö¿Úµã×Ô¶¯ÉèÔÚËÎ½ğÕ½ÒÛµÄ±¨Ãûµã£¬·ñÔòÔòÉèÔÚÔ­ËÎ½ğÕ½³¡µØÍ¼
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--¼ÆËã»ı·ÖÏµÊı£¬ÖØÖÃ»ı·Ö
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	branchTask_JoinSJend1()
	-- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖĞOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØĞëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "Phe Tèng"..szGAME_GAMELEVEL[level].."VËn l­¬ng")
	else
		LeaveChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."VËn l­¬ng")
	end
	sf_onplayerleave()
	SyncTaskValue(700 + PL_BATTLEPOINT);--Í¬²½Íæ¼ÒµÄ×Ü»ı·Ö¸ø¿Í»§¶Ë£¬ÓÃÓÚ»ı·Ö¹ºÂò¹¦ÄÜ
	AddSkillState(656,30,0,0) --½µÍæ¼ÒµÄËÙ¶È
	AddSkillState(661,5,0,0) --Çå³ıÍæ¼ÒµÄ³ÆºÅ¼¼ÄÜÊı¾İ
	Title_ActiveTitle(0);
	local nRecord = GetTask(PL_TOTALPOINT + 750);	--By Liao Zhishan
	local nBeiShu = greatnight_huang_event(1);
	if (nBeiShu > 0) then
		nRecord = floor(nRecord / nBeiShu);
	end;
	local nOffered = GetTask(2435);
	SetTask(2435, nRecord);
	if (nRecord > nOffered) then
		tongaward_battle(nRecord - nOffered);--
	end;

	if (GetMissionV(MS_TIMER1_TIME) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end	
	ResetBonus()		--¼ÆËã»ı·ÖÏµÊı£¬ÖØÖÃ»ı·Ö
end;
