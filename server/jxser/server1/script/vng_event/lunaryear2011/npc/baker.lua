Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\composeex.lua")

if not tbBaker then
	tbBaker = {}
end
function main()
	if tbVNG_LY2011:isActive() == 0 then
		return
	end
	tbBaker:main()
end
function tbBaker:main()
	local tbMainDiag = tbNpcHead:createDialog()
	tbMainDiag.szTitleMsg = "Nh÷ng ngµy nµy thËt bËn rén"
	tbMainDiag:AddOptEntry("Giíi thiÖu ho¹t ®éng", tbBaker.introduction, {tbBaker})
	tbMainDiag:AddOptEntry("B¸nh ch­ng ®Æc biÖt", tbBaker.composeItem, {tbBaker})
	tbMainDiag:Show()
end
function tbBaker:introduction()
	local tbIntroDialog = tbNpcHead:createDialog()
	tbIntroDialog.szTitleMsg = "Mäi ng­êi ai còng bËn rén chuÈn bÞ cho ba ngµy tÕt, sao ng­¬i cßn ®øng ®©y? H·y ghÐ th¨m trang chñ cña trß ch¬i ®Ó biÕt thªm chi tiÕt nhÐ!"
	tbIntroDialog:AddOptEntry("Trë l¹i", tbBaker.main, {tbBaker})
	tbIntroDialog:Show()
end
function tbBaker:composeItem()
	local tbComposeDialog = tbNpcHead:createDialog()
	tbComposeDialog.szTitleMsg = "NÕu cã ®ñ nguyªn liÖu ta sÏ gióp ng­¬i lµm [B¸nh ch­ng ®Æc biÖt]"
	tbComposeDialog:AddOptEntry("Lµm b¸nh", tbBaker.doCompose, {tbBaker})
	tbComposeDialog:AddOptEntry("Trë l¹i", tbBaker.main, {tbBaker})
	tbComposeDialog:Show()
end

function tbBaker:doCompose()
	local tbItemCompose = 
	{
		["B¸nh ch­ng ®Æc biÖt"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho¹t ®éng lµm b¸nh ®ãn xu©n\t Hîp thµnh %s", "B¸nh ch­ng ®Æc biÖt"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "B¸nh ch­ng", tbProp = {6,1,30086,1,0,0}, nCount = 2},
								{szName = "GiÊy gãi b¸nh", tbProp = {6,1,30085,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "B¸nh ch­ng ®Æc biÖt", tbProp = {6,1,30089,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}
	local tbItem = tbItemCompose["B¸nh ch­ng ®Æc biÖt"]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("Hîp thµnh [%s]", "B¸nh ch­ng ®Æc biÖt"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end
