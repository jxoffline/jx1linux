Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\string.lua")
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\task\\metempsychosis\\item\\wulinren_xinfeng.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeathbydamage.lua")
Include("\\script\\misc\\eventsys\\type\\func.lua")
Include("\\script\\misc\\eventsys\\type\\harvestplant.lua")





TransLife7 = {}
--Ìõ¼þ
function TransLife7:CheckCondition()
	local nRetCode = 0
	
	nRetCode = check_zhuansheng_level()
	if (nRetCode ~= 1) then	
		nRetCode = 0
		return nRetCode;
	end
	
	nRetCode = zhuansheng_check_common()
	if nRetCode ~= 1 then
		nRetCode = 0
		return nRetCode
	end
	
	nRetCode = self:CheckItemNeedCondition()
	if nRetCode == 0 then
		return nRetCode
	end
	
	nRetCode = self:CheckTL7TaskValue()
	if nRetCode == 0 then
		return nRetCode
	end
	
	return nRetCode
end

function TransLife7:CheckItemNeedCondition()
	local nRetCode = 0
	local tbItemNeedParam = TL7_CONFIG.tbNeedItem
	local tbNeedItemName = {}
	for nIndex, tbItemParam in tbItemNeedParam do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam)
		local nCurCount = CalcItemCount(nRoomPos, nGenre, nDetail, nParticular, nLevel)
		if nCurCount < nNeedItemCount then
			CreateTaskSay({format(TL7_CONFIG.tbLang[1], nNeedItemCount, szItemName), "§­îc råi./OnCancel"})
			return 0
		end
	end
	
	nRetCode = 1
	return nRetCode
end

--¼´Ê¹ÓÐÁËµÀ¾ß£¬Ò²¼ì²éÒ»ÏÂÈÎÎñ±äÁ¿µÄ¼ÇÂ¼Çé¿ö°É
function TransLife7:CheckTL7TaskValue()
	local nRetCode = 0
	local szErr = ""
		--05022001 Admin: bá kiem tra nhiem vu  yªu cÇu cho trung sinh 7

	-- local nTaskStep1 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_ACCEPT_TASK, 1) 
	-- if nTaskStep1 == 0 then
	-- 	szErr = TL7_CONFIG.tbLang[27]
	-- 	CreateTaskSay({szErr});
	-- 	return nRetCode
	-- end
	
	-- local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	-- if nTaskStep2 == 0 then
	-- 	szErr = TL7_CONFIG.tbLang[28]
	-- 	CreateTaskSay({szErr});
	-- 	return nRetCode
	-- end
	
	-- local nTaskStep3 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_KILL_BOSS, 1) 
	-- if nTaskStep3 == 0 then
	-- 	szErr = TL7_CONFIG.tbLang[29]
	-- 	CreateTaskSay({szErr});
	-- 	return nRetCode
	-- end
	
	-- local nTaskStep4 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_COMMIT_XINFENG, 1) 
	-- if nTaskStep4 == 0 then
	-- 	szErr = TL7_CONFIG.tbLang[30]
	-- 	CreateTaskSay({szErr});
	-- 	return nRetCode
	-- end
	
	-- local nTaskStep5 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_COMPOSE_TASK_ITEM, 1) 
	-- if nTaskStep5 == 0 then
	-- 	szErr = TL7_CONFIG.tbLang[31]
	-- 	CreateTaskSay({szErr});
	-- 	return nRetCode
	-- end


	nRetCode = 1
	return nRetCode 
end

--7×ª´¦Àí
function TransLife7:AfterTransLifeProcess()
	--add hieu ung trung sinh 7
	local szTitle = TL7_CONFIG.tbLang[21]
	Say(szTitle, 0);
	
	--Ôö¼Ó7×ª¼¼ÄÜ
	local nSelection = GetTask(TSK_ZHUANSHENG_7_PROPERTY)
	local tbIgnoreProperty = TB_IGNORE_PROPERTY[nSelection]
	if tbIgnoreProperty then
		local szSkillName, nSkillID, nSkillLevel = unpack(tbIgnoreProperty)
		AddMagic(nSkillID, nSkillLevel)
	end
	
	local nSeriesValue = GetSeries()
	local tbActiveParam = TB_TL7_SKILL_ADD_ACTIVE[nSeriesValue]
	local tbPassiveParam = TB_TL7_SKILL_ADD_PASSIVE[nSeriesValue]
	-- if  tbActiveParam then
	-- 	local szActiveSkillName, nActiveSkillID, nActiveLevel = unpack(tbActiveParam)
	-- 	AddMagic(nActiveSkillID, nActiveLevel)
	-- end
	
	-- if tbPassiveParam then
	-- 	local szPassiveSkillName, nPassiveSkillID, nPassiveLevel = unpack(tbPassiveParam)
	-- 	AddMagic(nPassiveSkillID, nPassiveLevel)
	-- end

	--admin add:
	AddSkillState(1582, 1, 1, 1555200 *1095 , 1) --add ng«i sao 3 n¨m
	AddMagicPoint(20)--add 20 ®iÓm kÜ n¨ng
	AddProp(100) --add 100 ®iÓm tiÒm n¨ng
	
	--Õë¶ÔÆäËû¼¼ÄÜ½øÐÐ´¦Àí£¬ÀýÈç£ºÇ¬À¤ÎÞÁ¿
	for nIndex, tbRemoveSkillParam in (TB_OTHER_SKILL_REMOVE) do
		local nOtherSkillIDRemove = unpack(tbRemoveSkillParam)
		DelMagic(nOtherSkillIDRemove)
	end
	
	for nIndex, tbAddSkillParam in (TB_OTHER_SKILL_ADD) do
		local nOtherSkillIDAdd, nOtherSkillIDLevel = unpack(tbAddSkillParam)
		AddMagic(nOtherSkillIDAdd, nOtherSkillIDLevel)
	end
	
end

tbTL7MainDlg = 
{

}

--½ðÉ½ÕÆÃÅNPC
function TransLife7:ShowMainDlg()
	CreateNewSayEx(TL7_CONFIG.tbLang[11], tbTL7MainDlg)
end

function TransLife7:Init()
	self:RegisterEvent()
	self:InitDialog()
	self:BeiDouOldManRegister()
end

function TransLife7:InitDialog()
	local tbOptClose = {TL7_CONFIG.tbLang[12]}
	tinsert(tbTL7MainDlg, {"B¾t ®Çu Trïng sinh 7", self.BeginTransLife7, {self}})
	tinsert(tbTL7MainDlg, {"KiÓm tra bÝ quyÕt Trïng sinh 7", self.LookUpTL7MiJue, {self}})
	tinsert(tbTL7MainDlg, tbOptClose)
end

function TransLife7:BeginTransLife7()
	local nCheckCode = self:CheckCondition()
	if nCheckCode ~= 1 then
		return
	end
	local is_ts7 = GetTask(TSK_TASK_IS_TS7)
	if(is_ts7 >0)then
		Talk(1, "", "§¹i HiÖp ®· trïng sinh lÇn 7 råi. Vâ c«ng rÊt th©m hËu, ta xin b¸i phôc!")
		Msg2Player("§¹i HiÖp ®· trïng sinh lÇn 7 råi. Vâ c«ng rÊt th©m hËu, ta xin b¸i phôc!")
		return
	end
	
	self:ChooseOneProperty()
end

function TransLife7:ChooseOneProperty()
	local tbOpp = {TL7_CONFIG.tbLang[22]};
		
	for nIndex, tbSelectProperty in TB_IGNORE_PROPERTY do
		local szSelection = tbSelectProperty[1]
		tinsert(tbOpp, format("%s/#tl_sure_learn(%d)", szSelection, nIndex));
	end
	tinsert(tbOpp, " KÕt thóc ®èi tho¹i!/OnCancel")
	CreateTaskSay(tbOpp);
end

function tl_sure_learn(nSelection)
	local tbOpp = {format(TL7_CONFIG.tbLang[23], TB_IGNORE_PROPERTY[nSelection][1])}
	tinsert(tbOpp, format("X¸c nhËn/#OnConfirm(%d)", nSelection))
	tinsert(tbOpp, "Lùa chän l¹i tõ ®Çu/OnReChooose")
	CreateTaskSay(tbOpp);
end

function OnConfirm(nSelection)
	TransLife7:SureLearn(nSelection)
end

function OnReChooose()
	TransLife7:ChooseOneProperty()
end

function TransLife7:SureLearn(nSelection)
	
	if (self:CheckCondition() == 0) then
		return 0;
	end
	
	local nConsumeCode = 1
	local tbTaskNeedItem = TL7_CONFIG.tbNeedItem
	for nIndex, tbItemParam in tbTaskNeedItem do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam)
		if ConsumeEquiproomItem(nNeedItemCount, nGenre, nDetail, nParticular, nLevel) ~= 1 then
			nConsumeCode = 0
			break
		end
	end
	
	if nConsumeCode == 0 then
		local szTitle = TL7_CONFIG.tbLang[19]
		Say(szTitle, 0 );
		return
	end
	--Msg2Player("TIEN HANH TRUNG SINH 7 =====1")
	SetTL7TaskValue(TL7_CONFIG.TSK_BIT_FINISH_TASK, 1)
	local n_transcount = ST_GetTransLifeCount()
	--Msg2Player("TIEN HANH TRUNG SINH 7 =====2")	
	SetTask(TSK_ZHUANSHENG_7_PROPERTY, nSelection)
	
	--×ªÉúÊ±µÄ´¦Àí
	LeaveTeam();	--½âÉ¢×é¶Ó¹ØÏµ
	--Msg2Player("TIEN HANH TRUNG SINH 7 =====3")
	SetTask(TSK_TASK_IS_TS7, 1)--active trïng sinh
	ST_DoTransLife();		--admin: h¹n chÕ trïng sinh 7
	--Msg2Player("TIEN HANH TRUNG SINH 7 =====4")
	--trõ level
	ST_LevelUp(-190)
	self:AfterTransLifeProcess()
end

function TransLife7:LookUpTL7MiJue()
	--Say(TL7_CONFIG.tbLang[8], 0)
	CreateNewSayEx(TL7_CONFIG.tbLang[8], {})
end

--ÎäÁÖÃË´«ÈË¶Ô»°¿ò
function TransLife7:OnTaskDialog()
	local aryTalk = {}
	tinsert(aryTalk, TL7_CONFIG.tbLang[37]);
	
	local nTaskAcceptFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_ACCEPT_TASK, 1) 
	local nTaskStateFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_KILL_BOSS, 1) 
	--if nTaskAcceptFlag == 0 then
		--tinsert(aryTalk, "½ÓÊÜ/OnAcceptTL7Task");
	--end
	if nTaskStateFlag == 0 then
		tinsert(aryTalk, "TiÕp nhËn/OnAcceptTL7Task");
	end
	
	if nTaskStateFlag == 1 then--Èç¹ûÒÑ¾­É±ÁËBOSS
		tinsert(aryTalk, "Trë vÒ/OnReplyTL7Task");
	end
	
	tinsert(aryTalk, " Hñy bá /OnCancelTL7Task");
	CreateTaskSay(aryTalk);
end

function OnAcceptTL7Task()
	TransLife7:OnAcceptTask()
end

function OnReplyTL7Task()
	TransLife7:OnReplyTask()
end

function TransLife7:OnAcceptTask()
	local nTaskStateFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_KILL_BOSS, 1) 
	if nTaskStateFlag == 1 then
		Say(TL7_CONFIG.tbLang[38], 0)
		return
	end
	
	local nCurFreeCount = CalcFreeItemCellCount()
	local nTotalNeedRoom = 1
	
	if %PlayerFunLib:CheckFreeBagCell(nTotalNeedRoom, "default") ~= 1 then
		Say(format(TL7_CONFIG.tbLang[4], nTotalNeedRoom), 0 );
		return 
	end
	
	local nRetCode = HaveCommonItem(TL7_CONFIG.tbBeiDouNeedItem[1], TL7_CONFIG.tbBeiDouNeedItem[2], TL7_CONFIG.tbBeiDouNeedItem[3])
	if nRetCode == 1 then
		Say(TL7_CONFIG.tbLang[6], 0)
		return
	end
	
	local nItemIndex = AddItem(unpack(TL7_CONFIG.tbBeiDouNeedItem))
	Msg2Player(format(TL7_CONFIG.tbLang[15], GetItemName(nItemIndex)))
	SetTL7TaskValue(TL7_CONFIG.TSK_BIT_ACCEPT_TASK, 1)
	Say(TL7_CONFIG.tbLang[7], 0 );
end

function TransLife7:OnReplyTask()
	local nGiveFengYeFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	if nGiveFengYeFlag == 1 then
		local szString = TL7_CONFIG.tbLang[5]
		Say(szString, 0 );
		return 
	end

	local nTotalNeedRoom = 1
	
	if %PlayerFunLib:CheckFreeBagCell(nTotalNeedRoom, "default") ~= 1 then
		Say(format(TL7_CONFIG.tbLang[4], nTotalNeedRoom), 0 );
		return 
	end
	
	local nHaveItemCheck = HaveCommonItem(TL7_CONFIG.tbBeiDouNeedItem[1], TL7_CONFIG.tbBeiDouNeedItem[2], TL7_CONFIG.tbBeiDouNeedItem[3])
	local szTitle = TL7_CONFIG.tbLang[2]
	if nHaveItemCheck == 1 then
		szTitle = TL7_CONFIG.tbLang[3]
	end

	local nBeiDouNeedItem = HaveCommonItem(TL7_CONFIG.tbGiveItem[1], TL7_CONFIG.tbGiveItem[2], TL7_CONFIG.tbGiveItem[3])
	local nGenre, nDetail, nParticular, nLevel = unpack(TL7_CONFIG.tbBeiDouNeedItem)
	local nDelCode = ConsumeEquiproomItem(1, nGenre, nDetail, nParticular, nLevel)
	if nBeiDouNeedItem == 0 and nDelCode == 1 then
		AddItem(unpack(TL7_CONFIG.tbGiveItem))
		SetTL7TaskValue(TL7_CONFIG.TSK_BIT_COMMIT_XINFENG, 1)
		SetTL7TaskValue(TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1)
	else
		szTitle = TL7_CONFIG.tbLang[18]
	end
	
	Say(szTitle, 0 );
end

function TransLife7:RegisterEvent()
	for nLevelConfig, tbParam in TB_SKILL_LEVEL_UP do
		--EventSys:GetType("OnPlayerLevelUp"):Reg(nLevelConfig, OnTL7LevelUp, nLevelConfig)
	end
	
	EventSys:GetType("SongJin"):Reg("OnFinish", TRANSLIFE7_OninishSongJin)  -- ËÎ½ð
	EventSys:GetType("YanDiBaoZang"):Reg("OnPass", TRANSLIFE7_OnYD)  -- Ñ×µÛ
	EventSys:GetType("ChuanGuan"):Reg("OnPass", TRANSLIFE7_OnBreakthrough)  -- ´³¹Ø£¨Ê¹ÓÃÁúÑªÍè£©
	EventSys:GetType("FengLingDu"):Reg("OnLanding", TRANSLIFE7_OnFenglingdu)-- ·çÁê¶É
	EventSys:GetType("SwordBurialMaze"):Reg("OnSingleFinish", TRANSLIFE7_OnSwordBurialMaze)  -- ½£Ú£ÃÔ¹¬
	EventSys:GetType("LongMenExpress"):Reg("OnFinish", TRANSLIFE7_OnLongMenExpress)  -- ÁúÃÅïÚ¾Ö
	EventSys:GetType("HarvestPlants"):Reg("tianlu_tree", TRANSLIFE7_OnDayTree)  -- ÖÖÊ÷
end

function TRANSLIFE7_OninishSongJin(nBattleLevel, tbPlayerAll)
	for i=1, getn(tbPlayerAll) do
		CallPlayerFunction(tbPlayerAll[i].nIndex, TransLife7.OnSongJinBattleTaskItem, TransLife7)
	end
end

function TRANSLIFE7_OnYD(nGuoGuanCount)
	TransLife7:OnYanDiTaskItem(nGuoGuanCount)
end

function TRANSLIFE7_OnBreakthrough(nChuanguanCount, tbAllPlayer, n_level)
	if nChuanguanCount == CHUANGGUAN_LIMIT then
		for i = 1, getn(tbAllPlayer) do 
			CallPlayerFunction(tbAllPlayer[i], TransLife7.OnBreakthroughTaskItem, TransLife7)
		end
	end
end

function TRANSLIFE7_OnFenglingdu(tbPlayerAll, bShuizeiTask)
	for i = 1, getn(tbPlayerAll) do
		CallPlayerFunction(tbPlayerAll[i], TransLife7.OnFenglingduTaskItem, TransLife7)
	end
end

function TRANSLIFE7_OnSwordBurialMaze()
	TransLife7:OnSwordBurialMazeTaskItem()
end

function TRANSLIFE7_OnLongMenExpress()
	TransLife7:OnLongmenExpressTaskItem()
end

function TRANSLIFE7_OnDayTree(nNpcIndex)
	TransLife7:OnDayTreeTaskItem()
end
---------------------------------------------------------
function OnTL7LevelUp()

	local nLevel = GetLevel()
	TransLife7:OnLevelUpProcess( nLevel)
end

function TransLife7:OnCollectionItem()
	g_GiveItemUI(TL7_CONFIG.tbLang[33], TL7_CONFIG.tbLang[34], {HandIn_OnFirstTimeOk, {}}, {}, 1)
end

function HandIn_OnFirstTimeOk(nCount)
	CreateTaskSay({TL7_CONFIG.tbLang[35], format("§ång ý!/#OnFirmCollection(%d)", nCount), " Hñy bá /OnCancelCollection"})
end

function OnFirmCollection(nCount)
	if nCount < 1 then
		CreateTaskSay({TL7_CONFIG.tbLang[36]})
		return 
	end
	TransLife7:OnSureCollectionItem(nCount)
end

function OnCancelCollection()

end

function TransLife7:OnSureCollectionItem(nCount)
	for nIndex=1, nCount do
		local nItemIndex = GetGiveItemUnit(nIndex)
		local nG, nD, nP = GetItemProp(nItemIndex)

		for nConfigIndex, tbItemCollection in (TB_COLLECTION_ITEM) do
			local nCollectionGenre, nCollectionDetail, nCollectionParticular = unpack(tbItemCollection)
			if nG == nCollectionGenre and nD == nCollectionDetail and nP == nCollectionParticular then
				RemoveItemByIndex(nItemIndex)
			end
		end
	end
end

function TransLife7:OnLevelUpProcess(nLevel)
	local nSeriesValue = GetSeries()
	local tbActiveParam = TB_TL7_SKILL_ADD_ACTIVE[nSeriesValue]
	local tbPassiveParam = TB_TL7_SKILL_ADD_PASSIVE[nSeriesValue]
	local nSkillLevel = TB_SKILL_LEVEL_UP[nLevel]

	if  tbActiveParam then
		local szActiveSkillName, nActiveSkillID, nActiveLevel = unpack(tbActiveParam)
		AddMagic(nActiveSkillID, nSkillLevel)
	end
	if tbPassiveParam then
		local szPassiveSkillName, nPassiveSkillID, nPassiveLevel = unpack(tbPassiveParam)
		AddMagic(nPassiveSkillID, nSkillLevel)
	end
	Talk(1, "", "Chóc mõng ®¹i hiÖp ®· lÜnh héi ®­îc vâ c«ng míi!")

end


function TransLife7:OnSongJinBattleTaskItem()
	local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	local nCheckCode = PlayerFunLib:CheckBT_PL_BATTLEPOINT(MIN_SONGJIN_POINT, ">=")
	local nFinishFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_FINISH_TASK, 1) 
	if nTaskStep2 == 1 and nCheckCode == 1 and nFinishFlag == 0 then
		tbAwardTemplet:Give(TB_SONGJIN_BATTLE_TASK_ITEM, 1, {TASK_ITEM_LOG_TITLE, SZ_SONGJIN_BATTLE_LOG})
	end
end

--Ñ×µÛ
function TransLife7:OnYanDiTaskItem(nGuoGuanCount)
	local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	local nFinishFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_FINISH_TASK, 1) 
	if nTaskStep2 == 1 and nGuoGuanCount == YANDI_COUNT and nFinishFlag == 0 then
		tbAwardTemplet:Give(TB_YANDI_TASK_ITEM, 1, {TASK_ITEM_LOG_TITLE, SZ_YANDI_LOG})
	end
end

--´³¹Ø
function TransLife7:OnBreakthroughTaskItem()
	local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	local nFinishFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_FINISH_TASK, 1) 
	if nTaskStep2 == 1 and nFinishFlag == 0 then
		tbAwardTemplet:Give(TB_BREAKTHROUGH_TASK_ITEM, 1, {TASK_ITEM_LOG_TITLE, SZ_BREAKTHROUGH_LOG})
	end
end

--·çÁê¶É
function TransLife7:OnFenglingduTaskItem()
	local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	local nFinishFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_FINISH_TASK, 1) 
	if nTaskStep2 == 1 and nFinishFlag == 0 then
		tbAwardTemplet:Give(TB_FENGLINGDU_TASK_ITEM, 1, {TASK_ITEM_LOG_TITLE, SZ_FENGLING_LOG})
	end
end

--½£Ú£ÃÔ¹¬
function TransLife7:OnSwordBurialMazeTaskItem()
	local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	local nFinishFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_FINISH_TASK, 1) 
	if nTaskStep2 == 1 and nFinishFlag == 0 then
		tbAwardTemplet:Give(TB_SWORDBURIALMAZE_TASK_ITEM, 1, {TASK_ITEM_LOG_TITLE, SZ_SWORDBURIALMAZE_LOG})
	end
end

--ÁúÃÅïÚ¾Ö
function TransLife7:OnLongmenExpressTaskItem()
	local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	local nFinishFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_FINISH_TASK, 1) 
	if nTaskStep2 == 1 and nFinishFlag == 0 then
		tbAwardTemplet:Give(TB_LONGMENEXPRESS_TASK_ITEM, 1, {TASK_ITEM_LOG_TITLE, SZ_LONGMENEXPRESS_LOG})
	end
end

--ÌìÂ»Êý
function TransLife7:OnDayTreeTaskItem()
	local nTaskStep2 = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_GIVE_FENGYE, 1) 
	local nFinishFlag = GetBitTask(TL7_CONFIG.TSK_TASK_STATE, TL7_CONFIG.TSK_BIT_FINISH_TASK, 1) 
	if nTaskStep2 == 1 and nFinishFlag == 0 then
		tbAwardTemplet:Give(TB_DAYTREE_TASK_ITEM, 1, {TASK_ITEM_LOG_TITLE, SZ_DAY_TREE_LOG})
	end
end

function TransLife7:BeiDouOldManRegister()
	local szNpcName = g_tbCreateBossNpcParam.szName
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	EventSys:GetType("NpcDeathByDamage"):Reg(szNpcName, TransLife7BeiDouDeath)
end

function TransLife7BeiDouDeath(nNpcIndex, nPlayerIndex)
	--nPlayerIndex£¬»÷É±Ñª×î¶àµÄÈË£¿
	--print("Êä³öÉËº¦×î¶àµÄÊÇ£º",nPlayerIndex)
	--print("×îºóÒ»»÷µÄÊÇ£º",PlayerIndex)
	
	local nPlayerIndexBak = PlayerIndex
	PlayerIndex = nPlayerIndex
	local nRemoveFlag = GetNpcParam(nNpcIndex, 2)--±êÖ¾npcÒÆ³ý
	if nRemoveFlag == 1 then
		PlayerIndex = nPlayerIndexBak
		return 0
	end
	
	local nBelongUUID = GetNpcParam(nNpcIndex, 1)
	local nCheckCode = 0 

	local nTeamSize = GetTeamSize()
	if nTeamSize > 0 then
		for nIndex = 1, nTeamSize do
			local nPlayerIndexSubBak = PlayerIndex
			PlayerIndex = GetTeamMember(nIndex)
			local nTeamMemberUUID = GetUUID()
			if mod(nTeamMemberUUID, g_nNpcParamFactor) == nBelongUUID then
				nCheckCode = 1
				PlayerIndex = nPlayerIndexSubBak
				break
			end
			PlayerIndex = nPlayerIndexSubBak
		end
	else
		local nCurUUID = GetUUID()
		if mod(nCurUUID, g_nNpcParamFactor) == nBelongUUID then
			nCheckCode = 1
		end
	end
	
	if nCheckCode == 0 then
		Msg2Player(TL7_CONFIG.tbLang[24])
		PlayerIndex = nPlayerIndexBak
		return 0
	end
	
	local nMapX, nMapY, nSubWorldIdx = GetNpcPos(nNpcIndex);
	local nMapID = SubWorldIdx2ID(nSubWorldIdx);
	
	g_tbCreateNpcParam.tbNpcParam = {}
	tinsert(g_tbCreateNpcParam.tbNpcParam, mod(nBelongUUID, g_nNpcParamFactor))
	
	local nNpcIndex = basemission_CallNpc(g_tbCreateNpcParam, nMapID, nMapX, nMapY)
	if nNpcIndex > 0 then
		SetTL7TaskValue(TL7_CONFIG.TSK_BIT_KILL_BOSS, 1)
	end
	PlayerIndex = nPlayerIndexBak
	return 0
end

function SetTL7TaskValue(nTaskSubID, nTaskSubValue)
	SetBitTask(TL7_CONFIG.TSK_TASK_STATE, nTaskSubID, 1, nTaskSubValue) 
	PlayerLoginSyncTL7Task()
end

function PlayerLoginSyncTL7Task()
	SyncTaskValue(TL7_CONFIG.TSK_TASK_STATE)
end


function GetSkillAfterTS7()
		if(CheckConditionGetSkill() ~= 1)then
			return
		end
	CreateTaskSay({"<dec><npc> Vâ c«ng trong thiªn h¹ bao la réng lín. Ta sÏ truyÒn thô cho ®¹i hiÖp vâ c«ng th­îng thõa nhÊt.",
		"X¸c NhËn LÜnh Héi/OnTL7LevelUp",
		--"Chi Hé/#OnTL7LevelUp(2)",
		"Ta biÕt rå/OnCancel"});
end


function CheckConditionGetSkill( )
	if (GetTask(TSK_TASK_IS_TS7) <1 ) then --kiem tra da trung 7 hay ch­a
		Talk(1, "", "§¹i hiÖp xin h·y trïng sinh 7 råi quay l¹i")
		return 0
	end
	return 1
end

TransLife7:Init()