IncludeLib("BATTLE");
IncludeLib("TITLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\butcher\\head.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")



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

	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--ÏÔÊ¾ÓëÍ³¼Æ×Ü»ı·Ö
	BT_SetView(PL_KILLPLAYER);--É±Íæ¼ÒÊıÄ¿
	BT_SetView(PL_BEKILLED);--±¾Íæ¼Ò±»É±´ÎÊı
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
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	

	--°Ú·Å¶Ô»°ÀàĞÍNpc
	--¾üÒ½µÄ°Ú·Å
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "Qu©n Nhu quan");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Qu©n nhu quan");
	
	--´«ËÍÔ±µÄ°Ú·Å
	transportxy = GetIniFileData(mapfile, "Area_"..s_area, "transportxy");
	x,y = bt_str2xydata(transportxy)
	bt_add_a_diagnpc(FILE_TRANSPORT1, TNPC_TRANSPORT1, x * 32 ,y * 32 , "Trinh s¸t tiÒn tuyÕn");


	transportxy = GetIniFileData(mapfile, "Area_"..j_area, "transportxy");
	x,y = bt_str2xydata(transportxy)
	bt_add_a_diagnpc(FILE_TRANSPORT2, TNPC_TRANSPORT2, x * 32, y * 32, "Trinh s¸t tiÒn tuyÕn");
	
	
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
	
	
	StartMissionTimer(MISSIONID, 40, TIMER_2);
	--Ëæ»úÄ£Ê½ĞèÒª´ò¿ªÃ¿X·ÖÖÓ´¥·¢Ò»´ÎµÄ´¥·¢Æ÷£¬ÒÔ²úÉúĞÂÆì
	StartMissionTimer(MISSIONID, 39, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--ÔÊĞí±¨ÃûÁË
	
	if (level == 1) then
		lvlstr = "Khu vùc S¬ cÊp "
	elseif (level == 2) then
		lvlstr = "Khu vùc Trung cÊp "
	else
		lvlstr = "Khu vùc Cao cÊp "
	end
	
	RestMin, RestSec = GetMinAndSec(600);
	local str1 = lvlstr.."ChiÕn tr­êng Tèng Kim ®ang trong giai ®o¹n b¸o danh, c¸c hiÖp kh¸ch muèn tham gia h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn TrÊn ®Ó b¸o danh (hoÆc dïng Tèng Kim Chiªu Th­) , thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"..RestSec.." gi©y. §iÒu kiÖn tham gia: CÊp kh«ng İt h¬n 40, phİ b¸o danh 100000 l­îng";
	--AddGlobalNews(str1);
	CreateChannel("Phe Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t", 9)
	CreateChannel("Phe Kim"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t", 10)

	BT_SetMissionName("D¹ng thøc Cõu s¸t")
	BT_SetMissionDesc("Bèi c¶nh: N¨m 1160 C«ng nguyªn, Kim chñ Hoµn Nhan L­îng tËp hîp qu©n lùc, quyÕt ®Şnh Nam h¹, tiªu diÖt Tèng triÒu. T­¬ng D­¬ng lµ trë ng¹i ®Çu tiªn cña qu©n Kim, T­¬ng D­¬ng chuÈn bŞ ngËp ch×m trong khãi löa binh ®ao! <enter><enter><color=yellow>D¹ng thøc Cõu s¸t: trªn chiÕn tr­êng, tiªu diÖt cµng nhiÒu qu©n ®Şch cµng nhËn ®­îc nhiÒu phÇn th­ëng tİch lòy. Phe nµo nhiÒu ®iÓm tİch lòy nhÊt sÏ giµnh chiÕn th¾ng chung cuéc. <enter> Ng­êi ch¬i kh«ng ®­îc ë l¹i hËu doanh qu¸ 2 phót. Trong chiÕn tr­êng kh«ng cã NPC chiÕn ®Êu.")

end

function RunMission()
	SetMissionV(MS_STATE,2);
	
	local idx = 0;
	local pidx = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1 , 500 do
		--´ËÊ±ÎªGM·¢²¼ÃüÁî£¬ÕıÊ½´òÏìÕ½¶·
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 		if (pidx > 0) then
 			PlayerIndex = pidx;
 			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
 			PutMessage("§Şch qu©n ®· b¾t ®Çu hµnh ®éng! C¸c chiÕn sÜ! X«ng lªn!");
		end
		if (idx <= 0) then 
			break
		end
	end;
	PlayerIndex = oldPlayerIndex
end;

function EndMission()
	WriteLog("[Battle Log] Ending Misson Begin");
	
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 39);
	StopMissionTimer(MISSIONID ,40);
	
	GameOver()
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("Phe Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t")
	DeleteChannel("Phe Kim"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t")


	SetGlbValue(GLB_BATTLESTATE, 0) --ÉèÖÃ¸ÃÈ«¾Ö±äÁ¿Îª1£¬±êÖ¾µ±Ç°·şÎñÆ÷Õı´¦ÓÚËÎ½ğÕ½ÒÛ½×¶Î£¬´ËÊ±ÏåÑô»òÖìÏÉÕòµÄ³ö¿Úµã×Ô¶¯ÉèÔÚËÎ½ğÕ½ÒÛµÄ±¨Ãûµã£¬·ñÔòÔòÉèÔÚÔ­ËÎ½ğÕ½³¡µØÍ¼
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	
	WriteLog("[Battle Log] Ending Misson End");
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
	
	WriteLog("[Battle Log] Player Leave Battle :"..GetName());
	
	-- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖĞOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØĞëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "Phe Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t")
	else
		LeaveChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."D¹ng thøc Cõu s¸t")
	end
	sf_onplayerleave()
	SyncTaskValue(700 + PL_BATTLEPOINT);--Í¬²½Íæ¼ÒµÄ×Ü»ı·Ö¸ø¿Í»§¶Ë£¬ÓÃÓÚ»ı·Ö¹ºÂò¹¦ÄÜ
	AddSkillState(656,30,0,0) --½µÍæ¼ÒµÄËÙ¶È
	AddSkillState(661,5,0,0) --Çå³ıÍæ¼ÒµÄ³ÆºÅ¼¼ÄÜÊı¾İ
	
	Title_ActiveTitle(0);
	if (GetMissionV(MS_TIMER1) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end
	local nRecord = GetTask(PL_TOTALPOINT + 750);--by Liaozhishan
	local nBeiShu = greatnight_huang_event(1);
	if (nBeiShu > 0) then
		nRecord = floor(nRecord / nBeiShu);
	end;
	local nOffered = GetTask(2435);
	SetTask(2435, nRecord);
	if (nRecord > nOffered) then
		tongaward_battle(nRecord - nOffered);--
	end;
	ResetBonus()		--¼ÆËã»ı·ÖÏµÊı£¬ÖØÖÃ»ı·Ö
end;

