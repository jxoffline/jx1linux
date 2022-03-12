Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = format("Tªn quan phñ bï nh×n ®ang say ngñ, ®µnh ph¶i nhê c¸c vÞ nh©n sü bang héi ®i ®¸nh ®uæi %s, nh©n sü nµo muèn gióp søc cã thÓ ®Õn Tæng qu¶n Ho¹t ®éng ph­êng ë khu vùc bang héi m×nh ®Ó b¸o danh tham gia.",SF_ANIMALNAME);
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_SF_PHASE, 1);	--¿ÉÒÔ¿ªÊ¼±¨ÃûÁË
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	StartMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME, SF_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME);
	festival_gameover(SF_MAPID[1], SF_PREPAREMISSIONID);
end;

function OnLeave()
end
