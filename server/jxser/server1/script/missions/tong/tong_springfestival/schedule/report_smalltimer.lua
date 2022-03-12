Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function OnTimer()
	local nNewsValue = GetMissionV(MS_SF_NEWSVALUE) + 1;
	SetMissionV(MS_SF_NEWSVALUE, nNewsValue);
	
	if (20 == nNewsValue) then
		CloseMission(SF_MISSIONID);
		return
	end;
	
	local i;
	for i = 1, SF_SMALLMAPCOUNT do
		if (nNewsValue >= 18) then
			groupsort(i, 1, SF_ANIMALNAME);
			groupsort(i + SF_SMALLMAPCOUNT, 1, SF_MOUSENAME);
		else
			groupsort(i, 0, SF_ANIMALNAME);
			groupsort(i + SF_SMALLMAPCOUNT, 0, SF_MOUSENAME);
		end;
	end;
	
	if (0 == mod(nNewsValue, 2)) then
		local nTime = floor(nNewsValue / 2);
		nTime = 10 - nTime;
		if (nTime > 0) then
			local OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(SF_MAPID[2]);
			Msg2MSAll(SF_MISSIONID, format("Cﬂn <color=yellow>%d<color> phÛt n˜a hoπt ÆÈng sœ k’t thÛc!",nTime));
			SubWorld = OldSubWorld;
		end;
	end;
end;

--≈≈–Ú∫Ø ˝(∏˘æ›µ„ª˜∏ˆ ˝”…∂‡µΩ…Ÿ»∑∂®Ω´“ª◊È≥…‘±µƒ√˚¥Œ)£ª
function groupsort(nGroupId, bSave, szAnimalName)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SF_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, SF_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(SF_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(SF_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--≤…”√“ª∏ˆ√∞≈›≈≈–Ú
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--≤…”√Ωµ–Ú≈≈–Ú
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
			if (nGroupId > SF_SMALLMAPCOUNT) then
			    szMsg = format("%s<enter> <color=green> x’p hπng %d: %s, bæt Æ≠Óc %d %s", 
							szMsg, i, GetName(), tabPlayer[i][2], SF_MOUSENAME);
			else
			    szMsg = format("%s<enter> <color=orange> x’p hπng %d: %s, Æ∏nh trÛng %s %d l«n", 
							szMsg, i, GetName(), SF_ANIMALNAME, tabPlayer[i][2]);
			end;
		end
	end
	--≈≈–Ú∫Û¥”«∞µΩ∫ÛæÕ «√˚¥Œµƒœ»∫Û
	nCount = nCount;
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(SF_TK_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		if (nGroupId > SF_SMALLMAPCOUNT) then
		    Msg2Player(format("Hi÷n tπi bπn bæt Æ≠Óc <color=yellow>%d<color> %s, x’p hπng <color=yellow>%d<color>.", GetTask(SF_COUNT_ONETIME), szAnimalName, i));
		else
		    Msg2Player(format("Hi÷n tπi bπn Æ∏nh trÛng %s <color=yellow>%d<color> l«n, hi÷n x’p hπng <color=yellow>%d<color>.", szAnimalName, GetTask(SF_COUNT_ONETIME), i));
		end;
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
