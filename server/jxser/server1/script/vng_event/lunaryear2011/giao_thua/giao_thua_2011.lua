Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
GiaoThua_2011 = {}

GiaoThua_2011.tbPos = 
{
	{11,3139,5063},
	{1,1595,3199},
	{176,1435,3281},
	{162,1621,3182},
	{80,1767,3030},
	{78,1580,3224},
	{37,1748,3077},
}

GiaoThua_2011.tbAwardExp = {szName = "§iÓm kinh nghiÖm", nExp = 1e6}
GiaoThua_2011.nTimerOut	  = 15*18
GiaoThua_2011.nTimerCount   = 1680
GiaoThua_2011.nSearchRange = 16
GiaoThua_2011.nMaxGetExp = 200
GiaoThua_2011.TSK_DAILY_RESET = 2758
GiaoThua_2011.TSK_GET_EXP = 2759

GiaoThua_2011.tbNpcList = {}


function GiaoThua_2011:CallAddNpc(nParamHandle, nResultHandle)
	self:AddNpc()
end
function GiaoThua_2011:AddNpc()
	for i=1, getn(self.tbPos) do
		local nMapID = SubWorldID2Idx(self.tbPos[i][1])		
		local nNpcIndex = AddNpc(1575, 1, nMapID, self.tbPos[i][2]*32, self.tbPos[i][3] * 32, 0, "")
		if (nNpcIndex > 0) then
			self.tbNpcList[nNpcIndex] = {}
			self.tbNpcList[nNpcIndex].tbPos = {nMapID, self.tbPos[i][2]*32, self.tbPos[i][3] * 32}
			self.tbNpcList[nNpcIndex].nTimerOut = self.nTimerOut
			self.tbNpcList[nNpcIndex].nTimerCount = self.nTimerCount
			AddTimer(self.nTimerOut, "GiaoThua_2011:OnTime", nNpcIndex);
		end
	end
	AddGlobalNews("Ph¸o hoa ®· ®­îc b¾n t¹i 7 thµnh thÞ, c¸c nh©n sü vâ l©m h·y mau ®Õn chiªm ng­ìng vµ nhËn léc ®Çu n¨m nhÐ!!!")
end

function GiaoThua_2011:OnTime(nNpcIndex, nTimerID)
	if (not self.tbNpcList[nNpcIndex]) then
		DelNpc(nNpcIndex)
		return 0, 0
	end
	self.tbNpcList[nNpcIndex].nTimerCount = self.tbNpcList[nNpcIndex].nTimerCount - 1
	local nTimerCount = self.tbNpcList[nNpcIndex].nTimerCount
	if (nTimerCount < 0) then
		DelNpc(nNpcIndex)
		self.tbNpcList[nNpcIndex] = nil
		return 0, 0
	end
	
	local nOldPlayer = PlayerIndex;
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(nNpcIndex, self.nSearchRange);
	
	for i=1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i];
		self:ResetDaily()
		if tbVNG_LY2011:checkCondition() == 1 then
			if (GetTask(self.TSK_GET_EXP) < self.nMaxGetExp) then
				SetTask(self.TSK_GET_EXP, GetTask(self.TSK_GET_EXP) + 1)
				tbAwardTemplet:GiveAwardByList(self.tbAwardExp, "PhÇn th­ëng kinh nghiÖm ho¹t ®éng ®ãn giao thõa");
			else
				Msg2Player("H«m nay c¸c h¹ ®· nhËn th­ëng v­ît qu¸ sè lÇn cho phÐp!");
			end
		end
	end
	PlayerIndex = nOldPlayer;
	return self.nTimerOut, nNpcIndex
end

function GiaoThua_2011:ResetDaily()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = GetTask(self.TSK_DAILY_RESET)
	if nCurDate ~= nRecordDate then
		SetTask(self.TSK_DAILY_RESET, nCurDate)
		SetTask(self.TSK_GET_EXP, 0)
	end
end