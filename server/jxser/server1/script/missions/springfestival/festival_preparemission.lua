Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua")

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "Quan phñ b¾t ®Çu cho ng­êi ®i ®uæi Qu¸i Thó "..FE_ANIMALNAME..", mäi ng­êi h·y ®Õn Nha m«n sai dÞch ë c¸c thµnh ®Ó b¸o danh tham gia.";
	AddGlobalNews(strGlbNews);
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	SetGlbValue(GLB_FE_PHASE, 1);	--¿ÉÒÔ¿ªÊ¼±¨ÃûÁË
	StartMissionTimer(FE_PREPAREMISSIONID, FE_PREPARETIME, FE_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(FE_PREPAREMISSIONID, FE_PREPARETIME);
	SetGlbValue(GLB_FE_PHASE, 2); --½ûÖ¹ÔÙ½øÀ´±¨Ãû
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
	
	festival_gameover(FE_MAPID[1], FE_PREPAREMISSIONID);
end;

function OnLeave()
end
