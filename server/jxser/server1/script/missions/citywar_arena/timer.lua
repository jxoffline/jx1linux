Include("\\script\\missions\\citywar_arena\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V + 1);

	if (V == GO_TIME) then
		RunMission(MISSIONID)
		return
	end

	--±¨Ãû½×¶Î
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --¿ªÕ½ÁË
		ReportBattle(V);
	elseif (timestate == 3) then  --Õ½¶·½áÊøÁË
		Msg2MSAll(MISSIONID, "ChiÕn dÞch kÕt thóc ");
		StopMissionTimer(MISSIONID, 16);
		StopMissionTimer(MISSIONID, 17);
	end;
end;

function ReportMemberState(V)
	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	if (V == GO_TIME) then
		Msg2MSAll(MSSIONID, "Sè ng­êi vµo trong ®· ®ñ, cuéc thi ®Êu chÝnh thøc b¾t ®Çu ");
		msgstr = format("Bang héi %s vµ %s ®· b¾t ®Çu thi ®Êu: Sè ng­êi hai bªn hiÖn t¹i lµ: %d - %d.", GetMissionS(1), GetMissionS(2), GetMSPlayerCount(MISSIONID, 1), GetMSPlayerCount(MISSIONID, 2));
		WriteLog(msgstr)
		RunMission(MISSIONID);
		return
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "Thêi gian vµo ®Êu tr­êng <#> cßn "..RestMin.."<#> phót, ®éi khiªu chiÕn xin lËp tøc vµo ®Êu tr­êng."
		str1 = "TrËn khiªu chiÕn thµnh <#> ®ang trong giai ®o¹n vµo ®Êu tr­êng, hai bªn nhanh chãng vµo ®Êu tr­êng. Sè ng­êi hai bªn "..GetMSPlayerCount(MISSIONID, 1).."<#>:"..GetMSPlayerCount(MISSIONID, 2).."<#>. Thêi gian vµo ®Êu tr­êng cßn: "..RestMin.."<#> phót "..RestSec.."<#> gi©y ";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--Õ½¶·½øÐÐ¹ý³ÌÖÐ£¬ÏµÍ³¶¨ÆÚÍ¨Öª¸÷·½µÄÕóÍöÇé¿ö
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. Thi ®Êu kÕt thóc,"..GetMissionS(2).."<#> giµnh ®­îc th¾ng lîi chung cuéc!");
		WinBonus(2)
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. Thi ®Êu kÕt thóc,"..GetMissionS(1).."<#> giµnh ®­îc th¾ng lîi chung cuéc!");
		WinBonus(1)
		CloseMission(MISSIONID);
		return
	end;

	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "Giai ®o¹n thi ®Êu <#>: Sè ng­êi hai bªn hiÖn t¹i: phe Vµng"..GetMSPlayerCount(MISSIONID, 1).."<#>, bªn mµu TÝm"..GetMSPlayerCount(MISSIONID, 2).."<#>. Thêi gian cßn d­ "..RestMin.."<#> phót "..RestSec.."<#> gi©y ";
	Msg2MSAll(MISSIONID, str1);
end;
