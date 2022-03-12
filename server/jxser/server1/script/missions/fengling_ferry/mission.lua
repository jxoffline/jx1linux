Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end
	worldid= SubWorldIdx2ID(SubWorld)
	ClearMapNpc(worldid)	
	ClearMapTrap(worldid) 
	ClearMapObj(worldid)
	StartMissionTimer(MISSIONID, 29, FLD_TIMER_1)		--20Ãë¼ÆÊ±
	StartMissionTimer(MISSIONID, 28, FLD_TIMER_2)		--È«³¡
end

function RunMission()
	for i=1, 30 do
		posx, posy = fld_getadata(npcthiefpos)
		local npcindex	= AddNpc(724, 95, SubWorld, posx, posy, 0, "Thñy TÆc ");
		SetNpcDeathScript(npcindex, "\\script\\missions\\fengling_ferry\\shuizeideath.lua");
	end
	idx = 0
	for i = 1 , 100 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);

 		if (pidx > 0) then
   			PlayerIndex = pidx;
 		end
		--´ËÊ±ÎªGM·¢²¼ÃüÁî
		SetFightState(1)
		PutMessage("ThuyÒn ®i råi! 30 phót sau sÏ ®Õn bê B¾c Phong L¨ng §é.")
		if (idx == 0) then 
 			break
 		end 
 	end
 	JiluAttendCount()		-- Êý¾ÝÂñµãµÚÒ»ÆÚ
end

function JiluAttendCount()
	-- µÃµ½µ±Ç°±¨ÃûµÄÈËÊý 
 	local nCount = GetMSPlayerCount(MISSIONID, 0)
	local mapid = SubWorldIdx2ID(SubWorld)
	if (mapid == 337) then
		AddStatData("fld_chuan1canjiarenshu", nCount)
	elseif (mapid == 338) then
		AddStatData("fld_chuan2canjiarenshu", nCount)
	elseif (mapid == 339) then
		AddStatData("fld_chuan3canjiarenshu", nCount)
	end
end

function EndMission()
	StopMissionTimer(MISSIONID, 28)
	StopMissionTimer(MISSIONID ,29)
	Landing()
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end
end

function OnLeave(RoleIndex)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = RoleIndex
	Msg2MSAll(MISSIONID, GetName().."B¹n kh«ng may tö vong trong lóc ®i thuyÒn.")
	SetCreateTeam(1)
	ForbidEnmity(0);
--	SetTaskTemp(200,0);
	SetDeathScript("")
	SetFightState(0)		
	ForbidChangePK(0)
	SetPKFlag(0)
	PlayerIndex = oldPlayerIndex
end

function Landing()
	Msg2MSAll(MISSIONID, "®· ®Õn bê B¾c Phong L¨ng §é.")
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));		-- by bel µ½°¶ÒÔºó·¢³ö¡°ÏûÃðË®Ôô¡±»î¶¯µÄÁì½±¹«¸æ
	if (nDate >= jf0904_act_dateS and nDate < jf0904_act_dateE) then
		local szNews = "Quan phñ vµ c¸c cao thñ ®· hoµn tÊt chiÕn dÞch tiªu diÖt Thñy TÆc, h·y nhanh chãng giao [Truy C«ng LÖnh] cho ThuyÒn Phu ®Ó nhËn th­ëng!";
		AddGlobalNews(szNews);
	end
	
	local tbPlayer = {}
	idx = 0
	for i = 1 , 100 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0)
		
		if (pidx > 0) then
   			tbPlayer[i] = pidx;
 		end
 		
		if (idx == 0) then 
	 		break
	 	end
	 	
	end
	
	worldid= SubWorldIdx2ID(SubWorld)
	
	G_ACTIVITY:OnMessage("FinishFengLingDu",tbPlayer);
	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i]
		camp = GetCamp()
		SetCurCamp(camp)
		SetCreateTeam(1)
		SetDeathScript("")
--		SetTaskTemp(200, 0)
		ForbidEnmity(0);
		
		if (check_new_shuizeitask() == 1) then
		--	tbAwardTemplet:GiveAwardByList({tbProp={6,1,2743,1,0,0},}, "fenglingdu_shuizeicaibao", 2)
		end
		
		local mapid = SubWorldIdx2ID(SubWorld)
		if (mapid == 337) then
			SetLogoutRV(0)
			NewWorld(fld_landingpos(1))
			SetFightState(1)
			DisabledUseTownP(1) -- ÏÞÖÆÆä½øÈë·çÁê¶É±±°¶Ê¹ÓÃ»Ø³Ç·û
			SetRevPos(175,1)	--Éè¶¨ËÀÍöÖØÉúµãÎªÎ÷É½´å
		elseif (mapid == 338) then
			SetLogoutRV(0)
			NewWorld(fld_landingpos(2))
			SetFightState(1)
			DisabledUseTownP(1) -- ÏÞÖÆÆä½øÈë·çÁê¶É±±°¶Ê¹ÓÃ»Ø³Ç·û
			SetRevPos(175,1)	--Éè¶¨ËÀÍöÖØÉúµãÎªÎ÷É½´å
		elseif (mapid == 339) then
			SetLogoutRV(0)
			NewWorld(fld_landingpos(3))
			SetFightState(1)
			DisabledUseTownP(1) -- ÏÞÖÆÆä½øÈë·çÁê¶É±±°¶Ê¹ÓÃ»Ø³Ç·û
			SetRevPos(175,1)	--Éè¶¨ËÀÍöÖØÉúµãÎªÎ÷É½´å
		else
			print("error:i don't know why")
		end
	--tbAwardTemplet:GiveAwardByList({{szName="Th­ Chóc ¤ng Bµ",tbProp={6,1,5112,1,1,0,0},nCount=5},}, "test", 1);
	--	tbAwardTemplet:GiveAwardByList({{szName="Nh©n S©m Ngh×n N¨m",tbProp={6,1,5117,1,1},nCount=1,},}, "test", 1);	

--	 SetTask(3374,GetTask(3374)+1)
--PhongLangDo2Lan()
	end
	
	ClearMapNpc(worldid)	
	ClearMapTrap(worldid) 
	ClearMapObj(worldid)
end


function PhongLangDo2Lan()
if (GetLevel() >=90 and  GetLevel() <120) then
tbAwardTemplet:GiveAwardByList({{szName="LÖnh Bµi N¨ng §éng",tbProp={6,1,5065,1,1},nCount=10,nExpiredTime=2880,},}, "test", 1);
end
end

