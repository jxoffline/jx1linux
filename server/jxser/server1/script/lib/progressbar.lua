IncludeLib("TIMER")
IncludeLib("FILESYS")


local tbData = {}

tbProgressBar = {}

tbProgressBar.szConfigFile = "\\settings\\progressconfig.txt"
local tbEventSring = 
{
	"EVENT_MOVE",	-- 移动
	"EVENT_ATTACK",-- 主动攻击(使用部分技能)
	"EVENT_SITE",	-- 打坐
	"EVENT_RIDE",	-- 上下马
	"EVENT_USEITEM",-- 使用道具
	"EVENT_ARRANGEITEM",	-- 移动物品栏中的道具
	"EVENT_DROPITEM",-- 丢弃物品
	"EVENT_CHANGEEQUIP",	-- 更换装备
	"EVENT_TRADE",-- 交易
	"EVENT_CHANGEFIGHTSTATE",-- 改变战斗状态
	"EVENT_ATTACKED",-- 被攻击
	"EVENT_DEATH",-- 死亡
	"EVENT_REVIVE",-- 重生打断
	"EVENT_BUYITEM",-- 在Npc处买东西
	"EVENT_SELLITEM",-- 在Npc处卖东西
	"EVENT_TALK",	-- NPC对话
}

function tbProgressBar:LoadConfig(szFile)
	self.tbConfig = {}
	if TabFile_Load(szFile, szFile) == 0 then
		WriteLog(format("Load %s is fail", szFile))
		return 0;
	end
	local nRowCount = TabFile_GetRowCount(szFile)
	
	for nRow=2, nRowCount do
		local nId = tonumber(TabFile_GetCell(szFile, nRow, "Id"))
		local szTitle = TabFile_GetCell(szFile, nRow, "Title")
		local nTime = tonumber(TabFile_GetCell(szFile, nRow, "Time"))
		local nEvent = 0
		for j=1, getn(%tbEventSring) do
			local szKey = %tbEventSring[j]
			local nBit = tonumber(TabFile_GetCell(szFile, nRow, szKey)) or 0
			nEvent = SetBit(nEvent, self.tbEventType[szKey], nBit)
		end
	
		self.tbConfig[nId] = 
		{
			nId = nId,
			szTitle = szTitle,
			nTime = nTime,
			nEvent = nEvent,
			bDesc = 0,
		}
	end
	
end

function tbProgressBar:InitEventType()
	self.tbEventType = {}
	for i=1, getn(%tbEventSring) do
		self.tbEventType[%tbEventSring[i]] = i;
	end
	
	self:LoadConfig(self.szConfigFile)
	
end

function tbProgressBar:OpenByConfig(nId, fnOnTime, tbOnTimeParam, fnOnBreak, tbOnBreakParam)
	
	if not self.tbConfig or not self.tbConfig[nId] then
		print("tbProgressBar.tbConfig is nil", nId)
		return 
	end
	local pTemp = self.tbConfig[nId]
	self:Start(pTemp.szTitle, pTemp.nTime * 18, pTemp.nEvent, pTemp.bDesc, fnOnTime, tbOnTimeParam, fnOnBreak, tbOnBreakParam)
end

function tbProgressBar:Open(szTitle, nFrame, tbEvent, bDesc, fnOnTime, tbOnTimeParam, fnOnBreak, tbOnBreakParam)
	local nEvent = 0
	for i=1, getn(tbEvent) do
		if tbEvent[i] < self.tbEventType.EVENT_COUNT then
			
			nEvent = SetBit(nEvent, tbEvent[i], 1)
		end
	end
	self:Start(szTitle, nFrame, nEvent, fnOnTime, tbOnTimeParam, fnOnBreak, tbOnBreakParam)
end

function tbProgressBar:Start(szTitle, nFrame, nEvent, bDesc, fnOnTime, tbOnTimeParam, fnOnBreak, tbOnBreakParam)
	
	
	OpenProgressBar(szTitle, nFrame, nEvent, bDesc, "tbProgressBar_OnTime", "tbProgressBar_OnBreak")
	
	%tbData[PlayerIndex] = {}

	%tbData[PlayerIndex].fnOnTime = fnOnTime
	%tbData[PlayerIndex].tbOnTimeParam = tbOnTimeParam
	%tbData[PlayerIndex].fnOnBreak = fnOnBreak
	%tbData[PlayerIndex].tbOnBreakParam = tbOnBreakParam
end

function tbProgressBar_OnTime()
	local tbPlayerProgressData = %tbData[PlayerIndex] or {}
	if not tbPlayerProgressData.fnOnTime  then
		return 
	end
	
	return call(tbPlayerProgressData.fnOnTime, tbPlayerProgressData.tbOnTimeParam or {})
end

function tbProgressBar_OnBreak()
	local tbPlayerProgressData = %tbData[PlayerIndex] or {}
	if not tbPlayerProgressData.fnOnBreak then
		return 
	end
	
	return call(tbPlayerProgressData.fnOnBreak, tbPlayerProgressData.tbOnBreakParam or {})
end

tbProgressBar:InitEventType()