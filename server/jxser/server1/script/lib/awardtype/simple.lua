Include("\\script\\lib\\log.lua")
--Ghi transaction log - Modified By DinhHQ - 20110816
Include("\\script\\vng_lib\\VngTransLog.lua")
SimpleType = {}

function SimpleType:new(szKey)
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb.szKey = szKey
	tb.nPak = curpack()
	return tb
end

SimpleType.szKey = ""
SimpleType.pFun = nil
SimpleType.nPak = curpack()
function SimpleType:Give(tbItem, nAwardCount, tbLogTitle)
	local var = tbItem[self.szKey]
	if not var then
		return
	end
	local nAmount = var * (nAwardCount or 1) * (tbItem.nCount or 1)
	if type(self.pFun) == "function" then
		local nPlayerIndex = PlayerIndex
		local nPak = usepack(self.nPak)
		CallPlayerFunction(nPlayerIndex, self.pFun, nAmount)
		CallPlayerFunction(nPlayerIndex, self.WriteLog, self, nAmount, tbLogTitle)
		usepack(nPak)
		self:Msg2Player(nAmount)
		
	end
end

function SimpleType:Reg()
	tbAwardTemplet:RegType(self.szKey, self)
end

function SimpleType:Msg2Player(nAmount)
	Msg2Player(format(self.szMsgFormat, nAmount))
end
function SimpleType:WriteLog(nAmount, tbLogTitle)
	local szCode = ""
	if tbLogTitle then
		local szEventName = tbLogTitle[1] or ""
		local szAction = tbLogTitle[2] or "award"
		local szName = self.szKey or ""
		call(tbLog.PlayerAwardLog, {tbLog, szEventName, szAction, szName, szCode, nAmount}, "x")
		--Ghi transaction log - Modified By DinhHQ - 20110816
		if tbLogTitle[3] and type(tbLogTitle[3]) == "table" then
			local tb = tbLogTitle[3]
			local strAction = tb.strAction or szAction
			call(tbVngTransLog.Write, {tbVngTransLog, tb.strFolder, tb.nPromID, strAction, nAmount.." "..szName, tb.nResult}, "x")
		end
	end
end