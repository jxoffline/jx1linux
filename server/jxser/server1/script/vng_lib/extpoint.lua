Include("\\script\\vng_lib\\extpoint_head.lua")
Include("\\script\\lib\\log.lua")

function tbExtPointLib:GetBitValue(nExtPoint, nBitPos)
	local nVal = GetExtPoint(nExtPoint)
	return(GetBit(nVal, nBitPos))
end

function tbExtPointLib:SetBitValue(nExtPoint, nBitPos, nBitValue)
--BÊ sung ki”m tra gi∏ trﬁ extpoint ©m - Modified by DinhHQ - 20110814	
	local nVal = GetExtPoint(nExtPoint)
	local nOldVal = nVal
	local nReturnValue = nil
	if nVal < 0 then
		return 0
	end
	if (nBitValue == 0) then		
		nVal = SetBit(nVal,nBitPos, 0)
		nVal = GetExtPoint(nExtPoint) - nVal
		nReturnValue = PayExtPoint(nExtPoint, nVal)		
	elseif (nBitValue == 1) then
		nVal = SetBit(nVal, nBitPos, 1)
		nVal = nVal - GetExtPoint(nExtPoint)
		nReturnValue =  AddExtPoint(nExtPoint, nVal)
	end
	local nNewValue = GetExtPoint(nExtPoint)
	if nReturnValue == 1 then
		tbLog:PlayerActionLog("Extpoint Changed Successfully", "Old Value: "..nOldVal, "New Value: "..nNewValue)
	else
		tbLog:PlayerActionLog("Extpoint Changed Fail", "Old Value: "..nOldVal, "New Value: "..nNewValue)
	end
	return nReturnValue
end
--format table tbExtPointLib = {nID= x, nBit = y, nVer = z}
function tbExtPointLib:GetBitValueByVersion(tbExtpoint)
	if self:CheckBitVersion(tbExtpoint) == 1 then
		return self:GetBitValue(tbExtpoint.nID, tbExtpoint.nBit)
	else		
		return nil
	end
end

function tbExtPointLib:SetBitValueByVersion(tbExtpoint, nBitValue)
	if self:CheckBitVersion(tbExtpoint) ~= 1 then
		return nil
	else		
		if self:SetBitValue(tbExtpoint.nID, tbExtpoint.nBit, nBitValue) > 0 then
			return 1
		end
	end
end

function tbExtPointLib:CheckBitVersion(tbExtpoint)
	if not tbExtpoint or type(tbExtpoint) ~= "table" then
		return nil
	end
	local nID = tbExtpoint.nID
	local nBit = tbExtpoint.nBit
	local nVer = tbExtpoint.nVer
	if self.tbList[nID][nBit] == nVer then
		return 1
	end
	error("Bit version is mismatched!!!")
	return nil
end