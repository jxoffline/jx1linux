Include("\\script\\lib\\baseclass.lua")

local tbTask = tbBaseClass:new()

function tbTask:_init(nStartDate, nEndDate)
	self.nStartDate	= nStartDate
	self.nEndDate	= nEndDate
	
	self.nMaxExpFromOther	= 8e8
	self.nMaxExpFromRose	= 3e8
	
	self.TSK_Version		= 1564
	self.TSK_ExpFromOther	= 1565
	self.TSK_ExpFromRose	= 1566
	self.TSK_Score			= 1567
	self.TSK_IsGetJinNang	= 1568
	
end


function tbTask:ResetTask()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if self.nStartDate <= nCurDate and nCurDate <= self.nEndDate then
		if GetTask(self.TSK_Version) ~= self.nStartDate then
			SetTask(self.TSK_Version,	self.nStartDate)
			
			SetTask(self.TSK_ExpFromOther,	0)
			SetTask(self.TSK_ExpFromRose,	0)
			SetTask(self.TSK_Score,			0)
			SetTask(self.TSK_IsGetJinNang,	0)
		end
	end
	
end

function tbTask:GetIsGetJinNang()
	self:ResetTask()
	return GetTask(self.TSK_IsGetJinNang)
end

function tbTask:SetIsGetJinNang(bIsGet)
	self:ResetTask()
	return SetTask(self.TSK_IsGetJinNang, bIsGet)
end


function tbTask:GetScore()
	self:ResetTask()
	return GetTask(self.TSK_Score)
end

function tbTask:SetScore(nScore)
	self:ResetTask()
	return SetTask(self.TSK_Score, nScore)
end

function tbTask:AddScore(nScore)
	self:ResetTask()
	return self:SetScore(self:GetScore() + nScore)
end

function tbTask:GetCurExpFromOther()
	self:ResetTask()
	return GetTask(self.TSK_ExpFromOther)
end

function tbTask:GetCurExpFromRose()
	self:ResetTask()
	return GetTask(self.TSK_ExpFromRose)
end

function tbTask:SetCurExpFromOther(nExp)
	self:ResetTask()
	return SetTask(self.TSK_ExpFromOther, nExp)
end

function tbTask:SetCurExpFromRose(nExp)
	self:ResetTask()
	return SetTask(self.TSK_ExpFromRose, nExp)
end

function tbTask:AddCurExpFromOther(nExp)
	self:ResetTask()
	return self:SetCurExpFromOther(self:GetCurExpFromOther() + nExp)
end

function tbTask:AddCurExpFromRose(nExp)
	self:ResetTask()
	return self:SetCurExpFromRose(self:GetCurExpFromRose() + nExp)
end

function tbTask:CheckExpFromOther()
	self:ResetTask()
	if self:GetCurExpFromOther() < self.nMaxExpFromOther then
		return 1
	else
		return nil
	end
end

function tbTask:CheckExpFromRose()
	self:ResetTask()
	if self:GetCurExpFromRose() < self.nMaxExpFromRose then
		return 1
	else
		return nil
	end
end

tbFunv0903_tbTasktCtrl = tbTask