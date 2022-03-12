Include("\\script\\petsys\\head.lua")

szSkillDefFile = ""

function load_tabfile(szFile, tbColumn)
	local b1 = TabFile_Load(szFile, szFile)
	if b1 ~= 1 then
		print(format("open %s failed", szFile))
		return
	end
	
	local nRowCount = TabFile_GetRowCount(szFile, szFile)
	local tbData = {}
	for i=2, 1+nRowCount do
		local tbRow = {}
		for j=1, getn(tbColumn) do
			local value = TabFile_GetCell(szFile, i, tbColumn[j])
			tbRow[j] = tonumber(value) or tostring(value)
		end
		tinsert(tbData, tbRow)
	end
	return tbData
end

function PetSys:LoadFeatureData()
	local szFeatureFile = "\\settings\\petsys\\feature.txt"
	local b1 = TabFile_Load(szFeatureFile, szFeatureFile)
	if b1 ~= 1 then
		print(format("open %s failed", szFeatureFile))
		return
	end
	local nRowCount = TabFile_GetRowCount(szFeatureFile, szFeatureFile)
	for i=2, nRowCount do
		local nFeatureLevel = tonumber(TabFile_GetCell(szFeatureFile, i, "nFeatureLevel"))
		self.tbFeature[nFeatureLevel] = self.tbFeature[nFeatureLevel] or {}
		local nFeatureName = tostring(TabFile_GetCell(szFeatureFile, i, "nFeatureName"))
		local nNpcId = tonumber(TabFile_GetCell(szFeatureFile, i, "nNpcId"))
		tinsert(self.tbFeature[nFeatureLevel], {nFeatureName, nNpcId})
	end
	
	local szLevelUpFile = "\\settings\\petsys\\levelup.txt"
	local tbLevelUpColumn = {"nUpGradePoint", "nGrownPoint", "nTamePoint", "nItemCostCount", "nSuccessRate"}
	self.tbLevelUp = load_tabfile(szLevelUpFile, tbLevelUpColumn)

end

function PetSys:LoadSkillData()
	local tbSkillData = {}
	
	if TabFile_Load(szSkillDefFile, szSkillDefFile) ~= 1 then
		print(format("ERROR! Load TabFile[%s] Failed!", szSkillDefFile))
		return
	end
	local MAGIC_ATTRIB_PARAM_COUNT = 4
	local nRowCount = TabFile_GetRowCount(szSkillDefFile)
	local nColCount = TabFile_GetColCount(szSkillDefFile)
	if mod(nColCount - 1, MAGIC_ATTRIB_PARAM_COUNT) ~= 0 then
		print(format("ERROR! TabFile[%s] column count error!", szSkillDefFile))
		return
	end
	local nSkillCount = floor((nColCount - 1) / MAGIC_ATTRIB_PARAM_COUNT)
	
	for nRow = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell(szSkillDefFile, nRow, 1))
		tbSkillData[nLevel] = {}
		for nSkillIdx = 1, nSkillCount do
			local tbMagicAttrib = {}
			tbMagicAttrib.tbParam = {}
			tbMagicAttrib.szName = TabFile_GetCell(szSkillDefFile, nRow, 2 + (nSkillIdx - 1) * MAGIC_ATTRIB_PARAM_COUNT)
			tbMagicAttrib.tbParam[1] = tonumber(TabFile_GetCell(szSkillDefFile, nRow, 3 + (nSkillIdx - 1) * MAGIC_ATTRIB_PARAM_COUNT))
			tbMagicAttrib.tbParam[2] = tonumber(TabFile_GetCell(szSkillDefFile, nRow, 4 + (nSkillIdx - 1) * MAGIC_ATTRIB_PARAM_COUNT))
			tbMagicAttrib.tbParam[3] = tonumber(TabFile_GetCell(szSkillDefFile, nRow, 5 + (nSkillIdx - 1) * MAGIC_ATTRIB_PARAM_COUNT))
			tinsert(tbSkillData[nLevel], tbMagicAttrib)
		end
	end
	self.tbSkillData = tbSkillData
	return 1
end

PetSys:LoadFeatureData()