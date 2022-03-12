Include("\\script\\lib\\baseclass.lua")

tbGuoqing0908_tbTasktCtrl = tbBaseClass:new()

function tbGuoqing0908_tbTasktCtrl:_init(nStartDate, nEndDate)
	self.nStartDate	= nStartDate
	self.nEndDate	= nEndDate
	
	self.TSK_Version = 1903

	self.TSK_ExpHepin = 1904

	self.TSK_ExpOtherCap = 1905

	self.TSK_UseCount = 1906

	
	self.TSK_JinNangState = 1907
	self.nMaxOtherCapExp = 1e9
	self.nMaxUseCount = 50
	self.nMaxHepinCapExp =  1e9
end


function tbGuoqing0908_tbTasktCtrl:ResetTask()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if self.nStartDate <= nCurDate and nCurDate <= self.nEndDate then
		if GetTask(self.TSK_Version) ~= self.nStartDate then
			SetTask(self.TSK_Version,	self.nStartDate)
			
			SetTask(self.TSK_ExpHepin,	0)
			SetTask(self.TSK_ExpOtherCap,	0)
			SetTask(self.TSK_UseCount, 0)
			SetTask(self.TSK_JinNangState, 0)
		end
	end
end

function tbGuoqing0908_tbTasktCtrl:GetJinNangState()
	self:ResetTask()
	return GetTask(self.TSK_JinNangState)
end

function tbGuoqing0908_tbTasktCtrl:SetJinNangState(nValue)
	self:ResetTask()
	return SetTask(self.TSK_JinNangState, nValue)
end

function tbGuoqing0908_tbTasktCtrl:GetHepinCapExp()
	self:ResetTask()
	return GetTask(self.TSK_ExpHepin)
end

function tbGuoqing0908_tbTasktCtrl:SetHepinCapExp(nExp)
	self:ResetTask()
	return SetTask(self.TSK_ExpHepin, nExp)
end


function tbGuoqing0908_tbTasktCtrl:CheckHepinCapExp()
	self:ResetTask()
	return self:GetHepinCapExp() < self.nMaxHepinCapExp 
end

function tbGuoqing0908_tbTasktCtrl:AddHepinCapExp(nExp)
	self:ResetTask()
	self:SetHepinCapExp(self:GetHepinCapExp() + nExp)
end

function tbGuoqing0908_tbTasktCtrl:GetOtherCapExp()
	self:ResetTask()
	return GetTask(self.TSK_ExpOtherCap)
end

function tbGuoqing0908_tbTasktCtrl:SetOtherCapExp(nExp)
	self:ResetTask()
	SetTask(self.TSK_ExpOtherCap, nExp)
end

function tbGuoqing0908_tbTasktCtrl:CheckOtherCapExp()
	self:ResetTask()
	return self:GetOtherCapExp() < self.nMaxOtherCapExp 
end

function tbGuoqing0908_tbTasktCtrl:AddOtherCapExp(nExp)
	self:ResetTask()
	self:SetOtherCapExp(self:GetOtherCapExp() + nExp)
end


function tbGuoqing0908_tbTasktCtrl:GetUseCount()
	self:ResetTask()
	return GetTask(self.TSK_UseCount)
end

function tbGuoqing0908_tbTasktCtrl:SetUseCount(nCount)
	self:ResetTask()
	SetTask(self.TSK_UseCount, nCount)
end

function tbGuoqing0908_tbTasktCtrl:CheckUseCount()
	self:ResetTask()
	return self:GetUseCount() < self.nMaxUseCount 
end

function tbGuoqing0908_tbTasktCtrl:AddUseCount(nCount)
	self:ResetTask()
	self:SetUseCount(self:GetUseCount() + nCount)
end

