Include([[\script\missions\tong\tong_disciple\head.lua]]);

function OnTimer()
	local nNewsValue = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, nNewsValue);
	
	if (20 == nNewsValue) then
		CloseMission(DIS_MISSIONID);
		return
	end;
	
	local i;
	for i = 1, DIS_SMALLMAPCOUNT do
		if (nNewsValue >= 18) then
			groupsort(i, 1);
		else
			groupsort(i, 0);
		end;
	end;
	
	if (0 == mod(nNewsValue, 2)) then
		local nTime = floor(nNewsValue / 2);
		nTime = 10 - nTime;
		if (nTime > 0) then
			local OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
			Msg2MSAll(DIS_MISSIONID, "Ho¹t ®éng vÉn cßn<color=yellow>"..nTime.."<color>phót kÕt thóc!");
			SubWorld = OldSubWorld;
		end;
	end;
end;

--ÅÅÐòº¯Êý(¸ù¾Ýµã»÷¸öÊýÓÉ¶àµ½ÉÙÈ·¶¨½«Ò»×é³ÉÔ±µÄÃû´Î)£»
function groupsort(nGroupId, bSave)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, DIS_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(DIS_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(DIS_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--²ÉÓÃÒ»¸öÃ°ÅÝÅÅÐò
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--²ÉÓÃ½µÐòÅÅÐò
				temptab = tabPlayer[j];
				tabPlayer[j] = tabPlayer[j - 1];
				tabPlayer[j - 1] = temptab;
			end;
		end;
	end;

	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", chiªu mé ®­îc"..tabPlayer[i][2].." ®Ö tö"
		end
	end
	--ÅÅÐòºó´ÓÇ°µ½ºó¾ÍÊÇÃû´ÎµÄÏÈºó
	nCount = nCount;
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(DIS_TK_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("Chiªu mé ®­îc <color=yellow>"..GetTask(DIS_COUNT_ONETIME).."<color> ®Ö tö, xÕp h¹ng thø <color=yellow>"..i.."<color>, tiÕp tôc cè g¾ng!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
