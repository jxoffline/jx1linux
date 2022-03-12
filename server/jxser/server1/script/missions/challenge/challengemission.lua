Include("\\script\\missions\\challenge\\challengehead.lua")
function InitMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	SetMissionV(MS_STATE, 1);--ÔÊĞí±¨ÃûÁË
	StartMissionTimer(MISSIONID,10,  TIMER_1);
	StartMissionTimer(MISSIONID, 11, TIMER_2);
end;

function RunMission()
	SetMissionV(MS_STATE, 2)
	idx = 0;
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
 			PlayerIndex = pidx;
			if (GetCurCamp() ~= 6) then
   				SetFightState(1);
				PutMessage("TrËn chiÕn chİnh thøc b¾t ®Çu, tÊt c¶ hµnh ®éng ");
   			end
 		end;
 	end;
end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	GameOver();
	StopMissionTimer(MISSIONID, 10);
	StopMissionTimer(MISSIONID, 11);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	str2 = GetName().."Rêi khái chiÕn tr­êng, ";
	-- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖĞOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØĞëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	ForbidChangePK(0);
	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(200, 0);
	if (GetMissionV(MS_STATE) == 1) then
		if (GetMSPlayerCount(MISSIONID, GetCurCamp()) == 0) then
			SetMissionV(MS_S_JOINED + GetCurCamp() - 1, 0)
		end
	end
end;