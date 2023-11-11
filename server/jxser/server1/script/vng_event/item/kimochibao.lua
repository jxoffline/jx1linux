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
	[12] = 0,
	[13] = 1,
	[14] = 2,
	[15] = 3,
	[16] = 4,
	[17] = 5,
	[18] = 6,
	[19] = 7,
	[20] = 8,
	[21] = 9,
	[22] = 10,
}
function main(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx, 1 ))
	local tb = {nSpecificItem = tbParam2EquipType[n_param], nItem2Consume = nItemIdx}
	tb.tbLog={"KimOChiBao","SuDungKimOChiBao"}
	local n_bindstate = tonumber(GetItemParam(nItemIdx, 2))
	if n_bindstate == 1 then
		tb.nBindState = -2
	end
	local n_expiredtime = tonumber(GetItemParam(nItemIdx, 3))
	if n_expiredtime > 0 then
		tb.nExpiredTime = n_expiredtime
	end
	if n_param <= 0 then
		return
	elseif n_param >= 1 and n_param <= 11 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(6,tb)
	elseif n_param >= 12 and n_param <= 22 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(8,tb)
	end	
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "",
		[1] = "Kim ¤ H¹ng Liªn - Tù chän hÖ ph¸i",
		[2] = "Kim ¤ Ph¸t Qu¸n - Tù chän hÖ ph¸i",		
		[3] = "Kim ¤ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",
		[4] = "Kim ¤ Hé UyÓn - Tù chän hÖ ph¸i",
		[5] = "Kim ¤ Yªu §¸i - Tù chän hÖ ph¸i",
		[6] = "Kim ¤ Kim Kh¶i - Tù chän hÖ ph¸i",
		[7] = "Kim ¤ KhÝ Giíi - Tù chän hÖ ph¸i",
		[8] = "Kim ¤ Hµi - Tù chän hÖ ph¸i",
		[9] = "Kim ¤ Ngäc Béi - Tù chän hÖ ph¸i",
		[10] = "Kim ¤ H¹ Giíi ChØ - Tù chän hÖ ph¸i",
		[11] = "Bé trang bÞ Kim ¤ - Tù chän hÖ ph¸i",
		[12] = "Kim ¤ H¹ng Liªn (Max Option) - Tù chän hÖ ph¸i",
		[13] = "Kim ¤ Ph¸t Qu¸n (Max Option) - Tù chän hÖ ph¸i",		
		[14] = "Kim ¤ Th­îng Giíi ChØ (Max Option) - Tù chän hÖ ph¸i",
		[15] = "Kim ¤ Hé UyÓn (Max Option) - Tù chän hÖ ph¸i",
		[16] = "Kim ¤ Yªu §¸i (Max Option) - Tù chän hÖ ph¸i",
		[17] = "Kim ¤ Kim Kh¶i (Max Option - Tù chän hÖ ph¸i)",
		[18] = "Kim ¤ KhÝ Giíi (Max Option) - Tù chän hÖ ph¸i",
		[19] = "Kim ¤ Hµi (Max Option) - Tù chän hÖ ph¸i",
		[20] = "Kim ¤ Ngäc Béi (Max Option) - Tù chän hÖ ph¸i",
		[21] = "Kim ¤ H¹ Giíi ChØ (Max Option) - Tù chän hÖ ph¸i",
		[22] = "Bé trang bÞ Kim ¤ (Max Option) - Tù chän hÖ ph¸i",
	}
	local n_bindstate = tonumber(GetItemParam(nItem, 2))	
	strBind = ""
	if n_bindstate == 1 then
		strBind = "(khãa vÜnh viÔn)"	
	end
	szDesc = szDesc..format("<color=yellow>%s %s<color>", tbItemName[n_param], strBind);
	return szDesc;
end