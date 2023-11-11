Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\log.lua")
--Ghi transaction log - Modified By DinhHQ - 20110816
Include("\\script\\vng_lib\\VngTransLog.lua")
IncludeLib("LEAGUE")
HonourType = {}
HonourType.nPak = curpack()


function HonourType:AddHonour(nAmount)
	
	SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nAmount);
	SyncTaskValue(WLLS_TASKID_HONOUR);
	Msg2Player(format("§iÓm Ving Dù t¨ng cao %d", nAmount))
end

function HonourType:Give(tbItem, nAwardCount, tbLogTitle)
	if not tbItem.nHonour then
		return 
	end
	local nPlayerIndex = PlayerIndex
	local nAmount = tbItem.nHonour * (nAwardCount or 1) * (tbItem.nCount or 1)
	local nPak = usepack(self.nPak)
	CallPlayerFunction(nPlayerIndex, self.AddHonour, self, nAmount)
	CallPlayerFunction(nPlayerIndex, self.WriteLog, self, nAmount, tbLogTitle)
	usepack(nPak)
	
end


function HonourType:WriteLog(nAmount, tbLogTitle)
	local szCode = ""
	if tbLogTitle then
		local szEventName = tbLogTitle[1] or ""
		local szAction = tbLogTitle[2] or "award"
		local szName = "nHonour"
		call(tbLog.PlayerAwardLog, {tbLog, szEventName, szAction, szName, szCode, nAmount}, "x")
		--Ghi transaction log - Modified By DinhHQ - 20110816
		if tbLogTitle[3] and type(tbLogTitle[3]) == "table" then
			local tb = tbLogTitle[3]
			local strAction = tb.strAction or szAction
			call(tbVngTransLog.Write, {tbVngTransLog, tb.strFolder, tb.nPromID, strAction, nAmount.." "..szName, tb.nResult}, "x")
		end
	end
end
		
tbAwardTemplet:RegType("nHonour", HonourType)