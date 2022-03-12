Include("\\script\\missions\\hsbattle\\hshead.lua")
function InitMission()
	for i = 1, 40 do 
		SetMissionV(i,0);--ÔÊĞí±¨ÃûÁË
	end;
	
	for i = 1, 10 do 
		SetMissionS(i, "")
	end;
	SetMissionV(MS_STATE, 1);
	StartMissionTimer(MISSIONID, 14,  	TIMER_1);
	StartMissionTimer(MISSIONID, 15, 	TIMER_2);
end;

function RunMission()
	idx = 0;
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			SetFightState(1);
		end
 	end;
 	SetMissionV(MS_STATE, 2);--ÔÊĞí±¨ÃûÁË
end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	
	for i  = 1, 10 do 
		SetMissionS(i, "")
	end;
	
	GameOver();
	StopMissionTimer(MISSIONID, 14);
	StopMissionTimer(MISSIONID, 15);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;

	if (GetMissionV(MS_STATE) ~=2 and GetCurCamp() ~= 1 and GetCurCamp()~=2 ) then 
		str2 = GetName().."<#> Rêi khái ®Êu tr­êng.";
	else
		str2 = GetName().."<#> Rêi khái ®Êu tr­êng."..GetMissionV(GetCurCamp()).."<#> Trõ mét ®iÓm tİch lòy";
		SetMissionV(MS_TONG1VALUE + GetCurCamp() - 1, GetMissionV(MS_TONG1VALUE + GetCurCamp() - 1) - 1);
	end;

	-- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖĞOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØĞëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	ForbidChangePK(0);
	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(200, 0);
end;