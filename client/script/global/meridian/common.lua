IncludeLib("FILESYS")

MERIDIAN_LEVELUP_WAY_NOMAL = 0
MERIDIAN_LEVELUP_WAY_USE_PROTECTION = 1
MERIDIAN_LEVELUP_WAY_USE_EHANCE_RATE = 2
MERIDIAN_LEVELUP_WAY_USE_DAHUMAIDAN = 3

ProtectItem1 =
{
	[2] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,1}, nCount = 10},
	[3] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,2}, nCount = 10},
	[4] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,3}, nCount = 10},
	[5] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,4}, nCount = 10},
	[6] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,5}, nCount = 10},
	[7] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,6}, nCount = 10},
	[8] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,7}, nCount = 10},
	[9] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,8}, nCount = 10},
	[10] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,9}, nCount = 10},
	[13] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,12}, nCount = 10},
}

ProtectItem2 =
{
	[5] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,4}, nCount = 10},
	[6] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,5}, nCount = 10},
	[7] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,6}, nCount = 10},
	[8] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 3328,2}, nCount = 10},
	[9] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,8}, nCount = 10},
	[10] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,9}, nCount = 10},
	[12] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,11}, nCount = 10},
	[13] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,12}, nCount = 10},
	[15] = {szName = "HuyÕt Long §»ng", tbProp = {6, 1, 30289,14}, nCount = 10},
}

MeridianProtect = {
	[1] = ProtectItem1,
	[2] = ProtectItem1,
	[5] = ProtectItem2,
	[6] = ProtectItem2,
	[7] = ProtectItem2,
	[8] = ProtectItem2,
}

NormalMethod = NormalMethod or {}
NormalMethod.tbRuleData = NormalMethod.tbRuleData or {}

function NormalMethod:Init()
	local szFile = "\\settings\\meridian\\meridian_level.txt"
	
	if TabFile_Load(szFile, szFile) == 0 then
		print("TabFile load error: "..szFile)
		return
	end
	
	for i = 2, TabFile_GetRowCount(szFile) do
		local tbData = {}
		local nMeridianIdx = tonumber(TabFile_GetCell(szFile, i, 2))
		local nLevel = tonumber(TabFile_GetCell(szFile, i, 3))
		tbData.nRollBackLevel = tonumber(TabFile_GetCell(szFile, i, 4))
		tbData.nSuccessRate = tonumber(TabFile_GetCell(szFile, i, 5))
		tbData.nZhenYuanCount = tonumber(TabFile_GetCell(szFile, i, 10))
		tbData.nHuMaiDanCount = tonumber(TabFile_GetCell(szFile, i, 11))
		
		local tbId = self.tbRuleData[nMeridianIdx]
		if tbId == nil then
			tbId = {}
			self.tbRuleData[nMeridianIdx] = tbId
		end
		
		tbId[nLevel] = tbData
	end
	TabFile_UnLoad(szFile)
end

function NormalMethod:GetLevelData(nMeridianIndex, nLevel)
	local tbId = self.tbRuleData[nMeridianIndex]
	if tbId  then
		return tbId[nLevel]
	end
	return 
end
NormalMethod:Init()

tbEhanceRateWay = tbEhanceRateWay or {}
tbEhanceRateWay.tbLevelUpInfo = {}
tbEhanceRateWay.tbAvailableMeridian = {
	[1] = 1,
	[2] = 1,
	[5] = 1,
	[6] = 1,
	[7] = 1,
	[8] = 1,
}

tbEhanceRateWay.tbAvailableLevel = {
	[3]=1,
	[4]=1,
	[5]=1,
	[6]=1,
	[7]=1,
	[8]=1,
	[15]=1,
	[16]=1,
}

function tbEhanceRateWay:LoadLevelUpInfo()
	local szFile = "\\settings\\meridian\\xuelongdan.txt"
	if TabFile_Load(szFile, szFile) == 0 then
		print("TabFile load error: "..szFile)
		return
	end
	for i = 2, TabFile_GetRowCount(szFile) do
		local nMeridian = tonumber(TabFile_GetCell(szFile, i, 1))
		local nLevel = tonumber(TabFile_GetCell(szFile, i, 2))
		local tbData = {
			nXueLongTengLevel = tonumber(TabFile_GetCell(szFile, i, 3)),
			nXueLongTengCount = tonumber(TabFile_GetCell(szFile, i, 4)),
			nXueLongDanLevel = tonumber(TabFile_GetCell(szFile, i, 5)),
			nXueLongDanCount = tonumber(TabFile_GetCell(szFile, i, 6)),
			nZhenYuan = tonumber(TabFile_GetCell(szFile, i, 7)),
			nHuMaiDan = tonumber(TabFile_GetCell(szFile, i, 8)),
			nRate = tonumber(TabFile_GetCell(szFile, i, 9)),
		}
		local tb = self.tbLevelUpInfo[nMeridian]
		if not tb then
			tb = {}
			self.tbLevelUpInfo[nMeridian] = tb
		end
		tb[nLevel] = tbData
	end
	TabFile_UnLoad(szFile)
end
tbEhanceRateWay:LoadLevelUpInfo()

tbDaHuMaiDanWay = tbDaHuMaiDanWay or {}
tbDaHuMaiDanWay.tbLevelUpInfo = {}
tbDaHuMaiDanWay.tbAvailableMeridian = {
	[3] = 1,
	[4] = 1,
}

function tbDaHuMaiDanWay:LoadLevelUpInfo()
	local szFile = "\\settings\\meridian\\lvup_dahumaidan.txt"
	if TabFile_Load(szFile, szFile) == 0 then
		print("TabFile load error: "..szFile)
		return
	end
	
	for i = 2, TabFile_GetRowCount(szFile) do
		local nLevel = tonumber(TabFile_GetCell(szFile, i, 1))
		local tbData = {
			nZhenYuan = tonumber(TabFile_GetCell(szFile, i, 2)),
			nHuMaiDan = tonumber(TabFile_GetCell(szFile, i, 3)),
			nRate = tonumber(TabFile_GetCell(szFile, i, 4)),
		}
		self.tbLevelUpInfo[nLevel] = tbData
	end
	TabFile_UnLoad(szFile)
end
tbDaHuMaiDanWay:LoadLevelUpInfo()


Meridian = Meridian or {}

--ĞÂÀÏ¾­Âö·Ö½ç
Meridian.MERIDIAN_TYPE_MAX_NUM = 8

--ÕæÔª
Meridian.TSK_ZHEN_YUAN = 4000

--»¤Âöµ¤
Meridian.tbHuMaiDan = {6, 1, 3203}

--ĞşÔª
Meridian.TSK_XUAN_YUAN = 4318

--ĞşÔªµ¤
Meridian.TSK_XUAN_YUAN_DAN = 4323

--¶¨Âöµ¤
Meridian.tbDingMaiDan = {6, 1, 4963}

--ÀÏ¾­ÂöÈÎÎñ±äÁ¿
Meridian.TSK_OLD_START = 4001
Meridian.TSK_OLD_END = 4008

--ĞÂ¾­ÂöÈÎÎñ±äÁ¿
Meridian.TSK_NEWMERIDIAN1 = 4319
Meridian.TSK_NEWMERIDIAN2 = 4320
Meridian.TSK_NEWMERIDIAN3 = 4321
Meridian.TSK_NEWMERIDIAN4 = 4322

--ÊÇ·ñÊÇĞÂ¾­Âö
function Meridian:IsNewMerdian(nMeridianIdx)
	if nMeridianIdx > self.MERIDIAN_TYPE_MAX_NUM then
		return 1
	end
	return nil
end

--»ñÈ¡ÕæÔª/ĞşÔªÖµ
function Meridian:GetValue(nMeridianIdx)
	if not self:IsNewMerdian(nMeridianIdx) then
		return GetTask(self.TSK_ZHEN_YUAN)
	else
		return GetTask(self.TSK_XUAN_YUAN)
	end
end

--ÏûºÄÕæÔª/ĞşÔª
function Meridian:ConsumeValue(nMeridianIdx, nValue)
	if not self:IsNewMerdian(nMeridianIdx) then
		SetTask(self.TSK_ZHEN_YUAN, self:GetValue(nMeridianIdx) - nValue)
	else
		SetTask(self.TSK_XUAN_YUAN, self:GetValue(nMeridianIdx) - nValue)
	end
end

function Meridian:GetValueName(nMeridianIdx)
	if not self:IsNewMerdian(nMeridianIdx) then
		return "Ch©n Nguyªn"
	else
		return "HuyÒn Nguyªn"
	end
end

--»ñÈ¡»¤Âöµ¤/¶¨Âöµ¤ÊıÁ¿
function Meridian:GetItemCount(nMeridianIdx)
	if not self:IsNewMerdian(nMeridianIdx) then
		return CalcItemCount(3, self.tbHuMaiDan[1], self.tbHuMaiDan[2], self.tbHuMaiDan[3], -1)
	else
		return CalcItemCount(3, self.tbDingMaiDan[1], self.tbDingMaiDan[2], self.tbDingMaiDan[3], -1)
	end
end

--ÏûºÄ»¤Âöµ¤/¶¨Âöµ¤
function Meridian:ConsumeItem(nMeridianIdx, nNum)
	if not self:IsNewMerdian(nMeridianIdx) then
		return ConsumeItem(3, nNum, self.tbHuMaiDan[1], self.tbHuMaiDan[2], self.tbHuMaiDan[3], -1)
	else
		return ConsumeItem(3, nNum, self.tbDingMaiDan[1], self.tbDingMaiDan[2], self.tbDingMaiDan[3], -1)
	end
end

function Meridian:GetItemName(nMeridianIdx)
	if not self:IsNewMerdian(nMeridianIdx) then
		return "Hé m¹ch ®¬n"
	else
		return "§Şnh M¹ch §an"
	end
end

function Meridian:GetOldAvgLevel()
	local nTotal = 0
	for i= self.TSK_OLD_START, self.TSK_OLD_END do
		nTotal = nTotal + GetTask(i)
	end
	return floor(nTotal / 8)
end

--ĞÂ¾­ÂöÖÁÉÙÃ¿Éı2¼¶£¬Éı1¼¶ÃÅÅÉÒÅ¼¼¼¼ÄÜ
function Meridian:GetNewMinLevel()
	return floor(min(GetTask(self.TSK_NEWMERIDIAN1), GetTask(self.TSK_NEWMERIDIAN2),
		GetTask(self.TSK_NEWMERIDIAN3), GetTask(self.TSK_NEWMERIDIAN4)) / 2)
end