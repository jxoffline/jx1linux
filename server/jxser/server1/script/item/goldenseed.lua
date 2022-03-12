IncludeLib("ITEM");
--huihuangzhiguo_level
MX_LANTERN_COUNT = 2;
GOLDFRUIT_MX_COUNT = 365;
TASKIDDAY = 2321;
TASKMAXEAT = 2314;
TASKEATCOUNT = 2322;

function main(ItemIndex)
	if (GetLevel() < 120) then
		Say("<#> §é rÌn luyÖn cña ng­¬i ch­a ®ñ ®Ó ¨n qu¶ nµy.", 0)
		return 1
	end
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(TASKIDDAY) ~= nDate ) then
		SetTask(TASKIDDAY, nDate)
		SetTask(TASKEATCOUNT, 0);
	end
	
	if (huihuang_checkdate(ItemIndex) == -1) then
		local szMsg = "Thêi h¹n sö dông qu¶ Hoµng Kim lµ 1 tuÇn."
		Say(szMsg, 0)
		Msg2Player()
		return 0
	end
	
	if ( GetTask(TASKIDDAY) == nDate and MX_LANTERN_COUNT <= GetTask(TASKEATCOUNT)) then
		local szMsg = format("<#>H«m nay b¹n ®· ¨n %d qu¶ Hoµng Kim, vâ c«ng th¨ng tiÕn qu¸ nhanh dÔ g©y t¸c dông ph¶n nghÞch, ngµy mai h·y tiÕp tôc vËy.",MX_LANTERN_COUNT)
		Say(szMsg, 0)
		Msg2Player(szMsg)
		return 1
	end
	
--	if ( GetTask(TASKMAXEAT) >= GOLDFRUIT_MX_COUNT ) then --Èç¹û³¬¹ýÁË30¸ö£¬¾Í²»ÄÜÔÙ³ÔÁË£»
--		local szMsg = format("<#>ÄúÒÑ¾­Ê³ÓÃÁË%dÃ¶»Æ½ðÖ®¹û£¬Ê³ÓÃ¹ý¶à¿ÉÄÜ»áÔì³É·´Ð§¹ûÅ¶¡£",GOLDFRUIT_MX_COUNT);
--		Say(szMsg, 0)
--		Msg2Player(szMsg)
--		return 1
--	end	
	
	SetTask(TASKMAXEAT, GetTask(TASKMAXEAT) + 1)	--ÈçºÎ±£Ö¤´Ó1¿ªÊ¼¼ÆÊýÄØ£¿£¿
	SetTask(TASKEATCOUNT, GetTask(TASKEATCOUNT) + 1)
	local award_exp = 5000000
	AddOwnExp(award_exp)
	return 0
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