function DefFun1(n1)
	return 1
end
function DefFun2(n1, n2)
	return 1
end
if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\workshop\\workshop_setting.lua")
Include("\\script\\tong\\log.lua")
if MODEL_RELAY == 1 then
	Include("\\script\\gb_taskfuncs.lua")
else
	Include("\\script\\tong\\map\\map_management.lua")
end

--°ï»á³õÊ¼»¯
function INIT_R(nTongID)
	if (nTongID == 0 or TONG_GetDay(nTongID) ~= 0)then
		return 0
	end
	return MAINTAIN_R(nTongID)
end
INIT_G_1 = DefFun1
INIT_G_2 = DefFun1

function ADD_R(nTongID, nMasterID)
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = "T¹o bang héi";
	local szRecordPlus;
	local szMasterName = TONGM_GetName(nTongID, nMasterID);
	if (szMasterName ~= "") then
		szRecordPlus = szMasterName.." "..szRecord;
	else
		szMasterName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- °ï»áÀúÊ·¼ÇÂ¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	
	cTongLog:WriteInfTB("TONG", "build", nTongID, {master = szMasterName})
		
	return INIT_R(nTongID)
end
ADD_G_1 = DefFun2
ADD_G_2 = DefFun2

function REMOVE_R(nTongID)
	local tbMsg = {
		membercount	= TONG_GetMemberCount(nTongID),
		retirecount	= TONG_GetMemberCount(nTongID, 4),
		day			= TONG_GetDay(nTongID),
		buildfund	= TONG_GetBuildFund(nTongID),
		warbuildfund= TONG_GetWarBuildFund(nTongID),
	}
	cTongLog:WriteInfTB("TONG", "dismiss", nTongID, tbMsg)
	return 1
end
REMOVE_G_1 = DefFun1
REMOVE_G_2 = DefFun1

aszTongLogXPFileHead = {	
	"Ngµy","Sè tuÇn","Bang héi","§¼ng cÊp kiÕn thiÕt","Ng©n s¸ch kiÕn thiÕt","Ng©n s¸ch chiÕn bÞ","N¹p ®iÓm cèng hiÕn","Sè ng­êi",
	"Sè ng­êi tho¸i Èn","Ng©n s¸ch kiÕn thiÕt hµng tuÇn","Ng©n s¸ch kiÕn thiÕt tiªu hao","Ng©n s¸ch chiÕn bÞ hµng tuÇn","Ng©n s¸ch chiÕn bÞ tiªu hao","Ng©n quü thµnh kiÕn thiÕt","Gãp tiÒn thµnh kiÕn thiÕt","KiÕn thiÕt thµnh chiÕn bÞ",
	"T¸c ph­êng s¶n xuÊt","Tæng sè T¸c Ph­êng","Khu Binh gi¸p ","Khu Thiªn C«ng ","Khu MÆt n¹ ","ThÝ luyÖn ph­êng","Khu Thiªn ý ","Khu LÔ vËt ",
	"Khu ho¹t ®éng ","CÊp T¸c Ph­êng cao nhÊt","§é khã môc tiªu tuÇn","Hoµn thµnh môc tiªu tuÇn","HÖ thèng môc tiªu tuÇn",
}
TongLogXPRecords = 0
function WriteXPLog(nTongID)
	if not tongLogFile then
		--ÎÄ¼þ²»´æÔÚ
		if not openfile("Logs/tong/tonglog_xp.log", "r")then
			tongLogFile = openfile("Logs/tong/tonglog_xp.log", "a+")
			if (tongLogFile == nil)then
				return
			end
			local size = getn(aszTongLogXPFileHead);
			for i=1,size-1 do
				write(tongLogFile,aszTongLogXPFileHead[i],'\t')
			end
			write(tongLogFile,aszTongLogXPFileHead[size],'\n')
		else
			tongLogFile = openfile("Logs/tong/tonglog_xp.log", "a+")
		end
	end	
	local aszData = GetTongLogData(nTongID)
	if (not tongLogFile or not aszData)then
		print("errererer\n")
		return	
	end
	write(tongLogFile,date("%Y-%m-%d %H:%M:%S"),'\t')
	local size = getn(aszData);
	for i=1,size-1 do
		write(tongLogFile,aszData[i],'\t')
	end
	write(tongLogFile,aszData[size],'\n')
	TongLogXPRecords = TongLogXPRecords + 1
	if TongLogXPRecords > 20 then
		TongLogXPRecords = 0
		flush(tongLogFile)
	end
end

function WEEKLY_MAINTAIN_R(nTongID)
	WriteXPLog(nTongID)	--¼ÇÒ»ÖÜµÄLog
	
	--Çå³ýLogÈÎÎñ±äÁ¿
	for i = TONGTSK_WEEK_BFADD,TONGTSK_BF2WF do
		TONG_ApplySetTaskValue(nTongID, i, 0)
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_HEROLING, 0);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_USEHEROLING, 0);
	
	--¼ÆËãÖÜÄ¿±ê½±Àø
	local nWeekGoalEvent = TONG_GetWeekGoalEvent(nTongID)
	local nWeekGoalLevel = TONG_GetWeekGoalLevel(nTongID)
	local nWeekGoalValue = TONG_GetWeekGoalValue(nTongID)
	local nWeekGoalTotal = TONG_GetWeekGoalTotal(nTongID)
	local nWeekGoalPlayer = TONG_GetWeekGoalPlayer(nTongID)
	local nWeekGoalPriceTong = TONG_GetWeekGoalPriceTong(nTongID)
	local nWeekGoalPricePlayer = TONG_GetWeekGoalPricePlayer(nTongID)
	--ÖÜÄ¿±êÄÚÈÝÒÆµ½ÉÏÖÜ
	TONG_ApplySetLWeekGoalEvent(nTongID, nWeekGoalEvent)
	TONG_ApplySetLWeekGoalLevel(nTongID, nWeekGoalLevel)
	TONG_ApplySetLWeekGoalValue(nTongID, nWeekGoalValue)
	TONG_ApplySetLWeekGoalTotal(nTongID, nWeekGoalTotal)
	TONG_ApplySetLWeekGoalPlayer(nTongID, nWeekGoalPlayer)
	TONG_ApplySetLWeekGoalPriceTong(nTongID, nWeekGoalPriceTong)
	TONG_ApplySetLWeekGoalPricePlayer(nTongID, nWeekGoalPricePlayer)
	--ÅÐ¶Ï°ï»áÖÜÄ¿±êÊÇ·ñÍê³É
	if (nWeekGoalTotal > 0 and nWeekGoalValue >= nWeekGoalTotal) then		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE, 1)
		TONG_ApplyAddEventRecord(nTongID, "Môc tiªu bang héi tuÇn tr­íc ®· hoµn thµnh, bang chñ hoÆc tr­ëng l·o cã thÈm quyÒn cã thÓ ®Õn TÕ §µn cña bang ®Ó nhËn th­ëng");	-- °ï»áÊÂ¼þ¼ÇÂ¼
		Msg2Tong(nTongID, "Môc tiªu bang héi tuÇn nµy ®· hoµn thµnh, bang chñ hoÆc tr­ëng l·o cã thÈm quyÒn cã thÓ ®Õn TÕ §µn cña bang ®Ó nhËn th­ëng, bang chóng nµo hoµn thµnh môc tiªu tuÇn c¸ nh©n còng cã thÓ ®Õn TÕ §µn ®Ó nhËn phÇn th­ëng c¸ nh©n. Thêi h¹n lµ 1 tuÇn!")
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE, 0)
	end		
	local nTongWeekBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nBuildLevel = TONG_GetBuildLevel(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, nBuildLevel)
	--Èç¹ûÖÜÀÛ»ý½¨Éè»ù½ðÎ´µ½ÉÏÏÞ
	if (nTongWeekBuildFund < nWeekBuildUpper) then
		--²î¶àÉÙµ½ÉÏÏÞ
		local nDec = nWeekBuildUpper - nTongWeekBuildFund
		--ÓÐ¶àÉÙ´¢±¸
		local nStored = TONG_GetStoredBuildFund(nTongID)
		if (nStored < nDec) then
			nDec = nStored
		end
		if (TONG_ApplyAddStoredBuildFund(nTongID, -nDec) == 1) then
			TONG_ApplyAddBuildFund(nTongID, nDec)
			local szMsg = "Ng©n s¸ch kiÕn thiÕt nhËn ®­îc trong tuÇn nµy ch­a ®¹t giíi h¹n, ng©n s¸ch kiÕn thiÕt dù tr÷ chuyÓn"..nDec.." v¹n vµo ng©n s¸ch kiÕt thiÕt"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
		end
	end
	TONG_ApplySetWeekBuildFund(nTongID, 0) --ÖÜÀÛ»ý½¨Éè»ù½ðÇå0
	TONG_ApplySetWeekGoalValue(nTongID, 0)	--ÖÜÄ¿±êÀÛ»ý¹±Ï×¶ÈÇå0
	TONG_ApplyAddWeek(nTongID, 1)			--°ï»áÖÜÊý¼Ó1
	
	local nMembers = TONG_GetMemberCount(nTongID, -1)		
	cTongLog:WriteInfTB("TONG", "weeklymaintain", nTongID,
						{
						week = TONG_GetWeek(nTongID),
						membercount = TONG_GetMemberCount(nTongID),
						retirecount	= TONG_GetMemberCount(nTongID, 4),
						buildlevel = nBuildLevel,
						buildfund = TONG_GetBuildFund(nTongID),
						warbuildfund = TONG_GetWarBuildFund(nTongID),
						storedoffer = TONG_GetStoredOffer(nTongID),
						weekbuildfund = nTongWeekBuildFund,
--						weekgoalevent = nWeekGoalEvent,
						weekgoalvalue = nWeekGoalValue,
						weekgoaltotal = nWeekGoalTotal,
						}	)
	
			--ÌØ¼¼ÐÂÒ»ÖÜÆÚ ³õÊ¼»¯
	if (nBuildLevel >= 4) then
		local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
		-- ¹Ø±ÕÁé²ÎÁ¦
		if (nStuntID == 6) then
			nStuntID = 0
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		end
	
		if (nStuntID ~= 0) then
			local nNextStunt = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
			if (nNextStunt ~= 0 and nNextStunt ~= nStuntID) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nNextStunt)
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, 0)
				nStuntID = nNextStunt
				local szMsg = "Kü n¨ng bang héi chuyÓn thµnh"..TB_STUNTID_INFO[nStuntID].name
				Msg2Tong(nTongID, szMsg)
				TONG_ApplyAddEventRecord(nTongID, szMsg)	-- °ï»áÊÂ¼þ¼ÇÂ¼
			end
			--Ó¦¸ÃÔÚÖÜÆÚÎ¬»¤Ê±
			Maintain_Stunt(nTongID, nStuntID)	--ÒÔÕ½±¸»ù½ðÎ¬»¤ÌØ¼¼
			if (nBuildLevel == 5) then
				local nCitySTID = tong_GetCityStuntID(nTongID)
				if (nCitySTID ~= 0 and TB_STUNTID_INFO[nCitySTID].right == 1) then
					TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].maxmem)
				else
					TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, 0)
				end
			end
		end
	end
	
	--Éè¶¨°ï»áÖÜÄ¿±ê
	if nMembers < MIN_WEEKGOAL_MEMBER then
		local szMsg = "Nh©n sè Ýt h¬n "..MIN_WEEKGOAL_MEMBER.." ng­êi, môc tiªu tuÇn kh«ng thÓ b¾t ®Çu!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg);
--		TONG_ApplySetWeekGoalEvent(nTongID, 0)
--		TONG_ApplySetWeekGoalLevel(nTongID, 0)
--		TONG_ApplySetWeekGoalPlayer(nTongID, 0)
--		TONG_ApplySetWeekGoalTotal(nTongID, 0)
--		TONG_ApplySetWeekGoalPricePlayer(nTongID, 0)
--		TONG_ApplySetWeekGoalPriceTong(nTongID, 0)
	else
		local nType = random(getn(TB_WEEKGOAL_TYPE_ID))
		local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
		if (nLevel <= 0) then nLevel = 1 end --¿ªÊ¼Ê±ÖÜÄ¿±êÄÑ¶ÈÄ¬ÈÏÎª1
		if (nLevel > 2) then
			nLevel = 2
			TONG_ApplySetCurWeekGoalLevel(nTongID, 2)
		end
		local nHourValue = random(150, 170)
		nWeekGoalPlayer = TB_WEEKGOAL_CHANGE[nLevel] * nHourValue --È·¶¨Íæ¼ÒÖÜÄ¿±ê¹±Ï×¶È
		nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer) --È·¶¨°ï»áÖÜÄ¿±ê¹±Ï×¶È
		nWeekGoalPricePlayer = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue) --È·¶¨Íæ¼ÒÖÜÄ¿±ê½±Àø
		nWeekGoalPriceTong = floor(TB_WEEKGOAL_PRICE_BASE[nLevel] * nHourValue * 0.4 * nMembers) --È·¶¨°ï»áÖÜÄ¿±ê½±Àø
--		nWeekGoalPlayer = WEEKGOAL_VALUE_PERSON;
--		nWeekGoalTotal = floor(0.4 * nMembers * nWeekGoalPlayer); --È·¶¨°ï»áÖÜÄ¿±ê¹±Ï×¶È
--		nWeekGoalPricePlayer = WEEKGOAL_PRICE_PERSON;
--		nWeekGoalPriceTong = WEEKGOAL_PRICE_TONG;
--		TONG_ApplySetWeekGoalEvent(nTongID, TB_WEEKGOAL_TYPE_ID[nType])
		TONG_ApplySetWeekGoalEvent(nTongID, nType)
		TONG_ApplySetWeekGoalLevel(nTongID, nLevel)
		TONG_ApplySetWeekGoalPlayer(nTongID, nWeekGoalPlayer)
		TONG_ApplySetWeekGoalTotal(nTongID, nWeekGoalTotal)
		TONG_ApplySetWeekGoalPricePlayer(nTongID, nWeekGoalPricePlayer)
		TONG_ApplySetWeekGoalPriceTong(nTongID, nWeekGoalPriceTong)
	
		TONG_ApplyAddEventRecord(nTongID, "Môc tiªu tuÇn nµy: "..TB_WEEKGOAL_TYPE_NAME[nType]);	-- °ï»áÊÂ¼þ¼ÇÂ¼
		Msg2Tong(nTongID, "Môc tiªu trong tuÇn cña bang: <color=green>"..TB_WEEKGOAL_TYPE_NAME[nType])
	end
	return 1
end

function Maintain_Stunt(nTongID, nStuntID)
	if (nStuntID == 0) then
		return
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
	TONG_ApplySetTaskValue(nTongID, TONGTSK_MONEYBOX_DROPMAX, 0)
	--TONGTSK_MONEYBOX_DROPMAX
	if (TB_STUNTID_INFO[nStuntID].right == 1) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, 0)
	end
	local nStuntState = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	if (TB_STUNT_PAUSESTATE[nStuntState][4] == 3 or TB_STUNT_PAUSESTATE[nStuntState][4] == 1) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, TB_STUNT_PAUSESTATE[nStuntState][4])
		local nCurFund = TONG_GetWarBuildFund(nTongID)
		if (nCurFund < TB_STUNTID_INFO[nStuntID].consume) then
			local szMsg = "Ng©n s¸ch chiÕn bÞ kh«ng ®ñ ®Ó b¶o tr× Bang héi ®Æc kü. TuÇn nµy t¹m ®ãng chøc n¨ng ®Æc kü!"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 0)
		else
			TONG_ApplyAddWarBuildFund(nTongID, -TB_STUNTID_INFO[nStuntID].consume)
			if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED) == 0) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
				local szMsg = "Ng©n s¸ch chiÕn bÞ ®· ®ñ bï vµo chi phÝ b¶o tr×, bang héi ®Æc kü sÏ tiÕp tôc ho¹t ®éng!"
				Msg2Tong(nTongID, szMsg)
				TONG_ApplyAddEventRecord(nTongID, szMsg)
			else
				if (nStuntState == TB_STUNT_PAUSESTATE[nStuntState][4]) then
					Msg2Tong(nTongID, "Bang héi ®Æc kü tiÕp tôc b¶o tr×"..TB_STUNT_PAUSESTATE[nStuntState][2].."Tr¹ng th¸i ")
					TONG_ApplyAddEventRecord(nTongID, "Bang héi ®Æc kü tiÕp tôc b¶o tr×"..TB_STUNT_PAUSESTATE[nStuntState][2].."Tr¹ng th¸i ")
				else
					Msg2Tong(nTongID, "B¶o tr× bang héi ®Æc kü"..TB_STUNT_PAUSESTATE[nStuntState][2])
					TONG_ApplyAddEventRecord(nTongID, "B¶o tr× bang héi ®Æc kü"..TB_STUNT_PAUSESTATE[nStuntState][2])
				end
			end
		end
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, TB_STUNT_PAUSESTATE[nStuntState][4])
	end
end

WEEKLY_MAINTAIN_G_1 = DefFun1
--WEEKLY_MAINTAIN_G_2 = DefFun1

function WEEKLY_MAINTAIN_G_2(nTongID)
	--Ã¿ÖÜÎ¬»¤Ê±Çå³ýÍ¼ÌÚNPCÍ·¶¥Ð§¹û£¬ÖØÐÂAddSkill£¬ÒÔ±£Ö¤ÔÚÇÐ»»ÌØ¼¼ºóÍ¼ÌÚµÄÐ§¹ûÒàÇÐ»»
	local nMapID = TONG_GetTongMap(nTongID)
	local nMapIdx = SubWorldID2Idx(nMapID)
	if (nMapIdx < 0) then
		return 1
	end
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	if (nStuntID > 0) then
		for i = 1, getn(TONGTSK_TOTEMINDEX) do
			local nNpcIndex = TONG_GetTaskValue(nTongID, TONGTSK_TOTEMINDEX[i])
			if (nNpcIndex > 0) then
				for j=1, getn(TB_STUNTID_INFO) do
					RemoveNpcSkillState(nNpcIndex, TB_STUNTID_INFO[j].skillid)
				end
				AddNpcSkillState(nNpcIndex, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
	return 1
end

function MAINTAIN_R(nTongID)
	local nDay = TONG_GetDay(nTongID)
	local nWeek = TONG_GetWeek(nTongID)
	local nexweek = nil
	if (nDay == 0 or tonumber(date("%w")) == 1 or 
		nDay >= TONG_GetTaskValue(nTongID, TONGTSK_LAST_WM_DAY) + 7) then
		nexweek = 1
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LAST_WM_DAY, nDay)
	end
	Msg2Tong(nTongID, "Bang héi b­íc vµo ngµy thø <color=white>"..(nDay+1).."<color>, ng©n s¸ch kiÕn thiÕt tr­íc m¾t: <color=gold>"..
		TONG_GetBuildFund(nTongID).."<color> v¹n, ng©n s¸ch chiÕn bÞ: <color=gold>"..TONG_GetWarBuildFund(nTongID)..
		"<color> v¹n")
	cTongLog:WriteInfTB("TONG", "maintain", nTongID,
						{
						day = nDay,
						membercount = TONG_GetMemberCount(nTongID),
						retirecount	= TONG_GetMemberCount(nTongID, 4),
						buildlevel = TONG_GetBuildLevel(nTongID),
						buildfund = TONG_GetBuildFund(nTongID),
						warbuildfund = TONG_GetWarBuildFund(nTongID),
						storedoffer = TONG_GetStoredOffer(nTongID),
						}	)
	--°ï»á0¼¶Ê±²»ÏûºÄ
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel > 0)then
		--×÷·»Î¬»¤
		local nWS = TWS_GetFirstWorkshop(nTongID)
		while (nWS ~= 0)do
			if (nexweek)then --Ã¿ÖÜÇå¿Õ²ú³ö
				TWS_ApplySetDayOutput(nTongID, nWS, 0)			
				local nUseLevelSet = TWS_GetUseLevelSet(nTongID, nWS)
				local nCurUseLevel = TWS_GetUseLevel(nTongID, nWS)
				if nUseLevelSet > 0 and nUseLevelSet ~= nCurUseLevel and nUseLevelSet <= TWS_GetLevel(nTongID, nWS) 
					and nUseLevelSet <= tongGetWorkshopUpperLevel(nTongID, nTongLevel) then
					TWS_ApplySetUseLevel(nTongID, nWS, nUseLevelSet)
					local nType = TWS_GetType(nTongID, nWS)
					Msg2Tong(nTongID, "<color=green>"..wsGetName(nType).."<color>§¼ng cÊp sö dông ®iÒu chØnh thµnh cÊp<color=blue>"..nUseLevelSet..
						"<color>")
				end
			end
			TWS_ApplyMaintain(nTongID, nWS)
			nWS = TWS_GetNextWorkshop(nTongID, nWS)
		end
		--ÅÐ¶ÏÔÝÍ£×´Ì¬
		local nCurFund = TONG_GetWarBuildFund(nTongID)
		if (TONG_GetPauseState(nTongID) ~= 0)then
			if (nCurFund >= TONG_GetStandFund(nTongID))then
				TONG_ApplySetPauseState(nTongID, 0)
				TONG_ApplyAddEventRecord(nTongID, "Ng©n s¸ch chiÕn bÞ ®· ®¹t yªu cÇu ng©n s¸ch chiÕn bÞ b¶o tr× hµng tuÇn, tr¹ng th¸i t¹m ngõng cña bang héi ®­îc xãa bá!");	-- °ï»áÊÂ¼þ¼ÇÂ¼
				Msg2Tong(nTongID, "Ng©n s¸ch chiÕn bÞ ®· ®¹t yªu cÇu ng©n s¸ch chiÕn bÞ b¶o tr× hµng tuÇn, tr¹ng th¸i t¹m ngõng cña bang héi ®­îc xãa bá!")
				cTongLog:WriteInfTB("TONG", "unpause", nTongID, {})
			end
		elseif (nCurFund < TONG_GetStandFund(nTongID)) then
			TONG_ApplySetPauseState(nTongID, 1)
			TONG_ApplyAddEventRecord(nTongID, "T¸c ph­êng cña bang bÞ t¹m dõng do ng©n s¸ch chiÕn bÞ kh«ng ®ñ chi phÝ b¶o tr× hµng tuÇn");	-- °ï»áÊÂ¼þ¼ÇÂ¼
			Msg2Tong(nTongID, "Ng©n s¸ch chiÕn bÞ thÊp h¬n ng©n s¸ch chiÕn bÞ b¶o tr× hµng tuÇn, tr¹ng th¸i cña bang héi lµ <color=red>T¹m dõng!")
			cTongLog:WriteInfTB("TONG", "pause", nTongID, {})
		end	
		
		local nConsume = TONG_GetMaintainFund(nTongID)
		TONG_ApplyAddWarBuildFund(nTongID, -nConsume)		
		TONG_ApplyAddEventRecord(nTongID, "B¶o tr× bang héi ngµy h«m nay, tiªu hao"..nConsume.." v¹n ng©n s¸ch chiÕn bÞ");	-- °ï»áÊÂ¼þ¼ÇÂ¼
		Msg2Tong(nTongID, "B¶o tr× bang héi ngµy h«m nay, tiªu hao ng©n s¸ch chiÕn bÞ bang héi: <color=gold>"..nConsume.."<color> v¹n")
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFCONSUME, nConsume)
		nConsume = wsGetAllDayConsume(nTongID)
		nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
		Msg2Tong(nTongID, "Ng©n s¸ch chiÕn bÞ b¶o tr× hµng ngµy cña bang hiÖn t¹i lµ:  <color=gold>"..nConsume.." v¹n")
		Msg2Tong(nTongID, "Ng©n s¸ch chiÕn bÞ b¶o tr× hµng tuÇn cña bang héi hiÖn t¹i lµ: <color=gold>"..(nConsume * 7).." v¹n")
		local nWarBuildFund = TONG_GetWarBuildFund(nTongID)
		if (TONG_GetPauseState(nTongID) ~= 1 and nWarBuildFund < nConsume * 7)then
			local szMsg = "Ng©n s¸ch chiÕn bÞ thÊp h¬n ng©n s¸ch chiÕn bÞ b¶o tr× hµng tuÇn, tr­íc lÇn b¶o tr× sau sÏ kh«ng cã thay ®æi, t¸c ph­êng bang héi bÞ t¹m dõng!"
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)-- °ï»áÊÂ¼þ¼ÇÂ¼
		end
		TONG_ApplySetMaintainFund(nTongID, nConsume)
		local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
		TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
		--Õ½±¸»ù½ðÎª0Ê±ÅÐ¶Ï½µ¼¶
--		if (nWarBuildFund == 0)then
--		local nLastDegradeDay = TONG_GetTaskValue(nTongID, TONGTSK_LAST_DEGRADE_DAY)
--			if (nDay - nLastDegradeDay > 7)then
--				if TONG_ApplyDegrade(nTongID) == 1 then
--					TONG_ApplySetTaskValue(nTongID, TONGTSK_LAST_DEGRADE_DAY, nDay)
--					local szMsg = "°ï»áÕ½±¸»ù½ðÒÑ½µÖÁ0£¬½¨ÉèµÈ¼¶ÏÂ½µÒ»¼¶£¡²¢ÇÒÔÚÒ»ÖÜÄÚ°ï»á²»»áÔÙ½µ¼¶¡£"
--					Msg2Tong(nTongID, szMsg)
--					TONG_ApplyAddEventRecord(nTongID, szMsg)	-- °ï»áÊÂ¼þ¼ÇÂ¼
--				end	
--			end	
--		end
	else	--½¨ÉèµÈ¼¶Îª0
		if (TONG_GetMaintainFund(nTongID) > 0) then
			TONG_ApplySetMaintainFund(nTongID, 0)
		end	
		if (TONG_GetPerStandFund(nTongID) > 0) then
			TONG_ApplySetPerStandFund(nTongID, 0)
		end	
	end
	

	-- °ïÖ÷×Ô¼öÎ¬»¤
	Master_SelfCommend_Maintain(nTongID);
	
	--Ã¿7Ìì½øÐÐÖÜÎ¬»¤
	--µ±Ä³´ÎµÄÖÜÎ¬»¤ÓÉÓÚÒì³£Ã»ÓÐÕý³£½øÐÐ£¬µÚ¶þÌì»á¼ÌÐø´¥·¢ÖÜÎ¬»¤
	if (nexweek) then
		TONG_ApplyWeeklyMaintain(nTongID)
		Msg2Tong(nTongID, "KiÕn thiÕt bang b­íc sang tuÇn thø <color=white>"..(nWeek+1).."<color>.")
	end
	
	--ÌØ¼¼Î¬»¤
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nenabled = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ENABLED)
	local ndifday = tonumber(date("%w"))
	local nCitySTID = tong_GetCityStuntID(nTongID)
	
	-- ¹Ø±ÕÁé²ÎÁ¦
	if (nStuntID == 6) then
		nStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
	end
		
	--ÈôÌØ¼¼ÎªÁìµ¼²ãÁìÈ¡£¬ÔòTB_STUNTID_INFO[nStuntID].memperÊÇÎª0µÄ
	if (nCitySTID ~= 0 and (ndifday >= 1 and ndifday <= 4)) then
		if (TONG_GetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT) + TB_STUNTID_INFO[nCitySTID].memper <= TB_STUNTID_INFO[nCitySTID].maxmem) then
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].memper)
		end
	end
	if (nTongLevel >= 4) then
		if (nStuntID ~= 0 and nenabled ~= 0) then 
			--ÖÜÆÚ1¡¢2¡¢3¡¢4Ìì·ÖÅú´Î¸øÓëÌØ¼¼
			if (ndifday <= 4 and ndifday >= 1) then
				if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT) + TB_STUNTID_INFO[nStuntID].memper <= TB_STUNTID_INFO[nStuntID].maxmem) then
					TONG_ApplyAddTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].memper)
				end
			end
		end
	end
	TONG_ApplyAddDay(nTongID, 1)
	return 1
end
MAINTAIN_G_1 = DefFun1
MAINTAIN_G_2 = DefFun1



function logicTongLevelUp(nTongID)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	if (nCurLevel >= 5)then
		return 5
	end	
	local nWsCount = TWS_GetWorkshopCount(nTongID)
	local nWsDemand = tongGetUpgradeWorkshopDemand(nTongID, nCurLevel)
	if (nWsCount < nWsDemand)then
		return 1, nWsDemand
	end
	local nLevelHi = tongGetUpgradeHighWorkshopsLevel(nTongID, nCurLevel)
	local nWorkshop = TWS_GetFirstWorkshop(nTongID)
	local nHiNum = 0
	while (nWorkshop > 0) do
		if (TWS_GetLevel(nTongID, nWorkshop) >= nLevelHi)then
			nHiNum = nHiNum + 1
		end
		nWorkshop = TWS_GetNextWorkshop(nTongID, nWorkshop)
	end
	local nHighDemand = tongGetUpgradeHighWorkshopsDemand(nTongID, nCurLevel)
	if (nHiNum < nHighDemand)then
		return 2, nHighDemand, nLevelHi
	end
	local nBFund = TONG_GetBuildFund(nTongID)
	local nCost = tongGetUpgradeCostFund(nTongID, nCurLevel)
	if (nBFund < nCost)then
		return 3, nCost
	end
	local nLastUpgradeDay = TONG_GetTaskValue(nTongID, TASKID_LAST_LEVELUP_DAY)
	if (nLastUpgradeDay + 7 > TONG_GetDay(nTongID))then
		return 4, nLastUpgradeDay
	end
	if (nCurLevel == 2)then
		if (TONG_GetTongMap(nTongID) <= DYNMAP_ID_BASE)then
			return 6
		end
	elseif (nCurLevel == 4)then
		local nCityDay = TONG_GetOccupyCityDay(nTongID)
		if (nCityDay == 0) then
			return 7, nCityDay
		end
	end	
	return 0
end

function UPGRADE_R(nTongID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (logicTongLevelUp(nTongID) ~= 0)then
		return 0
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	local nCost = tongGetUpgradeCostFund(nTongID, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1)then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	TONG_ApplySetTaskValue(nTongID, TASKID_LAST_LEVELUP_DAY, TONG_GetDay(nTongID))

	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = "§¼ng cÊp kiÕn thiÕt bang héi t¨ng lªn "..(nCurLevel + 1).."cÊp";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." lµm cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- °ï»áÀúÊ·¼ÇÂ¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	Msg2Tong(nTongID, szRecordPlus);
	cTongLog:WriteInfTB("TONG", "upgrade", nTongID, {buildlevel = (nCurLevel + 1), day = TONG_GetDay(nTongID)})
	--0¼¶Éýµ½Ò»¼¶Ê±ÌáÊ¾
	if (nCurLevel == 0)then
		local szMsg = "§¼ng cÊp kiÕn thiÕt cña bang héi th¨ng lªn cÊp 1, chøc n¨ng TÕ §µn ph©n ph¸t ®iÓm cèng hiÕn ®­îc më ra.";
		Msg2Tong(nTongID, szMsg);
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	end
	if (nCurLevel == 4) then
		local nCitySTID = tong_GetCityStuntID(nTongID)
		local nday = getRelativeDay(nTongID)
		OutputMsg("UPGRade,"..nCitySTID..","..nday)
		if (TONG_GetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD) < TONG_GetWeek(nTongID)) then
			TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		end
		if (nCitySTID ~= 0) then
			if (TB_STUNTID_INFO[nCitySTID].right == 2) then
				TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].memper)
			else
				TONG_ApplySetTaskValue(nTongID, TONGTSK_CITYST_MEMLIMIT, TB_STUNTID_INFO[nCitySTID].maxmem)
			end
		end
	end
	--Éý¼¶°ï»áÃû´Î¼ÇÂ¼
	local nNowLevel = nCurLevel + 1;
	if (nNowLevel == 2 or nNowLevel == 4) then
		local nOrder = gb_GetTask("TONG_LVL_UP_ORDER", nNowLevel) + 1
		gb_SetTask("TONG_LVL_UP_ORDER", nNowLevel, nOrder)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_ORDER, nOrder)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, -1)	
	end;
	return 1
end

function UPGRADE_G_1(nTongID)
	local nRet, rt_1, rt_2 = logicTongLevelUp(nTongID)
	if (nRet == 0)then
		return 1
	elseif (nRet == 1)then
		Msg2Player("§Ó n©ng lªn cÊp kÕ tiÕp cÇn ph¶i x©y dùng <color=yellow> "..rt_1.."<color> T¸c Ph­êng")
	elseif (nRet == 2)then
		Msg2Player("§¼ng cÊp kiÕn thÕt n©ng lªn cÊp tiÕp theo cÇn T¸c Ph­êng cã <color=yellow>"..rt_1.."<color> ®¹t <color=green>"..rt_2.."<color>")
	elseif (nRet == 3)then
		Msg2Player("§¼ng cÊp kiÕn thiÕt n©ng lªn cÊp tiÕp theo cÇn ng©n s¸ch kiÕn thiÕt<color=gold>: "..rt_1.." v¹n")
	elseif (nRet == 4)then
		Msg2Player("N©ng cÊp ®¼ng cÊp kiÕn thiÕt cÇn ph¶i c¸ch nhau 1 tuÇn!")
	elseif (nRet == 5)then
		Msg2Player("§¼ng cÊp kiÕn thiÕt ®· ®¹t ®Õn cÊp cao nhÊt!")
	elseif (nRet == 6)then
		Msg2Player("§¼ng cÊp kiÕn thiÕt ®¹t cÊp 3 cÇn ph¶i cã khu vùc bang héi riªng!")		
	elseif (nRet == 7)then
		Msg2Player("§¼ng cÊp kiÕn thiÕt ®¹t cÊp 5 cÇn chiÕm lÜnh 1 thµnh thÞ!")				
	end	
	return 0	
end
--UPGRADE_G_2 = DefFun1
--//////////////////
--Éý¼¶ºó½¨ÉèµÈ¼¶´ïµ½4¡¢5¼¶£¬°ï»áÓµÓÐÍ¼ÌÚÖ®Öù
--//////////////////
function UPGRADE_G_2(nTongID)
--´ËÊ±»ñµÃµÄ½¨ÉèµÈ¼¶£¿Éý¼¶Ç°£¿Éý¼¶ºó£¿´Ë´¦ÔÝÒÔÉý¼¶ºó´¦Àí
	local nCurLevel = TONG_GetBuildLevel(nTongID) + 1
	local nMap = TONG_GetTongMap(nTongID)
	local nMapIndex = SubWorldID2Idx(nMap)
	if (nCurLevel < 4) then
		return 0
	else
		if (nMapIndex < 0) then
			return 0
		end
		if (nCurLevel == 4) then
			ClearMapNpcWithName(nMap, "Cét biÓu t­îng bang héi");	--É¾³ýÄ³¸öµØÍ¼IDÉÏµÄ£¬Ä³¸öÃû×ÖµÄNPC
			local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "Cét biÓu t­îng bang héi")--ÓÒ
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "Cét biÓu t­îng bang héi")--×ó
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			ClearMapNpcWithName(nMap, "Cét biÓu t­îng bang héi");	--É¾³ýÄ³¸öµØÍ¼IDÉÏµÄ£¬Ä³¸öÃû×ÖµÄNPC
			local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "Cét biÓu t­îng bang héi")--ÓÒ
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "Cét biÓu t­îng thµnh th")--×ó
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nCitySTID ~= 0) then
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	end
	return 1
end

function logicTongDegrade(nTongID)
	local nCurLevel = TONG_GetBuildLevel(nTongID)
	if (nCurLevel < 1)then
		return 1, nCurLevel
	end	
	return 0, nCurLevel
end
function DEGRADE_R(nTongID)
	local nRet, nCurLevel = logicTongDegrade(nTongID)
	if (nRet ~= 0)then
		return 0
	end	
	local nWorkshop = TWS_GetFirstWorkshop(nTongID)
	local nWsUpperLevel = tongGetWorkshopUpperLevel(nTongID, nCurLevel - 1)
	--µ÷ÕûËùÓÐ×÷·»Ê¹ÓÃµÈ¼¶
	while(nWorkshop ~= 0)do
		if (TWS_GetUseLevel(nTongID, nWorkshop) > nWsUpperLevel)then
			TWS_ApplySetUseLevel(nTongID, nWorkshop, nWsUpperLevel)
		end
		nWorkshop = TWS_GetNextWorkshop(nTongID, nWorkshop)
	end
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = "§¼ng cÊp kiÕn thiÕt gi¶m xuèng "..(nCurLevel - 1).."cÊp";
	TONG_ApplyAddHistoryRecord(nTongID, szRecord);		-- °ï»áÀúÊ·¼ÇÂ¼
	TONG_ApplyAddEventRecord(nTongID, szRecord);		-- °ï»áÊÂ¼þ¼ÇÂ¼
	cTongLog:WriteInfTB("TONG", "degrade", nTongID, {buildlevel = (nCurLevel - 1), day = TONG_GetDay(nTongID)})
	return 1
end
function DEGRADE_G_1(nTongID)
	local nRet, nCurLevel = logicTongDegrade(nTongID)
	if (nRet == 0)then
		return 1
	elseif (nRet == 1)then
	end
	return 0
end
--DEGRADE_G_2 = DefFun1
function DEGRADE_G_2(nTongID)
--´ËÊ±»ñµÃµÄ½¨ÉèµÈ¼¶£¿Éý¼¶Ç°£¿Éý¼¶ºó£¿´Ë´¦ÔÝÒÔÉý¼¶ºó´¦Àí
	local nCurLevel = TONG_GetBuildLevel(nTongID) - 1
	local nMap = TONG_GetTongMap(nTongID)
	local nMapIndex = SubWorldID2Idx(nMap)
	if (nMapIndex < 0) then
		return 1
	end
	if (nCurLevel == 4) then	--5¼¶½µÖÁ4¼¶Ê±£¬Í¼ÌÚÒª±äÉíµÄ
		ClearMapNpcWithName(nMap, "Cét biÓu t­îng bang héi");	--É¾³ýÄ³¸öµØÍ¼IDÉÏµÄ£¬Ä³¸öÃû×ÖµÄNPC
		ClearMapNpcWithName(nMap, "Cét biÓu t­îng thµnh th");	--É¾³ýÄ³¸öµØÍ¼IDÉÏµÄ£¬Ä³¸öÃû×ÖµÄNPC
		local nNpcIndex1 = AddNpc(1191, 1, nMapIndex, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "Cét biÓu t­îng bang héi")--ÓÒ
		TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
		SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
		local nNpcIndex2 = AddNpc(1192, 1, nMapIndex, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "Cét biÓu t­îng bang héi")--×ó
		TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
		SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
		local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
		if (nStuntID ~= 0) then
			AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
		end
	elseif (nCurLevel == 3) then	--½µÖÁ3¼¶Ê±£¬¾ÍÃ»ÓÐÍ¼ÌÚÁË
		ClearMapNpcWithName(nMap, "Cét biÓu t­îng bang héi");	--É¾³ýÄ³¸öµØÍ¼IDÉÏµÄ£¬Ä³¸öÃû×ÖµÄNPC
	end
	return 1
end


function TONGCLAIMWAR_R(nTongID, nDestTongID)
--	local nTimes    = 0;
--	local nCurTimes = 0;
--	local nCurDay = TONG_GetDay(nTongID);
--	local nDay = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE);
	
--	if (nCurDay ~= nDay) then
--		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE, nCurDay);
--		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, 0);
--	elseif (nCurDay == nDay) then
--		nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
--	end;
	
	local nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
	local nCurTimes = nTimes + 1;
	
	local nCostMoneyFund = 0;	--µ¥Î»:Íò
	if (nCurTimes == 1) then
		nCostMoneyFund = 5000;
	elseif (nCurTimes == 2) then
		nCostMoneyFund = 2 * 5000;
	elseif (nCurTimes == 3) then
		nCostMoneyFund = 4 * 5000;
	elseif (nCurTimes > 3) then
		nCostMoneyFund = 4 * 5000;
	end;
	
	if (TONG_ApplyAddMoney(nTongID, -(nCostMoneyFund*10000)) ~= 1) then	
		Msg2Player("Bang héi tuyªn chiÕn cÇn giao nép"..nCostMoneyFund.." v¹n lÊy tõ ng©n s¸ch!");
		return 0;
	end;
	
	--ÐûÕ½³É¹¦ºó£¬´ÎÊý¼Ó1£¬´æÈë
	TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, nCurTimes);
	
	local szDestTongName = GetTongNameByID(nDestTongID);
	local szTongMsg = "Bang chñ  ®· tuyªn chiÕn bang héi"..szDestTongName.." råi";
	Msg2Tong(nTongID, szTongMsg);
	TONG_ApplyAddEventRecord(nTongID, szTongMsg);
	return 1;
end

function TONGCLAIMWAR_G_1(nTongID, nDestTongID)
	-- Open bang héi tuyªn chiÕn Modifiled NgaVN - 20111124
--	do
--		return
--	end
	
	if (nTongID == nDestTongID) then
		Msg2Player("Kh«ng thÓ tù tuyªn chiÕn bang héi chÝnh m×nh!");
		return 0;
	end;
	
	local szDoFunc = "/#DO_TONGCLAIMWAR_G_1("..nTongID..","..nDestTongID..")"
	Say("X¸c nhËn muèn tuyªn chiÕn?",2,"X¸c nhËn"..szDoFunc, "§Ó ta suy nghÜ l¹i/cancel")
end

function DO_TONGCLAIMWAR_G_1(nTongID, nDestTongID)
	local nTimes    = 0;
	local nCurTimes = 0;
	local nCurDay = TONG_GetDay(nTongID);
	local nDay = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE);
	
	if (nCurDay ~= nDay) then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_DATE, nCurDay);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, 0);
	elseif (nCurDay == nDay) then
		 nTimes = TONG_GetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES);
	end;
	
	nCurTimes = nTimes + 1;	
	local nCostMoneyFund = 0;	--µ¥Î»:Íò
	if (nCurTimes == 1) then
		nCostMoneyFund = 5000;
	elseif (nCurTimes == 2) then
		nCostMoneyFund = 2 * 5000;
	elseif (nCurTimes == 3) then
		nCostMoneyFund = 4 * 5000;
	elseif (nCurTimes > 3) then
		nCostMoneyFund = 4 * 5000;
	end;
	
	if (TONG_GetMoney(nTongID) < nCostMoneyFund * 10000) then
		Msg2Player("Tuyªn chiÕn bang héi cÇn giao nép"..nCostMoneyFund.." v¹n lÊy tõ ng©n s¸ch!");
		return 0;
	end;	
	
	--ÔÚrelayÄÇÉèÖÃ
--	TONG_ApplySetTaskValue(nTongID, TONGTSK_CLAIMWAR_TIMES, nCurTimes);	
-- Fix bang héi tuyªn chiÕn Modifiled AnhHH - 20111110
	TongClaimWar(nDestTongID);
	return 1;
end

function cancel()
end

TONGCLAIMWAR_G_2 = DefFun2

function ClaimWar_Death_Process(nAttackerIndex)
	local result = 0;	
	local szTong = 0;
	szTong, result = GetTong();
	
	local szAttackPlayer = GetNpcName(nAttackerIndex);
	local szDestTong     = GetNpcTong(nAttackerIndex);
	
	local szMsg = format("%s bang héi cña %s ®· tiªu diÖt %s bang héi cña %s", szDestTong, szAttackPlayer, szTong, GetName());
	Msg2SubWorld(szMsg);
end

function CHANGECAMP_R(nTongID, nCamp)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local nCurCamp = TONG_GetCurCamp(nTongID);
	if (nCurCamp == nCamp or
		nCurCamp < 1 or
		nCurCamp > 3 or
		nCamp < 1 or
		nCamp > 3) then
		return 0;
	end
	if (TONG_GetUnionID(nTongID) ~= 0) then
		Msg2PlayerByName(szExecutorName, "Kh«ng thÓ thay ®æi phe ph¸i trong liªn minh cña bang héi");
		return 0;
	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2PlayerByName(szExecutorName, "¹¥³ÇÕ½½×¶Î²»ÄÜ¸Ä±ä°ï»áÕóÓª£¡");
--		return 0;
--	end
	
	local nCostMoneyFund = 100;	-- µ¥Î»£ºÍò Ó¦Ô½ÄÏÈËÒªÇó¸ÄÎª100W by Zhi Dong
	if (TONG_ApplyAddMoney(nTongID, -(nCostMoneyFund*10000)) ~= 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, "§æi phe c¸nh cho bang cÇn n¹p phÝ "..nCostMoneyFund.." v¹n lÊy tõ ng©n s¸ch!");
		return 0;
	end
	Msg2Tong(nTongID, "Bang chñ thay ®æi phe ph¸i cña bæn bang! ");
	cTongLog:WriteInfTB("TONG", "changecamp", nTongID, {camp = nCamp, camp_old = nCurCamp})
	return 1;
end
function CHANGECAMP_G_1(nTongID, nCamp)
	local nCurCamp = TONG_GetCurCamp(nTongID);
	if (nCurCamp == nCamp or
		nCurCamp < 1 or
		nCurCamp > 3 or
		nCamp < 1 or
		nCamp > 3) then
		return 0;
	end
	if (TONG_GetUnionID(nTongID) ~= 0) then
		Msg2Player("Kh«ng thÓ thay ®æi phe ph¸i trong liªn minh cña bang héi");
		return 0;
	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2Player("¹¥³ÇÕ½½×¶Î²»ÄÜ¸Ä±ä°ï»áÕóÓª£¡");
--		return 0;
--	end
	local nCostMoneyFund = 100; -- µ¥Î»£ºÍò Ó¦Ô½ÄÏÈËÒªÇó¸ÄÎª100W by Zhi Dong
	if (TONG_GetMoney(nTongID) < nCostMoneyFund*10000) then
		Msg2Player("§æi phe c¸nh cho bang cÇn n¹p phÝ "..nCostMoneyFund.." v¹n lÊy tõ ng©n s¸ch!");
		return 0;
	end
	return 1;
end

--°ïÖ÷×Ô¼öÎ¬»¤
function Master_SelfCommend_Maintain(nTongID)
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		return	--ÈôÃ»ÓÐ¿ªÆôÔò·µ»Ø
	end
	
	local dwIniDayTime = TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE);
	local dwCurrTime = GetSysCurrentTime();
	local nOweday = ceil((dwCurrTime - dwIniDayTime)/(24 * 3600 ))
	if (nOweday <= CAST_DURATION) then -- »¹Ã»ÓÐµ½½áÊøÆÚ
		return
	end
	
	Msg2Tong(nTongID, "Thêi gian tù tiÕn cö ®· kÕt thóc");
	TONG_ApplyAddEventRecord(nTongID, "Thêi gian tù tiÕn cö ®· kÕt thóc");
	local bRetireLoop = 0;
	local nMemberID  = TONG_GetFirstMember(nTongID, -1);
	--±£´æÇ°3Ãû£¬ÊôÐÔ·Ö±ðÎª³ÉÔ±ID,¾ºÍ¶Êý£¬¾ºÍ¶ÈÕÆÚ
	tbForecontributiveness = 
	{ 
		{0, 0, dwCurrTime}, 
		{0, 0, dwCurrTime}, 
		{0, 0, dwCurrTime} 
	} 
	
	--±£´æÇ°3ÃûµÄÍ¶³öµÄ¹±Ï×¶È
	while (nMemberID > 0) do
		local nContributiveness = TONGM_GetTaskValue(nTongID,nMemberID, TONGMTSK_CONTRIBUTIVENESS) --»ñµÃ¸öÈË¹±Ï×¶È
		local dwContributivenesstime = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME)--»ñµÃ¾ºÍ¶Ê±¼ä
		if (nContributiveness > tbForecontributiveness[3][2] or 
			(nContributiveness == tbForecontributiveness[3][2] and 
			dwContributivenesstime < tbForecontributiveness[3][3] and
			nContributiveness > 0) and --±£Ö¤²Î¼ÓÁË¾ºÍ¶
			dwContributivenesstime > dwIniDayTime	--±£Ö¤ÊÇ±¾´Î¾ºÍ¶£¬¶ø²»ÊÇÉÏÒ»´ÎµÄ
			) then
				tbForecontributiveness[3][1] = nMemberID
				tbForecontributiveness[3][2] = nContributiveness
				tbForecontributiveness[3][3] = dwContributivenesstime
				if ((tbForecontributiveness[3][2] > tbForecontributiveness[2][2]) or
					(tbForecontributiveness[3][2] == tbForecontributiveness[2][2] and
					tbForecontributiveness[3][3] < tbForecontributiveness[2][3])) then
					tbForecontributiveness[2],tbForecontributiveness[3] = tbForecontributiveness[3],tbForecontributiveness[2];
						if ((tbForecontributiveness[2][2] > tbForecontributiveness[1][2]) or
        					(tbForecontributiveness[2][2] == tbForecontributiveness[1][2] and
        					tbForecontributiveness[2][3] < tbForecontributiveness[1][3])) then
        					tbForecontributiveness[1], tbForecontributiveness[2] = tbForecontributiveness[2], tbForecontributiveness[1];
        				end 
        		end 
        end 

        --³ÉÔ±ÈÎÎñ±äÁ¿Çå0
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, 0);
		TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, 0);
		if (bRetireLoop == 0) then
			nMemberID = TONG_GetNextMember(nTongID, nMemberID, -1);	--±éÀúÏÂÒ»¸ö³ÉÔ±
			if (nMemberID == 0) then
				nMemberID = TONG_GetFirstMember(nTongID, 4);		--±éÀúµÚÒ»¸öÒþÊ¿
				bRetireLoop = 1;
			end
		else
			nMemberID = TONG_GetNextMember(nTongID, nMemberID, 4);	--±éÀúÏÂÒ»¸öÒþÊ¿
		end
	end  --end while

	
	--¹«²¼Ç°3Ãû
	for i = 1, 3 do
		if (tbForecontributiveness[i][1] ~= 0 and tbForecontributiveness[i][2] ~= 0) then
			local szMember = TONGM_GetName(nTongID, tbForecontributiveness[i][1])
			local szDateTime = FormatTime2String(tbForecontributiveness[i][3])
			local szMsg = "h¹ng thø "..i.." "..szMember.." Sè tranh cö: "..tostring(tbForecontributiveness[i][2]).." Thêi gian tranh cö: "..szDateTime;
			Msg2Tong(nTongID, szMsg)
			TONG_ApplyAddEventRecord(nTongID, szMsg)
		end
	end 
	
	--ÉèÖÃÐÂµÄ°ïÖ÷
	if (tbForecontributiveness[1][1] == 0) then
			Msg2Tong(nTongID, "LÇn tranh cö chøc bang chñ nµy kh«ng chän ®­îc ng­êi thÝch hîp.");
	else
		if (TONG_GetFirstMember(nTongID, 0) == tbForecontributiveness[1][1] or
			SetTongMaster(nTongID, tbForecontributiveness[1][1]) == 1) then
			local szMember = TONGM_GetName(nTongID, tbForecontributiveness[1][1]);
			Msg2Tong(nTongID, "Bang chñ nhiÖm vÞ míi cña bang sÏ lµ "..tostring(szMember).."Sè ®iÓm tranh cö cña bang chñ míi lµ: "..tostring(tbForecontributiveness[1][2]));
			TONG_ApplyAddHistoryRecord(nTongID, "Bang chñ nhiÖm vÞ míi cña bang sÏ lµ "..tostring(szMember).."Sè ®iÓm tranh cö cña bang chñ míi lµ: "..tostring(tbForecontributiveness[1][2]));
		else
			local tbMsg = {
				masterid     = tbForecontributiveness[1][1]
				};
			cTongLog:WriteErrTB("TONG", "master_bidding", nTongID, tbMsg);
		end
	end
	
	--ÈÎÎñ±äÁ¿ÇåÁã
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, 0);
end


--function CHANGECAMP_C_1(nTongID, nCamp)
--	local nCurCamp =TONG_GetCurCamp(nTongID);
--	if (nCurCamp == nCamp or nCurCamp < 1 or nCurCamp > 3) then
--		return 0;
--	end
--	if (TONG_GetUnionID(nTongID) ~= 0) then
--		Msg2Player("°ï»áÁªÃËÖÐ£¬²»ÄÜÐÞ¸ÄÕóÓª£¡");
--		return 0;
--	end
--	if (TONG_GetWarState(nTongID) ~= 0) then
--		Msg2Player("¹¥³ÇÕ½½×¶Î²»ÄÜ¸Ä±ä°ï»áÕóÓª£¡");
--		return 0;
--	end
--	return 1;
--end
CHANGECAMP_G_2 = DefFun2

---------¿Í»§¶ËµÄÈ«·ÅÔÚÕâ¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£
else
INIT_C_1 = DefFun1
INIT_C_2 = DefFun1
ADD_C_1 = DefFun2
ADD_C_2 = DefFun2
REMOVE_C_1 = DefFun1
REMOVE_C_2 = DefFun1
WEEKLY_MAINTAIN_C_1 = DefFun1
WEEKLY_MAINTAIN_C_2 = DefFun1
MAINTAIN_C_1 = DefFun1
MAINTAIN_C_2 = DefFun1
UPGRADE_C_1 = DefFun1
UPGRADE_C_2 = DefFun1
DEGRADE_C_1 = DefFun1
DEGRADE_C_2 = DefFun1
CHANGECAMP_C_1 = DefFun2
CHANGECAMP_C_2 = DefFun2
TONGCLAIMWAR_C_1 = DefFun2
TONGCLAIMWAR_C_2 = DefFun2	
end