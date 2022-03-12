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
	local tb = {nItem2Consume = nItemIdx, nBindState = -2, nExpiredTime = 259200}
	tb.tbLog = {"BatNienHoiNgoLenhBai", "SuDungRuongXichLan"}		
	local nParam1 = tonumber(GetItemParam(nItemIdx, 1))
	if nParam1 == 0 then		
		local nParam2 = tonumber(GetItemParam(nItemIdx, 2))
		local nParam3 = tonumber(GetItemParam(nItemIdx, 3))
		local nParam4 = tonumber(GetItemParam(nItemIdx, 4))
		local nParam5 = tonumber(GetItemParam(nItemIdx, 5))
		if nParam2 ~= 0 or nParam3 ~= 0 or nParam4 ~= 0 or nParam5 ~= 0 then
			tb.tbExclude = {nParam2, nParam3, nParam4, nParam5}
		end		
		tbVNGetGoldEquip:ShowSpecItemDialog(10, tb)
	else		
		tb.nSpecificItem = tbParam2EquipType[nParam1]
		tbVNGetGoldEquip:ShowEquipBranchDialog(10,tb)
	end
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "1 trang bÞ XÝch L©n tù chän",
		[1] = "XÝch L©n H¹ng Liªn - Tù chän hÖ ph¸i",
		[2] = "XÝch L©n Ph¸t Qu¸n - Tù chän hÖ ph¸i",		
		[3] = "XÝch L©n Th­îng Giíi ChØ - Tù chän hÖ ph¸i",
		[4] = "XÝch L©n Hé UyÓn - Tù chän hÖ ph¸i",
		[5] = "XÝch L©n Yªu §¸i - Tù chän hÖ ph¸i",
		[6] = "XÝch L©n Kim Kh¶i - Tù chän hÖ ph¸i",
		[7] = "XÝch L©n KhÝ Giíi - Tù chän hÖ ph¸i",
		[8] = "XÝch L©n Hµi - Tù chän hÖ ph¸i",
		[9] = "XÝch L©n Ngäc Béi - Tù chän hÖ ph¸i",
		[10] = "XÝch L©n H¹ Giíi ChØ - Tù chän hÖ ph¸i",
		[11] = "Bé trang bÞ XÝch L©n - Tù chän hÖ ph¸i",		
	}
	local tbEquipName = {
	[1] = "H¹ng Liªn",
	[2] = "§Ønh M¹o",
	[3] = "Th­îng Giíi ChØ",
	[4] = "Hé UyÓn",
	[5] = "Yªu §¸i",
	[6] = "Y Phôc",
	[7] = "Vò KhÝ",
	[8] = "Hµi Tö",
	[9] = "Ngäc Béi",
	[10] = "H¹ Giíi ChØ",	
}
	
	local nParam2 = tonumber(GetItemParam(nItem, 2))
	local nParam3 = tonumber(GetItemParam(nItem, 3))
	local nParam4 = tonumber(GetItemParam(nItem, 4))
	local nParam5 = tonumber(GetItemParam(nItem, 5))
	if n_param ~= 0 then
		szDesc = szDesc..format("<color=yellow>%s", tbItemName[n_param]);
	else
		if nParam2 ~= 0 or nParam3 ~= 0 or nParam4 ~= 0 or nParam5 ~= 0 then
			szDesc = szDesc..format("<color=yellow>%s trõ ", tbItemName[n_param]);		
			if nParam2 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam2]);
			end
			if nParam3 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam3]);
			end
			if nParam4 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam4]);
			end
			if nParam5 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam5]);
			end		
		end
	end
	szDesc = szDesc.."<color>"
	return szDesc;
end