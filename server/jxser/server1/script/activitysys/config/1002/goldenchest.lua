Include("\\script\\vng_feature\\getgoldequip.lua")
Include("\\script\\activitysys\\config\\1002\\variables.lua")
function main(nItemIdx)	
	local tb = {nSpecificItem = tbVnItemPos.WEAPON, nItem2Consume = nItemIdx}
	tb.tbLog = {"Event_NgoiSaoTuyet", "SuDungKimBaoRuong"}
	tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "SuDungKimBaoRuong"}
	tbVNGetGoldEquip:ShowEquipBranchDialog(5, tb)
	return 1
end