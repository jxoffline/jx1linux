IncludeLib("ITEM");
Include("\\script\\lib\\award.lua")
--huihuangzhiguo_level
MX_LANTERN_COUNT = 5
function main(ItemIndex)
	--if (GetLevel() < 90 and huihuangzhiguo_level > 1) then
	--	Say("<#>ÄúµÄÀúÁ·»¹²»×ãÒÔÏû»¯ÕâÃ¶¹ûÊµ¡£", 0)
	--	return 1
	--elseif (GetLevel() >= 90 and GetLevel() < 120 and huihuangzhiguo_level > 2) then
	--	Say("<#>ÄúµÄÀúÁ·»¹²»×ãÒÔÏû»¯ÕâÃ¶¹ûÊµ¡£", 0)
	--	return 1
	--end
	local szfruitlevel = ""
	local nPlayerLevel = GetLevel();	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
		szfruitlevel = "cÊp thÊp"
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
		szfruitlevel = "Trung cÊp"
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
		szfruitlevel = "Cao cÊp"
	end
	
	if (nGetSeedLevel ~= huihuangzhiguo_level) then
		Say(format("<#>B¹n chØ cã thÓ ¨n qu¶ Huy hoµng %s.",szfruitlevel), 0)
		return 1
	end;
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(2312) ~= nDate ) then
		SetTask(2312, nDate)
		SetTask(2313, 0)
	end
	
	if (huihuang_checkdate(ItemIndex) == -1) then
		local szMsg = "Qu¶ huy hoµng nµy ®· qu¸ h¹n sö dông."
		Say(szMsg, 0)
		Msg2Player(szMsg)
		return 0
	end
	
	if ( GetTask(2313) >= MX_LANTERN_COUNT ) then
		local szMsg = format("<#>H«m nay b¹n ®· ¨n %d qu¶ Huy hoµng, vâ c«ng th¨ng tiÕn qu¸ nhanh dÔ g©y t¸c dông ph¶n nghÞch, ngµy mai h·y tiÕp tôc vËy.",MX_LANTERN_COUNT);
		Say(szMsg, 0)
		return 1
	end
	
	local award_exp = 0
	if (huihuangzhiguo_level == 1) then
		award_exp = 50000
	elseif (huihuangzhiguo_level == 2) then
		award_exp = 50000
	elseif (huihuangzhiguo_level == 3) then
		award_exp = 50000
	end
	AddOwnExp(award_exp)
	SetTask(2313, GetTask(2313) + 1)
end

function huihuang_checkdate(ItemIndex)
	local nItemdate = GetItemParam(ItemIndex, 1)
	
	if (nItemdate == 0) then
		if (ITEM_GetExpiredTime(ItemIndex) <= 0) then
			return -1
		end
		return 1;
	end
	
	local nItemYear = floor(nItemdate / 10000)
	local nItemMonth = mod(floor(nItemdate / 100), 100)
	local nItemDay = mod(nItemdate, 100)

	local nRoledate = tonumber(GetLocalDate("%y%m%d"))
	local nRoleYear = floor(nRoledate / 10000)
	local nRoleMonth = mod(floor(nRoledate / 100), 100)
	local nRoleDay = mod(nRoledate, 100)
	
	local offtime = 0
	if (nItemMonth == 2) then
		offtime = (nRoleYear - nItemYear) * 356 + (nRoleMonth - nItemMonth) * 28 + (nRoleDay - nItemDay)
	elseif (nItemMonth == 1 or nItemMonth == 3 or nItemMonth == 5 or nItemMonth == 7 or nItemMonth == 8 or nItemMonth == 10 or nItemMonth == 12)then
		offtime = (nRoleYear - nItemYear) * 356 + (nRoleMonth - nItemMonth) * 31 + (nRoleDay - nItemDay)
	elseif (nItemMonth == 4 or nItemMonth == 6 or nItemMonth == 9 or nItemMonth == 11) then
		offtime = (nRoleYear - nItemYear) * 356 + (nRoleMonth - nItemMonth) * 30 + (nRoleDay - nItemDay)
	end
	
	if (offtime >= 7) then
		return -1
	else
		return 1
	end
end

function GetDesc(nItem)
	local nEndTime = GetItemParam(nItem, 1);
	if (nEndTime == 0) then
		return "";
	end
	--nEndTime = nEndTime + 65536;
	local nEndYear = floor( nEndTime / 10000 );
	if (nEndYear == 0) then
		nEndTime = nEndTime + 65536;
		nEndYear = floor( nEndTime / 10000 );
	end;
	local nEndMonth = mod( floor( nEndTime / 100 ), 100 );
	local nEndDay = mod( nEndTime, 100 );
	
	nEndDay = nEndDay + 7
	if (nEndMonth == 1 or nEndMonth == 3 or nEndMonth == 5 or nEndMonth == 7 or nEndMonth == 8 or nEndMonth == 10) then
		if (nEndDay > 31) then
			nEndDay = nEndDay - 31
			nEndMonth = nEndMonth + 1
		end
	elseif (nEndMonth == 4 or nEndMonth == 6 or nEndMonth == 9 or nEndMonth ==11) then
		if (nEndDay > 30) then
			nEndDay = nEndDay - 30
			nEndMonth = nEndMonth + 1
		end
	elseif (nEndMonth == 2) then
		if (nEndDay > 28) then
			nEndDay = nEndDay - 28
			nEndMonth = nEndMonth + 1
		end
	elseif (nEndMonth == 12) then
		if (nEndDay > 31) then
			nEndDay = nEndDay - 31
			nEndMonth = 1
			nEndYear = nEndYear + 1
		end
	end
	return format("\n Thêi h¹n sö dông: %d-%d-20%d",nEndDay,nEndMonth,nEndYear);
end