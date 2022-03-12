Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\script\\missions\\basemission\\lib.lua")
IncludeLib("FILESYS")
tbShenSuanZi = {}
tbShenSuanZi.nActStartTime =  20100709
tbShenSuanZi.nActEndTime = 20100816
tbShenSuanZi.lang = {}


tbShenSuanZi.bTestMode = nil

tbShenSuanZi.tbRoundPlayerCount = 
{
	512,
	256,
	128,
	64,
	32,
	16,
	8,
	4,
	2,
	1,
}







tbShenSuanZi.nLevellimit = 80
tbShenSuanZi.nState = 0 -- 0活动没开始， 1  可以答题， 2 不可答题
tbShenSuanZi.tbRoundAward = 
{
	[1]=	{nExp =	1000000},
	[2]=	{nExp =	2000000},
	[3]=	{nExp =	3000000},
	[4]=	{nExp =	4000000},
	[5]=	{nExp =	6000000},
	[6]=	{nExp =	8000000},
	[7]=	{nExp =	11000000},
	[8]=	{nExp =	15000000},
	[9]=	{nExp =	20000000},
	[10]=	{nExp =	30000000},

}
tbShenSuanZi.tbNpcPos = 
{
	{80,1607,3172},
	{80,1627,3195},
	{80,1709,3242},
	{80,1723,3222},
	{80,1646,3012},
	{80,1662,2996},
	{80,1862,3039},
	{80,1830,3073},
}



function tbShenSuanZi:CreateExpression(nNumberCount)
	
	local tbNumber = {}
	local tbOptionId2Value = {"+", "-", "*"}
	
	local nNumber =  random(1, 9)
	local szExpression = format("%d", nNumber)
	for i=1, nNumberCount - 1 do
		nNumber =  random(1, 9)
		local nOptionId = random(1, 3)
		szExpression = format("%s %s %d", szExpression, tbOptionId2Value[nOptionId], nNumber)
	end
	return szExpression	
end

function tbShenSuanZi:RoundStart_gc(nParamHandle, nResultHandle)
	self:RoundStart(1)
end

function tbShenSuanZi:RoundStart(nRound)
	
	nRound = nRound or 1
	self.nStartTime = GetCurServerTime()
	self.nRound = nRound
	
	self.nState = 1
	
	self.tbPlayer = {}
	
	self:Announce( format(self.lang.RoundStartMsg, self.nRound) )
	AddTimer(18 * 90, "tbShenSuanZi:TimeOut", nRound)
end


function tbShenSuanZi:TimeOut(nRound, nTimerId)
	
	
	if self.nRound ~= nRound then
		return 0,0 
	end
	self:Announce(self.lang.RoundTimeOut)
	self.nState = 2
	
	local nCountLimit = self.tbRoundPlayerCount[self.nRound]
	local nPlayerCount = getn(self.tbPlayer)
	
	
	local nCount = 0
	
	
	for i=1, nPlayerCount do 
		local szName = self.tbPlayer[i].szName
		
		local nPlayerIndex = SearchPlayer(szName)
		if nCount >= nCountLimit then
			break
		end
		if nPlayerIndex > 0 then
			DynamicExecuteByPlayer(nPlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", self.tbRoundAward[self.nRound])
			DynamicExecuteByPlayer(nPlayerIndex, "", "tbShenSuanZi:AddPlayerFinishRound")
			nCount = nCount + 1
		end
	end
	if self.nRound == 10 then
		self:Announce(self.lang.LastRoundEnd)
		return 0, 0
	end
	AddTimer(18 * 19, "tbShenSuanZi:CountDown", 11)
	--self:Announce(format("还有%d秒 就到下一轮，请注意准备", 20))
	return 0, 0
end


function tbShenSuanZi:CountDown(nCount, nTimerId)
	
	
	nCount = nCount - 1
	if nCount == 0 then
		self:RoundStart(self.nRound + 1)
		return 0,0
		
	else
		self:Announce(format(self.lang.CountDownMsg, nCount))
		return 18, nCount
	end
	
end

function tbShenSuanZi:Announce(szMsg)
	Msg2SubWorld(szMsg)
end








function tbShenSuanZi:DailogMain()
	

	if self.nState == 1 then		
		self:AskExpression()
		
	elseif self.nState == 2 then
		self:QueryList(1)
	else
		Talk(1, "", self.lang.ActNotInDate)
	end
	
	
end


function tbShenSuanZi:QueryList(nPage)
	local nCount = getn(self.tbPlayer)
	local nCountPerPage = 10
	local nStartIdx = (nPage - 1 ) * nCountPerPage + 1 
	
	
	if nCountPerPage > nCount then
		nCountPerPage = nCount
	end
	local szMsg = ""
	
	if self.nRound == 10 then
		szMsg = szMsg..self.lang.LastRoundEnd.."<enter>"
	end
	
	if nCountPerPage - nStartIdx >= 0 then
		szMsg = szMsg..self.lang.RankTitle.."<enter>"
		szMsg = format("%s\t\t\t\t%s<enter>", self.lang.NAME, self.lang.UseTime)
		for i=nStartIdx, nCountPerPage do
			
			local pPlayer = self.tbPlayer[i]
			if pPlayer then
				szMsg = format("%s%s\t\t%d<enter>", szMsg, pPlayer.szName, pPlayer.nTime)
			end
		end
	else
		szMsg = szMsg..self.lang.NoRank.."<enter>"
	end
	
	CreateNewSayEx(szMsg, {})
end


function tbShenSuanZi:AskExpression()
	
	if GetLevel() < self.nLevellimit then
		Talk(1, "", format(self.lang.LevelLimit, self.nLevellimit))
		return 
	end
	
	
	if self.nRound - 1 ~= self:GetPlayerFinishRound() then
		Talk(1, "", self.lang.LimitMsg)
		return
	end
	if self:GetPlayerAnswerCount() >= self.nRound then
		Talk(1, "", self.lang.AlreadyAnswer)
		return 0
	end
	
	local szExpression = self:CreateExpression(self.nRound + 1)
	local szTitle = format(self.lang.Question, szExpression)
	
	local tbOpt = 
	{
		{self.lang.InputAnswer, self.ShowInput, {self, szExpression}},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbShenSuanZi:ShowInput(szExpression)
	local szDefault = ""
	if self.bTestMode then
		szDefault = tostring(dostring("return "..szExpression))
	end
	g_AskClientStringEx(szDefault, 1, 11, self.lang.InputAnswerTitle, {self.Answer, {self, szExpression}})
end

function tbShenSuanZi:Answer(szExpression, szInput)
	local nInput = tonumber(szInput)
	
	
	--轮数不同也不行！
	if self.nRound - 1 ~= self:GetPlayerFinishRound() then
		return 0
	end
	
	if self:GetPlayerAnswerCount() >= self.nRound then
		Msg2Player(self.lang.AlreadyAnswer)
		return 0
	end
	
	if self.nState == 2 then
		Msg2Player(self.lang.AnswerTooLate)
		return 
	end
	if nInput then
		if ( dostring("return "..szExpression) == nInput) then
			local nTime = GetCurServerTime() - self.nStartTime
			self:AddPlayerUseTime(nTime)
			tinsert(self.tbPlayer, {szName = GetName{}, nTime = self:GetPlayerUseTime()})
			
			
			Msg2Player(format(self.lang.Congratulate, nTime))
		else
			--Msg2Player(self.lang.WrongAnswer)
			local nResult = dostring("return "..szExpression)
			Msg2Player(format(self.lang.WrongAnswer, nResult))
			
		end
		
		self:AddPlayerAnswerCount()
	else
		Msg2Player(self.lang.ForbitWord)
	end
	
end

function tbShenSuanZi:InDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	return self.nActStartTime <= nDate and nDate < self.nActEndTime
end


function tbShenSuanZi:LoadLang(szLangName)	
	local szFile = "\\settings\\event\\other\\shensuanzi\\"..szLangName..".txt"
	
	if TabFile_Load(szFile, szFile) == 0 then
		WriteLog(format("Load %s is fail", szFile))
		print(format("Load %s is fail", szFile))
		return 0;
	end
	local nRow = TabFile_GetRowCount(szFile)
	
	for i=1, nRow do
		local szKey	= TabFile_GetCell(szFile, i, 1)
		local szValue = TabFile_GetCell(szFile, i, 2)
		
		self.lang[szKey] = szValue
	end
	
end



function tbShenSuanZi:Init()
	
	if self:InDate() then
		self:LoadLang("vn")
		self:AddLimitRegion()
		self:AddNpc()
		
	else
		print("tbShenSuanZi:Init is nil")
	end
end

function tbShenSuanZi:AddNpc()
	local tbNpc = {nNpcId = 117, szName = self.lang.NpcName, szScriptPath = "\\script\\event\\other\\shensuanzi\\npcscript.lua"}
	
	local nTime = Tm2Time(2010, 08, 16)
	
	
	tbNpc.nTime = nTime - GetCurServerTime() 
	if tbNpc.nTime <= 0 then
		return 
	end
	for i=1, getn(self.tbNpcPos) do
		local tbPos = self.tbNpcPos[i]
		basemission_CallNpc(tbNpc, tbPos[1], tbPos[2] * 32, tbPos[3] * 32)
	end
end

function tbShenSuanZi:AddLimitRegion()
	for i=1, getn(self.tbNpcPos) do
		local tbPos = self.tbNpcPos[i]
		aryLimitRegion[tbPos[1]] = aryLimitRegion[tbPos[1]] or {}
		tinsert(aryLimitRegion[tbPos[1]], {tbPos[2], tbPos[3]})
	end
end