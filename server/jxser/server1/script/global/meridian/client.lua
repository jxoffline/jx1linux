Include("\\script\\global\\meridian\\head.lua")
Include("\\script\\global\\meridian\\lang.lua")

function tbEhanceRateWay:GetLevelUpTips(nMeridianIndex, nNewLevel)
	if not self.tbAvailableMeridian[nMeridianIndex] then
		return 0, MERIDIAN_NOTICE_MERIDIAN_INVALID
	end
	
	local tbMeridian = self.tbLevelUpInfo[nMeridianIndex]
	if not tbMeridian then
		return 0, MERIDIAN_NOTICE_MERIDIAN_INVALID
	end
	
	local tbRequirement = tbMeridian[nNewLevel]
	if (not tbRequirement) or tbRequirement.nXueLongDanCount < 0 then
		return 0, MERIDIAN_NOTICE_ACUP_INVALID
	end

	if not self.tbAvailableLevel[nNewLevel] then
		return 0, MERIDIAN_NOTICE_ACUP_NOT_OPEN
	end

	local szTips = ""
	szTips = format(MERIDIAN_NOTICE_COST_ZY, Meridian:GetValueName(nMeridianIndex), tbRequirement.nZhenYuan).."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_COST_HMD, Meridian:GetItemName(nMeridianIndex), tbRequirement.nHuMaiDan).."\n\n"
	if tbRequirement.nXueLongTengCount > 0 then
		szTips = szTips..format(MERIDIAN_NOTICE_COST_LEVEL_ITEM,
			ITEM_NAME_XUELONGTENG,
			tbRequirement.nXueLongTengLevel,
			tbRequirement.nXueLongTengCount).."\n\n"
	end
	if tbRequirement.nXueLongDanCount > 0 then
		szTips = szTips..format(MERIDIAN_NOTICE_COST_LEVEL_ITEM,
			ITEM_NAME_XUELONGDAN,
			tbRequirement.nXueLongDanLevel,
			tbRequirement.nXueLongDanCount).."\n\n"
	end

	szTips = szTips..format(MERIDIAN_NOTICE_SUC_RATE, floor(tbRequirement.nRate/100)).."\n\n"
	if tbRequirement.nRate < 10000 then
		szTips = szTips..format(MERIDIAN_NOTICE_FAILED_PUNISH, MERIDIAN_NOTICE_FAILED_PROTECTION).."\n\n"
	end
	return 1,szTips
end

function tbDaHuMaiDanWay:GetLevelUpTips(nMeridianIndex, nNewLevel)
	if not self.tbAvailableMeridian[nMeridianIndex] then
		return 0, MERIDIAN_NOTICE_MERIDIAN_INVALID
	end

	local tbRequirement = self.tbLevelUpInfo[nNewLevel]
	if (not tbRequirement) then
		return 0, MERIDIAN_NOTICE_ACUP_INVALID
	end

	local szTips = ""
	szTips = format(MERIDIAN_NOTICE_COST_ZY, Meridian:GetValueName(nMeridianIndex), tbRequirement.nZhenYuan).."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_COST_DHMD, floor(tbRequirement.nHuMaiDan/tbReqHuMaiDan.nDaHuMaiDa2HuMaiDan))..", hoÆc lµ Hé M¹ch §¬n b»ng nhau.".."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_SUC_RATE, floor(tbRequirement.nRate/100)).."\n\n"
	return 1,szTips
end

function GetDefaultWay(nMeridianIndex, nNewLevel)
	if nMeridianIndex == 3 or nMeridianIndex == 4 then
		return MERIDIAN_LEVELUP_WAY_USE_DAHUMAIDAN
	end
	return MERIDIAN_LEVELUP_WAY_NOMAL
end

function GetNormalLevelUpTips(nMeridianIndex, nNewLevel)
	local tbData = NormalMethod:GetLevelData(nMeridianIndex, nNewLevel)
	if not tbData then
		return 0, ""
	end
	local szTips = ""
	szTips = format(MERIDIAN_NOTICE_COST_ZY, Meridian:GetValueName(nMeridianIndex), tbData.nZhenYuanCount).."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_COST_HMD, Meridian:GetItemName(nMeridianIndex), tbData.nHuMaiDanCount).."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_SUC_RATE, floor(tbData.nSuccessRate/100)).."\n\n"
	if tbData.nSuccessRate >= 10000 or tbData.nRollBackLevel >= nNewLevel-1 then
		szTips = szTips..format(MERIDIAN_NOTICE_FAILED_PUNISH, MERIDIAN_NOTICE_FAILED_PROTECTION).."\n\n"
	else
		local szInfo = format(MERIDIAN_NOTICE_FAILED1, tbData.nRollBackLevel)
		szTips = szTips..format(MERIDIAN_NOTICE_FAILED_PUNISH, szInfo).."\n\n"
	end
	return 1, szTips
end

function GetProtectLevelUpTips(nMeridianIndex, nNewLevel)
	local tbData = NormalMethod:GetLevelData(nMeridianIndex, nNewLevel)
	if not tbData then
		return 0, ""
	end
	if tbData.nSuccessRate >= 10000 then
		return 0, MERIDIAN_PROTECT_INVALID
	end
	if not MeridianProtect[nMeridianIndex] or not MeridianProtect[nMeridianIndex][nNewLevel] then
		return 0, MERIDIAN_PROTECT_INVALID
	end
	local szTips = ""
	szTips = format(MERIDIAN_NOTICE_COST_ZY, Meridian:GetValueName(nMeridianIndex), tbData.nZhenYuanCount).."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_COST_HMD, Meridian:GetItemName(nMeridianIndex), tbData.nHuMaiDanCount).."\n\n"
	local tbItem = MeridianProtect[nMeridianIndex][nNewLevel]
	szTips = szTips..format(MERIDIAN_NOTICE_COST_LEVEL_ITEM, tbItem.szName, tbItem.tbProp[4], tbItem.nCount).."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_SUC_RATE, floor(tbData.nSuccessRate/100)).."\n\n"
	szTips = szTips..format(MERIDIAN_NOTICE_FAILED_PUNISH, MERIDIAN_NOTICE_FAILED_PROTECTION).."\n\n"
	return 1, szTips
end