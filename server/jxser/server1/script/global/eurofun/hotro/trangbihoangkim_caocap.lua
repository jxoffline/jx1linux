
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

EQUIP_ANHHAO = {
	[0] = {
		["ThiÕu L©m QuyÒn"] 					= 		{6283, 6292},
		["ThiÕu L©m Bæng"] 					= 		{6293, 6302},
		["ThiÕu L©m §ao"] 						=		 	{6303, 6312},
	},
	[1] = {
		["Thiªn V­¬ng Chïy"] 				= 		{6313, 6322},
		["Thiªn V­¬ng Th­¬ng"] 			= 		{6323, 6332},
		["Thiªn V­¬ng §ao"] 					=			{6333, 6342},
	},
	[4] = {
		["Nga My KiÕm"] 						= 		{6343, 6352},
		["Nga My Ch­ëng"] 					= 		{6353, 6362},
	},
	[5] = {
		["Thóy Yªn §ao"] 						= 		{6363, 6372},
		["Thóy Yªn Song §ao"] 				= 		{6373, 6382},
	},
	[3] = {
		["Ngò §éc Ch­ëng"] 					= 		{6383, 6392},
		["Ngò §éc §ao"] 							= 		{6393, 6402},
	},
	[2] = {
		["§­êng M«n Phi §ao"] 			= 		{6403, 6412},
		["§­êng M«n Tô TiÔn"] 			= 		{6413, 6422},
		["§­êng M«n Phi Tiªu"] 			=			{6423, 6432},
	},
	[6] = {
		["C¸i Bang Ch­ëng"] 					= 		{6433, 6442},
		["C¸i Bang C«n"] 						= 		{6443, 6452},
	},
	[7] = {
		["Thiªn NhÉn KÝch"] 					= 		{6453, 6462},
		["Thiªn NhÉn §ao"] 					= 		{6463, 6472},
	},
	[8] = {
		["Vâ §ang QuyÒn"] 					= 		{6473, 6482},
		["Vâ §ang KiÕm"] 						= 		{6483, 6492},
	},
	[9] = {
		["C«n L«n §ao"] 							= 		{6493, 6502},
		["C«n L«n KiÕm"] 						= 		{6503, 6512},
	},
	[10] = {
		["Hoa S¬n KiÕm T«ng"] 				= 		{6513, 6522},
		["Hoa S¬n KhÝ T«ng"] 				= 		{6523, 6532},
	},
	[11] = {
		["Vò Hån ThuÈn"] 				= 		{7318, 7327},
		["Vò Hån §ao"] 				= 		{7328, 7337},
	},
};



TAB_EQUIP_FACTION = {
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
	[10] = "Hoa S¬n",
	[11] = "Vò Hån",
};

function TrangBiHoangKimCaoCap()
	local szTitle = "Ng­¬i muèn nhËn trang bÞ lo¹i nµo?";
	local tbOption = {}
		tinsert(tbOption, {"Trang bÞ Anh Hµo", AddEquipGoldSpecical, {EQUIP_ANHHAO}})
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end


-- Load danh s¸ch tÊt c¶ c¸c ph¸i
function AddEquipGoldSpecical(nTableEquip)
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local n_Faction = GetLastFactionNumber();
	if (n_Faction < 0) then
		Talk(1, "", "B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn trang bÞ nµy")
	return end
	
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ cña m«n ph¸i nµo?";
	local tbOption = {};
	local tb_Equip = nTableEquip;
	local tb_Faction = TAB_EQUIP_FACTION;
	for i = 0, getn(tb_Equip) do
		tinsert(tbOption, {format("Trang bÞ ph¸i %s", tb_Faction[i]), AddEquipGoldConfirm, {tb_Equip[i]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldConfirm(tb_EquipFaction)
	local tb_Equip = tb_EquipFaction;
	local tb_Faction = TAB_EQUIP_FACTION;
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
