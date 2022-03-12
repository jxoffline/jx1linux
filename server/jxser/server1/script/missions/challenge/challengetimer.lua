Include("\\script\\missions\\challenge\\challengehead.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);

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
		StopMissionTimer(MISSIONID, 10);
		StopMissionTimer(MISSIONID, 11);
	end;
end;

function ReportMemberState(V)
	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö
	if (V == GO_TIME) then
		if (GetMSPlayerCount(MISSIONID,1) == 0 or GetMSPlayerCount(MISSIONID , 2) == 0) then
			Msg2MSAll(MISSIONID, "§· hÕt giê b¸o danh nh­ng sè ng­êi hai bªn vÉn kh«ng phï hîp yªu cÇu, trËn ®Êu ®µnh hñy bá ");
			CloseMission(MISSIONID)
			return
		else
			Msg2MSAll(MSSIONID, "§· hÕt giê b¸o danh, trËn ®Êu chÝnh thøc b¾t ®Çu ");
			RunMission(MISSIONID);
			return
		end
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "<#> Khiªu chiÕn ®ang trong giai ®o¹n b¸o danh, ®éi khiªu chiÕn xin nhanh chãng nhËp tr­êng ®Êu"..RestMin.."<#> phót ";
		str1 = "<#> Khiªu chiÕn ®ang trong giai ®o¹n b¸o danh, c¸c ®éi khiªu chiÕn xin nhanh chãng nhËp tr­êng ®Êu! Nh©n sè 2 bªn hiÖn lµ:"..GetMSPlayerCount(MISSIONID, 1)..","..GetMSPlayerCount(MISSIONID, 2).."<#>. Thêi gian b¸o danh cßn l¹i:"..RestMin.."<#> phót "..RestSec.."<#> gi©y ";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--Õ½¶·½øÐÐ¹ý³ÌÖÐ£¬ÏµÍ³¶¨ÆÚÍ¨Öª¸÷·½µÄÕóÍöÇé¿ö
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "TrËn ®Êu ®· kÕt thóc, phe TÝm ®· giµnh ®­îc th¾ng lîi chung cuéc ");
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "TrËn ®Êu ®· kÕt thóc, phe Vµng ®· giµnh ®­îc th¾ng lîi chung cuéc ");
		CloseMission(MISSIONID);
		return
	end;
		
	s_death = GetMissionV(MS_S_DEATHCOUNT);
	j_death = GetMissionV(MS_J_DEATHCOUNT);
	gametime = (floor(GetMSRestTime(MISSIONID,11)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> Giai ®o¹n chiÕn ®Êu. T×nh h×nh th­¬ng vong hiÖn t¹i: phe Vµng:"..s_death.."<#> ng­êi, phe TÝm:"..j_death.."<#> ng­êi. Thêi gian cßn l¹i"..RestMin.."<#> phót "..RestSec.."<#> gi©y ";
	Msg2MSAll(MISSIONID, str1);
end;
 