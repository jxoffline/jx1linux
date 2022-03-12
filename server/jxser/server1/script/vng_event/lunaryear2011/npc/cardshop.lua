Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\composeex.lua")
if not tbCardShop then
	tbCardShop = {}
end
tbCardShop.composeList =
	{
		["ThiÖp Xu©n 1"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng lµm b¸nh ®ãn xu©n\t Hîp thµnh %s", "ThiÖp Xu©n 1"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "Lam Thñy Tinh", tbProp = {4,238,1,1,0,0}, nCount = 1}, --lam thuy tinh
								{szName = "Tinh Hång B¶o Th¹ch", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "Phóc Duyªn Lé (§¹i)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "ThiÖp Xu©n", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["ThiÖp Xu©n 2"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng lµm b¸nh ®ãn xu©n\t Hîp thµnh %s", "ThiÖp Xu©n 2"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "Tö Thñy Tinh", tbProp = {4,239,1,1,0,0}, nCount = 1}, --tu thuy tinh
								{szName = "Tinh Hång B¶o Th¹ch", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "Phóc Duyªn Lé (§¹i)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "ThiÖp Xu©n", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["ThiÖp Xu©n 3"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng lµm b¸nh ®ãn xu©n\t Hîp thµnh %s", "ThiÖp Xu©n 3"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "Lôc Thñy Tinh", tbProp = {4,240,1,1,0,0}, nCount = 1}, --luc thuy tinh
								{szName = "Tinh Hång B¶o Th¹ch", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "Phóc Duyªn Lé (§¹i)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "ThiÖp Xu©n", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}

function main()
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	local tbMainDialog = tbNpcHead:createDialog()
	tbMainDialog.szTitleMsg = "Víi <color=red>1 <color>Tinh Hång B¶o Th¹ch,<color=red>1 <color>B×nh Phóc Duyªn Lé (§¹i)  vµ <color=red>1 <color>trong 3 lo¹i thñy tinh lµ §¹i hiÖp sÏ cã ngay 1  tÊm thiÖp xu©n thËt ®Ñp."
	tbMainDialog:AddOptEntry("Mua thiÖp b»ng Lam Thñy Tinh", tbCardShop.buyCard, {tbCardShop,"ThiÖp Xu©n 1"})
	tbMainDialog:AddOptEntry("Mua thiÖp b»ng Tö Thñy Tinh", tbCardShop.buyCard, {tbCardShop, "ThiÖp Xu©n 2"})
	tbMainDialog:AddOptEntry("Mua thiÖp b»ng Lôc Thñy Tinh", tbCardShop.buyCard, {tbCardShop, "ThiÖp Xu©n 3"})
	tbMainDialog:Show()
end

function tbCardShop:buyCard(strCard)	
	local tbItem = self.composeList[strCard]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("[VNG][Lunar Year 2011] [Mua %s]", "ThiÖp Xu©n"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end