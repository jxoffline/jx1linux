Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
tbChectfour = {};
tbChectfour.tbCompose = 
{
				["ThÇn Bİ Chi Th­"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("§æi nguyªn liÖu\t Hîp thµnh %s", "ThÇn Bİ Chi Th­"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "Tö thñy tinh", tbProp = {4,239,1,1,0,0}, nCount = 1},
									{szName = "Lôc thñy tinh", tbProp = {4,240,1,1,0,0}, nCount = 1},
									{szName = "Lam thñy tinh", tbProp = {4,238,1,1,0,0}, nCount = 1},
									{szName = "HuyÒn tinh cÊp 1", tbProp = {6,1,147,1,-1,0}, nCount = 50},
									{szName = "HuyÒn tinh cÊp 2", tbProp = {6,1,147,2,-1,0}, nCount = 50},
									{szName = "HuyÒn tinh cÊp 3", tbProp = {6,1,147,3,-1,0}, nCount = 50},
									{szName = "Cöu Ch©u LÖnh", tbProp = {6,1,30117,1,0,0}, nCount = 1},
									{szName = "Long HuyÕt Hoµn", tbProp = {6,1,2117,1,0,0}, nCount = 1},
									{szName = "Thiªn B¶o Khè LÖnh", tbProp = {6,1,2813,1,0,0}, nCount = 1},
									{szName = "Hµnh HiÖp LÖnh", tbProp = {6,1,2566,1,0,0}, nCount = 50},
									{szName = "ThiÕt La H¸n", tbProp = {6,1,23,-1,-1,0}, nCount = 2},
								},
							tbProduct = {szName = "ThÇn Bİ Chi Th­", tbProp = {6,1,30181,1,0,0}, nExpiredTime = 60*24*7},
						},
						pCompos = nil;
				},
				["Më R­¬ng 4"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("Nép vËt phÈm\t cã thÓ %s", "Më ®­îc r­¬ng 4"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "ThÇn Bİ Chi Th­", tbProp = {6,1,30181,1,0,0}, nCount = 3},
									{szName = "Ch×a khãa thÇn bİ", tbProp = {6,1,30182,1,0,0}, nCount = 1},
								},
							pProductFun = function (self)
								OpenStoreBox(3)
								Msg2Player("B¹n nhËn ®­îc më r­¬ng chøa ®å thø t­")
							end,
							pLimitFun = function (self) 
								return %tbChectfour:LimitStoreBox()
							end,
						},
						pCompos = nil;
				},
}

function tbChectfour:CreateDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbChectfour:ComposeItem(strItemName)
	local tbItem = self.tbCompose[strItemName]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, strItemName);			
		end
		tbItem.pCompos:ComposeDailog(0);
	end
end
--§æi thÇn bİ chi th­
function tbChectfour:main()
	local tbMainDialog = tbChectfour:CreateDialog()
	tbMainDialog.szTitleMsg = "Kh«ng biÕt ta cã thÓ gióp g× cho ®¹i hiÖp ?"
	tbMainDialog:AddOptEntry("§æi ThÇn Bİ Chi Th­", tbChectfour.ComposeItem, {tbChectfour, "ThÇn Bİ Chi Th­"})
	tbMainDialog:AddOptEntry("Nép vËt phÈm më r­¬ng 4", tbChectfour.ComposeItem, {tbChectfour, "Më R­¬ng 4"})
	tbMainDialog:Show()
end	

function tbChectfour:CheckStoreBox()
	for i=1, 2 do
		if CheckStoreBoxState(i) == 0 then
			return i
		end 
	end
	return 0
end

function tbChectfour:LimitStoreBox()
		if tbChectfour:CheckStoreBox() > 0 then
			Msg2Player(format("§¹i hiÖp vÉn ch­a më r­¬ng thø %d",tbChectfour:CheckStoreBox() + 1))
			return 0
		end
		if CheckStoreBoxState(3) > 0 then
			Msg2Player("§¹i hiÖp ®· më r­¬ng thø 4 råi, kh«ng thÓ më n÷a")
			return 0
		end
		return 1
end