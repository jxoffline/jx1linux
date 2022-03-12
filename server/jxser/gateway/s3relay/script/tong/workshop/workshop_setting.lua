Include("\\script\\tong\\tong_setting.lua")
--ÅäÖÃ²ÎÊı
WS_MAX_LEVEL = 10 --×÷·»×î´óµÈ¼¶
WS_COEF_CLOSE = 0.2 --¹Ø±Õ×÷·»µÄÎ¬»¤ÏûºÄ±È£¨¶ÔÓÚ¿ªÆô×´Ì¬£©

aWorkshopTypeData = {}	--¸÷ÀàĞÍ×÷·»µÄÅäÖÃ²ÎÊı
aWorkshopLevelData = {}	--×÷·»µÈ¼¶²ÎÊı
aWorkshopNameType = {}  --ÓÉÃû×ÖË÷ÒıµÄÀàĞÍID

function LoadWorkshopSetting()	--ÔØÈëÅäÖÃ
	local b2 = TabFile_Load("\\settings\\tong\\workshop\\workshop_level_data.txt", "WorkshopLevelData")
	local b3 = TabFile_Load("\\settings\\tong\\workshop\\workshops.txt", "WorkshopTypeData")
	if b2~=1 or b3~=1 then
		print("§äc tÖp config t¸c ph­êng thÊt b¹i!")
		if b2 == 1 then TabFile_UnLoad("WorkshopLevelData") end
		if b3 == 1 then TabFile_UnLoad("WorkshopTypeData") end
		return
	end
	local nRowCount = TabFile_GetRowCount("WorkshopLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("WorkshopLevelData", y, "LEVEL"))
		aWorkshopLevelData[nLevel] = {}
		for x = 1, 100 do 
			local szHead = TabFile_GetCell("WorkshopLevelData", 1, x)
			if szHead ~= "" then	
				aWorkshopLevelData[nLevel][szHead] = TabFile_GetCell("WorkshopLevelData", y, x)
			else
				break	
			end		
		end	
	end	
	nRowCount = TabFile_GetRowCount("WorkshopTypeData")
	for y = 2, nRowCount do
		local eType = tonumber(TabFile_GetCell("WorkshopTypeData", y, "TYPE"))
		aWorkshopTypeData[eType] = {}
		for x = 1, 100 do
			local szHead = TabFile_GetCell("WorkshopTypeData", 1, x)
			if szHead ~= "" then	
				aWorkshopTypeData[eType][szHead] = TabFile_GetCell("WorkshopTypeData", y, x)
			else
				break	
			end		
		end	
	end
	for i = 1, getn(aWorkshopTypeData) do
		aWorkshopNameType[aWorkshopTypeData[i]["NAME"]] = i
	end	
--	TabFile_UnLoad("WorkshopLevelData")
--	TabFile_UnLoad("WorkshopTypeData")
end
LoadWorkshopSetting()
------------------------ÔËËã¹«Ê½-------------------------------------
--°ï»áÈËÊıĞŞÕıÏµÊı
function calcMemberCoef(nMembers)
	if nMembers < 50 then
		return 1.5 - nMembers/50*(1.5-1)
	elseif	nMembers > 300 then
		return 5 - (300/nMembers)*(5-3)
	else
		return 1
	end
end

--×÷·»ÈÕ³£Î¬»¤·ÑÓÃ¹«Ê½£º»ù´¡½¨Éè¶È*°ï»áÈËÊı*×÷·»ÖÖÀàĞŞÕı*°ï»áÈËÊıĞŞÕı
function calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	return nBaseFund*nMembers*coefType*coefMember
end

--ÓÉÕı³£×÷·»µÄÈÕ³£ÏûºÄ¼ÆËã¹Ø±Õ×´Ì¬×÷·»µÄÈÕ³£ÏûºÄ
function calcCloseDailyFund(nNormalFund)
	return nNormalFund * WS_COEF_CLOSE
end

-------------------------Êı¾İ½Ó¿Ú------------------------------------
function wsGetMaxLevel(nTongID, eType)
	return WS_MAX_LEVEL
end

function wsGetName(eType)
	return aWorkshopTypeData[eType]["NAME"]
end

function wsGetTypeID(szName)
	return aWorkshopNameType[szName]
end

function wsGetUpgradeCostFund(nTongID, eType, nCurLevel) --»ñÈ¡ÉıÏÂ¼¶ËùĞè½¨Éè»ù½ğ
	local nRet = tonumber(aWorkshopLevelData[nCurLevel]["UPGRADE_FUND"]*aWorkshopTypeData[eType]["COEFFICIENT"])
	if (nRet == nil) then
		print("GÆp lçi khi n©ng cÊp ng©n s¸ch kiÕn thiÕt!")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetMaintainCost(nTongID, eType, nCurLevel, bOpen) --»ñÈ¡ÈÕ³£Î¬»¤·ÑÓÃ
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--»ù´¡½¨Éè¶È
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--»ñÈ¡°ï»áÈËÊı
	local coefMember = calcMemberCoef(nMembers)	--ÈËÊıĞŞÕıÏµÊı
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --½¨ÉèÏµÊı£¨×÷·»ÖÖÀàĞŞÕı£©
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if bOpen == 0 then
		nRet = calcCloseDailyFund(nRet)
	end
	if (nRet == nil) then
		print("GÆp lçi khi b¶o tr× chi phİ hµng ngµy!")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetPerMaintainCost(nTongID, eType, nCurLevel, bOpen) --»ñÈ¡µ¥ÈËÈÕ³£Î¬»¤·ÑÓÃ
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--»ù´¡½¨Éè¶È
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--»ñÈ¡°ï»áÈËÊı
	local coefMember = calcMemberCoef(nMembers)	--ÈËÊıĞŞÕıÏµÊı
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --½¨ÉèÏµÊı£¨×÷·»ÖÖÀàĞŞÕı£©
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if bOpen == 0 then
		nRet = calcCloseDailyFund(nRet)
	end
	if (nRet == nil) then
		print("GÆp lçi khi b¶o tr× chi phİ hµng ngµy!")
		return INVALID_VALUE
	end
	return floor(nRet/nMembers)
end

function wsGetClose2OpenMaintainCost(nTongID, eType, nCurLevel) --»ñÈ¡¿ª¹Øµ¥ÈËÎ¬»¤·ÑÓÃ²î
	local nBaseFund = tonumber(aWorkshopLevelData[nCurLevel]["MAINTAIN_FUND"])	--»ù´¡½¨Éè¶È
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--»ñÈ¡°ï»áÈËÊı
	local coefMember = calcMemberCoef(nMembers)	--ÈËÊıĞŞÕıÏµÊı
	local coefType = tonumber(aWorkshopTypeData[eType]["COEFFICIENT"]) --½¨ÉèÏµÊı£¨×÷·»ÖÖÀàĞŞÕı£©
	local nRet = calcDailyFund(nBaseFund, nMembers, coefType, coefMember)
	if (nRet == nil) then
		print("GÆp lçi khi b¶o tr× chi phİ hµng ngµy!")
		return INVALID_VALUE
	end
	nRet = nRet - calcCloseDailyFund(nRet)
	return floor(nRet/nMembers)
end

function wsGetOpenCost(nTongID, eType, nCurLevel)	--»ñÈ¡¿ªÆôÏûºÄ
	local nRet = tonumber(aWorkshopLevelData[nCurLevel]["OPEN_FUND"]*aWorkshopTypeData[eType]["COEFFICIENT"])
	if (nRet == nil) then
		print("GÆp lçi khi nhËn ®­îc tiªu hao do kİch ho¹t!")
		return INVALID_VALUE
	end
	return floor(nRet)
end

function wsGetAllDayConsume(nTongID)	--»ñÈ¡ËùÓĞ×÷·»Ò»ÌìÎ¬»¤ÏûºÄ
	local nTotalValue = 0
	local nID = TWS_GetFirstWorkshop(nTongID)
	while nID ~= 0 do
		local eType = TWS_GetType(nTongID, nID)
		local bOpen = TWS_IsOpen(nTongID, nID)
		local nCurLevel = TWS_GetUseLevel(nTongID, nID)
		nTotalValue = nTotalValue + wsGetMaintainCost(nTongID, eType, nCurLevel, bOpen)
		nID = TWS_GetNextWorkshop(nTongID, nID)
	end
	return nTotalValue
end