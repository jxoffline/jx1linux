function TradeNhanTamPhu_main()
	 AskClientForNumber("DoTaskYes_main",1,20,"<#>NhËp sè l­îng cÇn mua")
end

function DoTaskYes_main(nCount)
	if (nCount == 0 or nCount == nil) then
		nCount = 1
	end
	local nSumMoney = nCount * 200000
	if (CalcFreeItemCellCount() < nCount +2) then
		Talk(1,"",format("Hµnh trang kh«ng ®ñ %d « trèng", nCount + 2))
		return
	end
	if (GetCash() < nSumMoney ) then
		Talk(1,"","Kh«ng ®ñ ng©n l­îng, Xin §¹i hiÖp kiÓm tra l¹i !")
		return
	end
	if (Pay(nSumMoney)==1) then
		for i=1, nCount do
			local ItemIndex = AddItem(6,1,30040,1,0,0)
			ITEM_SetExpiredTime(ItemIndex, 10080);
			SyncItem(ItemIndex);
			Msg2Player("B¹n nhËn ®­îc  Nh©n T©m Phï")
		end
		WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Mua Nh©nT©m Phï sè l­îng "..nCount)
	else
		WriteLog(date("%Y%m%d %H%M%S").."\t".."B¶o R­¬ng ThÇn BÝ"..GetAccount().."\t"..GetName().."\t".."Mua Nh©nT©m Phï ThÊt B¹i, sè l­îng "..nCount)
	end
end