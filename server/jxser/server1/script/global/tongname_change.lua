Include("\\script\\global\\rename_head.lua")

function ChangeTongNameResult(old_tong, new_tong, result)
	local msg = "<color=red>" .. new_tong .. "<color>"
	if (result == TONGNAMERES_SUCCESS) then
		local value = GetTask(TASKVALUE_BLEND)
		value = SetBit(value, 2, 0)
		SetTask(TASKVALUE_BLEND, value)
		msg = msg .. "<#> Thay ®æi tªn thµnh c«ng, sÏ hiÖu qu¶ sau khi b¶o tr× "
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#> Tªn nh©n vËt nµy ®· cã ng­êi sö dông"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#> Tªn nh©n vËt nµy ®· cã ng­êi ®¨ng ký "
	else
		msg = msg .. "<#> Tªn nh©n vËt nµy v« hiÖu, kh«ng thÓ sö dông"
	end
	Say(msg, 1, "<#> BiÕt råi!/cancel")
end
