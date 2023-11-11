function DEF_FUN(nTongID, nID)
	return 1
end

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
Include("\\script\\tong\\workshop\\workshop_logic.lua")
Include("\\script\\tong\\workshop\\workshop_def.lua")
Include("\\script\\tong\\log.lua")

if (MODEL_GAMESERVER == 1) then --Èç¹ûÊÇGameServer
	Include("\\script\\tong\\addtongnpc.lua");
	Include([[\script\tong\workshop\tongcolltask.lua]]);--°ï»áÌØÊâÁîÅÆÍ·ÎÄ¼þ
end

function SVR_CheckUse(nTongID, nWorkshopID, szName)
	if (SubWorldIdx2ID(SubWorld) ~= TONG_GetTongMap(nTongID)) then
		if (GetTask(TASK_LP_COUNT) ~= 0) then --Èç¹ûÓÐ°ï»áÌØÊâÁîÅÆÈÎÎñ
			local nRwlp = rwlp_taskcheck(nTongID, nWorkshopID);
			local szLevel = "<color=yellow>"..GetTask(TASK_LP_ZONGGUANLEVEL).." -cÊp<color> ";
			local szZGName = "<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."Ph­êng tæng qu¶n<color>";
			if (nRwlp == 2) then --Èç¹ûµØÍ¼ÊÇ¶ÔµÄ
				Say("H×nh nh­ ng­¬i ®ang lµm nhiÖm vô lÖnh bµi, nhanh chãng t×m  "..szZGName.."xem «ng Êy cã gióp ®­îc g× cho ng­¬i kh«ng.", 0);
				Msg2Player("T×m ®èi tho¹i "..szZGName.."trong ph¹m vi khu vùc.");
			elseif (nRwlp == 0) then --
				Say("H×nh nh­ ng­¬i ®ang lµm nhiÖm vô lÖnh bµi, nh­ng tæng qu¶n khu vùc chung kh«ng qu¶n lý viÖc <color=yellow>th­ tiÕn cö<color> nµy, h·y ®Õn bang héi kh¸c t×m "..szZGName.."xem «ng Êy cã gióp ®­îc g× cho ng­¬i kh«ng.", 0);
				Msg2Player("Kh«ng thÓ t×m thÊy <color=yellow>th­ tiÕn cö<color> t¹i khu vùc chung.");
			elseif (nRwlp == 1) then --
				rwlp_dedaojianshu(nTongID, nWorkshopID);
			end;
		else
			Say("§©y kh«ng ph¶i lµ l·nh ®Þa quý bang, kh«ng thÓ sö dông T¸c Ph­êng nµy.", 0);
		end;
		return 0
	end
	if (nWorkshopID <= 0) then
		Say("Quý bang d­êng nh­ ch­a x©y dùng T¸c Ph­êng nµy.", 0)
		return 0
	end	
	if (TWS_GetUseLevel(nTongID, nWorkshopID) < 1) then
		Say("§¼ng cÊp t¸c ph­êng nµy lµ 0, t¹m thêi kh«ng thÓ sö dông", 0);
		return 0;
	end
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1) then
		Say(szName..": Bang héi ta ch­a x©y dùng t¸c ph­êng nµy, muèn sö dông ph¶i ®i t×m bang chñ hoÆc tr­ëng l·o khai më.", 0);
		return 0;
	end	
	if TONG_GetPauseState(nTongID) ~= 0 then
		Say(szName..": T¸c Ph­êng ®ang t¹m ngõng ho¹t ®éng.", 0);
		return 0;
	end
	return 1
end

function RL_DoLevelUp(nTongID, nID, nToLevel)
	if (logicWorkShopLevelUp(nTongID, nID, nToLevel) ~= 0) then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local nCost = wsGetUpgradeCostFund(nTongID, eType, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end	
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	local szRecord = wsGetName(eType).."Th¨ng lªn cÊp "..nToLevel.."cÊp";
	local szRecordPlus;
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." lµm cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- °ï»áÀúÊ·¼ÇÂ¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "upgrade", nTongID, {workshopid = nID, typename = wsGetName(eType), tolevel = nToLevel})
	
	return 1;
end

function RL_DoDegrade(nTongID, nID, nToLevel)
	--È¡Ïû½µ¼¶²Ù×÷
	do return 0 end
	local nRet = logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nRet ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	local bOpen = TWS_IsOpen(nTongID, nID)
	--Ê¹ÓÃµÈ¼¶
	if TWS_GetUseLevel(nTongID, nID) > nToLevel then
		TWS_ApplySetUseLevel(nTongID, nID, nToLevel)
	end
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nToLevel, bOpen) - 
			wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen);			
	--ÖÜÎ¬»¤Õ½±¸»ù½ð±ä»¯
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)
	
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = wsGetName(eType).."Gi¶m xuèng cÊp"..nToLevel.."cÊp";
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
		
	cTongLog:WriteInfTB("WORKSHOP", "degrade", nTongID, {workshopid = nID, typename = wsGetName(eType), tolevel = nToLevel})
	
	return 1	
end

function RL_DoOpen(nTongID, nID)
	if (logicWorkShopOpen(nTongID, nID) ~= 0) then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCost = wsGetOpenCost(nTongID, eType, nCurLevel)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	--ÖÜÎ¬»¤Õ½±¸»ù½ð±ä»¯
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)	
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = wsGetName(eType).."Khai më l¹i";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." lµm cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "open", nTongID, {workshopid = nID, typename = wsGetName(eType), level = nCurLevel})
	
	return 1
end

function RL_DoClose(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (logicWorkShopClose(nTongID, nID) ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	--ÖÜÎ¬»¤Õ½±¸»ù½ð±ä»¯
	TONG_ApplyAddPerStandFund(nTongID, -nMaintainAdd * 7)	
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = wsGetName(eType).."§ãng";
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName.." lµm cho"..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "close", nTongID, {workshopid = nID, typename = wsGetName(eType), level = nCurLevel})
	
	return 1
end

function RL_DoDestroy(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (logicWorkShopDestroy(nTongID, nID) ~= 0) then
		return 0
	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local bOpen = TWS_IsOpen(nTongID, nID)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen)
	--ÖÜÎ¬»¤Õ½±¸»ù½ð±ä»¯
	TONG_ApplyAddPerStandFund(nTongID, -nMaintainAdd * 7)
	
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = wsGetName(eType).."Hñy bá";
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
	
	cTongLog:WriteInfTB("WORKSHOP", "destroy", nTongID, {workshopid = nID, typename = wsGetName(eType), level = TWS_GetLevel(nTongID, nID)})
	
	return 1
end

function RL_DoLearn(nTongID, eType)
	if (logicWorkShopLearn(nTongID, eType) ~= 0) then
		return 0
	end	
	local nCost = wsGetUpgradeCostFund(nTongID, eType, 0)
	if (TONG_ApplyAddBuildFund(nTongID, -nCost) ~= 1) then
		return 0
	end
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, nCost)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, 1, 1);
	--ÖÜÎ¬»¤Õ½±¸»ù½ð±ä»¯
	TONG_ApplyAddPerStandFund(nTongID, nMaintainAdd * 7)	
	-- °ï»áÀúÊ·/ÊÂ¼þ¼ÇÂ¼¡¢Í¨Öª
	local szRecord = "§· x©y dùng"..wsGetName(eType);
	local szRecordPlus;
	local szExecutorName = TONGM_GetName(nTongID, ExecutorId);
	if (szExecutorName ~= "") then
		szRecordPlus = szExecutorName..szRecord;
	else
		szExecutorName = "";
		szRecordPlus = szRecord;
	end
	TONG_ApplyAddHistoryRecord(nTongID, szRecordPlus);	-- °ï»áÀúÊ·¼ÇÂ¼
	TONG_ApplyAddEventRecord(nTongID, szRecordPlus);	-- °ï»áÊÂ¼þ¼ÇÂ¼
	Msg2Tong(nTongID, szRecordPlus);
	
	cTongLog:WriteInfTB("WORKSHOP", "learn", nTongID, {typename = wsGetName(eType)})
	
	return 1
end

function SVR_CheckLevelUp(nTongID, nID, nToLevel)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopLevelUp(nTongID, nID, nToLevel)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("T¸c ph­êng nµy ®· ®¹t ®Õn cÊp cao nhÊt, muèn n©ng cÊp t¸c ph­êng cÇn ph¶i n©ng ®¼ng cÊp kiÕn thiÕt tr­íc!")
	elseif (nRet == 2) then
		Msg2Player("Ng©n s¸ch kiÕn thiÕt bang kh«ng ®ñ, kh«ng thÓ n©ng cÊp t¸c ph­êng nµy.")
	elseif (nRet == 3) then
		Msg2Player("Bang héi ®ang t¹m ngõng ho¹t ®éng, kh«ng thÓ n©ng cÊp t¸c ph­êng!")	
	elseif (nRet == 4) then
		Msg2Player("Sau khi n©ng cÊp, ng©n s¸ch chiÕn bÞ thÊp h¬n ng©n s¸ch b¶o tr× hµng tuÇn, kh«ng thÓ n©ng cÊp t¸c ph­êng nµy!")	
	end	
	return 0
end

function SVR_DoLevelUp(nTongID, nID, nToLevel)
		--Ê¹ÓÃµÈ¼¶
	Say("Ng­¬i cã thÓ n©ng ®¼ng cÊp sö dông t¸c ph­êng b»ng víi ®¼ng cÊp t¸c ph­êng, cã ®ång ý kh«ng?", 2, "Muèn/#SetUSeLevel("..nTongID..","..
		nID..")", "Kh«ng muèn/cancel")
	return 1
end

function SetUSeLevel(nTongID, nID)
	local nLevel = TWS_GetLevel(nTongID, nID)
	if nLevel > 0 then
		TWS_ApplySetUseLevel(nTongID, nID, nLevel)
		TWS_ApplySetUseLevelSet(nTongID, nID, nLevel)
	end
	Msg2Player("§¼ng cÊp sö dông t¸c ph­êng ®­îc n©ng lªn b»ng víi ®¼ng cÊp t¸c ph­êng!")
end

function SVR_CheckOpen(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopOpen(nTongID, nID)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
	elseif (nRet == 2) then
		Msg2Player("Bang héi ®ang t¹m ngõng ho¹t ®éng, kh«ng thÓ khai më t¸c ph­êng!")
	elseif (nRet == 3) then
		Msg2Player("Ng©n s¸ch kiÕn thiÕt bang kh«ng ®ñ, kh«ng thÓ khai më t¸c ph­êng nµy!")
	elseif (nRet == 4) then
		Msg2Player("Sau khi khai më, ng©n s¸ch chiÕn bÞ thÊp h¬n ng©n s¸ch b¶o tr× hµng tuÇn, kh«ng thÓ khai më t¸c ph­êng nµy!")	
	end
	return 0
end

function SVR_DoOpen(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	return 1
end

function SVR_CheckClose(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	if (logicWorkShopClose(nTongID, nID) ~= 0) then
		return 0
	end
	return 1
end

function SVR_DoClose(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	return 1
end

function SVR_CheckDestroy(nTongID, nID)
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopDestroy(nTongID, nID)
	if (nRet == 0) then
		return 1
	end	
	return 0
end

function SVR_DoDestroy(nTongID, nID)
	local npcid = TWS_GetBuildingNpc(nTongID, nID)
	if (npcid > 0)then
		DelNpc(npcid)
		TWS_GetBuildingNpc(nTongID, nID, 0)
	end
	return 1
end

function SVR_CheckLearn(nTongID, eType)
	if nTongID == 0 then
		return 0
	end
	local nRet = logicWorkShopLearn(nTongID, eType)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("Sè l­îng t¸c ph­êng ®· ®¹t giíi h¹n, muèn x©y dùng thªm cÇn ph¶i n©ng ®¼ng cÊp kiÕn thiÕt lªn!")	
	elseif (nRet == 2) then
		Msg2Player("T¸c ph­êng nµy ®· cã råi!")
	elseif (nRet == 3) then
		Msg2Player("Bang héi t¹m ngõng ho¹t ®éng, kh«ng thÓ x©y dùng t¸c ph­êng!")
	elseif (nRet == 4) then
		Msg2Player("Ng©n s¸ch kiÕn thÕt kh«ng ®ñ, kh«ng thÓ thµnh lËp t¸c ph­êng nµy!")
	elseif (nRet == 5) then
		Msg2Player("Sau khi x©y dùng, ng©n s¸ch chiÕn bÞ thÊp h¬n ng©n s¸ch b¶o tr× hµng tuÇn, kh«ng thÓ x©y dùng t¸c ph­êng nµy!")	
	end
	return 0
end

--DoLearnÊÇGS×÷·»´´½¨Íêºó²Åµ÷ÓÃµÄ
function SVR_DoLearn(nTongID, nWorkshopID)
	local eType = TWS_GetType(nTongID, nWorkshopID)
	if (eType == 0)then
		_dbgMsg("SVR_DoLearn: ERRORRORORR")
		return 0
	end
	local nMapID = TONG_GetTongMap(nTongID)
	--ÎÞ°ï»áµØÍ¼»ò·Ç¶¯Ì¬µØÍ¼
	if (nMapID < DYNMAP_ID_BASE)then
		return 1
	end
	nMapID = SubWorldID2Idx(nMapID)
	local nMapCopy = TONG_GetTongMapTemplate(nTongID)
	--µØÍ¼²»ÔÚ´Ë·þÎñÆ÷
	if (nMapID < 0 or nMapCopy <= 0)then
		return 1
	end
	local npcid = add_one_building(nMapID, nMapCopy, eType, 1)
	_dbgMsg("add building npcid:"..npcid)
	if (npcid > 0)then
		TWS_SetBuildingNpc(nTongID, nWorkshopID, npcid)
	end
	return 1
end 

function SVR_CheckDegrade(nTongID, nID, nToLevel)
	--È¡Ïû½µ¼¶²Ù×÷
	do return 0 end
	if nTongID == 0 or nID <=0 then
		return 0
	end
	local nRet = logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nRet == 0) then
		return 1
	elseif (nRet == 1) then
		Msg2Player("T¸c ph­êng ®· ë cÊp thÊp nhÊt, kh«ng thÓ gi¶m cÊp n÷a!")
	end
	return 0	
end

function SVR_DoDegrade(nTongID, nID, nToLevel)
	return 1
end 

SET_USELEVELSET_R = DEF_FUN
SET_USELEVELSET_G_1 = DEF_FUN
function SET_USELEVELSET_G_1(nTongID, nID)
	SetULConfirm(nTongID, nID)
	return 0
end

function SetULConfirm(nTongID, nID)
	local nLevel = TWS_GetLevel(nTongID, nID)
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCurLevelSet = TWS_GetUseLevelSet(nTongID, nID)
	local nUpperLevel = tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))
	if nCurLevelSet <= 0 then
		nCurLevelSet = nCurLevel
	elseif (nCurLevelSet > nCurLevel)then
		nCurLevelSet = nCurLevel
	elseif (nCurLevelSet > nUpperLevel) then	
		nCurLevelSet = nUpperLevel
	end
	local eType = TWS_GetType(nTongID, nID)
	Say("<#>HiÖn t¹i, <color=yellow>"..wsGetName(eType).."<color>®¼ng cÊp thùc tÕ lµ <color=blue>"..
		nLevel.."<color>, ®¼ng cÊp sö dông lµ <color=blue>"..nCurLevel.."<color>\n ®· ®­îc ®iÒu chØnh ®¼ng cÊp sö dông, "..
		"sau khi <color=red>b¶o tr× hµng tuÇn<color> sÏ cã hiÖu lùc, ®¼ng cÊp sö dông hiÖn t¹i lµ <color=blue>"..nCurLevelSet.."<color>, "..
		"ng­¬i muèn ®iÒu chØnh ®¼ng cÊp sö dông cho tuÇn sau thÕ nµo?",3,"CÊp 1 ®Õn 5/#SetUseLevelSet("..nTongID..","..nID..",1)",
		"CÊp 6 ®Õn 10/#SetUseLevelSet("..nTongID..","..nID..",2)", "Ta muèn rêi khái!/cancel")
end

function SetUseLevelSet(nTongID, nID, nFlag)
	if nFlag == 1 then
		Say("H·y lùa chän ®¼ng cÊp:  ", 6, "CÊp 1/#SUS_Chose("..nTongID..","..nID..",1)", "CÊp 2/#SUS_Chose("..nTongID..","..nID..",2)",
			"CÊp 3/#SUS_Chose("..nTongID..","..nID..",3)", "CÊp 4/#SUS_Chose("..nTongID..","..nID..",4)",
			"CÊp 5/#SUS_Chose("..nTongID..","..nID..",5)", "Trë l¹i/#SetULConfirm("..nTongID..","..nID..")")
	elseif nFlag == 2 then
		Say("H·y lùa chän ®¼ng cÊp:  ", 6, "CÊp 6/#SUS_Chose("..nTongID..","..nID..",6)", "CÊp 7/#SUS_Chose("..nTongID..","..nID..",7)",
			"CÊp 8/#SUS_Chose("..nTongID..","..nID..",8)", "CÊp 9/#SUS_Chose("..nTongID..","..nID..",9)",
			"CÊp 10/#SUS_Chose("..nTongID..","..nID..",10)", "Trë l¹i/#SetULConfirm("..nTongID..","..nID..")")
	end
end

function SUS_Chose(nTongID, nID, nLevel)
	local nWsLevel = TWS_GetLevel(nTongID, nID)
	if (nLevel > nWsLevel)then
		Say("§¼ng cÊp sö dông ®­îc chän kh«ng thÓ lín h¬n ®¼ng cÊp t¸c ph­êng hiÖn t¹i", 1, "BiÕt råi/cancel")
		return
	end
	local nUpperLevel = tongGetWorkshopUpperLevel(nTongID, TONG_GetBuildLevel(nTongID))	
	if (nLevel > nUpperLevel)then
		Say("§¼ng cÊp sö dông t¸c ph­êng hiÖn t¹i cña quý bang sÏ giíi h¹n ë cÊp: <color=red>"..nUpperLevel.."<color>3. Kh«ng thÓ chän ®¼ng cÊp cao h¬n ®¼ng cÊp nµy.", 1, "BiÕt råi/cancel")
		return
	end
	local eType = TWS_GetType(nTongID, nID)
	local szMsg = "<color=white>"..GetName().."<color>thiÕt lËp <color=red>"..wsGetName(eType)..
	"<color> ®¼ng cÊp sö dông lµ <color=green>"..nLevel.."<color>, ".."Thay ®æi nµy sÏ cã hiÖu lùc sau mét tuÇn"
	Msg2Tong(nTongID, szMsg)
	-- °ï»áÊÂ¼þ¼ÇÂ¼
	TONG_ApplyAddEventRecord(nTongID, GetName().."ThiÕt lËp "..wsGetName(eType).." ®¼ng cÊp sö dông hiÖn t¹i lµ "..nLevel.."cÊp");
	TWS_ApplySetUseLevelSet(nTongID, nID, nLevel)
end

SET_USELEVEL_R = DEF_FUN
SET_USELEVEL_G_1 = DEF_FUN
function SET_USELEVEL_G_2(nTongID, nID, nToLevel)
	local npcid = TWS_GetBuildingNpc(nTongID, nID)
	if (npcid > 0)then
		if nToLevel > 0 then
			local eType = TWS_GetType(nTongID, nID)
			ChangeNpcFeature(npcid, 0, 0, building_figure[eType][nToLevel])
		else
			DelNpc(npcid)
			TWS_SetBuildingNpc(nTongID, nID, 0)
		end	
	elseif nToLevel > 0 then
		local nMapID = TONG_GetTongMap(nTongID)
		local eType = TWS_GetType(nTongID, nID)
		--ÎÞ°ï»áµØÍ¼»ò·Ç¶¯Ì¬µØÍ¼
		if (nMapID < DYNMAP_ID_BASE)then
			return 1
		end
		nMapID = SubWorldID2Idx(nMapID)
		local nMapCopy = TONG_GetTongMapTemplate(nTongID)
		--µØÍ¼²»ÔÚ´Ë·þÎñÆ÷
		if (nMapID <= 0 or eType == 0 or nMapCopy <= 0)then
			return 1
		end
		local npcid = add_one_building(nMapID, nMapCopy, eType, 1)
		_dbgMsg("add building npcid:"..npcid)
		if (npcid > 0)then
			TWS_SetBuildingNpc(nTongID, nID, npcid)
		end
	end
	return 1
end

function cancel()
end
	
else
-----------------Èç¹ûÊÇ¿Í»§¶Ë---------------
Include("\\script\\tong\\workshop\\workshop_setting.lua")
SET_USELEVELSET_C_1 = DEF_FUN
SET_USELEVELSET_C_2 = DEF_FUN
SET_USELEVEL_C_1 = DEF_FUN
SET_USELEVEL_C_2 = DEF_FUN
end	--if½áÊø

--Ä¬ÈÏµÄ´¦Àíº¯Êý£¬ÒªÖØÔØ¿ÉÖØÐÂ¸³Öµ
LEARN_R		= RL_DoLearn
LEARN_G_1	= SVR_CheckLearn
LEARN_G_2	= SVR_DoLearn
LEARN_C_1	= DEF_FUN
LEARN_C_2	= DEF_FUN

REMOVE_R	= RL_DoDestroy
REMOVE_G_1	= SVR_CheckDestroy
REMOVE_G_2	= SVR_DoDestroy
REMOVE_C_1	= DEF_FUN
REMOVE_C_2	= DEF_FUN

OPEN_R		= RL_DoOpen
OPEN_G_1	= SVR_CheckOpen
OPEN_G_2	= SVR_DoOpen
OPEN_C_1 	= DEF_FUN
OPEN_C_2 	= DEF_FUN

CLOSE_R		= RL_DoClose
CLOSE_G_1	= SVR_CheckClose
CLOSE_G_2	= SVR_DoClose
CLOSE_C_1 	= DEF_FUN
CLOSE_C_2 	= DEF_FUN

UPGRADE_R	= RL_DoLevelUp
UPGRADE_G_1	= SVR_CheckLevelUp
UPGRADE_G_2	= SVR_DoLevelUp
UPGRADE_C_1 = DEF_FUN
UPGRADE_C_2 = DEF_FUN

DEGRADE_R	= RL_DoDegrade
DEGRADE_G_1	= SVR_CheckDegrade
DEGRADE_G_2	= SVR_DoDegrade
DEGRADE_C_1 = DEF_FUN
DEGRADE_C_2 = DEF_FUN

--MAINTAIN_R	 = DEF_FUN
MAINTAIN_G_1 = DEF_FUN
MAINTAIN_G_2 = DEF_FUN
MAINTAIN_C_1 = DEF_FUN
MAINTAIN_C_2 = DEF_FUN