Include("\\vng_script\\vng_lib\\extpoint_head.lua")
Include("\\script\\lib\\log.lua")

function VngExtPointLib:GetBitValue(nExtPoint, nBitPos)
	local nVal = GetExtPoint(nExtPoint)
	return(GetBit(nVal, nBitPos))
end

function VngExtPointLib:SetBitValue(nExtPoint, nBitPos, nBitValue)
--BÊ sung ki”m tra gi∏ trﬁ extpoint ©m, Thanhld 20150331
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
--format table VngExtPointLib = {nID= x, nBit = y, nVer = z}
function VngExtPointLib:GetBitValueByVersion(tbExtpoint)
	if self:CheckBitVersion(tbExtpoint) == 1 then
		return self:GetBitValue(tbExtpoint.nID, tbExtpoint.nBit)
	else		
		return nil
	end
end

function VngExtPointLib:SetBitValueByVersion(tbExtpoint, nBitValue)
	if self:CheckBitVersion(tbExtpoint) ~= 1 then
		return nil
	else		
		if self:SetBitValue(tbExtpoint.nID, tbExtpoint.nBit, nBitValue) > 0 then
			return 1
		end
	end
end

function VngExtPointLib:CheckBitVersion(tbExtpoint)
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

function VngExtPointLib:CheckBitExtPoint(tbBitExtpoint,nValue,szMsgFail)	
	--Th bªng gi∏ trﬁ so s∏nh th◊ fail	
	if (VngExtPointLib:GetBitValueByVersion(tbBitExtpoint) == nValue) then	
		Talk(1,"",szMsgFail)	
		return nil
	end
	return 1
end