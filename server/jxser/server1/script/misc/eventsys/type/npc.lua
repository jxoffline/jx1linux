Include("\\script\\misc\\eventsys\\eventsys.lua")

pEventType =  EventSys:NewType("AddNpcOption")


function pEventType:Reg(szNpcName, szOptName, fn, tbParam, fnLimit, tbLimitParam)
	
	self.MapEvnent[szNpcName] = self.MapEvnent[szNpcName] or {}
	local nNewId = getn(self.MapEvnent[szNpcName]) + 1
	self.MapEvnent[szNpcName][nNewId] = 
	{
		szOptName = szOptName,
		fn = fn,
		tbParam = tbParam,
		fnLimit = fnLimit,
		tbLimitParam = tbLimitParam,
		nPackNo = curpack(),
	}
	return nNewId
end

function pEventType:OnEvent(szNpcName, tbDailog, nNpcIndex)
	if not self.MapEvnent[szNpcName] then
		return
	end
	for nId=1, getn(self.MapEvnent[szNpcName]) do
		local tbProcParam = self.MapEvnent[szNpcName][nId]
		
		local fnLimit = tbProcParam.fnLimit
		if self:CanAdd(tbProcParam.nPackNo, tbProcParam.fnLimit, tbProcParam.tbLimitParam, nNpcIndex) then
			tbDailog:AddOptEntry(tbProcParam.szOptName, self.OnSelectOpt, {self, tbProcParam.nPackNo, tbProcParam.fn, tbProcParam.tbParam})
		end
	end
end

function pEventType:CanAdd(nPackNo, fnLimit, tbLimitParam, nNpcIndex)
	if fnLimit then
		local tbParam = {}
		if tbLimitParam then
			for i = 1, getn(tbLimitParam) do
				tinsert(tbParam, tbLimitParam[i])
			end
		end
		tinsert(tbParam, nNpcIndex)
		local nPlayerIndex = PlayerIndex
		local nOldPack = usepack(nPackNo)
		local bRet = CallPlayerFunction(nPlayerIndex, fnLimit, unpack(tbParam))
		usepack(nOldPack)
		return bRet == 1
	end
	return 1
end

function pEventType:OnSelectOpt(nPackNo, fn, tbParam)
	local nPlayerIndex = PlayerIndex
	local nOldPack = usepack(nPackNo)
	CallPlayerFunction(nPlayerIndex, fn, unpack(tbParam))
	usepack(nOldPack)
end


pDialogTitle =  EventSys:NewType("SetNpcDialogTitle")
function pDialogTitle:Reg(szNpcName, szTitle)
	self.MapEvnent[szNpcName] = szTitle
	return 1
end

function pDialogTitle:UnReg(szNpcName, nId)
	self.MapEvnent[szNpcName] = nil
end


function pDialogTitle:OnEvent(szNpcName, tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = self.MapEvnent[szNpcName] or "Xin chµo"
end

