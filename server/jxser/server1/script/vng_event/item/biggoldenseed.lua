IncludeLib("ITEM");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

MX_GREAT_LANTERN_COUNT = 1;
TSK_DAILY_LIMIT = 3062

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
	if PlayerFunLib:CheckTaskDaily(TSK_DAILY_LIMIT, MX_GREAT_LANTERN_COUNT, "Mçi ngµy chØ cã thÓ sö dông 1 Qu¶ §¹i Hoµng Kim.", "<") ~= 1 then		
		return 1
	end
	PlayerFunLib:AddTaskDaily(TSK_DAILY_LIMIT, 1)
	local tbExpAward = {szName = "200 triÖu ®iÓm kinh nghiÖm", nExp = 200000000}
	tbAwardTemplet:Give(tbExpAward, 1, {"QuaDaiHK", "SuDungQuaDaiHK"})
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