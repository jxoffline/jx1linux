Include("\\script\\activitysys\\config\\1004\\variables.lua")
tbDTT_Data = {}
tbDTT_Data.tbStages = {}
function tbDTT_Data:Load()
	local strFolder = "settings/vng/dongtrungthao/"
	local tbPattern = {"*n", "*n", "*n", "*n", "*n"}
	--Load file giai doan 1
	--diem ky nang
	self.tbStages[1] = {}
	self.tbStages[1].tbProp = {}
	local tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage1_skill_point.txt", tbPattern)
	self.tbStages[1][1] = self:SyncData(tbTemp)
	self.tbStages[1][1].strType = "ßi”m k¸ n®ng"
	self.tbStages[1][1].tbBitTask = {%tbBITTSK_STAGE_1_SKILL_POINT, %tbBITTSK_STAGE_1_SKILL_POINT_FINISH}
	self.tbStages[1][1].strLog = "NVGD1_DiemKyNang"
	--diem tiem nang
	tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage1_prop_point.txt", tbPattern)
	self.tbStages[1][2] = self:SyncData(tbTemp)
	self.tbStages[1][2].strType = "ßi”m ti“m n®ng"
	self.tbStages[1][2].tbBitTask = {%tbBITTSK_STAGE_1_PROP_POINT, %tbBITTSK_STAGE_1_PROP_POINT_FINISH}
	self.tbStages[1][2].strLog = "NVGD1_DiemTiemNang"
	--khang tat ca
	tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage1_all_resist.txt", tbPattern)
	self.tbStages[1][3] = self:SyncData(tbTemp)
	self.tbStages[1][3].strType = "Kh∏ng t t c∂"
	self.tbStages[1][3].tbBitTask = {%tbBITTSK_STAGE_1_ALL_RESIST, %tbBITTSK_STAGE_1_ALL_RESIST_FINISH}
	self.tbStages[1][3].strLog = "NVGD1_KhangTatCa"
	--ky nang toi da
	tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage1_max_skill.txt", tbPattern)
	self.tbStages[1][4] = self:SyncData(tbTemp)
	self.tbStages[1][4].strType = "K¸ n®ng tËi Æa"
	self.tbStages[1][4].tbBitTask = {%tbBITTSK_STAGE_1_MAX_SKILL, %tbBITTSK_STAGE_1_MAX_SKILL_FINISH}
	self.tbStages[1][4].strLog = "NVGD1_KyNangToiDa"
	--Giai doan 2
	self.tbStages[2] = {}
	--ky nang
	 tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage2_skill_point.txt", tbPattern)
	self.tbStages[2][1] = self:SyncData(tbTemp)
	self.tbStages[2][1].strType = "ßi”m k¸ n®ng"
	self.tbStages[2][1].tbBitTask = {%tbBITTSK_STAGE_2_SKILL_POINT, %tbBITTSK_STAGE_2_SKILL_POINT_FINISH}
	self.tbStages[2][1].strLog = "NVGD2_DiemKyNang"
	--tiem nang
	tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage2_prop_point.txt", tbPattern)
	self.tbStages[2][2] = self:SyncData(tbTemp)
	self.tbStages[2][2].strType = "ßi”m ti“m n®ng"
	self.tbStages[2][2].tbBitTask = {%tbBITTSK_STAGE_2_PROP_POINT, %tbBITTSK_STAGE_2_PROP_POINT_FINISH}
	self.tbStages[2][2].strLog = "NVGD2_DiemTiemNang"
	--khang tinh 1 loai
	tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage2_resist.txt", tbPattern)
	self.tbStages[2][3] = self:SyncData(tbTemp)
	self.tbStages[2][3].strType = "Kh∏ng t›nh"
	self.tbStages[2][3].tbBitTask = {%tbBITTSK_STAGE_2_RESIST, %tbBITTSK_STAGE_2_RESIST_FINISH}
	self.tbStages[2][3].strLog = "NVGD2_KhangTinh"
	--Giai doan 3
	self.tbStages[3] = {}
	--ky nang
	 tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage3_skill_point.txt", tbPattern)
	self.tbStages[3][1] = self:SyncData(tbTemp)
	self.tbStages[3][1].strType = "ßi”m k¸ n®ng"
	self.tbStages[3][1].tbBitTask = {%tbBITTSK_STAGE_3_SKILL_POINT, %tbBITTSK_STAGE_3_SKILL_POINT_FINISH}
	self.tbStages[3][1].strLog = "NVGD3_DiemKyNang"
	--tiem nang
	tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage3_prop_point.txt", tbPattern)
	self.tbStages[3][2] = self:SyncData(tbTemp)
	self.tbStages[3][2].strType = "ßi”m ti“m n®ng"
	self.tbStages[3][2].tbBitTask = {%tbBITTSK_STAGE_3_PROP_POINT, %tbBITTSK_STAGE_3_PROP_POINT_FINISH}
	self.tbStages[3][2].strLog = "NVGD3_DiemTiemNang"
	--khang tinh 1 loai
	tbTemp = tbVngLib_File:TableFromFile(strFolder, "stage3_resist.txt", tbPattern)
	self.tbStages[3][3] = self:SyncData(tbTemp)
	self.tbStages[3][3].strType = "Kh∏ng t›nh"
	self.tbStages[3][3].tbBitTask = {%tbBITTSK_STAGE_3_RESIST, %tbBITTSK_STAGE_3_RESIST_FINISH}
	self.tbStages[3][3].strLog = "NVGD3_KhangTinh"
end

function tbDTT_Data:SyncData(tbIn)
	local tbOut = {}
	for i = 1, getn(tbIn) do		
		tbOut[tbIn[i][1]] = {tbIn[i][2], tbIn[i][3], tbIn[i][4], tbIn[i][5]}
	end
	return tbOut
end