Include("\\script\\lib\\baseclass.lua")
DaTuShaTimerList = {}
DaTuShaTimer = tbBaseClass:new()

function DaTuShaTimer:_init()
	self.nId = getn(DaTuShaTimerList) + 1
	DaTuShaTimerList[self.nId] = {}
end

function DaTuShaTimer:Add(nFrame, fn, tbParam)
	local nTimerId = AddTimer(nFrame, "DaTuShaTimer:OnTime", self.nId)
	DaTuShaTimerList[self.nId][nTimerId] = 
	{
		fn = fn,
		tbParam = tbParam
	}
end

function DaTuShaTimer:Clear(nFrame, fn, tbParam)
	for nTimerId, pData in DaTuShaTimerList[self.nId] do
		if pData then
			DelTimer(nTimerId)
		end
	end
	DaTuShaTimerList[self.nId] = nil
end

function DaTuShaTimer:OnTime(nParam, nTimerId)
	if not DaTuShaTimerList[nParam] then
		return 0,0
	end
	local pData = DaTuShaTimerList[nParam][nTimerId]
	if not pData then
		return 0, 0
	end
	local nFrame = call(pData.fn, pData.tbParam)
	if nFrame and nFrame > 0 then
		return nFrame ,nParam
	else
		if DaTuShaTimerList[nParam] then
			DaTuShaTimerList[nParam][nTimerId] = nil
		end
		return 0,0
	end
end
