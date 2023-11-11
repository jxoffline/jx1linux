Include([[\script\missions\tong\tong_disciple\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "C¸c bang héi ®ang tæ chøc c¸c nh©n sü ®i chiªu mé ®Ö tö, lµm lùc l­îng hËu bÞ l©u dµi, Tæng qu¶n Ho¹t ®éng ph­êng ®ang chê ®îi mäi ng­êi ®Õn gióp mét tay."
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_DIS_PHASE, 1);	--¿ÉÒÔ¿ªÊ¼±¨ÃûÁË
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 1);
	StartMissionTimer(DIS_PREPAREMISSIONID, DIS_PREPARETIME, DIS_RUNINTERVER); --
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(DIS_PREPAREMISSIONID, DIS_PREPARETIME);
	gameover(DIS_MAPID[1], DIS_PREPAREMISSIONID);
end;

function OnLeave()
end
