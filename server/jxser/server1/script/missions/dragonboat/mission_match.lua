-- description	: ±ÈÈüÈÎÎñ
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\dragonboat\\include.lua")

-- Æô¶¯±ÈÈü¶¨Ê±Æ÷
function start_match_timer()
	-- 10·ÖÖÓºóÆô¶¯±ÈÈüÈÎÎñ
	StartMissionTimer(MISSION_MATCH, TIMER_MATCH, LIMIT_SIGNUP * 18);
end

-- ½áÊø±ÈÈü
function close_match()
	-- °ÑÍæ¼ÒÌß³öµØÍ¼
	kickout();
	
	-- ÇåÀíµØÍ¼
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- Ò²ÇåÀíÍæ¼Ò
	ClearMapTrap(world); 
	ClearMapObj(world);
end

-- ¿ªÊ¼±¨Ãû
function start_signup()
	-- ÉèÖÃÎª±¨Ãû×´Ì¬
	SetMissionV(VARV_STATE, 1);
	SetMissionV(VARV_BOARD_TIMER, 0);
	SetMissionS(VARS_TEAM_NAME, "");
	-- Í¨¸æÁúÖÛ±ÈÈü±¨Ãû¿ªÊ¼
	local min = floor(LIMIT_SIGNUP / 60);
	broadcast("<#> Ho¹t ®éng ®ua thuyÒn rång TÕt §oan Ngä ®· b¾t ®Çu b¸o danh. Mêi mäi ng­êi nhanh ch©n ®Õn LÔ quan b¸o danh, ®éi nhãm do ®éi tr­ëng b¸o danh, thêi gian b¸o danh lµ " .. min .. "phót");
end

function InitMission()
	start_signup();
	start_match_timer();
end

function EndMission()
	close_match();
	close_board_timer();
end

-- Íæ¼ÒÍË³ö
function OnLeave(index)
	local old_index = PlayerIndex;
	PlayerIndex = index;
	
	SetCurCamp(GetCamp());
	SetTaskTemp(200,0)
	SetFightState(0);
	SetPunish(1);
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	
	SetTask(1505, 0)
	DisabledUseTownP(0)
	
	str = GetName().."Rêi khái thuyÒn rång nµy"
	Msg2MSAll(MISSION_MATCH,str);
	
	PlayerIndex = old_index;
end

function JoinMission(RoleIndex, camp)
	PlayerIndex = RoleIndex;
	if (camp ~= 1) then
		return
	end
	
	LeaveTeam()
	AddMSPlayer(MISSION_MATCH,camp);
	SetCurCamp(camp);
	SetTaskTemp(200,1)
	SetFightState(1);
	SetLogoutRV(1);
	SetPunish(0);
	str = GetName().."Thªm vµo thuyÒn rång nµy"
	local sf_mapid = SubWorldIdx2ID(SubWorld)
	NewWorld(sf_mapid, BOAT_POSX,BOAT_POSY);
	SetCreateTeam(0);
	Msg2MSAll(MISSION_MATCH,str);
	SetPKFlag(1)
	ForbidChangePK(1);
	SetDeathScript("\\script\\missions\\dragonboat\\player_death.lua");
	SetTask(1505, 1)
	DisabledUseTownP(1)
end