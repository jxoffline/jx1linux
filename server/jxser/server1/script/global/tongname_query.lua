Include("\\script\\global\\rename_head.lua")

function QueryTongNameResult(tong, result)
	local msg = "<color=red>" .. tong .. "<color>"
	if (result == TONGNAMERES_FREE) then
		msg = msg .. "<#> Tªn nh©n vËt nµy ch­a ®­îc sö dông"
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#> Tªn nh©n vËt nµy ®· cã ng­êi sö dông"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#> Tªn nh©n vËt nµy ®· cã ng­êi ®¨ng ký "
	else
		msg = msg .. "<#> Tªn nh©n vËt nµy v« hiÖu, kh«ng thÓ sö dông"
	end
	Say(msg, 1, "<#> BiÕt råi!/cancel")
end
