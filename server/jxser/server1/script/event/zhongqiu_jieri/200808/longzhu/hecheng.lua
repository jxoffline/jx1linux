--ÁúÖé»»ÔÂ±ý
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="Ngò s¾c long ch©u (Kim)", tbProp={6, 1, 1807}},
			{szName="Ngò s¾c long ch©u (Méc)", tbProp={6, 1, 1808}},
			{szName="Ngò s¾c long ch©u (Thñy)", tbProp={6, 1, 1809}},
			{szName="Ngò s¾c long ch©u (Háa)", tbProp={6, 1, 1810}},
			{szName="Ngò s¾c long ch©u (Thæ)", tbProp={6, 1, 1811}},

		},
		nMoney = 0,
		tbAward = 	{szName="Phông NguyÖt Qu¶ Dung", tbProp={6, 1, 127, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="Ngò s¾c phông vò (Kim)", tbProp={6, 1, 1812}},
			{szName="Ngò s¾c phông vò (Méc)", tbProp={6, 1, 1813}},
			{szName="Ngò s¾c phông vò (Thñy)", tbProp={6, 1, 1814}},
			{szName="Ngò s¾c phông vò (Háa)", tbProp={6, 1, 1815}},
			{szName="Ngò s¾c phông vò (Thæ)", tbProp={6, 1, 1816}},
		},
		nMoney = 0,
		tbAward = {szName="Cèng NguyÖt Phï Dung", tbProp={6, 1, 128, 1, 0, 0}},
	},
}

function zhongqiu0808_longzhuhecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>Cã hai lo¹i b¸u vËt, ®¹i hiÖp muèn ®æi g×?<enter>C¸ch 1: 1 bé 'Ngò s¾c long ch©u'  ®æi “Phông nguyÖt qu¶ dung'<enter>C¸ch 2: 1 bé 'Ngò s¾c phông vò' ®æi 'Cèng nguyÖt phï dung'.",
		"T¹i h¹ muèn ®æi 'Phông nguyÖt qu¶ dung'./#zhongqiu0808_longzhuhecheng_select(1)",
		"T¹i h¹ muèn ®æi 'Cèng nguyÖt phï dung'./#zhongqiu0808_longzhuhecheng_select(2)",
		"KÕt thóc ®èi tho¹i/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_longzhuhecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	
	local szMsg = format("<dec><npc>§æi <color=yellow>%s<color> cÇn:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("X¸c nhËn ®æi/#zhongqiu0808_longzhuhecheng_comfirm(%d)", nSelectId),
				"KÕt thóc ®èi tho¹i/OnCancel",
				
			}
		)
end

function zhongqiu0808_longzhuhecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "Ho¹t ®éng Lµm b¸nh trung thu")
	
end

function OnCancel()
	
end