Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

tbAwardTemplet = tbAwardTemplet or {}
function tbAwardTemplet:tbVngGivByRandom(tbItem, nAwardCount, tbLogTitle)
	if tbItem == nil then
		return 0
	end
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			return self:tbVngGiveByFormat(tbItem[i], nAwardCount, tbLogTitle)
		end
	end
end

function tbAwardTemplet:tbVngGiveByFormat(tbItem, nAwardCount, tbLogTitle)
	if not tbItem then 
		return 0
	end
	local szLogItemId =  ""
	nAwardCount = nAwardCount or 1
	if type(tbItem[1]) == "table" then 
		if tbItem[1].nRate then
			for i = 1, nAwardCount do
				local nFlag, szItemId =  self:tbVngGivByRandom(tbItem, 1, tbLogTitle)
				szLogItemId = format("%s,%s",(szItemId or "nil"),(szLogItemId or "nil"))
			end
			return 1,szLogItemId
		else
			for i = 1,  getn(tbItem) do
				local nFlag, szItemId =  self:tbVngGiveByFormat(tbItem[i], nAwardCount, tbLogTitle)
				szLogItemId = format("%s,%s",(szItemId or "nil"),(szLogItemId or "nil"))
			end
			return 1, szLogItemId;
		end
	else
		for k, v in self.TYPE do
			if tbItem[k] then
				v:Give(tbItem, nAwardCount, tbLogTitle)
				return 1,tbLog:VngGetItemID(tbItem,nAwardCount)
			end
		end
	end
end

function tbAwardTemplet:tbVngGetItem(tbAwardTable,nCount,szLogData,szLogTitle)
	local tbLogTitle = lib:Split(szLogData,",")
	local nFlag, szLogItemId = tbAwardTemplet:tbVngGiveByFormat(tbAwardTable,nCount, {tbLogTitle, tbLogTitle[3]})	
	if(nFlag == 1 and szLogItemId ~= nil) then
		tbLog:VngActionFormatLog(tbLogTitle,szLogItemId)
	end		
end