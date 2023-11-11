Include("\\script\\missions\\clearskill\\testhole.lua")
function GameOver()
	local PTab = {};
	idx = 0
	for i = 1, 1000 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	nTrapId = random(1,4)
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		LeaveGame(nTrapId)
	end;
	PlayerIndex = OldPlayer;
end;

function InitMission()
	StartMissionTimer(MISSIONID, 20, CSP_PKTIME);
	nNpcId = AddNpc(68, 10, SubWorld, CSP_CAMPMANX, CSP_CAMPMANY, 1, "Sø gi¶ bang ph¸i");
	SetMissionV(2, nNpcId)
	SetNpcScript(nNpcId, "\\script\\missions\\clearskill\\camperman.lua");
	SetMissionV(1, 1)
end;

function RunMission()

end;

function EndMission()
	GameOver();
	SetMissionV(1,0)
	nNpcId = GetMissionV(2);
	if (nNpcId > 0) then 
		DelNpc(nNpcId)
	end;
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	SetLogoutRV(1);--ÉèÖÃÖØÉúµã
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	ForbidChangePK(1);
	SetTaskTemp(200, 0);
	if (GetMSPlayerCount(10,0) <= 1) then 
		CloseMission(10)
	end;
end;
