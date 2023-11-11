Include("\\script\\vng_feature\\getgoldequip.lua")
Include("\\script\\activitysys\\config\\1002\\variables.lua")
function main(nItemIdx)	
	local tbSay = {
		format("Tö M·ng Th­îng Giíi ChØ/#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.UPPER_RING),
		format("Tö M·ng H¹ Giíi ChØ/#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.LOWER_RING),
		"§ãng/OnCancel",
	}
	Say("Xin h·y chän phÇn th­ëng:", getn(tbSay), tbSay)
	return 1
end

function OnCancel()

end

function SilverChest_GetAward(nIdx, nSelectedOption)
	local tb = {nSpecificItem = nSelectedOption, nItem2Consume = nIdx}
	tb.tbLog = {"Event_NgoiSaoTuyet", "SuDungNganBaoRuong"}
	tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "SuDungNganBaoRuong"}
	tbVNGetGoldEquip:ShowEquipBranchDialog(5, tb)
end