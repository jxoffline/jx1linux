Include("\\script\\event\\wulin_final_match\\createleague.lua")IncludeLib("ITEM")
function main( nItemIdx )
	local curzoneid = wl_zonename2zoneid(GetTong())
	local zoneid =  ITEM_GetItemExParam(nItemIdx,1)
	if ( zoneid ~= curzoneid or zoneid == 0 ) then
		Say("TÊm phiÕu nµy h×nh nh­ kh«ng ph¶i khu vùc b¹n ®ang ë, kh«ng thÓ sö dông.", 0)
		return 1
	end
	local matchtype = ITEM_GetItemExParam(nItemIdx,2)
	Say("B¹n muèn b¸o danh tham gia thi ®Êu ­?", 2, "Ta muèn lËp nhãm "..TAB_TICKETINFO[matchtype][1].."/#wl_createleague("..matchtype..")", "T¹m thêi kh«ng b¸o danh, ®Ó khi kh¸c vËy!/OnCancel")
	return 1;
end