Include("\\script\\vng_feature\\getgoldequip.lua")
function main(nItemIdx)
	local tb = {nSpecificItem = tbVnItemPos.WHOLE_SET, nItem2Consume = nItemIdx, nBindState = -2}
	tb.tbLog = {"PhongVanLenhBai", "SuDungThuongLangChiBao"}
	--tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "SuDungTuMangBaoChau"}
	local nFaction = GetLastFactionNumber()
	if nFaction < 0 or nFaction > 9 then
		Talk(1, "", "Xin h·y gia nhËp ph¸i råi h·y sö dông vËt phÈm nµy")
		return 1
	end
	tbVNGetGoldEquip:ShowEquipBranchByFaction(3, tb, nFaction)
	return 1
end