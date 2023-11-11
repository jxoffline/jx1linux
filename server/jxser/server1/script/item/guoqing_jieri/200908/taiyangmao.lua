
Include("\\script\\event\\guoqing_jieri\\200908\\itemscript.lua")

IncludeLib("ITEM")

function main(nItemIndex)	
	
	return 1
end

function IsPickable(nItemIndex)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate >= tbGuoqing0908.nComposeEndDate) then
		return 0
	end
	
	ITEM_SetExpiredTime(nItemIndex, tbGuoqing0908.nComposeEndDate);
	SyncItem(nItemIndex);
	return 1;
end