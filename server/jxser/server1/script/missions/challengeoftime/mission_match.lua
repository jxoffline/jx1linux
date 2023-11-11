-- description	: ±ÈÈüÈÎÎñ
-- author		: wangbin
-- datetime		: 2005-06-04

Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\misc\\eventsys\\type\\npc.lua")

-- Æô¶¯±ÈÈü¿ªÊ¼¶¨Ê±Æ÷
function start_match_timer()
	-- 10·ÖÖÓºóÆô¶¯±ÈÈüÈÎÎñ
	StartMissionTimer(MISSION_MATCH, TIMER_MATCH, LIMIT_SIGNUP * 18);
end

-- ¿ªÊ¼±¨Ãû
function start_signup()
	-- ÉèÖÃÎª±¨Ãû×´Ì¬
	SetMissionV(VARV_STATE, 1);
	SetMissionV(VARV_BOARD_TIMER, 0);
	SetMissionS(VARS_TEAM_NAME, "");
	-- Í¨¸æÁúÖÛ±ÈÈü±¨Ãû¿ªÊ¼
	--ÓÉrelayÍ¨¸æ±¨Ãû¿ªÊ¼£¬2´Î
	--local min = floor(LIMIT_SIGNUP / 60);
	--broadcast("<#>Ê±¼äµÄÌôÕ½ÈÎÎñ±¨Ãû¿ªÊ¼ÁË£¬Çë´ó¼ÒËÙÀ´7´ó³ÇÊĞÄôß±³¾´¦×é¶ÓÓÉ¶Ó³¤±¨Ãû£¬±¨ÃûÊ±¼äÎª" .. min .. "·ÖÖÓ");
end

function InitMission()
	start_signup();
	start_match_timer();
end

function EndMission()
	close_match();
	close_board_timer();
	close_close_timer();
end

function PlayerLeave()

	BigBoss:RemoveChuangGuanBonus()
	
	SetCurCamp(GetCamp())
	SetTaskTemp(200,0)
	SetFightState(0)
	SetPunish(1)
	SetCreateTeam(1)
	SetPKFlag(0)
	ForbidChangePK(0)
	SetDeathScript("")
	
	SetTask(1505, 0)
	DisabledUseTownP(0)
	
	Msg2MSAll(MISSION_MATCH, GetName().."Rêi khái khu vùc nhiÖm vô ")
	
	--Storm ¼Ó½±Àø·Ö
	if storm_valid_game(2) then	--·ç±©ÌôÕ½Ã»ÓĞ½áÊø£¨Èç¹ûÊÇÍæ¼ÒÏÂÏß¸Ã¶Î´úÂë²»»áÆğ×÷ÓÃ£©
		storm_add_pointex(2, 40)
		storm_end(2)
	end
	SetTask(STORM_TASKID_GAMEID_SS, 0)	--Çå³ıGameKey
end

function PlayerJoinMission(camp)
	LeaveTeam()
	AddMSPlayer(MISSION_MATCH,camp);
	SetCurCamp(camp);
	SetTaskTemp(200,1)
	SetFightState(1);
	SetLogoutRV(1);
	SetPunish(0);
	str = GetName().."Tham gia 'NhiÖm vô Th¸ch thøc thêi gian'"
	local sf_mapid = SubWorldIdx2ID(SubWorld)
	NewWorld(sf_mapid, BOAT_POSX, BOAT_POSY);
	SetCreateTeam(0);
	Msg2MSAll(MISSION_MATCH,str);
	SetPKFlag(1)
	ForbidChangePK(1);
	SetDeathScript(SCRIPT_PLAYER_DEATH);
	SetTask(1505, 1)
	DisabledUseTownP(1)

	--Storm ¼ÓÈë·ç±©»ı·Ö
	SetTask(STORM_TASKID_GAMEID_SS, random(100000))	--Ö¸¶¨Ëæ»úµÄGameKey
end

-- Íæ¼ÒÍË³ö
function OnLeave(index)
	CallPlayerFunction(index, PlayerLeave)
end

--Íæ¼Ò½øÈë
function JoinMission(RoleIndex, camp)
	if (camp ~= 1) then
		return
	end
	CallPlayerFunction(RoleIndex, PlayerJoinMission, camp)
	EventSys:GetType("ChuanGuan"):OnPlayerEvent("OnEnter", RoleIndex, camp)
end

