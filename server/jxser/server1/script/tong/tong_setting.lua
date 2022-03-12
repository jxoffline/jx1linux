IncludeLib("FILESYS")
IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

INVALID_VALUE = 2147483647
TONG_BASE_MAINTAIN_FUND = 10	--»ù´¡Î¬»¤·ÑÓÃÈË¾ùÖµ
aTongLevelData = {}	--°ï»áµÈ¼¶²ÎÊý

function LoadTongSetting()	--ÔØÈëÅäÖÃ
	local b1 = TabFile_Load("\\settings\\tong\\tong_level_data.txt", "TongLevelData")
	if b1~=1 then
		print("§äc tÖp config bang héi thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("TongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("TongLevelData", y, "LEVEL"))
		aTongLevelData[nLevel] = {}
		for x = 1, 100 do 
			local szHead = TabFile_GetCell("TongLevelData", 1, x)
			if szHead ~= "" then	
				aTongLevelData[nLevel][szHead] = TabFile_GetCell("TongLevelData", y, x)
			else
				break	
			end		
		end	
	end	
--	TabFile_UnLoad("TongLevelData")
end
LoadTongSetting()


	TB_STUNTID_INFO = {
	[1] = {stuntid = 1,name = "Phông Hoµng Ên", func = "stunt_fenghuang",},
	[2] = {stuntid = 2,name = "LuyÖn vâ hån", func = "stunt_duanwuhun",},
	[3] = {stuntid = 3,name = "V« Song S¸t TrËn", func = "stunt_wushuang",},
	[4] = {stuntid = 4,name = "§µo Chu TiÒn", func = "stunt_moneybox",},
	[5] = {stuntid = 5,name = "Vâ thÇn tø phóc", func = "stunt_wushenbless",},--ÔÝ¶¨
	[6] = {stuntid = 6,name = "Linh S©m Lùc", func = "stunt_lingshenli",},
	[7] = {stuntid = 7,name = "Hoµng Kim LÖnh", func = "stunt_huangjinling",},
	}
	function LoadStuntData()
		local b1 = TabFile_Load("\\settings\\tong\\tongstunt_setting.txt", "stuntData")
		if b1~=1 then
			print("§äc tÖp config kü n¨ng ®Æc biÖt thÊt b¹i!")
			return
		end
		local nRowCount = TabFile_GetRowCount("stuntData")
		for y = 3, nRowCount do
			local nstuntID = tonumber(TabFile_GetCell("stuntData", y, "StuntID"))
			TB_STUNTID_INFO[nstuntID].maxmem = tonumber(TabFile_GetCell("stuntData", y, "MaxMemberCnt"))
			TB_STUNTID_INFO[nstuntID].cycle = tonumber(TabFile_GetCell("stuntData", y, "Cycle"))
			TB_STUNTID_INFO[nstuntID].consume = tonumber(TabFile_GetCell("stuntData", y, "Consume"))
			TB_STUNTID_INFO[nstuntID].right = tonumber(TabFile_GetCell("stuntData", y, "RightLimit"))
			TB_STUNTID_INFO[nstuntID].cntper = tonumber(TabFile_GetCell("stuntData", y, "MaxStuntCntPer"))
			
			if (TB_STUNTID_INFO[nstuntID].right == 2) then
				TB_STUNTID_INFO[nstuntID].memper = floor(TB_STUNTID_INFO[nstuntID].maxmem / TB_STUNTID_INFO[nstuntID].cycle)
			else
				TB_STUNTID_INFO[nstuntID].memper = 0
			end
			
			TB_STUNTID_INFO[nstuntID].describe = TabFile_GetCell("stuntData", y, "Describe")
			TB_STUNTID_INFO[nstuntID].skillid = tonumber(TabFile_GetCell("stuntData", y, "SkillID"))
		end
		--TabFile_UnLoad("stuntData")
	end
	LoadStuntData()


if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
_Enable_Debug_Message = nil
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
function _dbgMsg(...) -- ÁÙÊ±ÓÃµ÷ÊÔÐÅÏ¢Êä³ö
	if _Enable_Debug_Message ~= 1 then
		return
	end
	local str = ""
	if (arg.n > 0) then
		str = tostring(arg[1])
		for i = 2, arg.n do
			str = str .. ", " .. tostring(arg[i])
		end
	end
	if (PlayerIndex and PlayerIndex > 0) then
		Msg2Player("DEBUG:<color=white>"..str)
		str = "["..tostring(GetName()).."]:"..str
	end
	print("DEBUG:"..str)
	TONG_WriteLog(date("%Y-%m-%d %H:%M:%S\t(DBG)\t")..str.."\r\n")
end

end

--¶à´«Ò»¸öTong²ÎÊýÊÇÎªÀ©Õ¹ÐèÒª£¬ÏÖÔÝÊ±Ã»ÓÃ£¬ÏÂÍ¬
function tongGetWorkshopUpperLevel(nTongID, nCurLevel)
	return tonumber(aTongLevelData[nCurLevel]["WORKSHOP_UPPER_LEVEL"])
end

function tongGetWeekBuildUpper(nTongID, nCurLevel)
	return tonumber(aTongLevelData[nCurLevel]["WEEK_BUILD_UPPER"])
end

function tongGetMaxWorkshopNum(nTongID, nCurLevel)
	return tonumber(aTongLevelData[nCurLevel]["MAX_WORKSHOP_NUM"])
end

function tongGetUpgradeWorkshopDemand(nTongID, nCurLevel) --»ñÈ¡Éý¼¶ËùÐè×÷·»Êý
	local nRet = tonumber(aTongLevelData[nCurLevel]["UPGRADE_WORKSHOP_NUM"])
	if (nRet == nil) then
		print("GÆp lçi khi n©ng cÊp yªu cÇu vÒ sè l­îng t¸c ph­êng!")
		return INVALID_VALUE
	end
	return nRet
end

function tongGetUpgradeHighWorkshopsDemand(nTongID, nCurLevel) --»ñÈ¡Éý¼¶ËùÐè¸ß¼¶×÷·»Êý
	local nRet = tonumber(aTongLevelData[nCurLevel]["UPGRADE_HI_WORKSHOP_NUM"])
	if (nRet == nil) then
		print("GÆp lçi khi n©ng cÊp yªu cÇu vÒ sè l­îng t¸c ph­êng cao cÊp!")
		return INVALID_VALUE
	end
	return nRet
end

function tongGetUpgradeHighWorkshopsLevel(nTongID, nCurLevel) --»ñÈ¡Éý¼¶ËùÐè¸ß¼¶×÷·»µÈ¼¶
	local nRet = tonumber(aTongLevelData[nCurLevel]["UPGRADE_HI_WORKSHOP_LEVEL"])
	if (nRet == nil) then
		print("GÆp lçi khi n©ng cÊp yªu cÇu vÒ ®¼ng cÊp t¸c ph­êng!")
		return INVALID_VALUE
	end
	return nRet
end

function tongGetUpgradeCostFund(nTongID, nCurLevel)
	local nRet = tonumber(aTongLevelData[nCurLevel]["UPGRADE_FUND"])
	if (nRet == nil or nRet <= 0)then
		print("GÆp lçi khi n©ng cÊp yªu cÇu vÒ ng©n s¸ch kiÕn thÕt!")
		return INVALID_VALUE
	end
	return nRet
end

function tongGetBaseMaintainFund(nTongID, nTongLevel)
	local nMembers = TONG_GetMemberCount(nTongID, -1)	--»ñÈ¡°ï»áÈËÊý
	return nMembers * TONG_BASE_MAINTAIN_FUND
end

--//»ñµÃÕ¼³Ç°ï»á¶ÔÓ¦µÄ³ÇÊÐÌØ¼¼ID
--//·µ»ØÖµ£ºÌØ¼¼ID,³ÇÊÐID
function tong_GetCityStuntID(nTongID)
	local tongname = TONG_GetName(nTongID)
	for i = 1, getn(TB_CITYID_STUNTID) do
		local cityowner = GetCityOwner(i)
		if (tongname == cityowner) then
			return TB_CITYID_STUNTID[i][2], i
		end
	end
	return 0
end


function getRelativeDay(nTongID)
--Ïà¶ÔÓÚ1970ÄêµÄµÚNÌì
--floor(GetCurrentTime() / 86400)
	return TONG_GetDay(nTongID)
end