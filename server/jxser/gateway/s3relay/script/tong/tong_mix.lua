--tong_action.lua
--°ï»á²Ù×÷£¬³ÌÐò·ÃÎÊµÄ½Ó¿Ú
function DefFun2(n1, n2)
	return 1
end
function DefFun3(n1, n2, n3)
	return 1
end
Include("\\script\\tong\\workshop\\workshop_setting.lua")

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
IncludeLib("TONG")
Include("\\script\\tong\\contribution_entry.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\addtongnpc.lua")

if MODEL_GAMESERVER == 1 then
Include("\\script\\maps\\checkmap.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
end

-------------------×Ê½ð×ª»¯¹ØÏµ----------------------
--´æÈ¡Ç®
function MONEYFUND_ADD_R(nTongID, nAdd)
	if (TONG_GetMoney(nTongID) + nAdd < 0)then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg;
	if (nAdd > 0) then
		szMsg = szMember.." ®· ®ãng gãp "..nAdd.." l­îng vµo ng©n quü bang héi"
	else
		szMsg = szMember.." ®· rót tõ ng©n quü bang héi"..(-nAdd).." l­îng"
	end	
	Msg2Tong(nTongID, szMsg)
	if (abs(nAdd) >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
		cTongLog:WriteInfTB("FUND", "moneyadd", nTongID, {add = nAdd})
	end
	return 1
end

function APPLY_JOIN_TONG(nTongID, szApplyerName)
	if szApplyerName == nil then
		return 0
	end
	
	local szMsg = szApplyerName.." Göi lêi mêi gia nhËp bang héi"
	Msg2Tong(nTongID, szMsg)
	return 1
end

function SAVE_ZHAO_MU(nTongID)	
	local szMsg = "CËp nhËt thµnh c«ng tin tøc chiªu mé bang héi!"
	Msg2Tong(nTongID, szMsg)
	return 1
end
function MONEYFUND_ADD_G_1(nTongID, nAdd)
	if (CheckGlobalTradeFlag() == 0) then
		return 0
	end
	local nCash = GetCash()
	if (nCash < nAdd)then
		Msg2Player("Kh«ng ®ñ ng©n l­îng!")
		return 0
	end
	local nMax = 2000000000	--20ÒÚ
	if (abs(nAdd) > nMax) then
		Msg2Player("Ng©n l­îng n¹p vµo qu¸ nhiÒu!")
		return 0
	end
	--ÏÈ¸¶Ç®ÔÙ¼Ó×Ê½ð
	if (nAdd > 0)then	--´æÇ®
		if Pay(nAdd) ~= 1 then
			return 0
		end
	else				--È¡Ç®
		if nCash > nMax + nAdd then --È¡³öºó´óÓÚnMax
			Msg2Player("Kh«ng thÓ rót ng©n l­îng! Sè ng©n l­îng trong hµnh trang sÏ v­ît møc cho phÐp!")
			return 0
		end
	end
	return 1
end
function MONEYFUND_ADD_G_2(nTongID, nAdd)
	--ÏÈ¿Û×Ê½ðÔÙ¸øÇ®
	if (nAdd < 0)then
		Earn(-nAdd)
	end
	return 1
end

--°ï»á×Ê½ð×ª½¨Éè»ù½ð
function MONEYFUND2BUILDFUND_R(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	local nAdd = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	if (nCurFund +  nAdd > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		return 0
	end
	if (TONG_ApplyAddMoney(nTongID, -nOffer) == 1 and TONG_ApplyAddBuildFund(nTongID, nAdd) == 1)then
		TONG_ApplyAddWeekBuildFund(nTongID, nAdd)
		local szMember = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMember.." lµm cho"..nOffer.."Ng©n s¸ch bang chuyÓn "..nAdd.." v¹n l­îng vµo ng©n s¸ch kiÕn thiÕt"
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYFUND2BF, nAdd)
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "moneyfund2buildfund", nTongID, {money = nOffer, buildfund = nAdd})
		return 1
	end
	return 0
end
function MONEYFUND2BUILDFUND_G_1(nTongID, nOffer)
	if (TONG_GetMoney(nTongID) < nOffer)then
		Msg2Player("Ng©n s¸ch bang héi kh«ng ®ñ")
		return 0
	end
	if (nOffer < 10000)then
		Msg2Player("ChuyÓn kho¶n tèi thiÓu lµ 1 v¹n l­îng!")
		return 0
	end
	local nCurFund = TONG_GetWeekBuildFund(nTongID)
	if (nCurFund + nOffer/COEF_CONTRIB_TO_VALUE > tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID)))then
		Msg2Player("Kh«ng thÓ chuyÓn ng©n, v× sÏ lµm ng©n s¸ch kiÕn thiÕt bang v­ît qu¸ giíi h¹n tuÇn!")
		return 0
	end
	return 1
end
MONEYFUND2BUILDFUND_G_2 = DefFun2

--½¨Éè»ù½ð×ªÕ½±¸»ù½ð
function BUILDFUND2WARFUND_R(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) >= nOffer)then
		if (TONG_ApplyAddBuildFund(nTongID, -nOffer) == 1 and TONG_ApplyAddWarBuildFund(nTongID, nOffer) == 1) then
			local szMember = TONGM_GetName(nTongID, ExecutorId);
			local szMsg = szMember.." lµm cho"..nOffer.." v¹n ng©n s¸ch kiÕn thiÕt chuyÓn sang ng©n s¸ch chiÕn bÞ."
			TONG_ApplyAddTaskValue(nTongID, TONGTSK_BF2WF, nOffer)	
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
			Msg2Tong(nTongID, szMsg);
			cTongLog:WriteInfTB("FUND", "buildfund2warfund", nTongID, {buildfund2warfund = nOffer})
			return 1
		end		
	end
	return 0
end
function BUILDFUND2WARFUND_G_1(nTongID, nOffer)
	if (TONG_GetBuildFund(nTongID) <  nOffer)then
		Msg2Player("Ng©n s¸ch kiÕn thiÕt bang kh«ng ®ñ!")
		return 0
	end
	return 1
end
BUILDFUND2WARFUND_G_2 = DefFun2

--³ÉÔ±½ðÇ®×ª½¨Éè»ù½ð
function MONEY2BUILDFUND_R(nTongID, nOffer)
	local nTotalBuildfundAdd = floor(nOffer / 10000)
	local nBuildfundAdd = 0
	local nStoredAdd = 0
	local nCurBuildFund = TONG_GetWeekBuildFund(nTongID)
	local nWeekBuildUpper = tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
	if (nCurBuildFund >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd
		nBuildfundAdd = 0
	elseif (nCurBuildFund + nTotalBuildfundAdd >= nWeekBuildUpper)then
		nStoredAdd = nTotalBuildfundAdd -  (nWeekBuildUpper - nCurBuildFund)
		nBuildfundAdd = nTotalBuildfundAdd - nStoredAdd
	else
		nStoredAdd = 0
		nBuildfundAdd = nTotalBuildfundAdd
	end
	if (nBuildfundAdd > 0)then
		TONG_ApplyAddBuildFund(nTongID, nBuildfundAdd)
		TONG_ApplyAddWeekBuildFund(nTongID, nBuildfundAdd)
	end
	if (nStoredAdd > 0)then
		TONG_ApplyAddStoredBuildFund(nTongID, nStoredAdd)
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." ®· ®ãng gãp "..(nOffer / 10000).." v¹n l­îng vµo ng©n s¸ch kiÕn thiÕt bang"
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEY2BF, nTotalBuildfundAdd)
	if (nOffer >= 1000000) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "money2buildfund", nTongID, {money = nOffer, buildfund = nBuildfundAdd, storebuildfund = nStoredAdd})
	return 1
end
function MONEY2BUILDFUND_G_1(nTongID, nOffer)
	if (nOffer < 10000)then
		Msg2Player("Mçi lÇn quyªn gãp tèi thiÓu lµ 1 v¹n l­îng!")
		return 0
	end
	if (GetCash() < nOffer)then
		Msg2Player("Ng©n l­îng kh«ng ®ñ!")
		return 0
	end
	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE)then
		Msg2Player("Èn sü kh«ng thÓ ®ãng gãp!")
		return 0
	end
	local nContribution = floor(nOffer/COEF_CONTRIB_TO_VALUE)
	local nWeekTotal = GetWeeklyOffer()
	if (nWeekTotal + nContribution > MAX_WEEK_CONTRIBUTION)then
		Msg2Player("Kh«ng thÓ ®ãng gãp, v× lµm cho ®iÓm cèng hiÕn tÝch lòy sÏ v­ît qu¸ giíi h¹n tuÇn!")
		return 0
	end
	Pay(nOffer)
	AddWeeklyOffer(nContribution)
	AddCumulateOffer(nContribution)
	if (AddContribution(nContribution) ~= 1)then
		return 0
	end
	Msg2Player("B¹n ®ãng gãp <color=gold>"..nOffer.."<color>Ng©n l­îng ®Õn bang héi lËp quü, ®ång thêi nhËn ®­îc<color=green>"..nContribution.."<color>NhÊn vµo ®é cèng hiÕn")
	return 1
end
MONEY2BUILDFUND_G_2 = DefFun2

--³ÉÔ±¹±Ï×¶È×ª´¢±¸¹±Ï×¶È
function CONTRIBUTION2STOREOFFER_R(nTongID, nExecutor, nOffer)
	-- if (TONG_ApplyAddStoredOffer(nTongID, nOffer) ~= 1)then
	if (TONG_ContributeOffer(nTongID, nExecutor, nOffer) ~= 1) then
		return 0
	end
	local szMember = TONGM_GetName(nTongID, ExecutorId);
	local szMsg = szMember.." ®· ®ãng gãp "..nOffer.." ®iÓm cèng hiÕn vµo ng©n s¸ch cèng hiÕn bang"
	if (nOffer >= 100) then
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	end
	Msg2Tong(nTongID, szMsg);
	cTongLog:WriteInfTB("FUND", "contribution2storeoffer", nTongID, {contribution2storeoffer = nOffer})
	return 1
end
function CONTRIBUTION2STOREOFFER_G_1(nTongID, nExecutor, nOffer)
	-- ¿Û³ý¹±Ï×¶ÈÊ±²»ÏòrelayÉêÇë£¬ÒòÎªrelayÒ²»áÖ´ÐÐÏàÓ¦½Å±¾º¯Êý wangbin 2009-4-13
	if (GetContribution() < nOffer or AddContribution(-nOffer, 0) ~= 1)then
		Msg2Player("§iÓm cèng hiÕn kh«ng ®ñ!")
		return 0
	end
	return 1
end
CONTRIBUTION2STOREOFFER_G_2 = DefFun3

-- ´¢±¸¹±Ï×¶È×ª³ÉÔ±¹±Ï×¶È£¨Èº·¢£©
g_szFigure = { "Toµn thÓ bang héi", "Bang chñ ", "Tr­ëng L·o", "§éi tr­ëng", "§Ö tö ", "Èn sü" }
function STOREOFFER2CONTRIBUTION1_R(nTongID, nFigure, nOffer)
	if (TONG_IsExist(nTongID) ~= 1)then
		return 0
	end
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	-- if (TONG_GetStoredOffer(nTongID) >= nCounts * nOffer)then
		-- if (TONGM_ApplyAddOfferEx(nTongID, nFigure, nOffer) ~= 1)then		
		--	return 0
		-- end		
		-- if (TONG_ApplyAddStoredOffer(nTongID, -nCounts * nOffer) ~= 1)then
		-- return 0
		-- end	
	if (TONG_DistributeOfferToGroup(nTongID, nFigure, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMsg = szMaster.."Thµnh viªn trªn m¹ng"..g_szFigure[nFigure+2].."("..nCounts.." ng­êi) ®­îc ph©n ph¸t "..nOffer.." ®iÓm cèng hiÕn!"
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution1", nTongID, {storeoffer2contribution = nOffer})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION1_G_1(nTongID, nFigure, nOffer)
	local nCounts = TONG_GetOnlineCount(nTongID, nFigure)
	if (TONG_GetStoredOffer(nTongID) < nCounts * nOffer)then
		Msg2Player("Ng©n s¸ch cèng hiÕn kh«ng ®ñ ®Ó ph¸t!")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION1_G_2 = DefFun3

-- ´¢±¸¹±Ï×¶È×ª³ÉÔ±¹±Ï×¶È£¨µ¥ÈË£©
function STOREOFFER2CONTRIBUTION2_R(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		return 0
	end
	-- if (TONG_GetStoredOffer(nTongID) >= nOffer)then
	-- 	TONG_ApplyAddStoredOffer(nTongID, -nOffer)
	-- 	TONGM_ApplyAddOffer(nTongID, nMemberID, nOffer)
	if (TONG_DistributeOfferToMember(nTongID, nMemberID, nOffer) == 1) then
		local szMaster = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = format("%s ph¸t cho %s %d ®iÓm cèng hiÕn dù tr÷",szMaster,szMember,nOffer);
		if (nOffer > 100)then
			TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
		end
		Msg2Tong(nTongID, szMsg);
		cTongLog:WriteInfTB("FUND", "storeoffer2contribution2", nTongID, {storeoffer2contribution = nOffer, member = szMember})
		return 1
	end
	return 0
end
function STOREOFFER2CONTRIBUTION2_G_1(nTongID, nMemberID, nOffer)
	if (TONGM_IsExist(nTongID, nMemberID) == 0)then
		Msg2Player("Ng©n s¸ch ®iÓm cèng hiÕn chØ cã thÓ ph¸t cho thµnh viªn trong bang!")
		return 0
	end
	if (TONG_GetStoredOffer(nTongID) < nOffer)then
		Msg2Player("Ng©n s¸ch cèng hiÕn kh«ng ®ñ!")
		return 0
	end	
	return 1
end
STOREOFFER2CONTRIBUTION2_G_2 = DefFun3

-- ³ÉÔ±±»Ìß³ö°ï»á
function MEMBER_KICK_R(nTongID, nMemberID, nFlag)
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2PlayerByName(szExecutorName, TB_TONG_FIGURE_NAME[nMemberFigure].." kh«ng thÓ bÞ trôc xuÊt!");
		return 0;
	end
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0) then
		local szExcutor = TONGM_GetName(nTongID, ExecutorId);
		local szMember = TONGM_GetName(nTongID, nMemberID);
		local szMsg = szExcutor.." trôc xuÊt "..szMember.." ra khái bang héi!"
		Msg2Tong(nTongID, szMsg)
		--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼	
		cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember})
		return 1
	end
	-- ¿Ûµô5%¹±Ï×¶È£¨ÏòÉÏÈ¡Õû£©
	local nDel = (nOffer + 19) / 20
	TONGM_ApplyAddOffer(nTongID, nMemberID, -nDel)
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	--Õ½±¸»ù½ð²»¹»¼õ
	if (nWarFund < nWarBuildDec)then
		return 0
	end
	--´¢±¸²»¹»¼õ
	if (nStoredBuildFund < nBuildDec)then
		--ÔÙ¼Ó½¨Éè»¹ÊÇ²»¹»¼õ
		if (nBuildFund < nBuildDec - nStoredBuildFund)then
			return 0
		end
		TONG_ApplyAddStoredBuildFund(nTongID, -nStoredBuildFund)
		TONG_ApplyAddBuildFund(nTongID, nStoredBuildFund - nBuildDec)
	else
		TONG_ApplyAddStoredBuildFund(nTongID, -nBuildDec)		
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nBuildDec)
	TONG_ApplyAddWarBuildFund(nTongID, -nWarBuildDec)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nWarBuildDec)
	--°ï»á¿ÛÍêÁË
	local szExcutor = TONGM_GetName(nTongID, ExecutorId);
	local szMember = TONGM_GetName(nTongID, nMemberID);
	local szMsg = szExcutor.." trôc xuÊt "..szMember.." trôc xuÊt khái bang héi, ng©n s¸ch kiÕn thiÕt dù tr÷ gi¶m"..nBuildDec..
		" v¹n, ng©n s¸ch chiÕn bÞ gi¶m"..nWarBuildDec.." v¹n!"
	Msg2Tong(nTongID, szMsg)	
	if (nStoredBuildFund < nBuildDec)then
		Msg2Tong(nTongID, "Khi trôc xuÊt ng­êi ng©n s¸ch kiÕn thiÕt dù tr÷ kh«ng ®ñ, phÇn thiÕu hôt sÏ khÊu trõ vµo ng©n s¸ch kiÕn thiÕt!")	
	end
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼	
	cTongLog:WriteInfTB("MEMBER", "kick", nTongID, {member = szMember, builddec = nBuildDec, warbuilddec = nWarBuildDec})
	return 1
end
function MEMBER_KICK_G_1(nTongID, nMemberID, nFlag)
	
	if (TONGM_IsExist(nTongID, nMemberID) ~= 1) then
		return 0;
	end
	local nMemberFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (nMemberFigure == 0 or nMemberFigure == 1) then
		local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
		Msg2Player(TB_TONG_FIGURE_NAME[nMemberFigure].." kh«ng thÓ bÞ trôc xuÊt!");
		return 0;
	end
	
	local nKickCount = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT);	--ÌÞ³ý°ï»á³ÉÔ±µÄ¼ÆÊý
	local nKickDate  = TONG_GetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE);	--ÌÞ³ý°ï»á³ÉÔ±µÄ¼ÆÊýÈÕÆÚ
	local nDate 	 = tonumber(GetLocalDate("%Y%m%d"));						--µ±Ç°ÈÕÆÚ
	
	if (nKickDate ~= nDate) then
		nKickCount = 0;
		nKickDate  = nDate;
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, 	nKickCount);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_DATE, 	nKickDate);
	end
	
	if(nKickCount >= MAX_KICK_COUNT) then
		local szMsg = format("Mçi ngµy chØ ®­îc gi¶i t¸n %d bang chóng!",MAX_KICK_COUNT);
		Msg2Player(szMsg);
		return 0;
	end
	
	local nStoredBuildFund = TONG_GetStoredBuildFund(nTongID)
	local nBuildFund = TONG_GetBuildFund(nTongID)
	local nWarFund = TONG_GetWarBuildFund(nTongID)
	local nOffer = TONGM_GetOffer(nTongID, nMemberID)
	if (nOffer <= 0)then
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	local nBuildDec = floor(nOffer * 0.6)
	local nWarBuildDec = floor(nOffer * 0.4)
	if (nFlag == 1)then
		Say("<#>Trôc xuÊt thµnh viªn sÏ khÊu trõ ng©n s¸ch kiÕn thiÕt dù tr÷ cña bang"..nBuildDec.." v¹n (nÕu ng©n s¸ch kiÕn thiÕt dù tr÷ kh«ng ®ñ sÏ trõ vµo ng©n s¸ch kiÕn thiÕt) vµ ng©n s¸ch chiÕn bÞ"..nWarBuildDec.." v¹n, cã ®ång ý kh«ng?", 
			2, "Trôc xuÊt/#KickConfirm("..nTongID..","..nMemberID..")", "Hñy bá /#Cancel")
	elseif (nFlag == 2)then
		--Õ½±¸»ù½ð²»¹»¼õ
		if (nWarFund < nWarBuildDec)then
			Msg2Player("Sau khi trôc xuÊt thµnh viªn, ng©n s¸ch chiÕn bÞ sÏ khÊu trõ thµnh sè ©m, t¹m thêi kh«ng thÓ trôc xuÊt thµnh viªn!")
			return 0
		end
		--´¢±¸²»¹»¼õ
		if (nStoredBuildFund < nBuildDec)then
			--ÔÙ¼ÓÕ½±¸»¹ÊÇ²»¹»¼õ
			if (nBuildFund < nBuildDec - nStoredBuildFund)then
				Msg2Player("Sau khi trôc xuÊt thµnh viªn, ng©n s¸ch kiÕn thiÕt sÏ khÊu trõ thµnh sè ©m, t¹m thêi kh«ng thÓ trôc xuÊt thµnh viªn!")
				return 0
			end
		end	
		
		TONG_ApplySetTaskValue(nTongID, TONGTSK_MEMBER_KICK_COUNT, nKickCount+1);
		return 1
	end
	return 0
end
function MEMBER_KICK_G_2(nTongID, nMemberID, nFlag)
	-- Ö±½ÓÔÚrelay¿Û³ý5%¹±Ï×¶È¡£ wangbin 2009-4-15
	--×¢Òâµ±Ç°µÄPlayerIDÊÇ±»ÌßÕß
	-- local nContribution = GetContribution()
	-- local nDel = (nContribution + 20 - 1) / 20	--¿Ûµô5%¹±Ï×¶È£¨ÏòÉÏÈ¡Õû£©
	-- AddContribution(-nDel)
	return 1
end
function KickConfirm(nTongID, nMemberID)
	TONG_ApplyKickMember(nTongID, nMemberID, 2)
end

-- ³ÉÔ±ÍËÒþ
function MEMBER_RETIRE_R(nTongID, nMemberID, bRetireOrNot)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szMemberName = TONGM_GetName(nTongID, nMemberID);
	local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (ExecutorId == nMemberID) then
				szPerson = "B¹n ";
			end
			Msg2PlayerByName(szExecutorName, szPerson.." ®¶m nhiÖm chøc vô quan träng, kh«ng thÓ tho¸i Èn, chØ cã ®éi tr­ëng vµ bang chóng míi cã thÓ tho¸i Èn!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2PlayerByName(szExecutorName, "Tr­íc m¾t sè ng­êi tho¸i Èn cña bang ®· ®¹t giíi h¹n, kh«ng thÓ tiÕp tôc sö dông thao t¸c tho¸i Èn"..nRetiredMemberCount);
			return 0;
		end
		local szMsg = ""
		if (ExecutorId ~= nMemberID) then
			if (TONGM_GetOnline(nTongID, nMemberID) == 1 or
				nTodayDate - TONGM_GetLastOnlineDate(nTongID, nMemberID) < TONGMEMBER_RETIRE_REQUIRE_DAY) then
					Msg2PlayerByName(szExecutorName, "ChØ cã thÓ cho tho¸i Èn ®èi víi thµnh viªn kh«ng lªn m¹ng tõ "..TONGMEMBER_RETIRE_REQUIRE_DAY.." ngµy trë lªn!");
					return 0;
			end
			szMsg = szExecutorName.." vs "..szMemberName.."TiÕn hµnh thao t¸c tho¸i Èn"
		else
			szMsg = szMemberName.."Tho¸i Èn khái bang héi"
		end
		Msg2Tong(nTongID, szMsg);
		TONGM_ApplySetRetireDate(nTongID, nMemberID, nTodayDate);
		cTongLog:WriteInfTB("MEMBER", "retire", nTongID, {member = szMemberName})
	elseif (bRetireOrNot == 0) then
		if (nFigure ~= 4) then
			cTongLog:WriteErr("MEMBER", "unretire", nTongID, {member = szMemberName})
			return 0;
		end
		if (nTodayDate - TONGM_GetRetireDate(nTongID, nMemberID) < TONGMEMBER_UNRETIRE_REQUIRE_DAY) then
			Msg2PlayerByName(szExecutorName, "KÓ tõ ngµy tho¸i Èn"..TONGMEMBER_UNRETIRE_REQUIRE_DAY.." ngµy sau ngµy tho¸i Èn míi cã thÓ hñy bá tho¸i Èn!");
			return 0;
		end
		Msg2PlayerByName(szExecutorName, "Hñy bá tho¸i Èn thµnh c«ng!");
		TONGM_ApplySetRetireDate(nTongID, nMemberID, 0);
		cTongLog:WriteInfTB("MEMBER", "unretire", nTongID, {member = szMemberName})
	end
	--ÖÜÎ¬»¤Õ½±¸»ù½ð¸üÐÂ
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0¼¶°ï»áÎÞÖÜÎ¬»¤
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1;
end
function MEMBER_RETIRE_G_1(nTongID, nMemberID, bRetireOrNot)
	local nFigure = TONGM_GetFigure(nTongID, nMemberID);
	if (bRetireOrNot == 1) then
		local szMemberName = TONGM_GetName(nTongID, nMemberID);
		if (nFigure ~= 2 and nFigure ~= 3) then
			local szPerson = szMemberName;
			if (GetTongMemberID() == nMemberID) then
				szPerson = "B¹n ";
			end
			Msg2Player(szPerson.." ®¶m nhiÖm chøc vô quan träng, kh«ng thÓ tho¸i Èn, chØ cã ®éi tr­ëng vµ bang chóng míi cã thÓ tho¸i Èn!");
			return 0;
		end
		local nRetiredMemberCount = TONG_GetMemberCount(nTongID, 4);
		if (nRetiredMemberCount >= floor((TONG_GetMemberCount(nTongID) + nRetiredMemberCount) * TONGMEMBER_RETIRE_MAX_RATE)) then
			Msg2Player("Tr­íc m¾t sè ng­êi tho¸i Èn cña bang ®· ®¹t giíi h¹n, kh«ng thÓ tiÕp tôc sö dông thao t¸c tho¸i Èn");
			return 0;
		end
	else
		if (nFigure ~= 4) then	-- ²»ÊÇÒþÊ¿²»ÔÊÐíÍËÒþ
			return 0;
		end
	end
	return 1;
end
MEMBER_RETIRE_G_2 = DefFun3

-- ³ÉÔ±ÉÏÏÂÏß
function MEMBER_ONLINE_R(nTongID, nMemberID, bOnline)
	-- ÉÏÏß
	if (bOnline == 1) then
	-- ÏÂÏß
	else
		local nTodayDate = floor(GetSysCurrentTime() / (3600*24));
		TONGM_ApplySetLastOnlineDate(nTongID, nMemberID, nTodayDate);
	end
	return 1;
end
MEMBER_ONLINE_G_1 = DefFun3
MEMBER_ONLINE_G_2 = DefFun3

function MEMBER_REMOVE_R(nTongID, nMemberID)
	--ÖÜÎ¬»¤Õ½±¸»ù½ð¸üÐÂ
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "remove", nTongID, {member = szMember});
	--0¼¶°ï»áÎÞÖÜÎ¬»¤
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_REMOVE_G_1 = DefFun2
MEMBER_REMOVE_G_2 = DefFun2

-- ³ÉÔ±¼ÓÈë°ï»á
function MEMBER_ADD_R(nTongID, nMemberID, nOfferBring)
	local nBuildAdd = floor(nOfferBring * 0.6)
	local nWarBuildAdd = floor(nOfferBring * 0.4)
	TONG_ApplyAddStoredBuildFund(nTongID, nBuildAdd)
	TONG_ApplyAddWarBuildFund(nTongID, nWarBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFADD, nBuildAdd)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWarBuildAdd)
	local szMember = TONGM_GetName(nTongID, nMemberID)
	local szMsg = szMember.." gia nhËp bæn bang, ng©n s¸ch kiÕn thiÕt dù tr÷ bang héi t¨ng"..nBuildAdd..
		" v¹n, ng©n s¸ch chiÕn bÞ t¨ng"..nWarBuildAdd.." v¹n!"
	Msg2Tong(nTongID, szMsg)
	--TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	local szExecutor = TONGM_GetName(nTongID, ExecutorId);
	cTongLog:WriteInfTB("MEMBER", "add", nTongID, {member = szMember, buildadd = nBuildAdd, warbuildadd = nWarBuildAdd})
	--ÖÜÎ¬»¤Õ½±¸»ù½ð¸üÐÂ
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	--0¼¶°ï»áÎÞÖÜÎ¬»¤
	if nTongLevel <= 0 then
		return 1
	end
	local nConsume = wsGetAllDayConsume(nTongID)
	nConsume = nConsume + tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nPerStandFund = floor(nConsume * 7 / TONG_GetMemberCount(nTongID, -1))
	TONG_ApplySetPerStandFund(nTongID, nPerStandFund)
	return 1
end
MEMBER_ADD_G_1 = DefFun3
MEMBER_ADD_G_2 = DefFun3

function MEMBER_SETFIGURE_R(nTongID, nMemberID, nFigure)
	if (nFigure == TONG_ELDER)then
		if TONG_GetMemberCount(nTongID, TONG_ELDER) >= MAX_ELDER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "Sè l­îng tr­ëng l·o ®· ®¹t giíi h¹n!");
			end	
			return 0
		end
	elseif (nFigure == TONG_MANAGER)then
		if TONG_GetMemberCount(nTongID, TONG_MANAGER) >= MAX_MANAGER_COUNT then
			if ExecutorId and ExecutorId ~= 0 then 
				Msg2PlayerByName(TONGM_GetName(nTongID, ExecutorId), "Sè l­îng ®éi tr­ëng ®· ®¹t giíi h¹n!");
			end					
			return 0	
		end
	end
	local szMember = TONGM_GetName(nTongID, nMemberID);
	cTongLog:WriteInfTB("MEMBER", "setfigure", nTongID, {member = szMember, figure = nFigure});
	return 1
end
MEMBER_SETFIGURE_G_1 = DefFun3
MEMBER_SETFIGURE_G_2 = DefFun3

-- ÉèÖÃµØÍ¼
function MAP_SET_R(nTongID, nMapID)
	if (TONG_GetTongMap(nTongID) ~= 0)then
		return 0
	end
	local szMsg = "§· cã khu vùc bang héi chung, nhÊp vµo nót <Vµo bæn bang> ®Ó ®i vµo khu vùc nµy!"
	Msg2Tong(nTongID, szMsg)		
	TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- °ï»áÀúÊ·¼ÇÂ¼
	TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	cTongLog:WriteInfTB("MAP", "set", nTongID, {mapid = nMapID});
	return 1
end
MAP_SET_G_1	= DefFun2
MAP_SET_G_2	= DefFun2

function GenParam(aInfo)
	local i = aInfo[1]
	aInfo[1] = i+1
	local mapcopy = aDynMapCopy[i]
	return aDynMapCopyName[mapcopy]..aInfo[2]..mapcopy..")"
end

function EnterMap(nTongID, nMapCopy)
	if (GetFightState() ~= 0)then
		Msg2Player("ChØ cã thÓ ®i vµo tõ khu vùc phi chiÕn ®Çu!")
		return
	end
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(nMapCopy, pos.x, pos.y)
end

function CreatMap(nTongID, nMapCopy)
	TONG_ApplyCreatMap(nTongID, nMapCopy)
end

function BrowseMap(nTongID)
	local aInfo = {1, "/#EnterMap("..nTongID..","}		
	Say("<#>H·y chän b¶n ®å muèn xem", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"Kh«ng xem n÷a!/#Cancel")
end

function SelectMap(nTongID)
	local aInfo = {1, "/#CreatMap("..nTongID..","}		
	Say("<#>Quý bang muèn ®Þnh c­ t¹i ®©u?", 8, GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),
		GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),GenParam(aInfo),"CÇn suy xÐt l¹i/#Cancel")
end

--µØÍ¼´´½¨ÉêÇë
MAP_CREAT_R		= DefFun2
function MAP_CREAT_G_1(nTongID, nMapCopy)
	local nTongMap = TONG_GetTongMap(nTongID) 
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongMap > DYNMAP_ID_BASE) then
		Say("<#>Bang héi cña ng­¬i ®· cã b¶n ®å riªng råi!", 0)
		return 0
	elseif (nMapCopy == 0 and nTongLevel < 2) then
		if(nTongMap > 0)then
			Say("<#>Bang héi ®· cã b¶n ®å chung råi, bang héi ®¹t tíi cÊp 2 míi cã thÓ cã b¶n ®å riªng!", 0)
			return 0
		else
			local nrand = mod(nTongID, 4) + 1
			local aNum = {
				gb_GetTask("TONG_PUBLIC_MAP", 1),
				gb_GetTask("TONG_PUBLIC_MAP", 2),
				gb_GetTask("TONG_PUBLIC_MAP", 3),
				gb_GetTask("TONG_PUBLIC_MAP", 4),
				}
			Say("<#>HiÖn nay ®¼ng cÊp bang héi kh«ng tíi cÊp 2, chØ cã thÓ sö dông b¶n ®å chung, h·y chän 1 b¶n ®å chung (kiÕn nghÞ nªn chän b¶n ®å cã Ýt bang héi):", 6,
			"Lùa chän ngÉu nhiªn/#PublicMap("..nTongID..","..nrand..")", 
			"Khu vùc chung 1 (®· cã "..aNum[1].." bang héi)/#PublicMap("..nTongID..",1)", 
			"Khu vùc chung 2 (®· cã "..aNum[2].." bang héi)/#PublicMap("..nTongID..",2)",
			"Khu vùc chung 3 (®· cã "..aNum[3].." bang héi)/#PublicMap("..nTongID..",3)", 
			"Khu vùc chung 4 (®· cã "..aNum[4].." bang héi)/#PublicMap("..nTongID..",4)",
			"Hñy bá /#Cancel"
			)
			return 0
		end
	end
	if (nMapCopy == 0) then
		Say("<#>Bang héi hiÖn nay ®· cã thÓ cã b¶n ®å riªng, ng­¬i cã muèn t¹o kh«ng?", 2, "Vµo xem thö/#BrowseMap("..nTongID..")", 
			"T¹o b¶n ®å/#SelectMap("..nTongID..")")
		return 0
	end
	return 1
end
MAP_CREAT_G_2	= DefFun2

function PublicMap(nTongID, nSelect)
	gb_AppendTask("TONG_PUBLIC_MAP", nSelect, 1)
	TONG_ApplySetTongMap(nTongID, aPublicMap[nSelect])
end

--µØÍ¼´´½¨³É¹¦
function MAP_CREATED_R(nTongID, dwMapID, nMapCopy)
	--Ê×´Î´´½¨µÄÊ±ºò¹«¸æÒ»ÏÂ
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE and nMapCopy > 0)then
		local mapname = aDynMapCopyName[nMapCopy]
		if (mapname == nil)then
			mapname = "Kh«ng biÕt n¬i nµo"
		end
		local szMsg = "Xin chóc mõng, quÝ bang ®· së h÷u khu vùc ho¹t ®éng riªng, bang chóng cã thÓ chän <§i vµo bæn bang> ®Ó b­íc vµo!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddHistoryRecord(nTongID, szMsg);	-- °ï»áÀúÊ·¼ÇÂ¼
		TONG_ApplyAddEventRecord(nTongID, szMsg);	-- °ï»áÊÂ¼þ¼ÇÂ¼
		cTongLog:WriteInfTB("MAP", "create", nTongID, {mapid = dwMapID, mapname = mapname})
	end
	return 1
end
MAP_CREATED_G_1 = DefFun2
--µØÍ¼´´½¨³É¹¦
function MAP_CREATED_G_2(nTongID, nMapID, nMapCopy)
	nMapIdx = SubWorldID2Idx(nMapID)
	-- µØÍ¼²»ÔÚ´Ë·þÎñÆ÷
	if nMapIdx < 0 or nMapCopy <= 0 then
		return 
	end
	-- ÉèÖÃÐ¡µØÍ¼Ãû×Ö
	SetWorldName(nMapIdx, TONG_GetName(nTongID).." - l·nh ®Þa")
	-- ÉèÖÃÀàÐÍÎª°ï»áµØÍ¼
	SetMapType(nMapIdx, 1);
	-- ÉèÖÃ²ÎÊýÎªTongID
	SetMapParam(nMapIdx, 0, nTongID);
	-- ¼ÓÔØËùÓÐ°ï»áµØÍ¼Npc
	add_one_citytong_npc(nMapIdx, nMapCopy);
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID)
	local npcid
	while(nWorkshopID ~= 0)do
		local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		if (nUseLevel > 0)then
			npcid = add_one_building(nMapIdx, nMapCopy, TWS_GetType(nTongID, nWorkshopID), nUseLevel)
			TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
		end	
		nWorkshopID = TWS_GetNextWorkshop(nTongID, nWorkshopID)
	end
	local nCurLevel = TONG_GetBuildLevel(nTongID)
		if (nCurLevel == 4) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "Cét biÓu t­îng bang héi")--ÓÒ
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "Cét biÓu t­îng bang héi")--×ó
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], nNpcIndex2)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\tong_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			if (nStuntID ~= 0) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
			end
		elseif (nCurLevel == 5) then
			local nNpcIndex1 = AddNpc(1191, 1, nMapIdx, TB_TOTEMPOLE_POS[1][1] * 32, TB_TOTEMPOLE_POS[1][2] * 32, 1, "Cét biÓu t­îng bang héi")--ÓÒ
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[1], nNpcIndex1)
			SetNpcScript(nNpcIndex1, "\\script\\tong\\npc\\tong_totempole.lua")
			local nNpcIndex2 = AddNpc(1192, 1, nMapIdx, TB_TOTEMPOLE_POS[2][1] * 32, TB_TOTEMPOLE_POS[2][2] * 32, 1, "Cét biÓu t­îng thµnh th")--×ó
			TONG_ApplySetTaskValue(nTongID, TONGTSK_TOTEMINDEX[2], 0)
			SetNpcScript(nNpcIndex2, "\\script\\tong\\npc\\city_totempole.lua")
			local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
			local nCitySTID = tong_GetCityStuntID(nTongID)
			if (nStuntID ~= 0 and nCitySTID ~= 0 and TB_STUNTID_INFO[nStuntID].skillid ~= nil) then
				AddNpcSkillState(nNpcIndex1, TB_STUNTID_INFO[nStuntID].skillid, 1, 1, 18*60*60*24*30)
				AddNpcSkillState(nNpcIndex2, TB_STUNTID_INFO[nCitySTID].skillid, 1, 1, 18*60*60*24*30)
			end
		end
	return 1
end

-- GameSvr°ï»áÄ£¿éÊÍ·Å
function RELEASE_G()
	--´¦ÀíÊý¾Ý»º´æ
	local nTongID = TONG_GetFirstTong()
	while nTongID ~= 0 do
		--°ï»á»ù½ð
		local nCurValue = TONG_GetTaskTemp(nTongID, TONG_FUNDTEMP)
		TongFundAdd(nTongID,  nCurValue)
		TONG_SetTaskTemp(nTongID, TONG_FUNDTEMP, 0)
		nTongID = TONG_GetNextTong(nTongID)
	end
	return 1
end

-- ½øÈë°ï»áµØÍ¼
function ENTER_TONG_MAP_G(nTongID)
	if (GetLevel() < 10) then
		Msg2Player("Ng­êi ch¬i cÊp 10 trë lªn míi cã thÓ b­íc vµo l·nh ®Þa bang héi!");
		return 0;
	end
	local dwSelfMapID = SubWorldIdx2ID(SubWorld);
	if (GetFightState() == 1 or (IsCityMap(dwSelfMapID) ~= 1 and IsFreshmanMap(dwSelfMapID) ~= 1 and IsTongMap(dwSelfMapID) ~= 1)) then
		Msg2Player("ChØ cã thÓ ®i vµo l·nh ®Þa bang héi tõ nh÷ng khu vùc phi chiÕn ®Êu!");
		return 0;
	end
	local szTongName = TONG_GetName(nTongID);
	if (szTongName == nil or szTongName == "") then
		Msg2Player("Bang héi nµy kh«ng tån t¹i, kh«ng thÓ vµo khu vùc bang!");
		return 0;
	end
	local _,SelfTong = GetTongName()
--	if (SelfTong ~= nTongID)then
--		if TONG_GetTongMapBan(nTongID) ~= 0 then
--			Msg2Player(szTongName.." Ã»ÓÐ¿ª·ÅµØÍ¼½ûÖÆ£¬ÎÞ·¨½øÈë£¡");
--	 		return 0;
--		end
--	end
	local dwTargetMapID = TONG_GetTongMap(nTongID);
	if (dwTargetMapID <= 0) then
		Msg2Player(szTongName.." Kh«ng cã khu vùc bang héi, kh«ng thÓ ®i vµo!");
	 	return 0;
	end
	if (dwTargetMapID == dwSelfMapID) then
		Msg2Player("B¹n ®ang ®øng t¹i khu vùc nµy råi!");
		return 0;
	end
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	local pos = GetMapEnterPos(nMapCopy)
	NewWorld(dwTargetMapID, pos.x, pos.y);	-- ÒÔºóµØÍ¼½øÈëµã×îºÃ×÷ÎªµØÍ¼µÄÒ»¸öÊôÐÔ
end

--ÉèÖÃµØÍ¼
function CONFIGURE_TONG_MAP_G(nTongID)
	if (TONG_GetTongMap(nTongID) < DYNMAP_ID_BASE) then
		Msg2Player("Bang héi cã khu vùc riªng míi cã thÓ sö dông chøc n¨ng nµy!")
		return 0		
	end
	local ban = TONG_GetTongMapBan(nTongID)
	local szBan = {[0]="ThiÕt lËp cÊm ®Þa/#SetTongMapBan("..nTongID..",1)",
				 [1]="Hñy bá cÊm ®Þa/#SetTongMapBan("..nTongID..",0)"}
	local szState = {[0]="<color=green>Më <color>",
				[1]="<color=red>CÊm <color>"}
	if (ban ~= 0)then
		ban = 1
	end	
	local szMsg = "Cã thÓ lùa chän cho phÐp hay ng¨n cÊm thµnh viªn bang héi kh¸c th©m nhËp, t×nh tr¹ng hiÖn t¹i lµ:"
	Say(szMsg..szState[ban], 2, szBan[ban], "Hñy bá/#Cancel")
	return 1
end

function SetTongMapBan(nTongID, bOpen)
	TONG_ApplySetTongMapBan(nTongID, bOpen)
	local szExcutor = GetName();
	local szState = {[0]="Cho phÐp",
				[1]="Ng¨n cÊm"}	
	local szMsg = szExcutor.." Thay ®æi t×nh tr¹ng khu vùc thµnh: "..szState[bOpen]
	Msg2Player("ThiÕt lËp thµnh c«ng!")
	TONG_ApplyAddEventRecord(nTongID, szMsg);
end

MAP_BAN_R = DefFun2
MAP_BAN_G_1 = DefFun2
function MAP_BAN_G_2(nTongID, bBan)
	local nMap = TONG_GetTongMap(nTongID)
	if (nMap <= DYNMAP_ID_BASE)then
		return 1
	end
	nMap = SubWorldID2Idx(nMap)
	if(bBan == 1 and nMap >= 0)then
		local nMapCopy = SubWorldIdx2MapCopy(nMap)
		local nPlayer = GetFirstPlayerAtSW(nMap)
		while(nPlayer > 0)do
			PlayerIndex = nPlayer
			local _,b = GetTongName()
			if (b ~= nTongID)then
				SetFightState(0)
				local pos = GetMapEnterPos(nMapCopy)
				SetPos(pos.x, pos.y)
				Msg2Player("Khu vùc nµy ®· ®­îc thiÕp lËp cÊm ®Þa, kh«ng thÓ b­íc vµo!")
			end
			nPlayer = GetNextPlayerAtSW(nMap)
		end
	end
	return 1
end

function CITY_OCCUPY_R(nOwner, nPreOwner, nCityMap)
	TONG_ApplySetOccupyCityDay(nOwner, TONG_GetDay(nOwner));
	if (nPreOwner == 0)then
		return 1
	end
	-- ½µµÍ½¨ÉèµÈ¼¶·Åµ½Æß³Ç´óÕ½½Å±¾ÖÐ´¦Àí wangbin 2010.8.11
	-- TONG_ApplySetOccupyCityDay(nPreOwner, 0);
	--Ê§È¥³Ç³Ø£¬5¼¶°ï½µÎª4¼¶
	-- if (TONG_GetBuildLevel(nPreOwner) >= 5) then
	-- 	TONG_ApplyDegrade(nPreOwner)
	-- 	local szMsg="°ï»á³Ç³Ø¶ªÊ§£¬½¨ÉèµÈ¼¶½µÎª4¼¶"
	-- 	Msg2Tong(nPreOwner, szMsg)
	-- 	TONG_ApplyAddEventRecord(nPreOwner, szMsg);	
	-- end
	cTongLog:WriteInfTB("TONG", "occupy_city", nOwner, {preowner = nPreOwner, city = nCityMap});
	return 1
end

--°ï»áÌØ¼¼
--TONGTSK_STUNT_ID = 1011
--stunt¿ªÆô/ÉèÖÃ°ï»áÌØ¼¼
function CONFIGURE_TONG_STUNT_G()
	local _, nTongID = GetTongName()
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	
	-- ¹Ø±ÕÁé²ÎÁ¦
	if (nStuntID == 6) then
		nStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
	end
	
	if (nStuntID == 0) then	--Ã»ÓÐ¿ªÆôÌØ¼¼
		Describe("H·y lùa chän kü n¨ng ®Æc biÖt cho bang: ", 7,
					TB_STUNTID_INFO[1].name.."/#StuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#StuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#StuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#StuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#StuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#StuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#StuntConfirm(7)",
					"Chê ®îi thiÕt lËp/Cancel"		)
	else
		local szMsg = "Kü n¨ng hiÖn t¹i cña bang héi lµ: "..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
						"<enter>NhËn quyÒn h¹n kü thuËt ®Æc biÖt:"..
						"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
						"<enter>Duy tr× tiÒn b¹c kü thuËt ®Æc biÖt:"..
						"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v¹n tiÒn chiÕn bÞ".."<color>"..
						"<enter>T¸c dông cô thÓ kü thuËt ®Æc biÖt:"..
						"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		Describe(szMsg, 3, "Thay ®æi kü n¨ng/#CHANGE_STUNT_G_1("..nTongID..")", "B¶o tr× kü n¨ng më (t¹m ng­ng)/#PAUSED_STUNT_G_1("..nTongID..")", "Rêi khái/OnCancel")
	end
end

function PAUSED_STUNT_G_1(nTongID)
	local nPause = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_PAUSE)
	local nswitch = 0
	local szMsg = ""
	if (nPause < 0 and nPause >= 4) then
		nPause = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nPause)
	end
	szMsg = "Tr¹ng th¸i kü n¨ng hiÖn t¹i cña bang lµ:  "..TB_STUNT_PAUSESTATE[nPause][1].."<enter>Sau khi duy tr× vµo tuÇn sau:"..TB_STUNT_PAUSESTATE[nPause][2]
	nswitch = TB_STUNT_PAUSESTATE[nPause][3]
	Describe(szMsg.."<enter>Ng­¬i cã muèn kh«ng?", 2, "Më(®ãng)/#Paused_Stunt_Sure("..nTongID..","..nswitch..")", "Hñy bá/Cancel")
	return 1
end

function Paused_Stunt_Sure(nTongID, nSwitch)
	TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, nSwitch)
	if (nSwitch == 1 or nSwitch == 3) then
		Msg2Player("Tr¹ng th¸i kü n¨ng cña bang tuÇn sau sÏ ®æi thµnh:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	else
		Msg2Player("Tr¹ng th¸i kü n¨ng cña bang tuÇn sau sÏ ®æi thµnh:  "..TB_STUNT_PAUSESTATE[nSwitch][2])
	end
end

function StuntConfirm(nStuntID)
	--local nStuntID = nSel + 1
	local szMsg = "Kü n¨ng ®­îc chän hiÖn t¹i lµ:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>NhËn quyÒn h¹n kü thuËt ®Æc biÖt:"..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Duy tr× tiÒn b¹c kü thuËt ®Æc biÖt:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v¹n tiÒn chiÕn  bÞ<color>"..
					"<enter>T¸c dông cô thÓ kü thuËt ®Æc biÖt:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>"
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "§ång ý chän/#StuntSureConfirm("..nStuntID..")", "Trë vÒ/CONFIGURE_TONG_STUNT_G", "Rêi khái/OnCancel")
end

function getStuntHelp(nStuntID, nRight, nCycle, nMaxMem)
	local szMsg = ""
	if (nRight == 1) then
		szMsg = "<enter>Lóc tr­íc thêi gian duy tr× kü thuËt ®Æc biÖt bang héi lµ mét tuÇn, b©y giê chØ cã thÓ nhËn trong vµi ngµy"..nMaxMem.." lÇn."
	else
		szMsg = "<enter>Lóc tr­íc thêi gian duy tr× kü thuËt ®Æc biÖt bang héi lµ mét tuÇn, b©y giê mçi ngµy mçi nh©n vËt chØ cã thÓ nhËn ®­îc 1 lÇn, chØ cho phÐp"..nMaxMem.." ng­êi nhËn."
	end
	return szMsg
end

function CHANGE_STUNT_G_1(nTongID)
	local nStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	local nSwith = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_SWICTH)
	if (nStuntID ~= 0) then	
		local szMsg = "Kü n¨ng hiÖn t¹i cña bang héi lµ: "..TB_STUNTID_INFO[nStuntID].name
		if (nSwith ~= 0 and nSwith ~= nStuntID) then
			szMsg = szMsg .."<enter>QuyÕt ®Þnh chuyÓn kü thuËt ®Æc biÖt cña bang héi lµ:"..TB_STUNTID_INFO[nSwith].name
		else
			szMsg = szMsg .."<enter>QuyÕt ®Þnh chuyÓn kü thuËt ®Æc biÖt cña bang héi lµ: [kh«ng]"
		end
		szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
		szMsg = szMsg.."<enter>Ng­¬i muèn ®æi kü thuËt ®Æc biÖt bang héi thµnh lo¹i nµo?"
		
		Describe(szMsg, 7,
					TB_STUNTID_INFO[1].name.."/#ChangeStuntConfirm(1)",
					TB_STUNTID_INFO[2].name.."/#ChangeStuntConfirm(2)",
					TB_STUNTID_INFO[3].name.."/#ChangeStuntConfirm(3)",
					TB_STUNTID_INFO[4].name.."/#ChangeStuntConfirm(4)",
					TB_STUNTID_INFO[5].name.."/#ChangeStuntConfirm(5)",
--					TB_STUNTID_INFO[6].name.."/#ChangeStuntConfirm(6)",
					TB_STUNTID_INFO[7].name.."/#ChangeStuntConfirm(7)",
					"Chê ®îi thiÕt lËp/Cancel"		)
	end
	return 1
end

function ChangeStuntConfirm(nStuntID)
	local _, nTongID = GetTongName()
	--local nStuntID = nSel + 1
	local szMsg = "Kü n¨ng ®­îc chän hiÖn t¹i lµ:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].name.."<color>"..
					"<enter>NhËn quyÒn h¹n kü thuËt ®Æc biÖt:"..
					"<enter><color=yellow>    "..TB_STUNT_RIGHT_DS[TB_STUNTID_INFO[nStuntID].right].."<color>"..
					"<enter>Duy tr× tiÒn b¹c kü thuËt ®Æc biÖt:"..
					"<enter><color=yellow>    "..(TB_STUNTID_INFO[nStuntID].consume).." v¹n tiÒn chiÕn  bÞ<color>"..
					"<enter>T¸c dông cô thÓ kü thuËt ®Æc biÖt:"..
					"<enter><color=yellow>    "..TB_STUNTID_INFO[nStuntID].describe.."<color>";
	szMsg = szMsg ..getStuntHelp(nStuntID, TB_STUNTID_INFO[nStuntID].right, TB_STUNTID_INFO[nStuntID].cycle, TB_STUNTID_INFO[nStuntID].maxmem)
	Describe(szMsg, 3, "§ång ý chän/#StuntSureConfirm("..nStuntID..")", "Trë vÒ/#CHANGE_STUNT_G_1("..nTongID..")", "Rêi khái/OnCancel")
end

function StuntSureConfirm(nStuntID)
	local _, nTongID = GetTongName()
	TONG_ApplySetStunt(nTongID, nStuntID)
end

function STUNT_SET_R(nTongID, nStuntID)
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId)
	if (TONG_GetBuildLevel(nTongID) < 4) then
		Msg2PlayerByName(szExecutorName, "Bang héi cÊp d­íi cÊp 4 kh«ng thÓ sö dông kü n¨ng ®Æc biÖt!");
		return 0
	end
	local nOldStuntID = TONG_GetTaskValue(nTongID, TONGTSK_STUNT_ID)
	-- ¹Ø±ÕÁé²ÎÁ¦
	if (nOldStuntID == 6) then
		nOldStuntID = 0
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nOldStuntID)
	end
	
	-- Èç¹ûÔ­À´Ã»ÓÐÌØ¼¼£¬ÔòÎªÆô¶¯ÌØ¼¼£¨Á¢¼´ÉúÐ§£©£¬·ñÔòÎª¸ü¸ÄÌØ¼¼£¨Î¬»¤ºóÉúÐ§£©
	if (nOldStuntID == 0) then
		local nday = TONG_GetDay(nTongID);
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ID, nStuntID)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MAINPERIOD, TONG_GetWeek(nTongID))
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_MEMLIMIT, TB_STUNTID_INFO[nStuntID].maxmem)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_ENABLED, 1)
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_PAUSE, 3)
		Msg2Tong(nTongID, "Kü n¨ng ®Æc biÖt ®­îc më, kü n¨ng lµ "..TB_STUNTID_INFO[nStuntID].name)
		TONG_ApplyAddEventRecord(nTongID, "Kü n¨ng ®Æc biÖt ®­îc më, kü n¨ng lµ "..TB_STUNTID_INFO[nStuntID].name)
	else
		TONG_ApplySetTaskValue(nTongID, TONGTSK_STUNT_SWICTH, nStuntID)
		Msg2PlayerByName(szExecutorName, "Sau mét tuÇn th× kü n¨ng sÏ ®æi thµnh "..TB_STUNTID_INFO[nStuntID].name..".")
		return 0
	end
	cTongLog:WriteInfTB("TONG", "setstunt", nTongID, {stuntid = nStuntID});
	return 1
end
STUNT_SET_G_1	= DefFun2

function STUNT_SET_G_2(nTongID, nStuntID)
	if (nStuntID ~= 0) then
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
end

---------¿Í»§¶ËµÄÈ«·ÅÔÚÕâ¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£¡£
else
-----------------Èç¹ûÊÇ¿Í»§¶Ë---------------
MONEYFUND_ADD_C_1 = DefFun2
MONEYFUND_ADD_C_2 = DefFun2
MONEYFUND2BUILDFUND_C_1 = DefFun2
MONEYFUND2BUILDFUND_C_2 = DefFun2
MAP_CREATED_C_1 = DefFun2
MAP_CREATED_C_2 = DefFun2
MAP_CREAE_C_1	= DefFun2
MAP_CREAT_C_2	= DefFun2
MAP_SET_C_1	= DefFun2
MAP_SET_C_1	= DefFun2
CONTRIBUTION2STOREOFFER_C_1 = DefFun3
CONTRIBUTION2STOREOFFER_C_2 = DefFun3
BUILDFUND2WARFUND_C_1 = DefFun2
BUILDFUND2WARFUND_C_2 = DefFun2
MONEY2BUILDFUND_C_1 = DefFun2
MONEY2BUILDFUND_C_2 = DefFun2
STOREOFFER2CONTRIBUTION1_C_1 = DefFun3
STOREOFFER2CONTRIBUTION1_C_2 = DefFun3
STOREOFFER2CONTRIBUTION2_C_1 = DefFun3
STOREOFFER2CONTRIBUTION2_C_2 = DefFun3
MEMBER_KICK_C_1 = DefFun3
MEMBER_KICK_C_2 = DefFun3
MEMBER_RETIRE_C_1 = DefFun3
MEMBER_RETIRE_C_2 = DefFun3
MEMBER_ONLINE_C_1 = DefFun3
MEMBER_ONLINE_C_2 = DefFun3
MEMBER_ADD_C_1 = DefFun3
MEMBER_ADD_C_2 = DefFun3
MEMBER_SETFIGURE_C_1 = DefFun3
MEMBER_SETFIGURE_C_2 = DefFun3
STUNT_SET_C_1	= DefFun2
STUNT_SET_C_2	= DefFun2

aPrompt= {"Cã muèn x©y dùng t¸c ph­êng nµy kh«ng?",
"Cã muèn hñy bá t¸c ph­êng nµy kh«ng?",
"Cã muèn kÝch ho¹t t¸c ph­êng nµy kh«ng?",
"Cã muèn ®ãng cöa t¸c ph­êng nµy kh«ng?",
"Cã ®ång ý n©ng cÊp t¸c ph­êng nµy kh«ng?",
"Cã ®ång ý ®iÒu chØnh ®¼ng cÊp sö dông t¸c ph­êng kh«ng?",
}
function GET_WORKSHOP_PROMPT(nTongID, nWorkshopID, nOpt)
	if (nOpt == 3)then
		return "Sau khi ®ãng cöa, muèn kÝch ho¹t l¹i cÇn "..
		wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), 
			TWS_GetUseLevel(nTongID, nWorkshopID)).." v¹n tiÒn kiÕn thiÕt, cã ®ång ý ®ãng cöa kh«ng?"
	end
	return aPrompt[nOpt+1]
end

end

-------------------¹«¹²µÄÈ«·ÅÕâ¡£¡£¡£¡£¡£¡£¡£¡£¡£
-- »ñÈ¡°ï»á½¨Éè»ù½ðÖÜÉÏÏÞ
function GET_WEEKBUILD_THRESHOLD(nTongID)
	return tongGetWeekBuildUpper(nTongID, TONG_GetBuildLevel(nTongID))
end

--ÖÜÀÛ»ý¹±Ï×¶ÈÉÏÏÞ
function GET_WEEKLYOFFER_THRESHOLD()
	return MAX_WEEK_CONTRIBUTION
end

-- »ñÈ¡°ï»á×÷·»ÊýÁ¿ÉÏÏÞ	
function GET_WORKSHOP_COUNT_THRESHOLD(nTongID)
	return tongGetMaxWorkshopNum(nTongID, TONG_GetBuildLevel(nTongID))
end	

-- »ñÈ¡°ï»á×÷·»µÈ¼¶ÉÏÏÞ
function GET_WORKSHOP_LEVEL_THRESHOLD(nTongID)
	return tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
end

function GET_WORKSHOP_DATA(nTongID, nWorkshopID, nFlag)
	if (nFlag == 0)then
		return wsGetOpenCost(nTongID, TWS_GetType(nTongID, nWorkshopID), TWS_GetUseLevel(nTongID, nWorkshopID))
	end
	return 0
end

-- È¡Ïû
function Cancel()
end
