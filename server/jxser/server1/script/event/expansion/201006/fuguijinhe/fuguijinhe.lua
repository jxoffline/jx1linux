Include("\\script\\event\\expansion\\201006\\fuguijinhe\\head.lua")

--------------------Task--------------------
tbJinhe_tsk = TaskManager:Create(1, 2);
tbJinhe_tsk.TSK_BETNUM_1_4 = 1;
tbJinhe_tsk.TSK_BETNUM_5_8 = 2;
tbJinhe_tsk.TSK_BETNUM_9_12 = 3;
tbJinhe_tsk.TSK_BETNUM_13_16 = 4;
tbJinhe_tsk.TSK_BETNUM_17_20 = 5;
tbJinhe_tsk.TSK_BET_CUR_DATE = 6;
tbJinhe_tsk.TSK_BET_CUR_COUNT = 7;
tbJinhe_tsk.TSK_BET_DAILY_SPEC_AWARD = 8;
tbJinhe_tsk.TSK_BET_LAST_DATE = 9;
tbJinhe_tsk.TSK_BET_LAST_COUNT = 10;
tbJinhe_tsk.TSK_LAST_BETNUM_1_4 = 11;
tbJinhe_tsk.TSK_LAST_BETNUM_5_8 = 12;
tbJinhe_tsk.TSK_LAST_BETNUM_9_12 = 13;
tbJinhe_tsk.TSK_LAST_BETNUM_13_16 =14;
tbJinhe_tsk.TSK_LAST_BETNUM_17_20 = 15;
tbJinhe_tsk.TSK_BET_DAILY_NORMAL_AWARD = 16;
tbJinhe_tsk.TSK_BET_TOTAL_SPEC_AWARD = 17;

tbJinhe_tsk.nCurBetDate = 0;
tbJinhe_tsk.nLastBetDate = 0;

function tbJinhe_tsk:ResetTaskForDay()
	local nCurDate = self:GetTask(self.TSK_BET_CUR_DATE)
	local nCurCount = self:GetTask(self.TSK_BET_CUR_COUNT)

	if (nCurDate ~= self.nCurBetDate or nCurDate == 0) then
		-- ÐÂµÄÒ»ÂÖ,ÉÏÒ»ÂÖ½á¹ûÒÑ¾­³öÀ´
		
		if (nCurDate == self.nLastBetDate and self.nLastBetDate ~= 0) then
			--±£´æÉÏÒ»ÂÖÍ¶µÄÊý×Ö
			self:SetTask(self.TSK_BET_LAST_DATE, nCurBetDate)
			self:SetTask(self.TSK_BET_LAST_COUNT, nCurCount)
			self:SetTask(self.TSK_BET_DAILY_SPEC_AWARD, 0)
			self:SetTask(self.TSK_BET_DAILY_NORMAL_AWARD, 0)
			
			self:SetTask(self.TSK_LAST_BETNUM_1_4, self:GetTask(self.TSK_BETNUM_1_4))
			self:SetTask(self.TSK_LAST_BETNUM_5_8, self:GetTask(self.TSK_BETNUM_5_8))
			self:SetTask(self.TSK_LAST_BETNUM_9_12, self:GetTask(self.TSK_BETNUM_9_12))
			self:SetTask(self.TSK_LAST_BETNUM_13_16, self:GetTask(self.TSK_BETNUM_13_16))
			self:SetTask(self.TSK_LAST_BETNUM_17_20, self:GetTask(self.TSK_BETNUM_17_20))
		else
			self:SetTask(self.TSK_BET_LAST_DATE, self.nLastBetDate)
			self:SetTask(self.TSK_BET_LAST_COUNT, 0)
			self:SetTask(self.TSK_BET_DAILY_SPEC_AWARD, 0)
			self:SetTask(self.TSK_BET_DAILY_NORMAL_AWARD, 0)
			
			self:SetTask(self.TSK_LAST_BETNUM_1_4, 0)
			self:SetTask(self.TSK_LAST_BETNUM_5_8, 0)
			self:SetTask(self.TSK_LAST_BETNUM_9_12, 0)
			self:SetTask(self.TSK_LAST_BETNUM_13_16, 0)
			self:SetTask(self.TSK_LAST_BETNUM_17_20, 0)
		end
		
		self:SetTask(self.TSK_BET_CUR_DATE, self.nCurBetDate)
		self:SetTask(self.TSK_BET_CUR_COUNT, 0)
		self:SetTask(self.TSK_BETNUM_1_4, 0)
		self:SetTask(self.TSK_BETNUM_5_8, 0)
		self:SetTask(self.TSK_BETNUM_9_12, 0)
		self:SetTask(self.TSK_BETNUM_13_16, 0)
		self:SetTask(self.TSK_BETNUM_17_20, 0)
	end
end

function tbJinhe_tsk:GetCurBetNum(nNum)
	self:ResetTaskForDay();
	local nValue = 0;
	if (nNum >= 1 and nNum <= 4) then
		nValue = self:GetTask(self.TSK_BETNUM_1_4);
		nValue = GetByte(nValue, nNum);
	elseif (nNum >= 5 and nNum <= 8) then
		nValue = self:GetTask(self.TSK_BETNUM_5_8);
		nValue = GetByte(nValue, nNum - 4);
	elseif (nNum >= 9 and nNum <= 12) then
		nValue = self:GetTask(self.TSK_BETNUM_9_12);
		nValue = GetByte(nValue, nNum - 8);
	elseif (nNum >= 13 and nNum <= 16) then
		nValue = self:GetTask(self.TSK_BETNUM_13_16);
		nValue = GetByte(nValue, nNum - 12);
	elseif (nNum >= 17 and nNum <= 20) then
		nValue = self:GetTask(self.TSK_BETNUM_17_20);
		nValue = GetByte(nValue, nNum - 16);
	end
	return nValue;
end

function tbJinhe_tsk:SetCurBetNum(nNum, nNumValue)
	self:ResetTaskForDay();
	local nValue = 0;
	if (nNum >= 1 and nNum <= 4) then
		nValue = self:GetTask(self.TSK_BETNUM_1_4);
		nValue = SetByte(nValue, nNum, nNumValue);
		self:SetTask(self.TSK_BETNUM_1_4, nValue);
	elseif (nNum >= 5 and nNum <= 8) then
		nValue = self:GetTask(self.TSK_BETNUM_5_8);
		nValue = SetByte(nValue, nNum - 4, nNumValue);
		self:SetTask(self.TSK_BETNUM_5_8, nValue);
	elseif (nNum >= 9 and nNum <= 12) then
		nValue = self:GetTask(self.TSK_BETNUM_9_12);
		nValue = SetByte(nValue, nNum - 8, nNumValue);
		self:SetTask(self.TSK_BETNUM_9_12, nValue);
	elseif (nNum >= 13 and nNum <= 16) then
		nValue = self:GetTask(self.TSK_BETNUM_13_16);
		nValue = SetByte(nValue, nNum - 12, nNumValue);
		self:SetTask(self.TSK_BETNUM_13_16, nValue);
	elseif (nNum >= 17 and nNum <= 20) then
		nValue = self:GetTask(self.TSK_BETNUM_17_20);
		nValue = SetByte(nValue, nNum - 16, nNumValue);
		self:SetTask(self.TSK_BETNUM_17_20, nValue);
	end
end

function tbJinhe_tsk:GetLastBetNum(nNum)
	self:ResetTaskForDay();
	local nValue = 0;
	if (nNum >= 1 and nNum <= 4) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_1_4);
		nValue = GetByte(nValue, nNum);
	elseif (nNum >= 5 and nNum <= 8) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_5_8);
		nValue = GetByte(nValue, nNum - 4);
	elseif (nNum >= 9 and nNum <= 12) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_9_12);
		nValue = GetByte(nValue, nNum - 8);
	elseif (nNum >= 13 and nNum <= 16) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_13_16);
		nValue = GetByte(nValue, nNum - 12);
	elseif (nNum >= 17 and nNum <= 20) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_17_20);
		nValue = GetByte(nValue, nNum - 16);
	end
	return nValue;
end

function tbJinhe_tsk:SetLastBetNum(nNum, nNumValue)
	self:ResetTaskForDay();
	local nValue = 0;
	if (nNum >= 1 and nNum <= 4) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_1_4);
		nValue = SetByte(nValue, nNum, nNumValue);
		self:SetTask(self.TSK_LAST_BETNUM_1_4, nValue);
	elseif (nNum >= 5 and nNum <= 8) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_5_8);
		nValue = SetByte(nValue, nNum - 4, nNumValue);
		self:SetTask(self.TSK_LAST_BETNUM_5_8, nValue);
	elseif (nNum >= 9 and nNum <= 12) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_9_12);
		nValue = SetByte(nValue, nNum - 8, nNumValue);
		self:SetTask(self.TSK_LAST_BETNUM_9_12, nValue);
	elseif (nNum >= 13 and nNum <= 16) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_13_16);
		nValue = SetByte(nValue, nNum - 12, nNumValue);
		self:SetTask(self.TSK_LAST_BETNUM_13_16, nValue);
	elseif (nNum >= 17 and nNum <= 20) then
		nValue = self:GetTask(self.TSK_LAST_BETNUM_17_20);
		nValue = SetByte(nValue, nNum - 16, nNumValue);
		self:SetTask(self.TSK_LAST_BETNUM_17_20, nValue);
	end
end

function tbJinhe_tsk:GetCurBetCount()
	self:ResetTaskForDay()
	return self:GetTask(self.TSK_BET_CUR_COUNT);
end

function tbJinhe_tsk:SetCurBetCount(nCount)
	self:ResetTaskForDay()
	return self:SetTask(self.TSK_BET_CUR_COUNT, nCount);
end

function tbJinhe_tsk:AddCurBetCount(nCount)
	self:ResetTaskForDay()
	return self:AddTask(self.TSK_BET_CUR_COUNT, nCount);
end

function tbJinhe_tsk:GetLastBetCount()
	self:ResetTaskForDay()
	return self:GetTask(self.TSK_BET_LAST_COUNT);
end

function tbJinhe_tsk:SetLastBetCount(nCount)
	self:ResetTaskForDay()
	return self:SetTask(self.TSK_BET_LAST_COUNT, nCount);
end

function tbJinhe_tsk:AddLastBetCount(nCount)
	self:ResetTaskForDay()
	return self:AddTask(self.TSK_BET_LAST_COUNT, nCount);
end

function tbJinhe_tsk:GetSpecAwardCount()
	self:ResetTaskForDay()
	return self:GetTask(self.TSK_BET_DAILY_SPEC_AWARD);
end

function tbJinhe_tsk:SetSpecAwardCount(nCount)
	self:ResetTaskForDay()
	return self:SetTask(self.TSK_BET_DAILY_SPEC_AWARD, nCount);
end

function tbJinhe_tsk:AddSpecAwardCount(nCount)
	self:ResetTaskForDay()
	return self:AddTask(self.TSK_BET_DAILY_SPEC_AWARD, nCount);
end

function tbJinhe_tsk:GetNormalAwardCount()
	self:ResetTaskForDay()
	return self:GetTask(self.TSK_BET_DAILY_NORMAL_AWARD);
end

function tbJinhe_tsk:SetNormalAwardCount(nCount)
	self:ResetTaskForDay()
	return self:SetTask(self.TSK_BET_DAILY_NORMAL_AWARD, nCount);
end

function tbJinhe_tsk:AddNormalAwardCount(nCount)
	self:ResetTaskForDay()
	return self:AddTask(self.TSK_BET_DAILY_NORMAL_AWARD, nCount);
end

function tbJinhe_tsk:GetTotalSpecAwardCount()
	return self:GetTask(self.TSK_BET_TOTAL_SPEC_AWARD);
end

function tbJinhe_tsk:SetTotalSpecAwardCount(nCount)
	return self:SetTask(self.TSK_BET_TOTAL_SPEC_AWARD, nCount);
end

function tbJinhe_tsk:AddTotalSpecAwardCount(nCount)
	return self:AddTask(self.TSK_BET_TOTAL_SPEC_AWARD, nCount);
end

function tbJinhe_tsk:SetCurBetDate(nDate)
	self.nLastBetDate = self.nCurBetDate;
	self.nCurBetDate = nDate;
end

--------------------BetInfo--------------------
tbBetInfo = {}
tbBetInfo.nTotalBet = 0;
tbBetInfo.tbNormalNum = {};
tbBetInfo.tbSpecNum = {};
tbBetInfo.nStartDate = 20100709;
tbBetInfo.nEndDate = 20100822;
tbBetInfo.tbNormalAward =
{
	-- §iÒu ChØnh Phó Quý CÈm Hép - Created by AnhHH  20110919
	{nExp_tl = 20000000},
--	{szName="Kim Bµi", tbProp={6,1,1481,1,0,0}, nExpiredTime = 10080},
}
tbBetInfo.tbSpecAward =
{
	-- §iÒu ChØnh Phó Quý CÈm Hép - Created by AnhHH  20110919
	{nExp_tl = 200000000},
	{szName="Tói May M¾n", tbProp={6,1,30111,1,0,0}, nExpiredTime = 1380},
--	{szName="Ngäc Bµi", tbProp={6,1,1482,1,0,0}, nExpiredTime = 10080},
--	{szName="NhÊt Kû Cµn Kh«n Phï", tbProp={6,1,2126,1,0,0}, nExpiredTime = 43200},
--	{szName="ThÇn Hµnh To¸i PhiÕn", tbProp={6,1,2410,1,0,0}, nCount=18, nExpiredTime = 20100823},
}

function tbBetInfo:IsActive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nNextDay = nDate;
	
	-- ÕâÀïÒª½øÐÐÏÂÒ»ÂÖ,»ñÈ¡µÚ¶þÌìµÄÈÕÆÚ
	if (nTime >= 221000) then
		nTime = Tm2Time(tonumber(GetLocalDate("%Y")), tonumber(GetLocalDate("%m")), tonumber(GetLocalDate("%d")))
		nTime = nTime + 24 * 60 * 60;
		local tbTM = Time2Tm(nTime);
		nNextDay = tbTM[1]*10000 + tbTM[2]*100 + tbTM[3];
	end
	
--	if (self.nStartDate <= nNextDay and nNextDay <= self.nEndDate) then
--		return 1;
--	end
	
	return 1;
end

function tbBetInfo:AddBetCount(nCount)
	local nAddCount = nCount or 1;
	self.nTotalBet = self.nTotalBet + nAddCount;
end

function tbBetInfo:SetTotalBetCount(nCount)
	self.nTotalBet = nCount;
end

function tbBetInfo:GetBetCount()
	return self.nTotalBet;
end

function tbBetInfo:ClearNumInfo()
	self.tbNormalNum = {};
	self.tbSpecNum = {};
end

function tbBetInfo:IsNumExist(nValue)
	local bExsit = 0;
	local bSpec = 0;
	for i=1,getn(self.tbNormalNum) do
		if (self.tbNormalNum[i] == nValue) then
			bExsit = 1;
			break;
		end
	end
	
	if (bExsit == 0) then
		for i=1,getn(self.tbSpecNum) do
			if (self.tbSpecNum[i] == nValue) then
				bExsit = 1;
				bSpec = 1;
				break;
			end
		end
	end
	
	return bExsit, bSpec;
end

function tbBetInfo:AddNormalNum(nValue)
	--print("tbBetInfo:AddNormalNum", nValue)
	if (self:IsNumExist(nValue) == 0) then
		tinsert(self.tbNormalNum,nValue);
	end
end

function tbBetInfo:AddSpecNum(nValue)
	--print("tbBetInfo:AddSpecNum", nValue)
	if (self:IsNumExist(nValue) == 0) then
		tinsert(self.tbSpecNum,nValue);
	end
end

function tbBetInfo:GetNormalNumInfo()
	local szInfo = "";
	for i=1,getn(self.tbNormalNum) do
		szInfo = format("%s %d", szInfo, self.tbNormalNum[i]);
	end
	return szInfo;
end

function tbBetInfo:GetSpecNumInfo()
	local szInfo = "";
	for i=1,getn(self.tbSpecNum) do
		szInfo = format("%s %d", szInfo, self.tbSpecNum[i]);
	end
	return szInfo;
end

function tbBetInfo:GetCurBetNumInfo()
	local szInfo = "";
	local nCount = tbJinhe_tsk:GetCurBetCount()
	
	for i=1,nCount do
		szInfo = format("%s %d", szInfo, tbJinhe_tsk:GetCurBetNum(i));
	end
	return szInfo;
end

function tbBetInfo:GetLastBetNumInfo()
	local szInfo = "";
	local nCount = tbJinhe_tsk:GetLastBetCount()
	
	for i=1,nCount do
		szInfo = format("%s %d", szInfo, tbJinhe_tsk:GetLastBetNum(i));
	end
	return szInfo;
end

function tbBetInfo:Bet(nValue)
	if (self:IsActive() ~= 1) then
		return 0;
	end
	
	if (nValue < 10 or nValue > 99) then
		Talk(1,"","ChØ ®­îc phÐp nhËp tõ sè 10 ®Õn 99.");
		return 0;
	end
	
	if ConsumeEquiproomItem(1, 6, 1, 2402, -1) ~= 1 then
		Talk(1,"","ña, sao ta kh«ng thÊy ng­¬i cÇm cÈm h¹p nhØ, kiÓm tra l¹i thö xem.");
		return 0;
	end
		
	tbJinhe_tsk:AddCurBetCount(1);
	local nCount = tbJinhe_tsk:GetCurBetCount();
	tbJinhe_tsk:SetCurBetNum(nCount, nValue);

	RemoteExecute("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "AddBetCount", 0);
	
	PlayerFunLib:AddExp(6000000,0,format("fuguijinhe\tbet number%d",nValue));
	Msg2Player(format("§· chän <color=green>%d<color> ®ång thêi nhËn ®­îc %d kinh nghiÖm",nValue,6000000))
	
	return 1;
end

function tbBetInfo:UseJinhe()
	if (PlayerFunLib:CheckLevel(50, "default", ">=") ~= 1) then
		return 0;
	end
	
	local nCount = tbJinhe_tsk:GetCurBetCount();

	if (nCount >= 20) then
		Talk(1, "", format("Mçi nh©n vËt mçi ®ît ho¹t ®éng chØ ®­îc sö dông %d lÇn.",20));
		return 0;
	end
	
	g_AskClientNumberEx(10, 99, "NhËp sè 10-99", {self.Bet, {self}} );
	
	-- ÔÚÊäÈëÊý×ÖÍ¶×¢ÒÔºóÔÚÉ¾³ýÎïÆ·
	return 0;
end

function tbBetInfo:AddNpc()
	local npcidx = AddNpc(455, 1, SubWorldID2Idx(37), 1762 * 32, 3049 * 32, 1, "ThÇn Tµi");
	SetNpcScript(npcidx, "\\script\\activitysys\\npcdailog.lua");
end

function tbBetInfo:Init()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nNextDay = nDate;
	
	-- ÕâÀïÒª½øÐÐÏÂÒ»ÂÖ,»ñÈ¡µÚ¶þÌìµÄÈÕÆÚ
	if (nTime >= 221000) then
		nTime = Tm2Time(tonumber(GetLocalDate("%Y")), tonumber(GetLocalDate("%m")), tonumber(GetLocalDate("%d")))
		nTime = nTime + 24 * 60 * 60;
		local tbTM = Time2Tm(nTime);
		nNextDay = tbTM[1]*10000 + tbTM[2]*100 + tbTM[3];
	end

	tbJinhe_tsk.nCurBetDate = nNextDay;
	
	self:AddNpc();
end

function tbBetInfo:GetAwardCount()
	local nNorm = 0;
	local nSpec = 0;
	
	local nCount = tbJinhe_tsk:GetLastBetCount()
	
	for i=1,nCount do
		local bExsit, bSpec = self:IsNumExist(tbJinhe_tsk:GetLastBetNum(i));
		if (bExsit == 1) then
			if (bSpec == 1) then
				nSpec = nSpec + 1;
			else
				nNorm = nNorm + 1;
			end
		end
	end
	
	return nNorm, nSpec;
end

function tbBetInfo:CurBetInfo_dlg()
	local szTitle =  format("<npc>§ît thi nµy cã <color=green>%d<color> lÇn chän, c¸c h¹ ®· chän <color=green>%d<color> lÇn sè <enter><color=green>%s<color>", self.nTotalBet, tbJinhe_tsk:GetCurBetCount(), self:GetCurBetNumInfo());
	local tbOpt = {}
	tinsert(tbOpt, {"Ta ®· biÕt råi. "})
	CreateNewSayEx(szTitle, tbOpt);
end

function tbBetInfo:LastBetInfo_dlg()
	local nNorm, nSpec = self:GetAwardCount();
	local szTitle = "";
	
	if (getn(self.tbNormalNum) == 0 or getn(self.tbSpecNum) == 0)  then
		szTitle = "HiÖn t¹i vÉn ch­a cã sè may m¾n";
	else
		szTitle =  format("<npc>Sè may m¾n lÇn tr­íc<enter>Sè th­êng: <color=green>%s<color><enter>Sè ®Æc biÖt: <color=green>%s<color><enter>Ng­¬i ®· chän sè: <color=green>%s<color><enter>§· chän tróng <color=red>%d<color> sè phæ th«ng, <color=red>%d<color> sè ®Æc biÖt<enter>Cã thÓ nhËn <color=red>%d<color> phÇn th­ëng phæ th«ng, <color=red>%d<color> phÇn th­ëng ®Æc biÖt", self:GetNormalNumInfo(), self:GetSpecNumInfo(), self:GetLastBetNumInfo(), nNorm, nSpec, max(min(nNorm,20) - tbJinhe_tsk:GetNormalAwardCount(),0), max(min(nSpec, 1) - tbJinhe_tsk:GetSpecAwardCount(),0));
	end
	local tbOpt = {}
	tinsert(tbOpt, {"Ta ®· biÕt råi. "})
	CreateNewSayEx(szTitle, tbOpt);
end

function tbBetInfo:GetAward_dlg()
	local nNorm, nSpec = self:GetAwardCount();
	local szTitle = "";
	
	if (getn(self.tbNormalNum) == 0 or getn(self.tbSpecNum) == 0)  then
		szTitle = "HiÖn t¹i vÉn ch­a cã sè may m¾n";
	else
		szTitle =  format("<npc>Sè may m¾n lÇn tr­íc<enter>Sè th­êng: <color=green>%s<color><enter>Sè ®Æc biÖt: <color=green>%s<color><enter>Ng­¬i ®· chän sè: <color=green>%s<color><enter>§· chän tróng <color=red>%d<color> sè phæ th«ng, <color=red>%d<color> sè ®Æc biÖt<enter>Cã thÓ nhËn <color=red>%d<color> phÇn th­ëng phæ th«ng, <color=red>%d<color> phÇn th­ëng ®Æc biÖt", self:GetNormalNumInfo(), self:GetSpecNumInfo(), self:GetLastBetNumInfo(), nNorm, nSpec, max(min(nNorm,20) - tbJinhe_tsk:GetNormalAwardCount(), 0), max(min(nSpec, 1) - tbJinhe_tsk:GetSpecAwardCount(),0));
	end
	
	local tbOpt = 
		{
			{"NhËn phÇn th­ëng phæ th«ng", tbBetInfo.GetNormalAward, {tbBetInfo}},
			{"NhËn phÇn th­ëng ®Æc biÖt", tbBetInfo.GetSpecAward, {tbBetInfo}},
			{"§Ó ta suy nghÜ l¹i"}
		}
	CreateNewSayEx(szTitle, tbOpt);
end

function tbBetInfo:GetNormalAward()
	local nNorm, nSpec = self:GetAwardCount();
	if ((nNorm - tbJinhe_tsk:GetNormalAwardCount()) <= 0) then
		Talk(1, "", "Ng­¬i ®· hÕt c¬ héi nhËn th­ëng");
		return
	end
	
	if (tbJinhe_tsk:GetNormalAwardCount() >= 20) then
		Talk(1, "", format("Mçi mét ®ît mçi nh©n vËt nhiÒu nhÊt chØ nhËn ®­îc %d lÇn th­ëng",20));
		return
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 ) then
		return
	end
	
	tbAwardTemplet:Give(self.tbNormalAward, 1, {"FuGuiJinHe", format("%s\t%s","Ho¹t ®éng phó quý","PhÇn th­ëng phæ th«ng")});
	tbJinhe_tsk:AddNormalAwardCount(1);
end

function tbBetInfo:GetSpecAward()
	local nNorm, nSpec = self:GetAwardCount();
	if ((nSpec - tbJinhe_tsk:GetSpecAwardCount()) <= 0) then
		Talk(1, "", "Ng­¬i ®· hÕt c¬ héi nhËn th­ëng");
		return
	end
	
	if (tbJinhe_tsk:GetSpecAwardCount() >= 1) then
		Talk(1, "", format("Mçi mét ®ît mçi nh©n vËt nhiÒu nhÊt chØ nhËn ®­îc %d lÇn th­ëng",1));
		return
	end
	
	-- §iÒu ChØnh Phó Quý CÈm Hép - Created by AnhHH  20110919
--	if (tbJinhe_tsk:GetTotalSpecAwardCount() >= 12) then
--		Talk(1, "", format("Trong thêi gian ho¹t ®éng mçi nh©n vËt nhiÒu nhÊt chØ ®­îc nhËn %d lÇn th­ëng",12));
--		return
--	end
	
	if (PlayerFunLib:CheckFreeBagCell(3, "default") ~= 1 ) then
		return
	end
	
	tbAwardTemplet:Give(self.tbSpecAward, 1,{"FuGuiJinHe", format("%s\t%s","Ho¹t ®éng phó quý","PhÇn th­ëng ®Æc biÖt")});
	tbJinhe_tsk:AddSpecAwardCount(1);
	
	-- §iÒu ChØnh Phó Quý CÈm Hép - Created by AnhHH  20110919
--	tbJinhe_tsk:AddTotalSpecAwardCount(1);
end