Include("\\script\\missions\\freshman_match\\tryout\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV( i , 0 );
	end;
	SetMissionS( 1, "" )
	SetMissionS( 2, "" )
	StartMissionTimer( MISSIONID, TIMERID_SMALL_OUTER, TRYOUT_TIMER_1 );
	StartMissionTimer( MISSIONID, TIMERID_TOTAL_OUTER, TRYOUT_TIMER_2 );
	
	SetMissionV( MS_STATE,1 );--ÔÊĞí±¨ÃûÁË
	RunMission( MISSIONID )
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer( MISSIONID, TIMERID_SMALL_OUTER) ;
	StopMissionTimer( MISSIONID, TIMERID_TOTAL_OUTER );
	GameOver();
	for i = 1, 100 do 
		SetMissionV( i , 0 );
	end;
	if(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		resultstr = "Thi ®Êu Vâ l©m kiÖt xuÊt ®· kÕt thóc, xin c¸c tuyÓn thñ ®Õn L©m An gÆp Sø gi¶ kiÖt xuÊt (203, 202) xem danh s¸ch kiÖt xuÊt. 5 ng­êi ®Çu cã thÓ ®Õn gÆp Sø gi¶ kiÖt xuÊt (203, 202) ®Ó l·nh th­ëng."
	else
		resultstr = "Ngµy thi ®Êu Vâ l©m kiÖt xuÊt h«m nay ®· kÕt thóc, tuyÓn thñ tham gia ngµy mai t¸i chiÕn."
	end
	AddGlobalNews(resultstr) 
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	WL_clear_pl_state()
end;