Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbCompose_RBH = tbActivityCompose:new()
tbFormulaList = 
{
	[1] = 
		{
			szName = "B¹ch Hæ Ph¸t Qu¸n",
			tbMaterial = {{szName="M¶nh B¹ch Hæ Ph¸t Qu¸n",tbProp={6,1,30291,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={2,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[2] = 
		{
			szName = "B¹ch Hæ Kim Kh¶i",
			tbMaterial = {{szName="M¶nh B¹ch Hæ Kim Kh¶i",tbProp={6,1,30292,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={6,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[3] = 
		{
			szName = "B¹ch Hæ H¹ng Liªn",
			tbMaterial = {{szName="M¶nh B¹ch Hæ H¹ng Liªn",tbProp={6,1,30293,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={1,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},		
	[4] = 
		{
			szName = "B¹ch Hæ Hé UyÓn",
			tbMaterial = {{szName="M¶nh B¹ch Hæ Hé UyÓn",tbProp={6,1,30294,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={4,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},		
	[5] = 
		{
			szName = "B¹ch Hæ Ngäc Béi",
			tbMaterial = {{szName="M¶nh B¹ch Hæ Ngäc Béi",tbProp={6,1,30295,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={9,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[6] = 
		{
			szName = "B¹ch Hæ Hµi",
			tbMaterial = {{szName="M¶nh B¹ch Hæ Hµi",tbProp={6,1,30296,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={8,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[7] = 
		{
			szName = "B¹ch Hæ Yªu §¸i",
			tbMaterial = {{szName="M¶nh B¹ch Hæ Yªu §¸i",tbProp={6,1,30297,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={5,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[8] = 
		{
			szName = "B¹ch Hæ Th­îng Giíi ChØ",
			tbMaterial = {{szName="M¶nh B¹ch Hæ Th­îng Giíi ChØ",tbProp={6,1,30298,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={3,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[9] = 
		{
			szName = "B¹ch Hæ H¹ Giíi ChØ",
			tbMaterial = {{szName="M¶nh B¹ch Hæ H¹ Giíi ChØ",tbProp={6,1,30299,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={10,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[10] = 
		{
			szName = "B¹ch Hæ KhÝ Giíi",
			tbMaterial = {{szName="M¶nh B¹ch Hæ KhÝ Giíi",tbProp={6,1,30300,1,0,0},nCount = 99},},
			tbProduct = {szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},tbParam={7,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
}
function tbCompose_RBH:RuongBachHo()
	local tbOpt = {}
	local szTitle = "Ng­¬i muèn ®æi lo¹i R­¬ng B¹ch Hæ nµo"
	local pEventType = EventSys:GetType("AddNpcOption")
	for i=1, getn(tbFormulaList) do
		local p = tbCompose_RBH:new(tbFormulaList[i], "ChangeRuongBachHo")
		local szOpt = format("§æi %s", tbFormulaList[i].szName)
		--tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
		tinsert(tbOpt, {szOpt, p.ComposeDailog, {p}})
	end
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szTitle, tbOpt);
end
pEventType:Reg("Ch­ëng §¨ng Cung N÷", "§æi R­¬ng B¹ch Hæ", tbCompose_RBH.RuongBachHo, {tbCompose_RBH})