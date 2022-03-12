Include("\\script\\tong\\workshop\\workshop_setting.lua")

-------作坊升级条件逻辑-------
function logicWorkShopLevelUp(nTongID, nID, nToLevel)
	local eType = TWS_GetType(nTongID, nID)
	local nCurLevel = TWS_GetLevel(nTongID, nID)
	local nnTongIDLevel = TONG_GetBuildLevel(nTongID)
	if (nToLevel > tongGetWorkshopUpperLevel(nTongID, nnTongIDLevel)) then
		return 1 --("作坊已达最大等级！")
	end	
	local nCost = wsGetUpgradeCostFund(nTongID, eType, nCurLevel)
	local nCurFund = TONG_GetBuildFund(nTongID)
	if nCurFund < nCost then	--建设基金是否满足
		return 2 --("建设基金不足，不能升级！")
	end	
	if TONG_GetPauseState(nTongID) ~= 0 then	--建设基金是否满足
		return 3 --("建设基金不足，不能升级！")
	end
	local bOpen = TWS_IsOpen(nTongID, nID)
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, nToLevel, bOpen) - 
			wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen);	
	if ((TONG_GetPerStandFund(nTongID) + nMaintainAdd * 7) * TONG_GetMemberCount(nTongID) > 
		TONG_GetWarBuildFund(nTongID)) then
		return 4 --（周维护战备基金大于战备基金）
	end	
	return 0
end

function logicWorkShopDegrade(nTongID, nID, nToLevel)
	if (nToLevel < 1) then
		return 1
	end	
	return 0
end
			
function logicWorkShopOpen(nTongID, nID)
	local eType = TWS_GetType(nTongID, nID)
	if (TWS_IsOpen(nTongID, nID) == 1) then
		return 1
	end
--	if TONG_GetPauseState(nTongID) ~= 0 then
--		return 2 --("暂停状态")
--	end
	local nCurLevel = TWS_GetUseLevel(nTongID, nID)
	local nCost = wsGetOpenCost(nTongID, eType, nCurLevel)
	if TONG_GetBuildFund(nTongID) < nCost then
		return 3 --("建设基金不足")
	end	
	local nMaintainAdd = wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel)
	if ((TONG_GetPerStandFund(nTongID) + nMaintainAdd * 7) * TONG_GetMemberCount(nTongID) > 
		TONG_GetWarBuildFund(nTongID)) then
		return 4 --（周维护战备基金大于战备基金）
	end	
	return 0
end

function logicWorkShopClose(nTongID, nID)
	if (TWS_IsOpen(nTongID, nID) == 1) then
		return 0
	end
	return 1	
end

function logicWorkShopDestroy(nTongID, nID)
	if (TWS_GetLevel(nTongID, nID) > 0) then
		return 0
	end
	return 1	
end

function logicWorkShopLearn(nTongID, eType)
	--if not WorkShopCheckAuthority(nTongID,eType,nPlayerIdx) then
	--	return 1 --("没有权限")
	--end
	local nnTongIDLevel = TONG_GetBuildLevel(nTongID)
	local nWorkshops = TWS_GetWorkshopCount(nTongID)
	--作坊数量已达上限
	if nWorkshops >= tongGetMaxWorkshopNum(nTongID, nnTongIDLevel)then
		return 1
	end
	--作坊已存在
	if TWS_GetWorkshopCount(nTongID, eType) > 0 then
		return 2
	end
	if TONG_GetPauseState(nTongID) ~= 0 then
		return 3
	end	
	local nCost = wsGetUpgradeCostFund(nTongID, eType, 0)
	 --("建设基金不足")
	if TONG_GetBuildFund(nTongID) < nCost then
		return 4
	end
	local nMaintainAdd = wsGetPerMaintainCost(nTongID, eType, 1, 1);
	if ((TONG_GetPerStandFund(nTongID) + nMaintainAdd * 7) * TONG_GetMemberCount(nTongID) > 
		TONG_GetWarBuildFund(nTongID)) then
		return 5 --（周维护战备基金大于战备基金）
	end	
	return 0
end
