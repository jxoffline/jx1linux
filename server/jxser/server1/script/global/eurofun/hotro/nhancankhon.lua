Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

NHANCANKHONTD = {
	["Kh¸ng Háa - Thêi Gian Tróng §éc"] 		= 	{6578},
	["Kh¸ng B¨ng - Thêi Gian Tróng §éc"] 		= 	{6579},
	["Kh¸ng L«i - Thêi Gian Tróng §éc"] 		= 	{6580},
	["Kh¸ng §éc - Thêi Gian Tróng §éc"] 		= 	{6581},
	["PTVL - Thêi Gian Tróng §éc"] 				= 	{6582},
}

NHANCANKHONLC = {
	["Kh¸ng Háa - Thêi Gian Lµm Cho¸ng"] 		= 	{6583},
	["Kh¸ng B¨ng - Thêi Gian Lµm Cho¸ng"] 		= 	{6584},
	["Kh¸ng L«i - Thêi Gian Lµm Cho¸ng"] 		= 	{6585},
	["Kh¸ng §éc - Thêi Gian Lµm Cho¸ng"] 		= 	{6586},
	["PTVL - Thêi Gian Lµm Cho¸ng"] 			= 	{6587},
}

NHANCANKHONLCH = {
	["Kh¸ng Háa - Thêi Gian Lµm ChËm"] 			= 	{6588},
	["Kh¸ng B¨ng - Thêi Gian Lµm ChËm"] 		= 	{6589},
	["Kh¸ng L«i - Thêi Gian Lµm ChËm"] 			= 	{6590},
	["Kh¸ng §éc - Thêi Gian Lµm ChËm"] 			= 	{6591},
	["PTVL - Thêi Gian Lµm ChËm"] 				= 	{6592},
}
--------------------------------------------------------------------------------
function NhanCanKhon1()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = NHANCANKHONTD;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang bÞ %s", x), AddEquipGoldOtherConfirm2,{tb_Equip[x]}})
	end
	tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm2(tbKind)
		AddGoldItem(0, tbKind[1])
end
--------------------------------------------------------------------------------
function NhanCanKhon2()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = NHANCANKHONLC;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang bÞ %s", x), AddEquipGoldOtherConfirm3,{tb_Equip[x]}})
	end
	tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm3(tbKind)
		AddGoldItem(0, tbKind[1])
end
--------------------------------------------------------------------------------
function NhanCanKhon3()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = NHANCANKHONLCH;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang bÞ %s", x), AddEquipGoldOtherConfirm4,{tb_Equip[x]}})
	end
	tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm4(tbKind)
		AddGoldItem(0, tbKind[1])
end
--------------------------------------------------------------------------------