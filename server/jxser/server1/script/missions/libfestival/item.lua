if (not _H_ITEM_)then
	_H_ITEM_ = 1;

--生成一个相对于当前玩家的选项
function festival_make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end


end;	--	end of _H_ITEM_