Include("\\script\\tagnewplayer\\func_check.lua");
function GetItemAnBang()
	if (CheckObject() < 1) then
		Talk(1, "", "Xin h·y kiÓm tra l¹i ®iÒu kiÖn tham gia.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) ~= 1) then
			Talk(1, "", "PhÇn th­ëng nµy chØ nhËn 1 lÇn !");
			return
	end
	if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 60 « trèng.");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang, 1)
	-- add chieu da ngoc su tu
		local ndx = AddItem(0,10,5,10,0,0)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B¹n nhËn ®­îc "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."nhËn ®­îc AB "..strItem)
	-- An bang bang tinh thach h¹ng liªn
		local ndx = AddGoldItem(0,164)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B¹n nhËn ®­îc "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."nhËn ®­îc AB "..strItem)
	-- add item an bang cuc hoa thach chi hoan
		local ndx = AddGoldItem(0,165)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B¹n nhËn ®­îc "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."nhËn ®­îc AB "..strItem)
	-- an bang dien hoang thach ngoc boi
		local ndx = AddGoldItem(0,166)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B¹n nhËn ®­îc "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."nhËn ®­îc AB "..strItem)
	-- an bang ke huyet thach gioi chi
		local ndx = AddGoldItem(0,167)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B¹n nhËn ®­îc "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Hoµng Kim LÖnh"..GetAccount().."\t"..GetName().."\t".."nhËn ®­îc AB "..strItem)
end