Include("\\script\\lib\\baseclass.lua")

tbJILIWanJia0908_tbTasktCtrl = tbBaseClass:new()

function tbJILIWanJia0908_tbTasktCtrl:_init(nStartDate, nEndDate)
	self.nStartDate	= nStartDate
	self.nEndDate	= nEndDate
	
	self.TSK_Version = 1987
	self.TSK_Award = 1988
	self.TSK_UseItem = 1989
	self.TSK_TuanYuanUseTime = 1990
	self.TSK_AnKanUseTime = 1991
	
	self.nMaxOtherCapExp = 1e9
	self.nMaxHepinCapExp =  1e9
end


function tbJILIWanJia0908_tbTasktCtrl:ResetTask()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if self.nStartDate <= nCurDate and nCurDate <= self.nEndDate then
		if GetTask(self.TSK_Version) ~= self.nStartDate then
			SetTask(self.TSK_Version,	self.nStartDate)
			SetTask(self.TSK_Award,	0)
			
			
			SetTask(self.TSK_Award, 0)
			SetTask(self.TSK_UseItem, 0)
			SetTask(self.TSK_TuanYuanUseTime, 0)
			SetTask(self.TSK_AnKanUseTime, 0)
		end
	end
	
end

function tbJILIWanJia0908_tbTasktCtrl:GetAwardState(nBit)
	self:ResetTask()
	return GetBit(GetTask(self.TSK_Award), nBit)
end

function tbJILIWanJia0908_tbTasktCtrl:SetAwardState(nBit, nValue)
	self:ResetTask()
	SetTask(self.TSK_Award, SetBit( GetTask(self.TSK_Award), nBit, nValue))
end

function tbJILIWanJia0908_tbTasktCtrl:GetUseItemState(nBit)
	self:ResetTask()
	return GetBit(GetTask(self.TSK_UseItem), nBit)
end

function tbJILIWanJia0908_tbTasktCtrl:SetUseItemState(nBit, nValue)
	self:ResetTask()
	SetTask(self.TSK_UseItem, SetBit( GetTask(self.TSK_UseItem), nBit, nValue))
end

function tbJILIWanJia0908_tbTasktCtrl:GetTuanYuanUseTime()
	self:ResetTask()
	return GetTask(self.TSK_TuanYuanUseTime)
end

function tbJILIWanJia0908_tbTasktCtrl:SetTuanYuanUseTime(nTime)
	self:ResetTask()
	SetTask(self.TSK_TuanYuanUseTime, nTime)
end

function tbJILIWanJia0908_tbTasktCtrl:GetAnKanUseTime()
	self:ResetTask()
	return GetTask(self.TSK_AnKanUseTime)
end

function tbJILIWanJia0908_tbTasktCtrl:SetAnKanUseTime(nTime)
	self:ResetTask()
	SetTask(self.TSK_AnKanUseTime, nTime)
end