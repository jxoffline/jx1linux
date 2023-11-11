Include("\\vng_script\\activitysys\\config\\1023\\head.lua")
Include("\\vng_script\\activitysys\\config\\1023\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1023\\awardlist.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\misc\\eventsys\\type\\map.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
IncludeLib("SETTING");

pActivity.nPak = curpack()
AddMonster = {}
AddMonster.PlayerName ={}
AddMonster.BossName ={}
AddMonster.Timer ={}
AddMonster.TimerCount ={}
function pActivity:IsOpen()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (nCurDate >= self.nStartDate and nCurDate < self.nEndDate) then
		return 1;
	else
		return 0;
	end
end
function pActivity:IsGoldTime()
	local nCurHour = tonumber(GetLocalDate("%H%M"));
	if (nCurHour >= 1900 and nCurHour <= 2000) then			
		return 1
	else
		return 0
	end
end

function pActivity:Init()
	self:LoadDataFromConfig()
	self:AddNpcBox()
end

pActivity.tbObjPos = {}
function pActivity:LoadDataFromConfig()
	if (TabFile_Load(NPC_BOX_INFO, NPC_BOX_INFO) == 0) then
		print("Load TabFile Error!"..NPC_BOX_INFO)
		return 0
	end
	local nTotalRow = TabFile_GetRowCount(NPC_BOX_INFO)
	
	self.tbObjPos = {}
	for nRow = 2, nTotalRow do
		local tbPos = {}	
		tbPos.nMapId = tonumber(TabFile_GetCell(NPC_BOX_INFO, nRow, "MapId"));
		tbPos.nX = tonumber(TabFile_GetCell(NPC_BOX_INFO, nRow, "nX"));
		tbPos.nY = tonumber(TabFile_GetCell(NPC_BOX_INFO, nRow, "nY"));
		tbPos.nNpcRes = tonumber(TabFile_GetCell(NPC_BOX_INFO, nRow, "NpcRes"));
		tbPos.szObjName = TabFile_GetCell(NPC_BOX_INFO, nRow, "NpcName");
		tbPos.szNpcScript = TabFile_GetCell(NPC_BOX_INFO, nRow, "NpcScript");
		--tbPos.nTaskId = tonumber(TabFile_GetCell(NPC_BOX_INFO, nRow, "TaskId"));
		tinsert(self.tbObjPos, tbPos)
	end
	return 1;
end

function pActivity:AddNpcBox()
	for i=1,getn(self.tbObjPos) do
		local tbPos = self.tbObjPos[i]
		local nNpcIdx = AddNpc(tbPos.nNpcRes, 1, SubWorldID2Idx(tbPos.nMapId), tbPos.nX * 32, tbPos.nY * 32, 0, tbPos.szObjName)
		if (nNpcIdx ~= nil and nNpcIdx >= 0) then			
			SetNpcScript(nNpcIdx, tbPos.szNpcScript)		
			--SetNpcParam(nNpcIdx, 1, tbPos.nTaskId);
		end
	end
	return 1
end
--call boss
function pActivity:AddMonster(nMapId,nX, nY)	
	local nRanIDBoss = random(1,4)
	local nIDBoss = %tbNpc_Monter[nRanIDBoss][1]
	local szBossName = %tbNpc_Monter[nRanIDBoss][2]	
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		local nNpcIdx = AddNpcEx(nIDBoss,1,random(0,4),nMapIndex, nX, nY,1,szBossName,1)
		SetNpcDeathScript(nNpcIdx,"\\vng_script\\activitysys\\config\\1023\\npc_box.lua")
		pActivity:AddChatNpc(nNpcIdx,%tbNpc_Monter_Chat)	
		--print("Add NPC IDX: "..nNpcIdx)
		if  nNpcIdx >= 0  then
			local nTimeOut =5*18
			local nTimerId =  AddTimer(nTimeOut, "OnTime_Monster", nNpcIdx)	
			AddMonster.Timer[nNpcIdx] = nTimerId
			AddMonster.TimerCount[nNpcIdx]  = 0
			--print("Add Timer ID: "..AddMonster.Timer[nNpcIdx])		
			tbLog:PlayerActionLog(%EVENT_LOG_TITLE,"BossXuatHien")
			return 1
		else
			local szLog = "ERROR_CallBoss: "..nMapId.." - "..nX.." - "..nY
			tbLog:PlayerActionLog(%EVENT_LOG_TITLE,szLog)
			return
		end
	end
end

function OnTime_Monster(nNpcIdx,nTimeOut )
	local nCount  = AddMonster.TimerCount[nNpcIdx]	
	if nCount <= 18 then
		AddMonster.TimerCount[nNpcIdx]  = nCount + 1		
		pActivity:SetFightAroundBoss(nNpcIdx)
		--cu 30s npc tu chat 1 lan 6*5 =30
		if nCount == 6 or nCount == 12 or nCount == 24 or nCount == 30 then
			pActivity:AddChatNpc(nNpcIdx,%tbNpc_Monter_Chat)		
		end
		return 5*18, nNpcIdx
	end
	DelNpc(nNpcIdx)
	local nTimerId =  AddMonster.Timer[nNpcIdx]
	DelTimer(nTimerId)
	AddMonster.Timer[nNpcIdx] = nil
	AddMonster.TimerCount[nNpcIdx] = nil
	return 0,0
end


function pActivity:AddChatNpc(nNpcIdx,tbStringChat)	
	if tbStringChat then
	 	local szBossChat = random (1,getn(tbStringChat))
		local szString = tbStringChat[szBossChat]
		SyncNpc(nNpcIdx)
		NpcChat(nNpcIdx,szString )	
	end
end

function pActivity:SetFightAroundBoss(nNpcIdx)	
	local nOldPlayer = PlayerIndex
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(nNpcIdx, 50)
	for i = 1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i]
		SetDeathType(-1)
		--dua gamer vao trang thai chien dau		
		if GetFightState() ~= 1 then			
			SetFightState(1)
		end
		SetDeathScript("\\vng_script\\activitysys\\config\\1023\\playerdeath.lua")
	end	
	PlayerIndex = nOldPlayer
end


function pActivity:OnEnterMapBK()	
	if self:IsOpen() == 1 then
		SetDeathType(-1)
		SetDeathScript("\\vng_script\\activitysys\\config\\1023\\playerdeath.lua")	
	end	
end
function pActivity:OnLeaveMapBK()	
	if pActivity:IsOpen() == 1 then
		SetDeathScript("")	
	end
end

EventSys:GetType("EnterMap"):Reg(37, pActivity.OnEnterMapBK, pActivity)
EventSys:GetType("LeaveMap"):Reg(37, pActivity.OnLeaveMapBK, pActivity)

--Use item
function pActivity:UseRuongTB()
	local nCountByMoney = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_USE_2000)
	local nCountByKey = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_USE_1000)
	local szString = format("\n<color=yellow>- §· më b»ng ng©n l­îng: %d R­¬ng\n- §· më b»ng ch×a khãa: %d R­¬ng<color>",nCountByMoney,nCountByKey)
	local szTitle = "Chän c¸ch sö dông R­¬ng ThÇn BÝ"..szString
	local tbOpt = {}	
	tinsert(tbOpt,  "Sö dông ng©n l­îng/#pActivity:UseMoney()")
	tinsert(tbOpt,  "Sö dông ch×a khãa/#pActivity:UseGoldKey()")		
	tinsert(tbOpt,  "§Ó ta suy nghÜ.../Cancel")
	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function pActivity:UseMoney()
	local nMoney = 10000
	if (GetCash() < nMoney) then 
		Talk(1, "", "H×nh nh­ ng­¬i kh«ng mang ®ñ 1 v¹n l­îng!")
		return nil
	end
	
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_LIMIT_USE_2000, MAX_2000, MSG_LIMITED_USE, "<") then
		return nil
	end
	if Pay(nMoney) ~= 1 then
		return nil
	end	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_2000, 1)
	local tbPropRuong = %ITEM_RUONGTHANBI.tbProp
	if (ConsumeItem(3, 1, tbPropRuong[1], tbPropRuong[2], tbPropRuong[3], -1)) ~= 1 then
		return
	end
	tbAwardTemplet:Give(tbAward_Mo_Ruong_Money,1,{EVENT_LOG_TITLE,"MoRuong_TienVan"})
	return 1
end
function pActivity:UseGoldKey()
	local tbProp = %ITEM_CK_THANBI.tbProp
	--kiem tra trong hanh trang tren nguoi
	local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	if (nCount < 1)  then
		Talk(1, "", "Kh«ng cã ch×a khãa sao më ®­îc r­¬ng!")
		return nil
	end
	
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_LIMIT_USE_1000, MAX_1000, MSG_LIMITED_USE, "<") then
		return nil
	end
	if (ConsumeItem(3, 1, tbProp[1], tbProp[2], tbProp[3], -1)) ~= 1 then
		return
	end
	local tbPropRuong = %ITEM_RUONGTHANBI.tbProp
	--ConsumeItem(-1, 1, tbPropRuong[1], tbPropRuong[2], tbPropRuong[3],-1)
	if ( ConsumeItem(3, 1, tbPropRuong[1], tbPropRuong[2], tbPropRuong[3],-1) ) ~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(tbBITTSK_LIMIT_USE_1000, 1)	
	tbAwardTemplet:Give(tbAward_Mo_Ruong_Key,1,{EVENT_LOG_TITLE,"MoRuong_Key_Exp"})
	tbAwardTemplet:Give(tbAward_Mo_Ruong_Key_Item,1,{EVENT_LOG_TITLE,"MoRuong_Key_Item"})
	return 1
end