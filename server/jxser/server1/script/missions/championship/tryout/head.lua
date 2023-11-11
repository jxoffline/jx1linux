Include("\\script\\missions\\championship\\head.lua")
MISSIONID = 18;
MATCH_MS_ID = 19;
FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ

UP_A_TIME = 15
RUN_A_TIME = 5 --±¨Ãû5·ÖÖÓÖ®ºó£¬×Ô¶¯½øÈëÕ½¶·Èü³¡

MS_STATE = 1; --ÈÎÎñÖÐ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
MS_TIME_1 = 2	--Ã¿20Ãë¼ÓÒ»smalltimer´¥·¢Æ÷
MS_TIME_2 = 3	--totaltimer´¥·¢Æ÷
MS_ROUND = 4	--¼ÇÂ¼µ±ÌìÈüÊÂµÄÂÖ´Î
MS_A_TIME = 5	--µ±Ç°ÂÖ´ÎÓÃµôµÄÊ±¼ä

function Elect_RanField()
	local cnt_1 = 0
	local cnt_2 = 0
	local fieldtab = {}
	for i =1, 100 do
		fieldtab[i] = i
	end
	for i = 1, 100 do
		cnt_1 = random(1, 100) 
		a = fieldtab[cnt_1]
		cnt_2 = random(1, 100)
		fieldtab[cnt_1] = fieldtab[cnt_2]
		fieldtab[cnt_2] = a
	end
	return fieldtab
end

HIGHMEMBER_PERCENT = 20
MIDDLEMEMBER_PERCENT = 40
LOWMEMBER_PERCENT = 100 - HIGHMEMBER_PERCENT - MIDDLEMEMBER_PERCENT

function Elect_RanEnemy(plyidx)
	local num = getn(plyidx)
	local per_num = floor(num / 3);

	plyidx = cp_randomeny(1, per_num, plyidx)
	plyidx = cp_randomeny(per_num + 1, per_num * 2, plyidx)
	plyidx = cp_randomeny(per_num * 2 + 1, num, plyidx)
	
	high_count = floor(num * HIGHMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(1, high_count, plyidx)
	
	middle_count = floor(num * MIDDLEMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(high_count + 1, high_count + middle_count, plyidx)
	
	plyidx = cp_randomeny(high_count + middle_count + 1, num, plyidx)
	return plyidx
end

function cp_randomeny(q, m, tabplyidx )
	local a = 0
	local cnt_1 = 0
	local cnt_2 = 0
	for i = q, m do
		cnt_1 = random(q, m) 
		a = tabplyidx[cnt_1]
		cnt_2 = random(q, m)
		tabplyidx[cnt_1] = tabplyidx[cnt_2]
		tabplyidx[cnt_2] = a
	end
	return tabplyidx
end

function Run_CPMatch()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end
	tbPlayer = Elect_RandomPL(tbPlayer)
	return tbPlayer
end

function Elect_RandomPL(tabplayindex)
	local ncount = 0
	local tab_index = {}
	oldplayer = PlayerIndex
	if (getn(tabplayindex) > 200) then
		tabplayindex = cp_randomeny(1, getn(tabplayindex), tabplayindex )
		for i = 1, 200 do
			tab_index[i] = tabplayindex[i]
		end
		local str = "Sè ng­êi thi ®Êu vßng nµy ®· ®Çy, xin ®îi trËn tiÕp theo!"
		for i = 201, getn(tabplayindex) do 
			PlayerIndex = tabplayindex[i]
			Msg2Player(str)
		end
	else
		tab_index = tabplayindex
	end
	PlayerIndex = oldplayer
	return tab_index	
end

function join_tryout()
	if (nt_gettask(CP_TASKID_ROUND) >= CP_MAXROUND ) then
		Say("Sè lÇn thi ®Êu dù tuyÓn §¹i héi Vâ l©m cña b¹n ®· ®ñ!"..CP_MAXROUND.."lÇn, kh«ng thÓ tiÕp tôc tham chiÕn.", 0)
		return
	end
	local subworldid = SubWorldIdx2ID (SubWorld)
	LeaveTeam()
	DisabledStall(1)	--½ûÖ¹°ÚÌ¯
	SetTaskTemp(200, 1)
	AddMSPlayer(MISSIONID,1);
	nt_settask(CP_TASKID_FLAG, 0)
	SetLogoutRV(1);
	SetCurCamp(1);
	SetFightState(0)
	SetPunish(0);
	SetPKFlag(2)
	ForbidChangePK(1);
	SetCreateTeam(0);
	ForbitTrade(1)
	SetRevPos(subworldid, 1)
	nt_settask(CP_TASKID_ENEMY, 0)
	for i = 1, getn(CP_FORBID_ITEM) do
		AddSkillState(CP_FORBID_ITEM[i][3], 20, 1, 0)
	end
	NewWorld(subworldid, CP_MAPPOS_PRE[1], CP_MAPPOS_PRE[2])
	DisabledUseTownP(1)	--ÏÞÖÆÆäÔÚ×¼±¸Ï¯ºÍ±ÈÈüÓÃµØÄÚÊ¹ÓÃ»Ø³Ç·û
	local mm = RUN_A_TIME - GetMissionV(MS_A_TIME)
	Msg2Player("B¹n ®· vµo n¬i chuÈn bÞ thi ®Êu. Thi ®Êu sÏ ®­îc tiÕn hµnh vµo"..mm.."phót b¾t ®Çu")
end

function join_match()
	WriteLog(date("%Y-%m-%d,%H:%M,").."h¹ng thø "..GetMissionV(MS_ROUND).."thø mÊy"..checkmap(1).."Sè ng­êi tham gia thi ®Êu dù tuyÓn M«n ph¸i lµ "..GetMSPlayerCount(MISSIONID, 0))
	local fieldtab = {}
	local playertab = {}
	local org_mapindex = 0
	local org_mapid = 0
	local new_mapindex = 0
	local new_mapid = 0
	
	fieldtab = Elect_RanField()
	playertab = Run_CPMatch()
	playertab = Sort_Point(playertab)	
	playertab = Elect_RanEnemy(playertab)
	if (getn(playertab) > 200) then
		num_vs = 100
	else
		num_vs = floor (getn(playertab) / 2) 
	end
	org_mapindex = SubWorld
	org_mapid = SubWorldIdx2ID(SubWorld)
	new_mapid = org_mapid + 1
	new_mapindex = SubWorldID2Idx(new_mapid)
	orgplayeridx = PlayerIndex
	
	SubWorld = new_mapindex
	for i = 1, num_vs * 2, 2 do 
		posx = GetTabFileData(CP_MATCH_POS, fieldtab[i] + 1, 1)
		posy = GetTabFileData(CP_MATCH_POS, fieldtab[i] + 1, 2)
		org_plyidx = playertab[i]
		PlayerIndex = org_plyidx
		org_plyname = GetName()
		org_plywin = nt_gettask(CP_TASKID_WIN)
		org_plylose = nt_gettask(CP_TASKID_LOSE)
		org_plytie = nt_gettask(CP_TASKID_TIE)
		
		eny_plyidx = playertab[i + 1]
		PlayerIndex = eny_plyidx
		eny_plyname = GetName()
		eny_plywin = nt_gettask(CP_TASKID_WIN)
		eny_plylose = nt_gettask(CP_TASKID_LOSE)
		eny_plytie = nt_gettask(CP_TASKID_TIE)
		PlayerIndex = org_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i);
		nt_settask(CP_TASKID_ENEMY, i + 100)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		SetCurCamp(2)
		SetFightState(0)
		SetPKFlag(2)
		SetCreateTeam(0);
		DisabledStall(1)	--½ûÖ¹°ÚÌ¯
		SetTaskTemp(200, 1)
		SetLogoutRV(1);
		ForbitTrade(1)
		ForbidChangePK(1);
		SetRevPos(org_mapid, 1)
		Msg2Player("B¹n ®· vµo tr­êng ®Êu, 10 gi©y sau sÏ chÝnh thøc b¾t ®Çu.")
		Msg2Player("§èi thñ cña b¹n"..eny_plyname.."KÕt qu¶ hiÖn t¹i:"..eny_plywin.."th¾ng "..eny_plylose.."thua"..eny_plytie.."hßa")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], giai ®o¹n tham gia chiÕn ®Êu, chiÕn tÝch cña b¹n hiÖn t¹i lµ: th¾ng"..org_plywin.."thua"..org_plylose.."hßa"..org_plytie..", ®· tham gia råi"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("Sau khi vµo khu vùc thi ®Êu, kh«ng thÓ di chuyÓn vËt phÈm trong hµnh trang, nh­ng vÉn cã thÓ sö dông vËt phÈm trong hµnh trang vµ b¶ng c«ng cô.");
		SetDeathScript("\\script\\missions\\championship\\match\\playerdeath.lua");
		
		PlayerIndex = eny_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i + 100);
		nt_settask(CP_TASKID_ENEMY, i)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		SetCurCamp(3)
		SetFightState(0)
		SetPKFlag(2)
		SetCreateTeam(0);
		DisabledStall(1)	--½ûÖ¹°ÚÌ¯
		SetTaskTemp(200, 1)
		SetLogoutRV(1);
		ForbitTrade(1)
		ForbidChangePK(1);
		SetRevPos(org_mapid, 1)
		Msg2Player("B¹n ®· vµo tr­êng ®Êu, 10 gi©y sau sÏ chÝnh thøc b¾t ®Çu.")
		Msg2Player("§èi thñ cña b¹n"..org_plyname.."KÕt qu¶ hiÖn t¹i:"..org_plywin.."th¾ng "..org_plylose.."thua"..org_plytie.."hßa")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], giai ®o¹n tham gia chiÕn ®Êu, chiÕn tÝch cña b¹n hiÖn t¹i lµ: th¾ng"..eny_plywin.."thua"..eny_plylose.."hßa"..eny_plytie..", ®· tham gia råi"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("Sau khi vµo khu vùc thi ®Êu, kh«ng thÓ di chuyÓn vËt phÈm trong hµnh trang, nh­ng vÉn cã thÓ sö dông vËt phÈm trong hµnh trang vµ b¶ng c«ng cô.");
		SetDeathScript("\\script\\missions\\championship\\match\\playerdeath.lua");
	end
	SubWorld = org_mapindex
		local playeridx = {}
		idx = 0;
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
			if (idx == 0) then 
		 		break
		 	end;
		 	playeridx[i] = pidx
		end
		if (getn(playeridx) > 1) then
			str = "Sè ng­êi thi ®Êu vßng nµy ®· ®Çy, xin ®îi trËn tiÕp theo!"
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				Msg2Player(str)
			end
		else
			str = "Sè ng­êi tham gia vßng nµy kh«ng ®ñ, kh«ng chän ®­îc ®èi thñ cña b¹n, vßng nµy b¹n ®· chiÕn th¾ng, ®­îc 3 ®iÓm th­ëng."
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				enyname = GetName()
				nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
				nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
				nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
				Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
				Msg2Player(str)
				WriteLog("Ng­êi ch¬i ["..enyname.."], do kh«ng cã ®èi thñ, chiÕn tÝch hiÖn thêi lµ: th¾ng"..nt_gettask(CP_TASKID_WIN)..", thua"..nt_gettask(CP_TASKID_LOSE)..", hßa"..nt_gettask(CP_TASKID_TIE)..", chung cuéc"..nt_gettask(CP_TASKID_POINT))
				AddAword(GetLevel(), 20, 2)
			end
		end
	PlayerIndex = orgplayeridx
end

function GameOver()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
		camp = GetCamp();
		SetCurCamp(camp);
		SetLogoutRV(0);
		SetCreateTeam(1);
		DisabledStall(0)	--ÔÊÐí°ÚÌ¯
		SetTaskTemp(200, 0)
		SetFightState(0);
		SetPunish(1);
		ForbidChangePK(0);
		SetPKFlag(0);
		ForbitTrade(0)
		nt_settask(CP_TASKID_ENEMY, 0)
		NewWorld(SubWorldIdx2ID(SubWorld), CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
	end
	WriteLog(date("%Y-%m-%d %H%M%S,").."§Þa ®å nµy ["..SubWorldIdx2ID(SubWorld).."] Thi ®Êu dù tuyÓn cña ngµy h«m nay ®· kÕt thóc.")
end