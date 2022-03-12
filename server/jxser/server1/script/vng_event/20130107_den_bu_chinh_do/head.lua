-- ============================================

--§Òn bï gamer Chinh §å
--Created by DinhHQ - 20130107

-- ======================================================
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
tbZhengtuCompensate = {
	nStartDate = 201301100000,
	nEndDate = 201302112400,
}
tbZhengtuCompensate.tbExtpointList = {
	[1] = {nExtPoint = 5, nBit = 8},
	[2] = {nExtPoint = 5, nBit = 9},
}

tbZhengtuCompensate.tbAccType_Get_Item_Skill = {
	[1] = {nTaskID = 2950,nStartBit = 25,nBitCount = 1,nMaxValue = 1},
	[2] = {nTaskID = 2950,nStartBit = 26,nBitCount = 1,nMaxValue = 1},
	[3] = {nTaskID = 2950,nStartBit = 27,nBitCount = 1,nMaxValue = 1},
	[4] = {nTaskID = 2950,nStartBit = 28,nBitCount = 1,nMaxValue = 1},	
}

tbZhengtuCompensate.tbBitTSKAccTypeGetTL = {
	[1] = {nTaskID = 2950,nStartBit = 21,nBitCount = 1,nMaxValue = 1},
	[2] = {nTaskID = 2950,nStartBit = 22,nBitCount = 1,nMaxValue = 1},
	[3] = {nTaskID = 2950,nStartBit = 23,nBitCount = 1,nMaxValue = 1},
	[4] = {nTaskID = 2950,nStartBit = 24,nBitCount = 1,nMaxValue = 1},	
}
tbZhengtuCompensate.tbBitTSKGetItem = {nTaskID = 2950,nStartBit = 29,nBitCount = 1,nMaxValue = 1}
tbZhengtuCompensate.tbBitTSKGetItem2 = {nTaskID = 2950,nStartBit = 30,nBitCount = 1,nMaxValue = 1}
function tbZhengtuCompensate:CheckGetTransLife()
	local tbTemp = self.tbExtpointList
	if not self:Get_TL_AccType_By_BitTSK() and tbExtPointLib:GetBitValue(tbTemp[1].nExtPoint, tbTemp[1].nBit) == 0 and tbExtPointLib:GetBitValue(tbTemp[2].nExtPoint, tbTemp[2].nBit) == 0 then
		return nil
	end
	return 1
end

function tbZhengtuCompensate:Get_ItemSkill_AccType()
	for i = 1, getn(self.tbAccType_Get_Item_Skill) do
		if tbVNG_BitTask_Lib:getBitTask(self.tbAccType_Get_Item_Skill[i]) == 1 then
			return i
		end
	end
	return nil
end

function tbZhengtuCompensate:Get_TL_AccType_By_BitTSK()
	for i = 1, getn(self.tbBitTSKAccTypeGetTL) do
		if tbVNG_BitTask_Lib:getBitTask(self.tbBitTSKAccTypeGetTL[i]) == 1 then
			return i
		end
	end
	return nil
end

function tbZhengtuCompensate:UpdateBitTSKValue()
	if tbExtPointLib:GetBitValue(self.tbExtpointList[1].nExtPoint, self.tbExtpointList[1].nBit) == 0 and tbExtPointLib:GetBitValue(self.tbExtpointList[2].nExtPoint, self.tbExtpointList[2].nBit) == 0 then
		return
	end	
	if tbExtPointLib:GetBitValue(self.tbExtpointList[1].nExtPoint, self.tbExtpointList[1].nBit) == 1 then
		if tbExtPointLib:SetBitValue(self.tbExtpointList[1].nExtPoint, self.tbExtpointList[1].nBit, 0) ~= 1 then
			return
		end
		tbVNG_BitTask_Lib:setBitTask(self.tbBitTSKAccTypeGetTL[1], 1)
	end
	
	if tbExtPointLib:GetBitValue(self.tbExtpointList[2].nExtPoint, self.tbExtpointList[2].nBit) == 1 then
		if tbExtPointLib:SetBitValue(self.tbExtpointList[2].nExtPoint, self.tbExtpointList[2].nBit, 0) ~= 1 then
			return
		end
		local strAcc = GetAccount()
		local nResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\account.lua", "tbZTAccount:CheckAccount", 2, strAcc)
		if nResult == 1 then
			tbVNG_BitTask_Lib:setBitTask(self.tbBitTSKAccTypeGetTL[2], 1)
		end		
		nResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\account.lua", "tbZTAccount:CheckAccount", 3, strAcc)
		if nResult == 1 then
			tbVNG_BitTask_Lib:setBitTask(self.tbBitTSKAccTypeGetTL[3], 1)
		end		
		nResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\account.lua", "tbZTAccount:CheckAccount", 4, strAcc)
		if nResult == 1 then
			tbVNG_BitTask_Lib:setBitTask(self.tbBitTSKAccTypeGetTL[4], 1)
		end	
		--item			
		nResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\account.lua", "tbZTAccount:CheckAccount", 5, strAcc)
		if nResult == 1 then
			tbVNG_BitTask_Lib:setBitTask(self.tbAccType_Get_Item_Skill[1], 1)
		end
		nResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\account.lua", "tbZTAccount:CheckAccount", 6, strAcc)
		if nResult == 1 then
			tbVNG_BitTask_Lib:setBitTask(self.tbAccType_Get_Item_Skill[2], 1)
		end
		nResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\account.lua", "tbZTAccount:CheckAccount", 7, strAcc)
		if nResult == 1 then
			tbVNG_BitTask_Lib:setBitTask(self.tbAccType_Get_Item_Skill[3], 1)
		end
		nResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\account.lua", "tbZTAccount:CheckAccount", 8, strAcc)
		if nResult == 1 then
			tbVNG_BitTask_Lib:setBitTask(self.tbAccType_Get_Item_Skill[4], 1)
		end
	end
end

function tbZhengtuCompensate:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end