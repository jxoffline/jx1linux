Include("\\script\\dailogsys\\dailogsay.lua");

TRANGBIHIEM = {
	["Vò LiÖt"] 			= 	{5953, 5957},
	["Cè S¬n"] 			= 	{6705, 6716},
	["ThÇn M·"] 			= 	{5933, 5938},
	["Trang Søc NhËm Tiªu Dao"] 		= 	{6262, 6282},
	["Hoµng Kim Ên"] 			= 	{5930, 5932},
	--["MÆt N¹"] 			= 	{5658, 5669},
}

TRANGBIHOANGKIM = {
	["Thiªn Hoµng"] 			= 	{168, 176},
	["Kim Phong"] 			= 	{177, 185},
	["HiÖp Cèt"] 			= 	{186, 189},
	["Nh­ T×nh"] 			= 	{190, 193},
	["§Þnh Quèc"] 			= 	{159, 163},
	["An Bang"] 			= 	{164, 167},
	["Kim Quang"] 			= 	{194, 203},
	["V« Danh"] 			= 	{141, 142},
	["§éng S¸t"] 			= 	{143, 146},
	["Hång ¶nh"] 			= 	{204, 207},
	["NhÉn exp ThÓ Tóc"] 		= 	{378, 379},
};

--------------------------------------------------
function TrangBiHiem()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = TRANGBIHIEM
	local szTitle = "B¹n muèn nhËn trang bÞ nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, format("Trang bÞ %s/#AddEquipGold_confirm(%d,%d)", x, tb_Equip[x][1], tb_Equip[x][2])) --, AddEquipGoldOtherConfirm,{tb_Equip[x]}})
	end
	tinsert(tbOption, "Trë l¹i./main")
	tinsert(tbOption, "KÕt thóc ®èi tho¹i./no")
	Say(szTitle, getn(tbOption), tbOption)	
	--CreateNewSayEx(szTitle, tbOption)
end
-------------------------------------------------------

function TrangBiHoangKimThuong()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = TRANGBIHOANGKIM
	local szTitle = "B¹n muèn nhËn trang bÞ nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, format("Trang bÞ %s/#AddEquipGold_confirm(%d,%d)", x, tb_Equip[x][1], tb_Equip[x][2])) --, AddEquipGoldOtherConfirm,{tb_Equip[x]}})
	end
	tinsert(tbOption, "Trë l¹i./main")
	tinsert(tbOption, "KÕt thóc ®èi tho¹i./no")
	Say(szTitle, getn(tbOption), tbOption)	
end

function AddEquipGold_confirm(num1, num2)
	if (num2-num1) <= 30 then
		for nID = num1, num2 do
			AddGoldItem(0, nID)
		end
	else
		Talk(1,"","Kh«ng thÓ nhËn qu¸ nhiÒu trang bÞ 1 lóc.")
	end
end