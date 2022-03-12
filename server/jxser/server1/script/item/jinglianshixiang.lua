Include( "\\script\\lib\\string.lua" );
Include("\\script\\misc\\itemexchangevalue\\jinglianshixiang.lua")

function main( nItemIdx )
	return BaoxiangCompose(nItemIdx);
end

function GetDesc( nItemIdx )
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local strDesc = "";
	strDesc = format("<color=yellow>Hån th¹ch nµy cã chøa: <color=green>%d<color> tinh lùc<color>", nCount);
	return strDesc;
end
