Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\functionlib.lua")
function COT_CheckTeamRequirement()
	local oldplayer = PlayerIndex
	if (IsCaptain() ~= 1) then
		Say("Xin lçi! CÇn ph¶i lµ §éi tr­ëng míi cã t­ c¸ch b¸o danh tham gia 'NhiÖm vô Th¸ch thøc thêi gian'",0)
		return
	end
	
	if (GetTeamSize() < 1) then
		Say("Xin lçi! §éi tham gia 'NhiÖm vô Th¸ch thøc thêi gian' cÇn ph¶i cã Ýt nhÊt <color=red>4<color> ng­êi!",0)
		return
	end
	
	if (GetCash() < 10000) then
		Say("Tham gia nhiÖm vô “Th¸ch thøc thêi gian” cÇn <color=red>1v¹n l­îng<color>. ChuÈn bÞ ®ñ tiÒn råi h·y quay l¹i!", 0)
		return
	end
	
	local nMatchLevel = GetMatchLevel(GetLevel())
	local nToday = tonumber(GetLocalDate("%y%m%d"));
	
	for i = 1, GetTeamSize() do 
		local nPlayerIndex = GetTeamMember(i)
		local nJoinDate = CallPlayerFunction(nPlayerIndex, GetTask, TSK_JOIN_DATE)
		local nRemainCount = CallPlayerFunction(nPlayerIndex, GetTask, TSK_REMAIN_COUNT)
		local nPlayerLevel = CallPlayerFunction(nPlayerIndex, GetLevel)
		local nTaskItem = CallPlayerFunction(nPlayerIndex, CalcItemCount, 3, 6, 1, 400, 90)
		local nFlag1 = DynamicExecuteByPlayer(nPlayerIndex,"\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", {nTaskID = 3071,nStartBit = 25,nBitCount = 1,nMaxValue = 1})
		if nFlag1 ~= 0 then
			PlayerIndex = GetTeamMember(i)
			local szNamePlayer = GetName()
			PlayerIndex = oldplayer
			Say("Xin lçi! Trong ®éi b¹n cã thµnh viªn <color=yellow>".. szNamePlayer.."<color> kh«ng tháa ®iÒu kiÖn ®Ó tham gia tÝnh n¨ng nµy")
			return
		end
		if (nJoinDate == nToday) and (nRemainCount <= 0) then
				Say("NhiÖm vô Th¸ch thøc thêi gian mçi ngµy chØ ®­îc tham gia 1 lÇn. Sè lÇn tha gia cña tæ b¹n ®· ®ñ! Ngµy mai trë l¹i nhÐ!",0);
				Msg2Team("NhiÖm vô Th¸ch thøc thêi gian mçi ngµy chØ ®­îc tham gia 1 lÇn. Sè lÇn tha gia cña tæ b¹n ®· ®ñ! Ngµy mai trë l¹i nhÐ!")
			return
		end
		
		if GetMatchLevel(nPlayerLevel) ~= nMatchLevel then
			if (nMatchLevel == 1) then
				Say(" Xin lçi! Trong ®éi b¹n cã thµnh viªn v­ît <color=red>cÊp 90<color>, xin kiÓm tra l¹i råi b¸o danh!",0)
				Msg2Team("Trong ®éi b¹n cã thµnh viªn trªn cÊp 90, xin h·y kiÓm tra l¹i råi b¸o danh!");
				return
			elseif (nMatchLevel == 2) then
				Say("Xin lçi! Trong ®éi b¹n cã thµnh viªn ch­a ®¹t <color=red>cÊp 90<color>, xin kiÓm tra l¹i råi b¸o danh!",0)
				Msg2Team("Trong ®éi b¹n cã thµnh viªn ch­a ®¹t cÊp 90, xin kiÓm tra l¹i råi b¸o danh!")
				return
			end
		end
		
		local bHaveItem = 0
		if nMatchLevel == 1 then
			for i=20,80,10 do
				if CallPlayerFunction(nPlayerIndex, CalcEquiproomItemCount, 6, 1, 400, i) > 0 then
					bHaveItem = 1
					break
				end
			end	
		elseif nMatchLevel == 2 then
			bHaveItem = CallPlayerFunction(nPlayerIndex, CalcEquiproomItemCount, 6, 1, 400, 90)
		end
		
		if (bHaveItem < 1 and nMatchLevel == 1) then
			Say("NhiÕp ThÝ ThÇn: Xin l­îng thø, tham gia nhiÖm vô khiªu chiÕn thêi gian s¬ cÊp mçi thµnh viªn cÇn ph¶i cã mét S¸t Thñ Gi¶n ngò hµnh bÊt kú cÊp 90 trë xuèng, xin h·y chuÈn bÞ råi h·y ®Õn ®©y gÆp ta",0)
			Msg2Team("Trong tæ ®éi cña ng­¬i cã ng­êi kh«ng cã S¸t Thñ Gi¶n ngò hµnh bÊt kú cÊp 90 trë xuèng , xin  kiÓm tra l¹i råi h·y b¸o danh tham gia !")
			return
		elseif (bHaveItem < 1 and nMatchLevel == 2) then
			Say("NhiÕp ThÝ ThÇn: Xin l­îng thø, tham gia nhiÖm vô khiªu chiÕn thêi gian cao cÊp mçi thµnh viªn cÇn ph¶i cã mét S¸t Thñ Gi¶n ngò hµnh bÊt kú cÊp 90 , xin h·y chuÈn bÞ råi h·y ®Õn ®©y gÆp ta",0)
			Msg2Team("Trong tæ ®éi cña ng­¬i cã ng­êi kh«ng cã S¸t Thñ Gi¶n ngò hµnh bÊt kú cÊp 90, xin  kiÓm tra l¹i råi h·y b¸o danh tham gia !")
			return
		end
	end

	return 1
	
end
function COT_GetFreeMap(nMatchLevel)
	local tbFreeMaps = {}
	local bStarted = nil
	local tbMapList = GetMatchMapList(nMatchLevel)
	
	for i = 1, getn(tbMapList) do 
		local nMapIndex = SubWorldID2Idx(tbMapList[i])
		if (nMapIndex >= 0) then
			local nState = lib:DoFunInWorld(nMapIndex, GetMissionV, VARV_STATE)
			local nMSPlayerCount = lib:DoFunInWorld(nMapIndex, GetMSPlayerCount, MISSION_MATCH, 1)
			if (nState > 0) then
			 bStarted = 1
			end
			if (nState == 1 and nMSPlayerCount == 0) then
				tinsert(tbFreeMaps, tbMapList[i])
			end
		end
	end
	
	return tbFreeMaps, bStarted
end

function want_playboat()
	local nPlayerLevel = GetLevel()
	local nMatchLevel = GetMatchLevel(nPlayerLevel)
	local tbFreeMapList, bStarted = COT_GetFreeMap(nMatchLevel)
	
	-- resolve lua error.
	if nMatchLevel == nil then
		return
	end

	local strLevel = tbLevels[nMatchLevel].szName
	
	if bStarted then
		if (getn(tbFreeMapList) == 0) then
			Say("Khu vùc nµy"..strLevel.."®· b¾t ®Çu. Kh«ng cßn chç n÷a….",0)
			return
		else
			Say("Khu vùc nµy"..strLevel.."giai ®o¹n b¸o danh ®ua thuyÒn rång, vÉn cßn <color=red>"..getn(tbFreeMapList).."<color> mét b¶n ®å nhiÖm vô cßn trèng, khiªu chiÕn cã thêi gian cÇn ph¶i nép <color=red>10 v¹n<color> ng©n l­îng, ng­¬i muèn nhËp héi kh«ng?",2, "Ph¶i! Ta muèn dÉn d¾t ®éi cña ta tham gia./dragon_join", "Kh«ng cÇn/onCancel")
			return
		end
	else
		Say("Xin lçi! Khu vùc nµy"..strLevel.."NhiÖm vô Th¸ch thøc thêi gian ch­a ®Õn giai ®o¹n b¸o danh. C¸ch <color=red>mçi giê<color> b¸o danh 1 lÇn. Xin chó ý hÖ thèng th«ng b¸o!",0)
		return
	end
	
end

function COT_TeamMemberJoin(nMatchLevel)
	local w,x,y = GetWorldPos();
	local nPrisonId = 208
	if w == nPrisonId then	-- ÔÚÕâÀïÅÐ¶ÏÊÇ·ñÓÐÔ½ÓüÆóÍ¼
		return
	end
	
	local nConsumed = 0
	if nMatchLevel == 1 then
		for i=20,80,10 do
			if(CalcEquiproomItemCount( 6, 1, 400, i ) > 0) then
				nConsumed = ConsumeEquiproomItem( 1, 6, 1, 400, i)
				if nConsumed > 0 then break end
			end
		end
	elseif nMatchLevel == 2 then
		nConsumed = ConsumeItem(3, 1, 6,1,400,90)
	end
	
	if (nConsumed > 0) then
		local nToday = tonumber(GetLocalDate("%y%m%d"));
		if(GetTask(TSK_JOIN_DATE) ~= nToday) then
			SetTask(TSK_REMAIN_COUNT, COUNT_LIMIT);
			SetTask(TSK_JOIN_DATE, nToday);
		end
		SetTask(TSK_REMAIN_COUNT, GetTask(TSK_REMAIN_COUNT) - 1);
		
		-- ÅÐ¶ÏÊÇ·ñÊ¹ÓÃÁËÁúÑªÍè
		if GetTask(%TSK_Longxuewan_Date) == nToday then
			local nCurCount = GetTask(%TSK_Longxuewan_avail)
			if nCurCount >= 0 then
				SetTask(%TSK_Longxuewan_avail, nCurCount - 1)
			end
		else
			SetTask(%TSK_Longxuewan_avail, -1)
		end

		JoinMission(MISSION_MATCH, 1)
		G_ACTIVITY:OnMessage("SignUpChuangguan", PlayerIndex, nMatchLevel)
		
		PlayerFunLib:AddTaskDaily(3079, 1)
		if PlayerFunLib:GetTaskDailyCount(3079) > 1 then
			tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiThuPhi")
		else
			tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiMienPhi")
		end
		
	end
end

function COT_TeamJoin(nMatchLevel)

	local szLeaderName = GetName()
	
	local tbPlayers = {}
	for i=1, GetTeamSize() do
		tbPlayers[i] = GetTeamMember(i)
	end		
	
	local w,x,y = GetWorldPos()
	SetMissionV(VARV_SIGNUP_WORLD, w)
	SetMissionV(VARV_SIGNUP_POSX, x)
	SetMissionV(VARV_SIGNUP_POSY, y)
	SetMissionV(VARV_LEVEL, nMatchLevel)
	SetMissionS(VARS_TEAM_NAME, szLeaderName)
	SetMissionS(VARS_TEAMLEADER_FACTION, GetLastFactionNumber())
	SetMissionS(VARS_TEAMLEADER_GENDER, GetSex())
	Pay(10000)
	
	local ndate = tonumber(GetLocalDate("%H"))
	if ndate <= 22 and ndate >= 10 and nMatchLevel == 2 then
		SetMissionV(VARV_BATCH_MODEL,1)
	else
		SetMissionV(VARV_BATCH_MODEL,0)
	end
	
	for i = 1 , getn(tbPlayers) do 
		CallPlayerFunction(tbPlayers[i], COT_TeamMemberJoin, nMatchLevel)
	end
	
	tbLog:PlayerActionLog("EventChienThang042011","BaoDanhVuotAi")-- ±¨ÃûÈÕÖ¾
end

function dragon_join()
	
	local nLeaderLevel = GetLevel()
	local nMatchLevel = GetMatchLevel(nLeaderLevel)
	
	if not COT_CheckTeamRequirement(nMatchLevel) then
		return
	end
	
	local tbFreeMaps = COT_GetFreeMap(nMatchLevel)
	for i = 1, getn(tbFreeMaps) do 
		local nMapIndex = SubWorldID2Idx(tbFreeMaps[i])
		if nMapIndex >= 0 then
			lib:DoFunInWorld(nMapIndex, COT_TeamJoin, nMatchLevel)
			return
		end
	end
	
	local strLevel = tbLevels[nMatchLevel].szName
	Say("Xin lçi! HiÖn t¹i khu vùc <color=red>"..strLevel.."<color>®· kh«ng cßn chç. Xin ®îi vßng sau!",0)
end
