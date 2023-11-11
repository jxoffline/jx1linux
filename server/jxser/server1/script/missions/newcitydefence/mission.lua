----------------------------------------------------------------
--FileName:	mission.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	ÖÜÄ©»î¶¯£ºÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç
--			¹¦ÄÜ1£ºInitMission³õÊ¼»¯Mission
--			¹¦ÄÜ2£ºRunMissionÆô¶¯Mission
--			¹¦ÄÜ3£ºEndMission½áÊøMission
--			¹¦ÄÜ4£ºOnLeaveÀë¿ªMissionÊ±µ÷ÓÃ
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
function InitMission()
	for i = 1, 100 do	--³õÊ¼»¯±äÁ¿
		SetMissionV(i, 0);
	end;

	for i = 1, 10 do	--³õÊ¼»¯±äÁ¿
		SetMissionS(i, "");
	end;

	local mapid = SubWorldIdx2ID(SubWorld)
	local citycamp = 0
	if ( mapid == tbDEFENCE_MAPID[1] ) then
		citycamp = 1;
		cd_name = "Thñ thµnh phe Tèng"
	elseif ( mapid == tbDEFENCE_MAPID[2] ) then
		citycamp = 2;
		cd_name = "Thñ thµnh phe Kim"
	else
		print("defencecity open map error mpaid == "..mapid)
		return
	end

	SetMissionV( MS_CITYCAMP, citycamp )
	SetMissionV( MS_MISSIONID, MISSIONID )
	SetMissionV( MS_RANDKEY, random(1000000) )
	SetMissionS( MS_S_CD_NAME, cd_name)
	SetMissionV( MS_HOMEDEFENCE, NHOMEDEFENCE )
	ClearMapNpc(mapid);
	ClearMapTrap(mapid);
	ClearMapObj(mapid);

	--»ñµÃµØÍ¼Ïà¶ÔÓ¦µÄÉè¶¨ÎÄ¼þÃû
	local mapfile = GetMapInfoFile(mapid)
	local citysection = "MapInfo"
-------------------------------------------------------------------------
--¶ÁÈ¡Á½¸öÇøÓòµÄ´óÓªÄÚµã×ø±ê

	--Ò°Íâµ½´óÓªµÄ×ø±êµã
	homeoutxy = GetIniFileData(mapfile, citysection , "homeout1")
	x,y = bt_str2xydata(homeoutxy)
	SetMissionV(MS_HOMEOUT_X1, x)		--ÒòÎª×ø±ê¸Ä³ÉÁË4Î»ËùÒÔ¾Í²»ÓÃ³ýÒÔ32
	SetMissionV(MS_HOMEOUT_Y1, y)
	
	homeoutxy = GetIniFileData(mapfile, citysection , "homeout2")
	x,y = bt_str2xydata(homeoutxy)
	SetMissionV(MS_HOMEOUT_X2, x)
	SetMissionV(MS_HOMEOUT_Y2, y)

	--´óÓªµ½Ò°ÍâµÄ×ø±êµã
	centerposxy = GetIniFileData(mapfile, citysection , "centerpos1")
	x,y = bt_str2xydata(centerposxy)
	SetMissionV(MS_CENTER_X1, x)
	SetMissionV(MS_CENTER_Y1, y)
	
	centerposxy = GetIniFileData(mapfile, citysection , "centerpos2")
	x,y = bt_str2xydata(centerposxy)
	SetMissionV(MS_CENTER_X2, x)
	SetMissionV(MS_CENTER_Y2, y)
	
	local guaifile = GetIniFileData(mapfile, citysection , "guai1")
	SetMissionS( MS_S_GUAI1, guaifile )

	guaifile = GetIniFileData(mapfile, citysection , "guai2")
	SetMissionS( MS_S_GUAI2, guaifile )

	guaifile = GetIniFileData(mapfile, citysection , "guai3")
	SetMissionS( MS_S_GUAI3, guaifile )
	
-------------------------------------------------------------------------

	--°Ú·ÅTrapµã
	--´óÓªµ½Ò°ÍâµÄtrapµã	--µÈÏÂÕâÀï¸Ä½Å±¾
	centertrapfile = GetIniFileData(mapfile, citysection, "home2centertrap1");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP1)
	centertrapfile = GetIniFileData(mapfile, citysection, "home2centertrap2");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP2)
	
	--°Ú·ÅÔÚÂ·ÉÏ½øÐÐÍÆ½øµÄtrap£»
	cd_buildtrapsonroad();


	--°Ú·Å¶Ô»°ÀàÐÍNpc	
	if (citycamp == 1) then
		campname = "Qu©n Tèng";
		tnpc_doctor = TNPC_DOCTOR1
		file_doctor = FILE_DOCTOR1
		tnpc_symbol = TNPC_SYMBOL1

	else
		campname = "Qu©n Kim";
		tnpc_doctor = TNPC_DOCTOR2
		file_doctor = FILE_DOCTOR2
		tnpc_symbol = TNPC_SYMBOL2

	end
	
	--¾üÒ½µÄ°Ú·Å --µÈÏÂ¸Ä¾üÒ½µÄ½Å±¾£¨×¢Òâ¾üÒ½µÄÏúÊÛ±àºÅ£©
	doctorxy = GetIniFileData(mapfile, citysection, "doctornpc1");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(file_doctor, tnpc_doctor, x * 32 ,y * 32 , campname.."Qu©n Nhu quan");

	doctorxy = GetIniFileData(mapfile, citysection, "doctornpc2");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(file_doctor, tnpc_doctor, x * 32 ,y * 32 , campname.."Qu©n Nhu quan");


	
	--ÖüÎïÏäµÄ°Ú·Å
	depositxy = GetIniFileData(mapfile, citysection, "depositobj1");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_BOX, TNPC_DEPOSIT, x * 32,y * 32);

	depositxy = GetIniFileData(mapfile, citysection, "depositobj2");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_BOX, TNPC_DEPOSIT, x * 32,y * 32);

	
	--³µ·òµÄ°Ú·Å
	chefuxy = GetIniFileData(mapfile, citysection, "chefu");
	x,y = bt_str2xydata(chefuxy)
	bt_add_a_diagnpc( FILE_CD_TRANSER, TNPC_CHEFU, x * 32,y * 32, campname.."Xa phu");
	

	--Æô¶¯¶¨Ê±Æ÷
	StartMissionTimer(MISSIONID, SMALLTIMERID, SMALL_TIME);
	StartMissionTimer(MISSIONID, TOTALTIMERID, TOTAL_TIME);

	SetMissionV(MS_STATE,1);--ÔÊÐí±¨ÃûÁË
	SetMissionV( MS_MAXCOUNTNPC_1, FIRE_1RSTNPC_COUNT )
	SetMissionV( MS_MAXCOUNTNPC_1 + 1, FIRE_2CNDNPC_COUNT )
	SetMissionV( MS_MAXCOUNTNPC_1 + 2, FIRE_3RDNPC_COUNT )
	SetMissionV( MS_MAXCOUNTNPC_1 + 3, FIRE_4THNPC_COUNT )
	SetMissionV( MS_MAXCOUNTNPC_1 + 4, FIRE_5THNPC_COUNT )
	
	if (citycamp == 1) then
		CreateChannel(cd_name, 9)
	else
		CreateChannel(cd_name, 10)
	end
	RestMin, RestSec = GetMinAndSec(1800);
	local szMsg = "VÖ quèc Phong Háa liªn thµnh"..cd_name.."Ho¹t ®éng ®· b¾t ®Çu nhËn b¸o danh, "..tbDEFENCE_ANNOUNCE[citycamp].."§iÒu kiÖn tham chiÕn: §¼ng cÊp kh«ng d­íi"..CD_LEVEL_LIMIT.."cÊp"
	AddGlobalNews(szMsg)
	WriteLog("VÖ quèc Phong Háa liªn thµnh"..cd_name.."\t vµo giai ®o¹n b¸o danh \t b¶n ®åi d\t"..mapid.."\t thêi gian \t"..date("%H:%M"))
--	BT_SetGameData(2, MISSIONID)
--	BT_SetType2Task(PL_TOTALPOINT, TSKID_PLAYER_ZHANGONG);
--	BT_SetView(PL_TOTALPOINT);--ÏÔÊ¾ÓëÍ³¼Æ×Ü»ý·Ö
end

function RunMission()
	SetMissionV( MS_STATE, 2 )
end

function JoinMission(RoleIndex, Camp)
	local oldPlayerIndex = PlayerIndex;
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	cd_join(Camp);
--	cd_AddSkillTitle()
--	BT_BroadView();
--	BT_BroadAllLadder();
--	BT_BroadGameData();
--	BT_SortLadder();
--	BT_BroadSelf()
	PlayerIndex = oldPlayerIndex;
end;

function EndMission()
	StopMissionTimer(MISSIONID, SMALLTIMERID);
	StopMissionTimer(MISSIONID ,TOTALTIMERID);
	
	GameOver();
	
	DeleteChannel(GetMissionS(MS_S_CD_NAME))
	
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	for i = 1, 10 do
		SetMissionS(i, "")
	end
	local mapid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(mapid);
	ClearMapTrap(mapid);
	ClearMapObj(mapid);
end

function OnLeave(RoleIndex)
	local oldPlayerIndex = PlayerIndex
	PlayerIndex = RoleIndex;
	if (GetMissionV(MS_STATE) == 2) then
		cd_calc_sumexp();
	end;
	LeaveTeam();
	SetCurCamp(GetCamp())
	DisableTeamChangeCamp(0)
	LeaveChannel(PlayerIndex, GetMissionS(MS_S_CD_NAME))
	-- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖÐOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØÐëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0);
	RestoreOwnFeature();
	SetTaskTemp(200,0);
	SetPunish(0);
	SetFightState(0);
	DisabledUseTownP(0);
	SetDeathScript("")
--	AddSkillState(440, 1, 0, 0, 1);
--	AddSkillState(RANK_SKILL,5,0,0) --Çå³ýÍæ¼ÒµÄ³ÆºÅ¼¼ÄÜÊý¾Ý
--	Title_ActiveTitle(0);						--Çå³ý³ÆºÅ
--	BT_LeaveBattle()
	PlayerIndex = oldPlayerIndex
end
