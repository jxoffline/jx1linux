Include([[\script\missions\tong\collectgoods\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "Vâ l©m minh chñ ®ang tËp trung c¸c nh©n sü tæ chøc ®i t×m tói hµng hãa cña T©y H¹ th­¬ng nh©n vÒ, mäi ng­êi cã thÓ ®Õn Tæng qu¶n Ho¹t ®éng ph­êng ®Ó b¸o danh tham gia."
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_COLLG_PHASE, 1);	--¿ÉÒÔ¿ªÊ¼±¨ÃûÁË
	gb_SetTask(COLLG_NAME, 1, 1);
	StartMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME, COLLG_RUNINTERVER);
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME);
	SetGlbValue(GLB_COLLG_PHASE, 2); --½ûÖ¹ÔÙ½øÀ´±¨Ãû
	gb_SetTask(COLLG_NAME, 1, 2);
	collg_gameover(COLLG_MAPID[1], COLLG_PREPAREMISSIONID);
end;

function OnLeave()
end
