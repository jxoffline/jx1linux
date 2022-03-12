Include("\\script\\missions\\championship\\tryout\\head.lua")
function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	StartMissionTimer(MISSIONID, 34, TRYOUT_TIMER_2);
	StartMissionTimer(MISSIONID, 33, TRYOUT_TIMER_1);
	
	SetMissionV(MS_STATE,1);--ÔÊĞí±¨ÃûÁË
	RunMission(MISSIONID)
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(MISSIONID, 33);
	StopMissionTimer(MISSIONID, 34);
	GameOver();
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	if(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		resultstr = "Thi ®Êu dù tuyÓn §¹i héi Vâ l©m m«n ph¸i ®· kÕt thóc, mêi c¸c vŞ ®Õn L©m An gÆp Viªn quan ®¹i héi Vâ L©m (182, 203) ®Ó xem danh s¸ch. Ng­êi ch¬i n»m trong danh s¸ch h·y ®Õn gÆp Viªn quan ®¹i héi Vâ L©m (182, 203) l·nh danh hiÖu."
	else
		resultstr = "Thi ®Êu dù tuyÓn §¹i héi Vâ l©m cña h«m nay ®· kÕt thóc, hÑn gÆp l¹i c¸c tuyÓn thñ vµo ngµy mai."
	end
	AddGlobalNews(resultstr) 
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	-- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖĞOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØĞëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetCreateTeam(1);
	DisabledStall(0)	--ÔÊĞí°ÚÌ¯
	SetTaskTemp(200, 0)
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	ForbidChangePK(0);
	ForbitTrade(0);
	RestoreOwnFeature();
end;