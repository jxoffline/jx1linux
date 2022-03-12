Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
if not tbVNGWD2011_ItemHead then
	tbVNGWD2011_ItemHead = {}
end
-- kiem tra han su dung item, 1: het han SD, 0: con han SD
function tbVNGWD2011_ItemHead:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end
function tbVNGWD2011_ItemHead:checkBag(nCellCount)
	if (CalcFreeItemCellCount() < nCellCount) then
		return 0
	end
	return 1
end
function tbVNGWD2011_ItemHead:isMaxItemUse(tbTaskInfo)
	if (tbVNG_BitTask_Lib:getBitTask(tbTaskInfo) >= tbTaskInfo.nMaxValue) then
		return 1;
	else return 0;
	end
end

function tbVNGWD2011_ItemHead:CheckBag(nCellCount)
	if (CalcFreeItemCellCount() < nCellCount) then
		return 0
	end
	return 1
end