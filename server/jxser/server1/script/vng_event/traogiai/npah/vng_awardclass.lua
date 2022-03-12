--Hæ trî trao gi¶i th­ëng cho ng­êi chiÕn th¾ng - Created by DinhHQ - 20110607
tbAwardClass = {}

function tbAwardClass:New()
	local tbResult = {}	
	for key, val in self do
		tbResult[key] = val
	end
	tbResult.nStartDate = nil
	tbResult.nEndDate = nil
	tbResult.strName = ""
	tbResult.nID = 0
	return tbResult
end

function tbAwardClass:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
		return nil
	end
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		return nil
	end
	return 1
end

function tbAwardClass:IsOver()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate > self.nEndDate then
		return 1
	end
	return nil
end

function tbAwardClass:GetSingleItem(nItemID)
	local tb = {}
	for key, val in self.tbPrizeList[nItemID] do
		tb[key] = val
	end
	return tb
end