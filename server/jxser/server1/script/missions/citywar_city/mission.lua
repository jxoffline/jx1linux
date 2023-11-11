Include("\\script\\missions\\citywar_city\\head.lua")
Include("\\script\\missions\\citywar_city\\camper.lua");

function InitMission()
	WriteLog(GetLoop()..": b¾t ®Çu thi ®Êu")
	ClearMapNpc(221);	--Çå³¡ÄÚnpc
	--ClearMapObj(221);--Òª²»ÒªÇåÄØ£¿£¿
	--ClearMapnpc ¾Í²»ÓÃDelNPcÁË°É
	--for i = 1, MS_SYMBOLCOUNT do  DelNpc(StonePos[i].Name);end;
	for i = 1, getn(tb_CW_MEDICINE) do
		SetGlbValue(tb_CW_MEDICINE[i][1], 0);
	end;

	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	
	for i = 1, 5 do 
		SetMissionS(i,"")
	end
	
	
	for i = 1, MS_SYMBOLCOUNT do 
		SetMissionV(MS_SYMBOLBEGIN + i - 1, 1);
	end

	--¼ÓÔØNPC
	NpcId1 = AddNpc(STONENPCID1, STONELEVEL1, SubWorld, StonePos[1].x, StonePos[1].y, 1, GetGamerName(1)..StonePos[1].Name, 1);
	NpcId2 = AddNpc(STONENPCID1, STONELEVEL1, SubWorld, StonePos[2].x, StonePos[2].y, 1, GetGamerName(1)..StonePos[2].Name, 1);
	NpcId3 = AddNpc(STONENPCID1, STONELEVEL1, SubWorld, StonePos[3].x, StonePos[3].y, 1, GetGamerName(1)..StonePos[3].Name, 1);

	WriteLog("Gia t¨ng th¹ch trô "..NpcId1);
	WriteLog("Gia t¨ng th¹ch trô "..NpcId2);
	WriteLog("Gia t¨ng th¹ch trô "..NpcId3);

	SetNpcCurCamp(NpcId1, 1) ;
	SetNpcCurCamp(NpcId2, 1) ;
	SetNpcCurCamp(NpcId3, 1) ;
	
	WriteLog("Cµi ®Æt b¶n gèc ®· chÕt")
	SetNpcDeathScript(NpcId1, "\\script\\missions\\citywar_city\\symboldeath1.lua");
	SetNpcDeathScript(NpcId2, "\\script\\missions\\citywar_city\\symboldeath2.lua");
	SetNpcDeathScript(NpcId3, "\\script\\missions\\citywar_city\\symboldeath3.lua");
	
	
	DoorId1 = AddNpc(DOORNPCID, DOORLEVEL, SubWorld, DoorPos[1].x, DoorPos[1].y, 1,	DoorPos[1].Name, 1);
	DoorId2 = AddNpc(DOORNPCID, DOORLEVEL, SubWorld, DoorPos[2].x, DoorPos[2].y, 1, DoorPos[2].Name, 1);
	DoorId3 = AddNpc(DOORNPCID, DOORLEVEL, SubWorld, DoorPos[3].x, DoorPos[3].y, 1, DoorPos[3].Name, 1);

	WriteLog("Gia t¨ng cæng thµnh"..DoorId1);
	WriteLog("Gia t¨ng cæng thµnh"..DoorId2)
	WriteLog("Gia t¨ng cæng thµnh"..DoorId3)
	
	SetNpcCurCamp(DoorId1, 1) ;
	SetNpcCurCamp(DoorId2, 1) ;
	SetNpcCurCamp(DoorId3, 1) ;
	
	SetMissionV(MS_DOORBEGIN, DoorId1);
	SetMissionV(MS_DOORBEGIN + 1, DoorId2);
	SetMissionV(MS_DOORBEGIN + 2, DoorId3);
	
	SetNpcDeathScript(DoorId1, "\\script\\missions\\citywar_city\\doordeath.lua");
	SetNpcDeathScript(DoorId2, "\\script\\missions\\citywar_city\\doordeath.lua");
	SetNpcDeathScript(DoorId3, "\\script\\missions\\citywar_city\\doordeath.lua");
	
	--Ëæ¾üÒ©Ò½
	for i = 1, getn(DoctorPos) do
		local nDoctIdx = AddNpc(DOCTORNPCID, 1, SubWorld, DoctorPos[i][1],DoctorPos[i][2], 1, DoctorPos[i][3]);
		SetNpcScript(nDoctIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\yaoshang.lua");
	end;
	--°µµÀÊØÎÀ
	local nAndaoIdx = AddNpc(48, 1, SubWorld, 1597 * 32, 3470 * 32, 1, "§Þa ®¹o vÖ thñ");
	SetNpcScript(nAndaoIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\andaoshouwei.lua");
	--´¢ÎïÏä
	local nChuwuIdx = AddNpc(625, 1, SubWorld, 1534*32, 3240*32, 1, "R­¬ng chøa ®å");
	SetNpcScript(nChuwuIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\chuwuxiang.lua");
	nChuwuIdx = AddNpc(625, 1, SubWorld, 1882*32, 3582*32, 1, "R­¬ng chøa ®å");
	SetNpcScript(nChuwuIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\chuwuxiang.lua");
	--¼ÓÔØNPC
	
	WriteLog("Thanh trõ ch­íng ng¹i");
	for i = 1, getn(ObstaclePos) do 
		CreateObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
	end;

	Tong2,Tong1 = GetCityWarBothSides(GetWarOfCity());
	SetMissionS(1, Tong1);
	SetMissionS(2, Tong2);

	logstr = format("%s: %s thµnh ®· më c«ng thµnh chiÕn! Bªn phßng thñ lµ: %s %s", date("%m%d-%H:%M"), GetGameCity(), Tong2, Tong1);
	WriteLog(logstr);
	
	--¼Æ·ÖÅÆÏÔÊ¾
	bt_setnormaltask2type()		--Õâ¸öÓÐÓÃ
	BT_SetView(PL_TOTALPOINT);--ÏÔÊ¾ÓëÍ³¼Æ×Ü»ý·Ö
	BT_SetView(PL_KILLPLAYER);--É±Íæ¼ÒÊýÄ¿
	BT_SetView(PL_BEKILLED);--±¾Íæ¼Ò±»É±´ÎÊý
	BT_SetView(PL_MAXSERIESKILL);--Á¬Õ¶´ÎÊý
	BT_SetMissionName("C«ng Thµnh ChiÕn");
	BT_SetGameData(GAME_BATTLEID, MISSIONID);--ÉèÖÃÕ½ÒÛµÄID£¬ÒÔmissionidÇø±ð
	ResetBonus()
	--¼Æ·ÖÅÆÏÔÊ¾
	
	SetMissionV(MS_KEY, random(100000))
	--´ò¿ª¼ÆÊ±Æ÷
	StartMissionTimer(MISSIONID, 12, REPORTTIME);
	StartMissionTimer(MISSIONID, 13, GAMETIME);
	
	SetMissionV(MS_STATE, 1);--ÔÊÐí±¨ÃûÁË
end;

function RunMission()
	SetMissionV(MS_STATE, 2)
	str = format("%s c«ng thµnh chiÕn chÝnh thøc b¾t ®Çu! Bªn thñ thµnh lµ %s, bªn khiªu chiÕn lµ %s. Ai sÏ giµnh th¾ng lîi chung cuéc ®©y?", GetGameCity(), GetGamerName(1), GetGamerName(2));
	AddGlobalNews(str);
end;

function EndMission()

	WriteLog(GetLoop()..date("%m%d-%H:%M")..":CloseMission!");
	for i = 1, MS_SYMBOLCOUNT do  DelNpc(GetMissionS(1) .. StonePos[i].Name);end;
	for i = 1, MS_SYMBOLCOUNT do  DelNpc(GetMissionS(2) .. StonePos[i].Name);end;
	
	
	WriteLog("GameOver")
	GameOver()
	
--	WriteLog("É¾³ýËùÓÐ¹¤¾ßNpc")
--	for i = 1, g_nMaxToolCount do 
--		DelIndex = GetMissionV(MS_TOOLBEGIN + i - 1) ;
--		if (DelIndex > 0) then 
--			DelNpcSafe(DelIndex)
--		end
--	end;
--
--	WriteLog("É¾³ýËùÓÐGCC")
--	for i = 1, g_nMaxGccPerDoor * g_nDoorCount do 
--		DelIndex = GetMissionV(MS_GCCBEGIN + i - 1) ;
--		if (DelIndex > 0) then  	
--			DelNpcSafe(DelIndex)
--		end;
--	end;
--	
--	WriteLog("É¾³ýËùÓÐTSC")
--
--	for i = 1, g_nDoorCount * g_nMaxTscPerDoor do 
--		DelIndex = GetMissionV(MS_TSCBEGIN + i - 1)
--		if (DelIndex > 0) then 
--			DelNpcSafe(DelIndex)
--		end;
--	end;
--	
--	WriteLog("É¾³ýËùÓÐÃÅ")
--	for i = 1, g_nDoorCount do 
--		DelIndex = GetMissionV(MS_DOORBEGIN + i - 1)
--		if (DelIndex > 0) then 
--			DelNpcSafe(DelIndex)
--		end;
--	end;

	for i = 1, g_nDoorCount do 
		ClearObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
	end;

	ClearMapNpc(221);
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;

	StopMissionTimer(MISSIONID, 12);
	StopMissionTimer(MISSIONID, 13);
	BT_ClearBattle();
end;


function OnLeave(RoleIndex)
	local oldPlayer = PlayerIndex;
	PlayerIndex = RoleIndex;
	str2 = GetName().."Rêi khái chiÕn tr­êng, ";
	SetFightState(0)
	--SetLogoutRV(0);
	SetCreateTeam(1);
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	ForbidChangePK(0);
	SetPunish(1)
	DisabledUseTownP(0)
--	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(200, 0);
	
	--BT_LeaveBattle()
	if (GetCurCamp() == 1) then
		--LeaveChannel(PlayerIndex, GetGameCity().."¸®ÊØ·½");
	else
		--LeaveChannel(PlayerIndex, GetGameCity().."¸®¹¥·½");
	end
	sf_onplayerleave()
	AddSkillState(661,5,0,0) --Çå³ýÍæ¼ÒµÄ³ÆºÅ¼¼ÄÜÊý¾Ý
	Title_ActiveTitle(0);
	if (GetMissionV(MS_STATE) == 2) then
		BT_UpdateMemberCount();
	end	
	SetCurCamp(GetCamp())
	PlayerIndex = oldPlayer
end;

