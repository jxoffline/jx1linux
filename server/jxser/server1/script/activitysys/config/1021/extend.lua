Include("\\script\\activitysys\\config\\1021\\head.lua");
Include("\\script\\activitysys\\config\\1021\\variables.lua");
Include("\\script\\activitysys\\config\\1021\\awardlist.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING");

pActivity.nPak = curpack()

function pActivity:IsOpen()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (nCurDate >= self.nStartDate and nCurDate < self.nEndDate) then
		return 1;
	else
		return 0;
	end
end


-- Æô¶¯Ê±³õÊ¼»¯
-- µ¼ÈëOBJ×ø±êµã
-- ¼ÓÔØ²É¼¯OBJ
function pActivity:Init()
	self:LoadDataFromConfig();
	self:AddGatherObj();
end

pActivity.tbObjPos = {}
function pActivity:LoadDataFromConfig()
	if (TabFile_Load(POSPATH_CAIJI, POSPATH_CAIJI) == 0) then
		print("Load TabFile Error!"..POSPATH_CAIJI)
		return 0
	end
	local nTotalRow = TabFile_GetRowCount(POSPATH_CAIJI)
	
	self.tbObjPos = {}
	for nRow = 2, nTotalRow do
		local tbPos = {}	
		tbPos.nMapId = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "MapId"));
		tbPos.nX = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "X"));
		tbPos.nY = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "Y"));
		tbPos.nNpcRes = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "NpcRes"));
		tbPos.szObjName = TabFile_GetCell(POSPATH_CAIJI, nRow, "NpcName");
		tbPos.szNpcScript = TabFile_GetCell(POSPATH_CAIJI, nRow, "NpcScript");
		--tbPos.nTaskId = tonumber(TabFile_GetCell(POSPATH_CAIJI, nRow, "TaskId"));
		tinsert(self.tbObjPos, tbPos)
	end
	return 1;
end

function pActivity:AddGatherObj()
	for i=1,getn(self.tbObjPos) do
		local tbPos = self.tbObjPos[i];
		local nNpcIdx = AddNpc(tbPos.nNpcRes, 1, SubWorldID2Idx(tbPos.nMapId), tbPos.nX * 32, tbPos.nY * 32, 0, tbPos.szObjName);
		if (nNpcIdx ~= nil and nNpcIdx > 0) then
			SetNpcScript(nNpcIdx, tbPos.szNpcScript);
			--SetNpcParam(nNpcIdx, 1, tbPos.nTaskId);
		end
	end
	return 1;
end


function pActivity:UseAward2()	
	local tbAward = %tbUseAward2_Exp
	local szItemName = % ITEM_AWARD2.szName	
	local tbBitTaskLimit = %tbBITTSK_LIMIT_2
	self:UseAwardGetExp(tbAward, tbBitTaskLimit, szItemName)
	tbAwardTemplet:Give(%tbAward_Old, 1, {%EVENT_LOG_TITLE, "SuDungSuBiDonNhanItem"})
end

function pActivity:UseAwardGetExp(tbAward, tbBitTaskLimit, szItemName)	
	local tbUseAward_Exp = tbAward
	local tbBitTask = tbBitTaskLimit
	local szLogAction = "SuDung"..szItemName
	
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTask,tbBitTask.nMaxValue,%MSG_LIMITED_USE,"<") then
		return
	end
	--random  exp
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = tbUseAward_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbBitTask)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > tbBitTask.nMaxValue then
		nNextExp = (tbBitTask.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(tbBitTask, floor(nNextExp/1e6))	
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE,szLogAction})
	Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%s<color> exp, cßn cã thÓ nhËn ®­îc thªm <color=yellow>%s<color> exp tõ %s.", (nCurTskVal*1e6 + nNextExp), (tbBitTask.nMaxValue - nCurTskVal - (nNextExp/1e6))*1e6,szItemName)	)
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbBitTask)
end

function pActivity:WriteLogPoint( tbBitTaskLimit, szItemName)	
		local tbBitTask = tbBitTaskLimit		
		local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbBitTask)
		if (mod(nCurTskVal,10)~= 0) then
			return
		end
		local szLogAction = "Sö dông "..szItemName.." lÇn thø "..nCurTskVal		
		tbLog:PlayerActionLog(self.LOG_TITLE,szLogAction )	
end


