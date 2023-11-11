function DisposeItem()
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "Mçi lÇn chØ cã thÓ hñy ®­îc mét vËt phÈm!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState ~= -2) then
		Talk(1, "", "VËt phÈm cÇn hñy ph¶i lµ vËt phÈm khãa vÜnh viÔn!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "§¹i hiÖp cã thÓ s¾p xÕp l¹i r­¬ng chøa ®å råi!");
	Msg2Player("§¹i hiÖp võa hñy vËt phÈm thµnh c«ng")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." Hñy item ABHKLB "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
end

function OnCancel()

end

