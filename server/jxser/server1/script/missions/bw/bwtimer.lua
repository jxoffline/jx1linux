Include("\\script\\missions\\bw\\bwhead.lua");

szCaptainName = {};
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);
	
	szCaptainName = bw_getcaptains(); --»ñÈ¡Á½¶Ó¶Ó³¤µÄÃû×Ö£»

	if (timestate == 1) then 	--±¨Ãû½×¶Î
		local str1 = ReportMemberState(V);
		bw_noticecaptainkey(str1);
	elseif (timestate == 2) then --¿ªÕ½ÁË
		ReportBattle(V);
	elseif (timestate == 3) then  --Õ½¶·½áÊøÁË
		Msg2MSAll(BW_MISSIONID, "KÕt thóc trËn ®Êu!");
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		StopMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID);
	end;
end;

function ReportMemberState(V)
	--ÔÚ±¨ÃûÆÚ¼ä£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÍæ¼Òµ±Ç°µÄ±¨ÃûÇé¿ö

	if (V == GO_TIME) then
		bw_begin_compete();
	end;
	
	RestMin = floor((GO_TIME - V) / 3);
	RestSec = mod((GO_TIME - V),3) * 20;
	local str1;

	if (RestMin > 0) and (RestSec == 0) then
		str1 = "Thêi gian vµo thi ®Êu l«i ®µi <#> cßn: <color=yellow>"..RestMin.."<color><#> phót."
		Msg2MSAll(BW_MISSIONID, str1);
		if ((GO_TIME - V) == 3) then 
			str1 = GetMissionS(CITYID).."Thêi gian vµo thi ®Êu l«i ®µi <#> chØ cßn ®óng <color=yellow>1<color> phót, xin mäi ng­êi nhanh chãng vµo tr­êng ®Êu."
			--AddGlobalCountNews(str1)
		end
	elseif (RestMin == 0) then
		str1 = "Thêi gian vµo thi ®Êu l«i ®µi <#> cßn: <color=yellow>" ..RestSec.. "<color><#> gi©y."
		Msg2MSAll(BW_MISSIONID, str1);
	end;
	return str1;
end;

function bw_noticecaptainkey(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	local masteridx, szName, nKey, str;
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
			szName = GetMissionS(MSS_CAPTAIN[i]);
			nKey = GetMissionV(MS_TEAMKEY[i]);
			nCount = GetMissionV(MS_MAXMEMBERCOUNT);
			str = "C¸c h¹ ®· thuéc ®éi thi ®Êu <color=yellow> "..GetMissionS(CITYID).."<color> <#> thuéc ®éi <color=yellow> "..nCount.."<color> ®Êu víi <color=yellow> "..nCount.."<color>, <#> sè thø tù vµo ®Êu tr­êng <color=yellow> ["..nKey.."]<color>. H·y th«ng b¸o víi ®éi h÷u m×nh vµo ®Êu tr­êng.";
			Msg2Player(str);
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_begin_compete()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0  and nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Thêi gian thi ®Êu l«i ®µi ®· ®Õn, ®éi <color=yellow>"..szCaptainName[1].."<#> <color> vµ ®éi <color=yellow>"..szCaptainName[2].."<#> <color> kh«ng ®óng giê vµo ®Êu tr­êng, trËn ®Êu hñy bá!";
		Msg2MSAll(BW_MISSIONID,str1)
		--AddGlobalCountNews(str1);
		SetMissionV(MS_STATE,3);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Thêi gian thi ®Êu l«i ®µi ®· ®Õn, ®éi <color=yellow>"..szCaptainName[1].."<#> <color> kh«ng ®óng giê vµo ®Êu tr­êng, ®éi <color=yellow>"..szCaptainName[2].."<#> <color> ®­îc xö th¾ng!"
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(2);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Thêi gian thi ®Êu l«i ®µi ®· ®Õn, ®éi <color=yellow>"..szCaptainName[2].."<#> <color> kh«ng ®óng giê vµo ®Êu tr­êng, ®éi <color=yellow>"..szCaptainName[1].."<#> <color> ®­îc xö th¾ng!";
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(1);
		CloseMission(BW_MISSIONID);
		return
	end;
		
	Msg2MSAll(BW_MISSIONID, "ChÊm døt thêi gian vµo ®Êu tr­êng, thi ®Êu chÝnh thøc b¾t ®Çu!");
	str = GetMissionS(CITYID).."L«i ®µi <#> <color=yellow>"..szCaptainName[1].."<color> <#> vµ <color=yellow>"..szCaptainName[2].."<color> <#> chÊm døt thêi gian vµo ®Êu tr­êng, thi ®Êu chÝnh thøc b¾t ®Çu!";
	--AddGlobalCountNews(str);
	RunMission(BW_MISSIONID);
	return
end;

function ReportBattle(V)
	bw_checkwinner();	--Õ½¶·½øÐÐ¹ý³ÌÖÐ£¬ÏµÍ³¶¨ÆÚÍ¨Öª¸÷·½µÄÕóÍöÇé¿ö
	gametime = (floor(GetMSRestTime(BW_MISSIONID,BW_TOTALTIME_ID)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(BW_MISSIONID, "Giai ®o¹n chiÕn ®Êu L«i ®µi <#>: Hai bªn ®ang thi ®Êu. Thêi gian cßn  <color=yellow>"..RestSec.."<color><#> gi©y.");
	elseif (RestSec == 0) then
		Msg2MSAll(BW_MISSIONID, "Giai ®o¹n chiÕn ®Êu L«i ®µi <#>: Hai bªn ®ang thi ®Êu. Thêi gian cßn  <color=yellow>"..RestMin.."<color><#> phót.");
	else
		Msg2MSAll(BW_MISSIONID, "Giai ®o¹n chiÕn ®Êu L«i ®µi <#>: Hai bªn ®ang thi ®Êu. Thêi gian cßn  <color=yellow>"..RestMin.."<color><#> phót<color=yellow>"..RestSec.."<color><#> gi©y.");
	end;
end;

function bw_checkwinner()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."Hai bªn ®ång thêi rêi khái ®Êu tr­êng <#>, ®éi <color=yellow>"..szCaptainName[1].."<color> <#> vµ <color=yellow>"..szCaptainName[2].."<color> <#> hßa nhau!";
		bw_all_gone(str1)
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."KÕt qu¶ l«i ®µi <#>, ®éi <color=yellow>"..szCaptainName[2].."<color> <#> ®· ®¸nh b¹i ®éi <color=yellow>"..szCaptainName[1].."<color> <#>, giµnh th¾ng lîi chung cuéc!"
		bw_all_gone(str1)
		return
	end;
	
	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."KÕt qu¶ l«i ®µi <#>, ®éi <color=yellow>"..szCaptainName[1].."<color> <#> ®· ®¸nh b¹i ®éi <color=yellow>"..szCaptainName[2].."<color> <#>, giµnh th¾ng lîi chung cuéc!"
		bw_all_gone(str1)
		return
	end;
end;

function bw_noticecaptainnews(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_all_gone(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	bw_noticecaptainnews(str1);
	CloseMission(BW_MISSIONID);
end;