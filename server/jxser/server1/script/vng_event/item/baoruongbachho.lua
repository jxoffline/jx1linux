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
	
	[23] = 0,
	[24] = 1,
	[25] = 2,
	[26] = 3,
	[27] = 4,
	[28] = 5,
	[29] = 6,
	[30] = 7,
	[31] = 8,
	[32] = 9,
	[33] = 10,
	
	[34] = 0,
	[35] = 1,
	[36] = 2,
	[37] = 3,
	[38] = 4,
	[39] = 5,
	[40] = 6,
	[41] = 7,
	[42] = 8,
	[43] = 9,
	[44] = 10,
}
function main(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx, 1 ))
	local tb = {nSpecificItem = tbParam2EquipType[n_param], nItem2Consume = nItemIdx}	
	tb.tbLog={"BaoRuongBachHo","SuDungBaoRuongBachHo"}
	local n_bindstate = tonumber(GetItemParam(nItemIdx, 2))
	if n_bindstate == 1 then
		tb.nBindState = -2
	end
	if n_param <= 0 then
		return
	elseif n_param >= 1 and n_param <= 11 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(7,tb)
	elseif n_param >= 12 and n_param <= 22 then
		tbVNGetGoldEquip:GetGoldEquip(7, random(1,23), tb)
	elseif n_param >= 23 and n_param <= 33 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(9,tb)
	elseif n_param >= 34 and n_param <= 44 then
		tbVNGetGoldEquip:GetGoldEquip(9, random(1,23), tb)
	end	
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "",
		[1] = "B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",
		[2] = "B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",		
		[3] = "B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",
		[4] = "B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",
		[5] = "B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",
		[6] = "B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",
		[7] = "B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",
		[8] = "B¹ch Hæ Hµi - Tù chän hÖ ph¸i",
		[9] = "B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",
		[10] = "B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",
		[11] = "Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",
		
		[12] = "B¹ch Hæ H¹ng Liªn - NgÉu nhiªn hÖ ph¸i",
		[13] = "B¹ch Hæ Ph¸t Qu¸n - NgÉu nhiªn hÖ ph¸i",		
		[14] = "B¹ch Hæ Th­îng Giíi ChØ - NgÉu nhiªn hÖ ph¸i",
		[15] = "B¹ch Hæ Hé UyÓn - NgÉu nhiªn hÖ ph¸i",
		[16] = "B¹ch Hæ Yªu §¸i - NgÉu nhiªn hÖ ph¸i",
		[17] = "B¹ch Hæ Kim Kh¶i - NgÉu nhiªn hÖ ph¸i",
		[18] = "B¹ch Hæ KhÝ Giíi - NgÉu nhiªn hÖ ph¸i",
		[19] = "B¹ch Hæ Hµi - NgÉu nhiªn hÖ ph¸i",
		[20] = "B¹ch Hæ Ngäc Béi - NgÉu nhiªn hÖ ph¸i",
		[21] = "B¹ch Hæ H¹ Giíi ChØ - NgÉu nhiªn hÖ ph¸i",
		[22] = "Bé trang bÞ B¹ch Hæ - NgÉu nhiªn hÖ ph¸i",
		
		[23] = "B¹ch Hæ H¹ng Liªn (Max Option) - Tù chän hÖ ph¸i",
		[24] = "B¹ch Hæ Ph¸t Qu¸n (Max Option) - Tù chän hÖ ph¸i",
		[25] = "B¹ch Hæ Th­îng Giíi ChØ (Max Option) - Tù chän hÖ ph¸i",
		[26] = "B¹ch Hæ Hé UyÓn (Max Option) - Tù chän hÖ ph¸i",
		[27] = "B¹ch Hæ Yªu §¸i (Max Option) - Tù chän hÖ ph¸i",
		[28] = "B¹ch Hæ Kim Kh¶i (Max Option) - Tù chän hÖ ph¸i",
		[29] = "B¹ch Hæ KhÝ Giíi (Max Option) - Tù chän hÖ ph¸i",
		[30] = "B¹ch Hæ Hµi (Max Option) - Tù chän hÖ ph¸i",
		[31] = "B¹ch Hæ Ngäc Béi (Max Option) - Tù chän hÖ ph¸i",
		[32] = "B¹ch Hæ H¹ Giíi ChØ (Max Option) - Tù chän hÖ ph¸i",
		
		[33] = "Bé trang bÞ B¹ch Hæ (Max Option) - Tù chän hÖ ph¸i",
		[34] = "B¹ch Hæ H¹ng Liªn (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[35] = "B¹ch Hæ Ph¸t Qu¸n (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[36] = "B¹ch Hæ Th­îng Giíi ChØ (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[37] = "B¹ch Hæ Hé UyÓn (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[38] = "B¹ch Hæ Yªu §¸i (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[39] = "B¹ch Hæ Kim Kh¶i (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[40] = "B¹ch Hæ KhÝ Giíi (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[41] = "B¹ch Hæ Hµi (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[42] = "B¹ch Hæ Ngäc Béi (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[43] = "B¹ch Hæ H¹ Giíi ChØ (Max Option) - NgÉu nhiªn hÖ ph¸i",
		[44] = "Bé trang bÞ B¹ch Hæ (Max Option) - NgÉu nhiªn hÖ ph¸i",
	}
	local n_bindstate = tonumber(GetItemParam(nItem, 2))	
	strBind = ""
	if n_bindstate == 1 then
		strBind = "(khãa vÜnh viÔn)"	
	end
	szDesc = szDesc..format("<color=yellow>%s %s<color>", tbItemName[n_param], strBind);
	return szDesc;
end