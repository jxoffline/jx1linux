Include("\\script\\missions\\bw\\bwhead.lua");
function OnDeath(Launcher)
	local curcamp = GetCurCamp();
	local i;
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();

	local PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murderÐ×ÊÖ
	local OrgPlayer  = PlayerIndex; --ËÀÕß
	local DeathName = GetName();
	local str;

	local nLaunGroupID;
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		local LaunName = GetName();
		nLaunGroupID = GetCurCamp();
		if (nLaunGroupID == 2 or nLaunGroupID == 3) then
			str  = GetMissionS(CITYID).."<#> Trong trËn ®Êu l«i ®µi nhiÒu ng­êi, <color=yellow>"..szCaptainName[nLaunGroupID - 1].."<color> ®éi <color=yellow>"..LaunName.."<color><#> trong thi ®Êu ®· ®¸nh b¹i <color=yellow>"..szCaptainName[4 - nLaunGroupID].."<color> ®éi <color=yellow>"..DeathName.."<color><#>.";
			Msg2MSAll(BW_MISSIONID, str);
		end
	end;
	
	PlayerIndex = OrgPlayer;
	if (nil ~= str) then
		DelMSPlayer(BW_MISSIONID, PlayerIndex);
	end;
	bw_all_death();
end;

function bw_all_death()
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	local str1 = "";
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> hai bªn cïng chÕt trong thi ®Êu l«i ®µi,"..szCaptainName[1].."<color><#> vµ <color=yellow>"..szCaptainName[2].."<color><#> hßa nhau!";
		bw_death_close(str1)
	elseif (nGroup2PlayerCount <= 0) then
		str1 = GetMissionS(CITYID).."KÕt qu¶ l«i ®µi <#>, ®éi <color=yellow>"..szCaptainName[1].."<color> ®¸nh b¹i ®éi <color=yellow>"..szCaptainName[2].."<color>, <#> <color=yellow>"..szCaptainName[1].."<color> giµnh chiÕn th¾ng chung cuéc!";
		bw_branchtask_win(1);
		bw_death_close(str1)
	elseif (nGroup1PlayerCount <= 0) then 
		str1 = GetMissionS(CITYID).."KÕt qu¶ l«i ®µi <#>, ®éi <color=yellow>"..szCaptainName[2].."<color> ®¸nh b¹i ®éi <color=yellow>"..szCaptainName[1].."<color>, <#> <color=yellow>"..szCaptainName[2].."<color> giµnh chiÕn th¾ng chung cuéc!";
		bw_branchtask_win(2);
		bw_death_close(str1)
	end;
end;

function bw_death_close(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	CloseMission(BW_MISSIONID);
end;