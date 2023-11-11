--»î¶¯¼ÛÖµÁ¿->È¡80%¼Óµ½¸öÈË¹±Ï×¶È->(ÖÜÀÛ»ý¹±Ï×¶ÈÀÛ¼Ó(ÖÜÀÛ»ý¹±Ï×¶ÈÉÏÏÞ)->¸öÈË×Ü¹±Ï×¶ÈÀÛ¼Ó£¬(Èç¹ûÊÇÖÜÄ¿±ê»î¶¯)¸öÈËÖÜÄ¿±ê¹±Ï×¶ÈÀÛ¼Ó->°ï»áÖÜÄ¿±ê¹±Ï×¶ÈÀÛ¼Ó)£¬
	--È¡5%¼Óµ½Ê¦¸µ£¬È¡15%¼Óµ½´¢±¸¹±Ï×¶È£¬%60¼ÛÖµÁ¿µ½½¨Éè»ù½ð->°ï»áÖÜÀÛ»ý°ï»á»ù½ð(ÉÏÏÞ)->°ï»á×ÜÀÛ»ý½¨Éè»ù½ð£¬40%¼ÛÖµÁ¿µ½Õ½±¸»ù½ð
--»î¶¯¼ÛÖµÁ¿Èë¿Úº¯Êý£ºContriValueAdd(nValue, nEntry)£¬·µ»Ø£°±íÊ¾Ê§°Ü(ÎÞ°ï»á)£¬£±±íÊ¾³É¹¦
Include("\\script\\tong\\tong_setting.lua")
Include("\\script\\tong\\log.lua")


--»º´æµ½Ò»¶¨¼ÛÖµÁ¿²Å·¢µ½Relay
TONG_VALUE_SYNC = 1000000 --´¢±¸¹±Ï×¶È¼°ÖÜÄ¿±êÀÛ»ý¹±Ï×¶È¼ÛÖµÁ¿»º´æÉÏÏÞ
TONG_FUND_SYNC = 5000000 --½¨Éè»ù½ð»º´æÉÏÏÞ

--×ª»¯ÏµÊý
coefPersonal = 0.8
coefTongStore = 0.15
coefMaster = 0.05
coefBuildFund = 0.6
coefWarFund = 0.4


function TongFundAdd(nTongID, nCurValue)
	local nTongWeekBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	nCurValue = nCurValue / 10000
	--_dbgMsg("Ä¿Ç°ÖÜÀÛ»ý½¨Éè»ù½ð£º"..nTongWeekBuildFund.."/"..nWeekBuildUpper)
	local nBuildFund = floor(nCurValue*coefBuildFund)	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildFund)
	if (nTongWeekBuildFund < nWeekBuildUpper) then
		--ÖÜÀÛ»ý¼´½«´ïÉÏÏÞ
		if (nTongWeekBuildFund + nBuildFund >= nWeekBuildUpper) then
			local nLeft = nWeekBuildUpper - nTongWeekBuildFund				 
			--_dbgMsg("½¨Éè»ù½ð¼´´ïÖÜÉÏÏÞ£¬Óà¶î½«Ôö¼Óµ½´¢±¸½¨Éè»ù½ð£¡")
			-- °ï»áÊÂ¼þ¼ÇÂ¼
			cTongLog:WriteInf("FUND", "THRESHOLD\t"..tostring(TONG_GetName(nTongID)).."\tTongWeek:\t"..
				TONG_GetWeek(nTongID).."\tTongDay:\t"..TONG_GetDay(nTongID))
			TONG_ApplyAddEventRecord(nTongID, "Ng©n s¸ch kiÕn thiÕt nhËn ®­îc v­ît qu¸ giíi h¹n tuÇn, ng©n s¸ch kiÕn thiÕt d­ ra sÏ chuyÖn sang ng©n s¸ch kiÕn thiÕt dù bÞ")
			TONG_ApplyAddStoredBuildFund(nTongID, nBuildFund - nLeft)
			nBuildFund = nLeft
		end
		--_dbgMsg("Ôö¼Ó°ï»á½¨Éè»ù½ð"..nBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nBuildFund)		
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildFund)
		--_dbgMsg("Ôö¼Ó°ï»áÖÜÀÛ»ý½¨Éè»ù½ð"..(nBuildFund))
		TONG_ApplyAddTotalBuildFund(nTongID, nBuildFund)
		--_dbgMsg("Ôö¼Ó°ï»á×ÜÀÛ»ý½¨Éè»ù½ð"..(nBuildFund))
	else
		TONG_ApplyAddStoredBuildFund(nTongID, nBuildFund)
		--_dbgMsg("Ôö¼Ó´¢±¸½¨Éè»ù½ð"..nBuildFund)
	end
	--_dbgMsg("Ôö¼Ó°ï»áÕ½±¸»ù½ð"..floor(nCurValue*coefWarFund))
	TONG_ApplyAddWarBuildFund(nTongID, nCurValue*coefWarFund)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nCurValue*coefWarFund)
end

--»î¶¯¼ÛÖµÁ¿Èë¿ÚÂß¼­£¨HEAD´óÂ½°æ±¾£©
function ContriValueEntryLogic_HEAD(nValue, nEntry) --nValue ¼ÛÖµÁ¿£¬nEntryÈë¿Ú
	--nValue = nValue * 10
	--_dbgMsg("X*X*X*X*X*X*X*X*X*X*X*X*X**X*X")
	--_dbgMsg("¼ÛÖµÈë¿Ú£¨10±¶£©"..nValue)
	local nRet = 1
	local _TongName, nTongID = GetTongName()
	if (nTongID == 0) then
		return 0
	end
	--ÒþÊ¿²»ÄÜÊ¹ÓÃ
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		return -2
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nWeekTotal = GetWeeklyOffer()
	local WeekGoal = TONG_GetWeekGoalEvent(nTongID)
	local nWeekGoalValue = GetWeekGoalOffer()	
	---------------------------------×ª»¯µ½¸öÈË-------------------------------------------
	local nPersonal = coefPersonal*nValue	
	local nMaster = coefMaster*nValue
	--¸öÈË
	local nValuePlayer = GetTask(TASKID_CONTRIVALUE) + nPersonal
	--_dbgMsg("×Ü»º´æ"..nValuePlayer)
	local nContribution = floor(nValuePlayer/COEF_CONTRIB_TO_VALUE)
	if (nContribution > 0) then
		--Èç¹ûÊÇÖÜÄ¿±ê»î¶¯
		if (nEntry == WeekGoal) then
			--¸öÈËÖÜÄ¿±ê¹±Ï×¶ÈÀÛ¼Ó
			AddWeekGoalOffer(nContribution)
			--°ï»áÖÜÄ¿±êÀÛ»ý¹±Ï×¶ÈÀÛ¼Ó
			local nCurValue = TONG_GetTaskTemp(nTongID, TONG_WEEKTEMP) + nContribution
			if (nCurValue * COEF_CONTRIB_TO_VALUE > TONG_VALUE_SYNC) then
				TONG_ApplyAddWeekGoalValue(nTongID, nCurValue)
				nCurValue = 0
			end
			TONG_SetTaskTemp(nTongID, TONG_WEEKTEMP, nCurValue)
		end
		--ÖÜÀÛ»ý¹±Ï×¶È
		--_dbgMsg("Ä¿Ç°ÖÜÀÛ»ý¹±Ï×¶È"..nWeekTotal.."/"..MAX_WEEK_CONTRIBUTION)
		if (nWeekTotal < MAX_WEEK_CONTRIBUTION)	then
			--»ñÈ¡µÄ¹±Ï×¶È½«³¬³öÉÏÏÞ
			--_dbgMsg("Ôö¼Ó¹±Ï×¶È"..nContribution)
			if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION) then
				nContribution = MAX_WEEK_CONTRIBUTION - nWeekTotal
				--_dbgMsg("¹±Ï×¶ÈÒÑ´ïÖÜÉÏÏÞ£¬±¾´ÎÖ»Ôö¼Ó¹±Ï×¶È"..nContribution)
				AddContribution(nContribution)
				AddCumulateOffer(nContribution)
				SetWeeklyOffer(MAX_WEEK_CONTRIBUTION)
				--Ê£Óà¼ÛÖµÁ¿
				nValuePlayer = 0
				--×Ü¼ÛÖµÁ¿È¡»ñµÃ±È
				--nValue = nContribution/coefPersonal*COEF_CONTRIB_TO_VALUE
			else
				AddContribution(nContribution)
				AddCumulateOffer(nContribution)
				AddWeeklyOffer(nContribution)
				nValuePlayer = mod(nValuePlayer, COEF_CONTRIB_TO_VALUE)
			end
			--´¢±¸¹±Ï×¶È
			local nTongStore = coefTongStore*nValue
			--°ï»á´¢±¸
			local nValueTong = TONG_GetTaskTemp(nTongID, TONG_STORETEMP) + nTongStore			
			--_dbgMsg("Ä¿Ç°°ï»á´¢±¸»º´æ"..nValueTong)
			if (nValueTong > TONG_VALUE_SYNC)then
				local nStore = floor(nValueTong/COEF_CONTRIB_TO_VALUE)
				--_dbgMsg("Ôö¼Ó°ï»á´¢±¸"..nStore)
				TONG_ApplyAddStoredOffer(nTongID, nStore)
				nValueTong = mod(nValueTong, COEF_CONTRIB_TO_VALUE)
			end
			TONG_SetTaskTemp(nTongID, TONG_STORETEMP, nValueTong)
		else
			--_dbgMsg("¹±Ï×¶ÈÒÑ´ïÉÏÏÞ£¡")
			--ÒÑ´ïÖÜÉÏÏÞ
			nRet = -1
		end
	end
	if (nRet == 1)then
		--Ê£Óà»º´æ£ºnValuePlayer
		SetTask(TASKID_CONTRIVALUE, nValuePlayer)
		--Ê¦Í½¹ØÏµ
		local nMasterValue = GetTongMTask(TONGMTSK_TOMASTER) + nMaster
		if (nMasterValue > MAX_SHITU_VALUE_STORE) then
			nMasterValue = MAX_SHITU_VALUE_STORE
		end	
		SetTongMTask(TONGMTSK_TOMASTER, nMasterValue)
	end
	
	-----------------------------------------×ª»¯µ½°ï»á»ù½ð-----------------------------
	local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
	nCurValue = nCurValue + nValue
	--_dbgMsg("Ä¿Ç°°ï»á»ù½ð»º´æ"..nCurValue)
	if (nCurValue > TONG_FUND_SYNC) then
		TongFundAdd(nTongID,  nCurValue)
		nCurValue = 0
	end
	TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, nCurValue)
	return nRet
end

--»î¶¯¼ÛÖµÁ¿Èë¿ÚÂß¼­£¨IB°æ±¾£©
function ContriValueEntryLogic_IB(nValue, nEntry) --nValue ¼ÛÖµÁ¿£¬nEntryÈë¿Ú
	local _TongName, nTongID = GetTongName();
	-- ÅÐ¶ÏÊÇ·ñÓÐ°ï»á
	if (nTongID == 0) then
		return 0;
	end
	-- ÅÐ¶ÏÊÇ·ñÖÜÄ¿±ê»î¶¯
	if (nEntry ~= TONG_GetWeekGoalEvent(nTongID)) then
		return 0;
	end
	-- ½«¼ÛÖµÁ¿»»Ëã³É¹±Ï×¶È£¬¼Óµ½Íæ¼ÒºÍ°ï»áÀï£¬Íæ¼Ò×î¶àÖ»ÄÜ¼Óµ½ÖÜÄ¿±êËùÐè¹±Ï×¶È
	local nValuePlayer = GetTask(TASKID_CONTRIVALUE) + nValue;
	--_dbgMsg("×Ü»º´æ"..nValuePlayer)
	local nContribution = floor(nValuePlayer / COEF_CONTRIB_TO_VALUE);
	local nWeekGoalGap = TONG_GetWeekGoalPlayer(nTongID) - GetWeekGoalOffer();
	if (nContribution >= nWeekGoalGap) then
		nContribution = nWeekGoalGap;
		nValuePlayer = 0;
	end
	if (nContribution > 0) then
		-- ¸öÈËÖÜÄ¿±ê¹±Ï×¶ÈÀÛ¼Ó
		AddWeekGoalOffer(nContribution);
		-- °ï»áÖÜÄ¿±êÀÛ»ý¹±Ï×¶ÈÀÛ¼Ó
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_WEEKTEMP) + nContribution;
		if (nCurValue * COEF_CONTRIB_TO_VALUE > TONG_VALUE_SYNC) then
			TONG_ApplyAddWeekGoalValue(nTongID, nCurValue);
			nCurValue = 0;
		end
		TONG_SetTaskTemp(nTongID, TONG_WEEKTEMP, nCurValue)
	end
	--Ê£Óà»º´æ£ºnValuePlayer
	SetTask(TASKID_CONTRIVALUE, mod(nValuePlayer, COEF_CONTRIB_TO_VALUE));
	return 1;
end

ContriValueEntryLogic = ContriValueEntryLogic_HEAD;

--function Test(nValue, nEvent)
--	if (nEvent == nil)then
--		nEvent = EVE_XINSHI
--	end	
--	ContriValueEntryLogic(nValue, nEvent)
--end