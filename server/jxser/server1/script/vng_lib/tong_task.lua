IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua");
if not tbTongTSK then 
	tbTongTSK = {}
end

tbTongTSK.tbList = {	
		[1] = {
			nTaskVersion = TONGTSK_VNG_CUSTOM3,
			nCurrentVersion = 1, --[08/4/2013 - 24h 14/4/2013] Ghi nhËn sè l­îng LÖnh Bµi TiÕn Cö
			tbTask = {TONGTSK_VNG_CUSTOM4, },
		},
}
--tbTTask ={nGroupID, nTaskIDX, nVersion}
function tbTongTSK:CheckTaskVersion(tbTTask)
	if not tbTTask or type(tbTTask) ~= "table" then
		return nil
	end
	local nGroupID = tbTTask.nGroupID	
	local nVer = tbTTask.nVersion
	if self.tbList[nGroupID].nCurrentVersion == nVer then
		return 1
	end
	error("Bit version is mismatched!!!")
	return nil
end

function tbTongTSK:ResetTask(nTongID, tbTTask)	
	local tbTSKGroup = self.tbList[tbTTask.nGroupID]
	local nCurGroupVer = tbTSKGroup.nCurrentVersion
	if TONG_GetTaskValue(nTongID, tbTSKGroup.nTaskVersion) ~= nCurGroupVer then
		TONG_ApplySetTaskValue(nTongID, tbTSKGroup.nTaskVersion, nCurGroupVer)
		for i = 1, getn(tbTSKGroup.tbTask) do
			TONG_ApplySetTaskValue(nTongID, tbTSKGroup.tbTask[i], 0)
		end
	end
end

function tbTongTSK:SetTongTask(nTongID, tbTTask, nValue)
	self:ResetTask(nTongID, tbTTask)
	if self:CheckTaskVersion(tbTTask) ~= 1 then		
		error("Tong task version mismatched!!!")
		return nil
	end
	
	TONG_ApplySetTaskValue(nTongID, self.tbList[tbTTask.nGroupID].tbTask[tbTTask.nTaskIDX], nValue)
	return 1
end

function tbTongTSK:GetTongTask(nTongID, tbTTask)
	self:ResetTask(nTongID, tbTTask)
	if self:CheckTaskVersion(tbTTask) ~= 1 then
		error("Tong task version mismatched!!!")
		return nil
	end	
	return TONG_GetTaskValue(nTongID, self.tbList[tbTTask.nGroupID].tbTask[tbTTask.nTaskIDX])
end