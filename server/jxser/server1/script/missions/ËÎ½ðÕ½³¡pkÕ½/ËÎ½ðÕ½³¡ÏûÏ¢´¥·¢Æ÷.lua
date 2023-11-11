Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE,V + 1);

--±¨Ãû½×¶Î
if (timestate == 1) then 
	ReportMemberState(V);
elseif (timestate == 2) then 
	ReportBattle(V);

--Èç¹ûÒÑ³¬¹ıµÚÒ»½×¶Î£¬²¢ÇÒÎ´ÓĞÈÎºÎÖ÷½«³öÏÖÊ±
	if (V >= SHOWKINGTIME1 and GetMissionV(MS_FIRSTSHOW) == 0) then
		s_show = GetMissionV(MS_S_SHOWKING);
		j_show = GetMissionV(MS_J_SHOWKING);

--Èç¹ûµ±Ç°Ö»ÓĞÒ»·½·ûºÏ»ù±¾µÄÖ÷½«³öÏÖÒªÇóÔò£¬ÈÃÆäÖ÷½«³öÏÖ
		if (s_show == 1 and j_show == 0) then 
			SetMissionV(MS_FIRSTSHOW, 1)
			ShowTheKing(1)
			SetMissionV(MS_S_SHOWKING,2)
			return
		end;

		if (s_show == 0 and j_show == 1) then 
			SetMissionV(MS_FIRSTSHOW, 2)
			ShowTheKing(2)
			SetMissionV(MS_J_SHOWKING,2)
			return
		end;

--Èç¹ûÁ½·½¶¼´ïµ½»ù±¾³öÏÖÖ÷½«µÄÒªÇó£¬Ôò¸ù¾İË«·½µÄµ±Ç°»ı·ÖÈ·¶¨
		if (s_show == 1 and j_show == 1) then
			s_dpk  = GetMissionV(MS_S_DEATHCOUNT);--Íæ¼ÒPKËÀÍöÊıÁ¿
			j_dpk  = GetMissionV(MS_J_DEATHCOUNT);
			s_dnpc = GetMissionV(MS_S_NPCDEATH);--NPCËÀÍöÊıÁ¿
			j_dnpc = GetMissionV(MS_J_NPCDEATH);

			if (s_dpk * 1.5 + s_dnpc > j_dpk * 1.5 + j_dnpc) then
				SetMissionV(MS_FIRSTSHOW, 1)
				ShowTheKing(1)
				SetMissionV(MS_S_SHOWKING,2)
				return
			else
				SetMissionV(MS_FIRSTSHOW, 2)
				ShowTheKing(2)
				SetMissionV(MS_J_SHOWKING,2)
				return
			end
		end;
	end;

--Èç¹ûÒÑ¾­µ½ÁËµÚ¶ş½×¶Î£¬¼´ÓÅÊÆ·½Ö÷½«¿ÉÒÔ³öÏÖÁË
	if (V >= SHOWKINGTIME2) then
		--Èç¹ûµ±Ç°ÎŞÈÎºÎ·½Ö÷½«³öÏÖ£¬ÔòÖ±½Ó·µ»Ø
		local fstshow = GetMissionV(MS_FIRSTSHOW);
		if (fstshow <= 0) then
			return
		end

--¼ÇÂ¼ÓÅÊÆ·½µÄ´úºÅ 1song ,2jing
		nextgroup = 0;
		if (fstshow == 1) then	
			nextgroup = 2
		else
			nextgroup = 1
		end;

--Èç¹û¸Ã·½³öÏÖÖ÷½«µÄÒªÇóÒÑ¾­´ïµ½£¬ÔòÈÃÖ÷½«³öÏÖ
		local canshow = GetMissionV(MS_S_SHOWKING + nextgroup - 1);

		if (canshow == 1) then
			ShowTheKing(nextgroup);
			SetMissionV(MS_S_SHOWKING + nextgroup - 1, 2);
		end;
	end;
elseif (timestate == 3) then 
	Msg2MSAll("ChiÕn dŞch kÕt thóc ");
	StopMissionTimer(1,1);
end;

end;

function ReportMemberState(V)
--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö

if (V == GO_TIME) then
	if (GetMSPlayerCount(1,1) <= 10 or GetMSPlayerCount(1,2) <= 10) then
		AddGlobalCountNews("Thêi gian b¸o danh chiÕn tr­êng Tèng Kim ®· ®Õn, nh­ng hiÖn giê sè ng­êi cña ®«i bªn ch­a phï hîp yªu cÇu, trËn chiÕn lÇn nµy bŞ hñy bá! ");
		GiveBackBonus()
		CloseMission(1)
		return
	else
		AddGlobalCountNews("Thêi gian b¸o danh chiÕn tr­êng Tèng Kim ®· ®Õn, trËn chiÕn chİnh thøc b¾t ®Çu! ",3);
		logstr = "<#>TrËn chiÕn Tèng Kim chİnh thøc b¾t ®Çu!, sè l­îng ng­êi tham gia chiÕn ®Êu cho ®«i bªn Tèng Kim lµ "..GetMSPlayerCount(1,1).."<#>:"..GetMSPlayerCount(1,2);
		WriteLog(logstr)
		Msg2MSAll(1, logstr)
		RunMission(1);
		return
	end
end;

if (mod(V, 18) == 0) then 
	RestTime = (GO_TIME - V) * 1800 / GO_TIME;
	RestMin, RestSec = GetMinAndSec(RestTime);
	local str1 = "<#>Tèng Kim ®¹i chiÕn ®ang cho b¸o danh, nh÷ng ng­êi muèn tham gia h·y nhanh ch©n ®Õn hai cöa vµo chiÕn tr­êng Tèng Kim, thêi gian b¸o danh cßn l¹i lµ: "..RestMin.."<#>Phót. §iÒu kiÖn tham chiÕn: §¼ng cÊp İt nhÊt lµ 40, phİ b¸o danh 3000 l­îng. ";
	AddGlobalCountNews(str1, 2);
end;

--str = "<#>±¨Ãû½×¶Î:ËÎ¡¢½ğË«·½µ±Ç°×ÜÈËÊıÎª:"..GetMSPlayerCount(1,1).."<#>:"..GetMSPlayerCount(1,2);
--Msg2MSAll(1, str);

end;

function ReportBattle(V)
--Õ½¶·½øĞĞ¹ı³ÌÖĞ£¬ÏµÍ³¶¨ÆÚÍ¨Öª¸÷·½µÄÕóÍöÇé¿ö
	s_death = GetMissionV(4) + GetMissionV(8);
	j_death = (GetMissionV(3) + GetMissionV(9));
	gametime = (floor(GetMSRestTime(1,5)/18));

	RestMin, RestSec = GetMinAndSec(gametime);

	s_dpk  = GetMissionV(MS_S_DEATHCOUNT);
	j_dpk  = GetMissionV(MS_J_DEATHCOUNT);
	s_dnpc = GetMissionV(MS_S_NPCDEATH);
	j_dnpc = GetMissionV(MS_J_NPCDEATH);

	s_result = floor(j_dpk * 1.5 + j_dnpc);
	j_result = floor(s_dpk * 1.5 + s_dnpc);
	
	str1 = "<#>giai ®o¹n chiÕn ®Êu: T×nh h×nh th­¬ng vong hiÖn giê: Qu©n Tèng "..s_death.."<#>Ng­êi, tæng céng "..s_result.."<#>; Qu©n Kim "..j_death.."<#>Ng­êi, tæng céng "..j_result.."<#>. Thêi gian cßn l¹i: "..RestMin.."<#>phót"..RestSec.."<#> gi©y";

	Msg2MSAll(1, str1);

--È«Çò¹«¸æÕ½¿ö¹¦ÄÜ¹Ø±Õ 2004.11.5
--	if (mod(V, 24) == 0) then
--		str2 = "ËÎ½ğÕ½³¡ÕıÔÚ½øĞĞ¼¤ÁÒµÄÕ½¶·!Ä¿Ç°ËÎ½ğÉËÍöÎª"..s_death..":"..j_death;
--		AddGlobalCountNews(str2 , 1);
--	end;

end;
 