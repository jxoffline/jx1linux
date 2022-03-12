
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

TRANGBIHIEM = {
	["Vò LiÖt"] 			= 	{5953, 5957},
	["Cè S¬n"] 				= 	{6705, 6716},
	["ThÇn M·"] 				= 	{5933, 5938},
	["Phi Phong"] 				= 	{6733, 6735},
	["Trang Søc"] 				= 	{6262, 6282},
	["Ên"] 				= 	{5930, 5932},
	["MÆt N¹"] 				= 	{5658, 5669},
}

TRANGBIHOANGKIM = {
	["V« Danh"] 				= 	{141, 142},
	["§éng S¸t"] 			= 	{143, 146},
	["§Þnh Quèc"] 			= 	{159, 163},
	["An Bang"] 				= 	{164, 167},
	["Thiªn Hoµng"] 		= 	{168, 176},
	["Kim Phong"] 			= 	{177, 185},
	["HiÖp Cèt"] 				= 	{186, 189},
	["Nh­ T×nh"] 			= 	{190, 193},
	["Kim Quang"] 		= 	{194, 203},
	["Hång ¶nh"] 			= 	{204, 207},
};

HOANGKIMMONPHAI = {
	[0] = {
		["ThiÕu L©m (quyÒn)"] 				= 		{1, 5},
		["ThiÕu L©m (c«n)"] 					= 		{6, 10},
		["ThiÕu L©m (®ao)"] 					= 		{11, 15},
	},
	
	[1] = {
		["Thiªn V­¬ng (chïy)"] 			=	 		{16, 20},
		["Thiªn V­¬ng (th­¬ng)"]	 		=			{21, 25},
		["Thiªn V­¬ng (®ao)"] 				= 		{26, 30},
	},
	
	[2] = {
		["§­êng M«n (phi ®ao)"] 			= 		{71, 75},
		["§­êng M«n (tô tiÔn"] 				= 		{76, 80},
		["§­êng M«n (phi tiªu)"] 			= 		{81, 85},
		["§­êng M«n (bÉy)"] 					= 		{86, 90},
	},
	
	[3] = {
		["Ngò §éc (ch­ëng)"] 				= 		{56, 60},
		["Ngò §éc (®ao)"] 						= 		{61, 65},
		["Ngò §éc (bïa)"] 						= 		{66, 70},
	},
	
	[4] = {
		["Nga My (kiÕm)"] 						= 		{31, 35},
		["Nga My (ch­ëng)"]	 				= 		{36, 40},
		["Nga My (hç trî)"] 					= 		{41, 45},
	},
	
	[5] = {
		["Thóy Yªn (®ao)"] 						= 		{46, 50},
		["Thóy Yªn (song ®ao)"] 			= 		{51, 55},
	},
	
	[6] = {
		["C¸i Bang (ch­ëng)"] 				= 		{91, 95},
		["C¸i Bang (bæng)"] 					= 		{96, 100},
	},
	
	[7] = {
		["Thiªn NhÉn (kÝch)"] 				= 		{101, 105},
		["Thiªn NhÉn (®ao)"] 					= 		{106, 110},
		["Thiªn NhÉn (bïa)"] 					= 		{111, 115},
	},
	
	[8] = {
		["Vâ §ang (quyÒn)"] 					= 		{116, 120},
		["Vâ §ang (kiÕm)"] 					= 		{121, 125},
	},
	
	[9] = {
		["C«n L«n (®ao)"] 						= 		{126, 130},
		["C«n L«n (sÐt)"] 						= 		{131, 135},
		["C«n L«n (bïa)"] 						= 		{136, 140},
	},
};

EQUIP_FACTION = {
	[0] = "ThiÕu L©m",
	[1] = "Thiªn V­¬ng",
	[2] = "§­êng M«n",
	[3] = "Ngò §éc",
	[4] = "Nga My",
	[5] = "Thóy Yªn",
	[6] = "C¸i Bang",
	[7] = "Thiªn NhÉn",
	[8] = "Vâ §ang",
	[9] = "C«n L«n",
};
--------------------------------------------------
function TrangBiHiem()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = TRANGBIHIEM;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang bÞ %s", x), AddEquipGoldOtherConfirm,{tb_Equip[x]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end
-------------------------------------------------------

function TrangBiHoangKim22()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = TRANGBIHOANGKIM;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ cña m«n ph¸i nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang bÞ %s", x), AddEquipGoldOtherConfirm,{tb_Equip[x]}})
	end
		tinsert(tbOption, {"Trang bÞ hoµng kim m«n ph¸i", AddEquipGoldBase})
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm(tbKind)
	for nID = tbKind[1], tbKind[2] do
		AddGoldItem(0, nID)
	end
end

function AddEquipGoldBase()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local n_Faction = GetLastFactionNumber();
	if (n_Faction < 0) then
		Talk(1, "", "B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn trang bÞ nµy")
	return end
	
	if (n_Faction > 9) then
		Talk(1, "", "HiÖn t¹i ch­a cã trang bÞ hoµng kim m«n ph¸i nµo nµo cho <color=red>Hoa S¬n ph¸i<color> c¶!")
	return end
	
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ cña m«n ph¸i nµo?";
	local tbOption = {};
	local tb_Equip = HOANGKIMMONPHAI;
	local tb_Faction = EQUIP_FACTION;
	for i = 0, (getn(tb_Equip)-1) do
		tinsert(tbOption, {format("Trang bÞ ph¸i %s", tb_Faction[i]), AddEquipGoldConfirm, {tb_Equip[i]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldConfirm(tb_EquipFaction)
	local tb_Equip = tb_EquipFaction;
	local tb_Faction = EQUIP_FACTION;
	local tbOption = {};
	local szTitle = "<dec><npc>Mêi b¹n chän ®­êng tÊn c«ng c¬ b¶n?";
	for x, y in tb_Equip do
		tinsert(tbOption, {format("%s", x), AddEquipGoldSpecicalKind, {tb_Equip[x]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldSpecicalKind(tb_EquipKind)
	for nID = tb_EquipKind[1], tb_EquipKind[2] do
		AddGoldItem(0, nID)
	end
end

-- pEventType:Reg("TÝnh n¨ng thö nghiÖm", "Trang bÞ hoµng kim", TrangBiHoangKim);
-- pEventType:Reg("LÖnh bµi T©n Thñ", "Trang bÞ hoµng kim", TrangBiHoangKim);