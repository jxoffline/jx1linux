Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua")

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "L¹i thªm mét nhãm ng­êi míi ®i t×m quµ thÊt l¹c."
	AddGlobalNews(strGlbNews);
	gb_SetTask("Ho¹t ®éng Gi¸ng Sinh", 1, 1);
	SetGlbValue(GLB_CH_PHASE, 1);	--¿ÉÒÔ¿ªÊ¼±¨ÃûÁË
	StartMissionTimer(CH_PREPAREMISSIONID, CH_PREPARETIME, CH_RUNINTERVER); --
end;

function RunMission()
	SetGlbValue(GLB_CH_PHASE, 2); --½ûÖ¹ÔÙ½øÀ´±¨Ãû
end;

function EndMission()
	StopMissionTimer(CH_PREPAREMISSIONID, CH_PREPARETIME);
	SetGlbValue(GLB_CH_PHASE, 3); --½ûÖ¹ÔÙ½øÀ´±¨Ãû
	gb_SetTask("Ho¹t ®éng Gi¸ng Sinh", 1, 2);
end;

function OnLeave()
end
