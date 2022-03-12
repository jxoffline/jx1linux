Include("\\script\\vng_feature\\getgoldequip.lua")
tbParam2EquipType = {
	[1] = 0,
	[2] = 1,	
	[3] = 2,
	[4] = 3,
	[5] = 4,
	[6] = 5,
	[7] = 6,
	[8] = 7,
	[9] = 8,
	[10] = 9,
	[11] = 10,	
}
function main(nItemIdx)
	local tb = {nItem2Consume = nItemIdx, nBindState = -2, nExpiredTime = 129600}
	tb.tbLog = {"BatNienHoiNgoLenhBai", "SuDungTuMangChiBao"}	
	local nFaction = GetLastFactionNumber()	
	local nParam1 = tonumber(GetItemParam(nItemIdx, 1))
	if nParam1 == 0 then		
		tbVNGetGoldEquip:ShowSpecItemDialog(5, tb)
	else
		tb.nSpecificItem = tbParam2EquipType[nParam1]
		tbVNGetGoldEquip:ShowEquipBranchDialog(5,tb)
	end
	return 1
end