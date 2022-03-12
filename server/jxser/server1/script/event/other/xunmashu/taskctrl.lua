Include("\\script\\lib\\baseclass.lua")

local tbTask = tbBaseClass:new()

function tbTask:_init(nStartDate, nEndDate)
	self.nStartDate	= nStartDate
	self.nEndDate	= nEndDate
	
	self.nMaxExpFromOther	= 3e3
	
	self.TSK_Version		= 1885
	self.TSK_ExpFromOther	= 1886

	
end


function tbTask:ResetTask()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if self.nStartDate <= nCurDate and nCurDate <= self.nEndDate then
		if GetTask(self.TSK_Version) ~= self.nStartDate then
			SetTask(self.TSK_Version,	self.nStartDate)
			
			SetTask(self.TSK_ExpFromOther,	0)
		end
	end
	
end


function tbTask:GetCurExpFromOther()
	self:ResetTask()
	return GetTask(self.TSK_ExpFromOther)
end

function tbTask:SetCurExpFromOther(nExp)
	self:ResetTask()
	return SetTask(self.TSK_ExpFromOther, nExp)
end

function tbTask:AddCurExpFromOther(nExp)
	self:ResetTask()
	return self:SetCurExpFromOther(self:GetCurExpFromOther() + nExp)
end

function tbTask:CheckExpFromOther()
	self:ResetTask()
	if self:GetCurExpFromOther() < self.nMaxExpFromOther then
		return 1
	else
		return nil
	end
end

tbXunMaShu0903_tbTasktCtrl = tbTask