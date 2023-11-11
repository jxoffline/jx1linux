Include("\\script\\lib\\awardtemplet.lua")
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	if (CalcFreeItemCellCount() < 3) then
		Talk(1,"","Hµnh trang kh«ng ®ñ 3 « trèng")
		return 1
	end
	for i=1, 2 do
		local ItemIndex = AddItem(6,1,30041,1,0,0)
		ITEM_SetExpiredTime(ItemIndex, 10080);
		SyncItem(ItemIndex);
	end
	Msg2Player("B¹n nhËn ®­îc 2 §Þa Linh Phï")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Më §¹i Linh Phï LÔ Bao nhËn ®­îc 2 §Þa Linh Phï ")
	
end