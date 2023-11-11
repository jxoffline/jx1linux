Include("\\script\\misc\\eventsys\\eventsys.lua")

UseTownPortalEvent = EventSys:NewType("UseTownPortal")

function UseTownPortalEvent:Reg(fn, ...)
	self.MapEvnent = self.MapEvnent or {}
	local nNewId = getn(self.MapEvnent) + 1
	self.MapEvnent[nNewId] = 
	{
		szOptName = szOptName,
		fn = fn,
		tbParam = arg,
		nPackNo = curpack(),
	}
	return nNewId
end

function UseTownPortalEvent:OnEvent()
	if getn(self.MapEvnent) <= 0 then
		return
	end
	for nId=1, getn(self.MapEvnent) do
		local tbProcParam = self.MapEvnent[nId]
		local nPlayerIndex = PlayerIndex
		local oldpack = usepack(tbProcParam.nPackNo)
		CallPlayerFunction(nPlayerIndex, tbProcParam.fn, unpack(tbProcParam.tbParam))
		usepack(oldpack)
	end
end