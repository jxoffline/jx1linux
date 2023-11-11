Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\pfunction.lua")

if not Vng_BitTask_Lib then 
	Vng_BitTask_Lib = {}
end


function Vng_BitTask_Lib:getBitTask(tbTaskInfo)
	return GetBitTask(tbTaskInfo.nTaskID, tbTaskInfo.nStartBit, tbTaskInfo.nBitCount) 
end
function Vng_BitTask_Lib:setBitTask(tbTaskInfo, nValue)
	SetBitTask(tbTaskInfo.nTaskID, tbTaskInfo.nStartBit, tbTaskInfo.nBitCount, nValue) 
	if self:getBitTask(tbTaskInfo) ~= nValue then
		return nil
	end
	return 1
end
function Vng_BitTask_Lib:addBitTask(tbTaskInfo, nValue)
	local nCurValue = self:getBitTask(tbTaskInfo)
	local nNextValue = nCurValue + nValue
	if nNextValue > tbTaskInfo.nMaxValue then
		nNextValue = tbTaskInfo.nMaxValue
	end
	self:setBitTask(tbTaskInfo, nNextValue)
end
function Vng_BitTask_Lib:isMaxBitTaskValue(tbTaskInfo)
	if (self:getBitTask(tbTaskInfo) >= tbTaskInfo.nMaxValue) then
		return 1;
	else return 0;
	end
end

function Vng_BitTask_Lib:IsMaxValue(tbTaskInfo)
	if (self:getBitTask(tbTaskInfo) >= tbTaskInfo.nMaxValue) then
		return 1;
	else return nil;
	end
end

function Vng_BitTask_Lib:CheckBitTaskValue(tbTaskInfo, nValue, szFailMsg, szOption)
	nValue = lib:NumberParamTrans(nValue)	
	local nBitTaskValue =  self:getBitTask(tbTaskInfo)
	if lib:OptionFunction(nBitTaskValue, nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end	
end