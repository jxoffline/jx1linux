IncludeLib("ITEM")
function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0
	end
	if(CalcFreeItemCellCount() < 5) then
		Talk(1, "", "§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa 5 « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy!")
		return 1
	end
	for i =1, 5 do
		local nItemIdx = AddItem(6,1,30083,1,0,0)		
		ITEM_SetExpiredTime(nItemIdx, 24*60)
		SyncItem(nItemIdx)
	end
	Msg2Player("B¹n nhËn ®­îc <color=yellow>5 ..Phong V©n Chiªu Binh LÖnh")
	return 0
end