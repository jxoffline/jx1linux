Include( "\\script\\lib\\string.lua" );

function main(nItem)
	return 1;
end

function GetDesc(nItem)
	local _, _, _, lvl = GetItemProp(nItem);
	return "<color=blue>Ph»m ch t: <color=yellow>"..lvl;
end