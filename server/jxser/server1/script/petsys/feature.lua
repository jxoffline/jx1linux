Include("\\script\\lib\\log.lua")
Include("\\script\\petsys\\head.lua")

function PetSys:ChangeFeatureDlg()
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end

	if PET_IsCreate() ~= 1 then 
		return
	end
	
	if GetCashCoin() < %CHANGE_FEATURE_COIN then
		Talk(1, "", format(%NOT_ENOUGH_COIN, %CHANGE_FEATURE_COIN))
		return
	end
	
	local szTitle = %CHANGE_FEATURE_DLG1_TITLE
	local tbOpt = {}
	tinsert(tbOpt, format("%s/#PetSys:ChangeFeatureChooseFeatureLevel()", "Ta muèn söa"))
	tinsert(tbOpt, "M¾c qu¸, kh«ng söa n÷a")
	
	Say(%CHANGE_FEATURE_DLG1_TITLE, getn(tbOpt), unpack(tbOpt))
end

function PetSys:ChangeFeatureChooseFeatureLevel()
	local szTitle = "Chän ngo¹i quan t­¬ng øng víi ®¼ng cÊp"
	local tbOpt = {}
	local nFeatureLevelLimit = ceil(PET_GetLevel() / %PET_LEVEL_STEP)
	
	for nFeatureLevel=1, nFeatureLevelLimit do
		local szFeatureRange = ((nFeatureLevel-1)*%PET_LEVEL_STEP + 1) .. " - " .. (nFeatureLevel*%PET_LEVEL_STEP)
		tinsert(tbOpt, format("%s/#%s(%d)",szFeatureRange, "PetSys:ChangeFeatureChooseFeature", nFeatureLevel))
	end
	tinsert(tbOpt, %END_DLG)
	Say(szTitle, getn(tbOpt), unpack(tbOpt))
end

function PetSys:ChangeFeatureChooseFeature(nFeatureLevel)
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	
	local szTitle = "Xin lùa chän ngo¹i quan"
	local tbOpt = {}
	local tbFeatureGroup = self.tbFeature[nFeatureLevel]
	if not tbFeatureGroup then return end

	local nFeatureLimit = ceil(PET_GetLevel() / %PET_LEVEL_STEP)
	if nFeatureLevel > nFeatureLimit then return end
	
	for i=1,getn(tbFeatureGroup) do
		tinsert(tbOpt, format("%s/#%s(%d)", tbFeatureGroup[i][1], "PetSys:ConfirmChangeFeature", tbFeatureGroup[i][2]))
	end
	tinsert(tbOpt, format("%s/#%s()",%BACK, "PetSys:ChangeFeatureChooseFeatureLevel"))
	tinsert(tbOpt, %END_DLG)
	Say(szTitle, getn(tbOpt), unpack(tbOpt))
end

function PetSys:ConfirmChangeFeature(nFeatureId)
	if GetCashCoin() < %CHANGE_FEATURE_COIN then
		Talk(1, "", format(%NOT_ENOUGH_COIN, %CHANGE_FEATURE_COIN))
		return
	end
	if PayCoin(%CHANGE_FEATURE_COIN) == 1 then
		if self.summon == 1 then --if PET_IsSummon() == 1 then
			PET_UnSummon()
			self.summon = 0 --test
		end
		PET_SetFeatureId(nFeatureId)
		Msg2Player(%MSG_CHANGE_FEATURE)
		%tbLog:PlayerActionLog("PetSys", "ChangeFeature", PET_GetLevel())
		--Í¬ÐÔºÃÓÑ½çÃæ´¦×öÏàÓ¦ÐÞ¸Ä
	end
end