Include("\\script\\missions\\tongwar\\match\\head.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i , 0)
	end
	for i = 1, 10 do
		SetMissionS(i, "")
	end


	bt_setnormaltask2type()		--Õâ¸öÓĞÓÃ
	BT_SetView(PL_TOTALPOINT);--ÏÔÊ¾ÓëÍ³¼Æ×Ü»ı·Ö
	BT_SetView(PL_KILLPLAYER);--É±Íæ¼ÒÊıÄ¿
	BT_SetView(PL_BEKILLED);--±¾Íæ¼Ò±»É±´ÎÊı
	BT_SetView(PL_MAXSERIESKILL);--Á¬Õ¶´ÎÊı
	
--	BT_SetGameData(GAME_CAMP1, 0) --ÉèÖÃµ±Ç°ËÎ·½ÈËÊı
--	BT_SetGameData(GAME_CAMP2, 0) --ÉèÖÃµ±Ç°½ğ·½ÈËÊı

	subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
	
	
	--»ñµÃµØÍ¼Ïà¶ÔÓ¦µÄÉè¶¨ÎÄ¼şÃû
	local mapfile = GetMapInfoFile(subworldid)

	--µÃµ½¸ÃµØÍ¼ÓĞ¼¸¸öÇøÓò
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("tongwar error! "..subworldid.." areacount <= 1");
		return
	end
	
	--Ëæ»ú´ÓËùÓĞÇøÓòÖĞ³éÈ¡Á½¸ö£¬×÷ÎªË«·½µÄÖ÷ÇøÓò
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)

	SetMissionV(MS_CAMP1AREA, s_area)
	SetMissionV(MS_CAMP2AREA, j_area)
	
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
	
	
	StartMissionTimer(MISSIONID, 62, TIMER_2);
	--Ëæ»úÄ£Ê½ĞèÒª´ò¿ªÃ¿X·ÖÖÓ´¥·¢Ò»´ÎµÄ´¥·¢Æ÷£¬ÒÔ²úÉúĞÂÆì
	StartMissionTimer(MISSIONID, 61, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--ÔÊĞí±¨ÃûÁË
	SetMissionV(MS_KEYNUMBER, random(1000000+tonumber(date("%y%m%d"))))
	
	local str = "Vâ L©m §Ö NhÊt Bang ®ang trong giai ®o¹n chuÈn bŞ. C¸c bang héi trong danh s¸ch tham chiÕn ngµy h«m nay h·y nhanh chãng ®Õn Vâ L©m Minh Chñ ®Ó vµo khu vùc chuÈn bŞ."
	AddGlobalNews(str);

	BT_SetMissionName("§Ö nhÊt bang chiÕn")

end

function RunMission()
	CreateChannel(GetMissionS(MS_S_CITYNAME_S), 9)
	CreateChannel(GetMissionS(MS_S_CITYNAME_J), 10)
	SetMissionV(MS_STATE,2);
end;

function EndMission()
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 61);
	StopMissionTimer(MISSIONID ,62);
	
	SetMissionV(MS_STATE, 3)
	
	GameOver()
	DeleteChannel(GetMissionS(MS_S_CITYNAME_S))
	DeleteChannel(GetMissionS(MS_S_CITYNAME_J))
	
	ClearMapNpc(SubWorldIdx2ID(SubWorld));	
	ClearMapTrap(SubWorldIdx2ID(SubWorld)); 
	ClearMapObj(SubWorldIdx2ID(SubWorld));

	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	for i = 1, 10 do
		SetMissionS(i, "")
	end
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
end;

function OnLeave(RoleIndex)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = RoleIndex;
	SetFightState(0)
	SetLogoutRV(1)
	ForbidChangePK(0);
	SetPKFlag(0)
	SetPunish(1)
	ForbidEnmity(0)
	DisabledUseTownP(0)
	BT_LeaveBattle()
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, GetMissionS(MS_S_CITYNAME_S))
	else
		LeaveChannel(PlayerIndex, GetMissionS(MS_S_CITYNAME_J))
	end
	sf_onplayerleave()
	AddSkillState(661,5,0,0) --Çå³ıÍæ¼ÒµÄ³ÆºÅ¼¼ÄÜÊı¾İ
	
	Title_ActiveTitle(0);
	if (GetMissionV(MS_TIMER1) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end	
	SetCurCamp(GetCamp())
	PlayerIndex = oldPlayerIndex
end;

