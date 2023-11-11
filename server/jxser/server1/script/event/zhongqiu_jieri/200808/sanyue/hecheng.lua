--ºÏ³ÉÔÂ±ý
--zhongchaolong
--by 200808


Include("\\script\\event\\zhongqiu_jieri\\200808\\lib\\compose.lua")

local tbFormula = 
{
	
	[1] = 
	{
		tbMaterial = 
		{
			{szName="Lång ®Ìn b­¬m b­ím", tbProp={6, 1, 1796}, nCount = 2},
			{szName="Lång ®Ìn ng«i sao", tbProp={6, 1, 1797}, nCount = 2},
			{szName="Lång ®Ìn èng", tbProp={6, 1, 1798}, nCount = 2},
			{szName="Lång ®Ìn trßn", tbProp={6, 1, 1799}, nCount = 2},
			{szName="HuyÒn tinh kho¸ng th¹ch (cÊp 2)", tbProp={6, 1, 147, 2}, nCount = 1},
		},
		nMoney = 0,
		tbAward = {szName="B¸nh trung thu Väng NguyÖt", tbProp={6, 1, 1801, 1, 0, 0}},
	},
	[2] = 
	{
		tbMaterial = 
		{
			{szName="Lång ®Ìn b­¬m b­ím", tbProp={6, 1, 1796}, nCount = 2},
			{szName="Lång ®Ìn ng«i sao", tbProp={6, 1, 1797}, nCount = 2},
			{szName="Lång ®Ìn èng", tbProp={6, 1, 1798}, nCount = 2},
			{szName="Lång ®Ìn trßn", tbProp={6, 1, 1799}, nCount = 2},
			{szName="Phóc Duyªn Lé (TiÓu) ", tbProp={6, 1, 122},nCount = 1}
		},
		nMoney = 30000,
		tbAward = {szName="B¸nh trung thu KiÕn NguyÖt", tbProp={6, 1, 1802, 1, 0, 0}},
	},
	[3] = 
	{
		tbMaterial = 
		{
			{szName="Lång ®Ìn b­¬m b­ím", tbProp={6, 1, 1796}, nCount = 2},
			{szName="Lång ®Ìn ng«i sao", tbProp={6, 1, 1797}, nCount = 2},
			{szName="Lång ®Ìn èng", tbProp={6, 1, 1798}, nCount = 2},
			{szName="Lång ®Ìn trßn", tbProp={6, 1, 1799}, nCount = 2},
			{szName="NÕn th­ëng nguyÖt", tbProp={6, 1, 1800}, nCount = 1},

		},
		nMoney = 0,
		tbAward = {szName="B¸nh trung thu Th­ëng NguyÖt", tbProp={6, 1, 1803, 1, 0, 0}},
	}
}

function zhongqiu0808_hecheng_dialog()
	
	local tbSay = 
	{
		"<dec><npc>Ho¹t ®éng B¸nh trung thu Th­ëng NguyÖt ®­îc diÔn ra tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008. Trong thêi gian ho¹t ®éng, ng­êi ch¬i ®¸nh qu¸i sÏ thu thËp ®­îc c¸c “Hép Lång §Ìn”. Më hép lßng ®Ìn sÏ ®­îc c¸c lo¹i lång ®Ìn, ng­êi ch¬i cã thÓ ®æi tõ lång ®Ìn sang c¸c lo¹i b¸nh trung thu. Sö dông B¸nh Trung Thu sÏ nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm vµ c¸c vËt phÈm cã gi¸ trÞ.",
		"§æi b¸nh trung thu Väng NguyÖt/#zhongqiu0808_hecheng_select(1)",
		"§æi b¸nh trung thu KiÕn NguyÖt/#zhongqiu0808_hecheng_select(2)",
		"§æi b¸nh trung thu Th­ëng NguyÖt/#zhongqiu0808_hecheng_select(3)",
		"KÕt thóc ®èi tho¹i/OnCancel",
	}
	CreateTaskSay(tbSay)
end


function zhongqiu0808_hecheng_select(nSelectId)
	local tbRecipe = %tbFormula[nSelectId]
	if zhongqiu0808_PlayerLimit() ~= 1 then
		return Say("Yªu cÇu ®¨ng cÊp ph¶i trªn 50 vµ ®· qua n¹p thÎ.", 0)
		
	end
	local szMsg = format("<dec><npc>§æi <color=yellow>%s<color> cÇn:<enter>%s",tbRecipe.tbAward.szName, zhongqiu0808_ComposeClass:GetMaterialList(tbRecipe.tbMaterial, tbRecipe.nMoney))
	
	CreateTaskSay(
			{
				szMsg,
				format("X¸c nhËn ®æi/#zhongqiu0808_hecheng_comfirm(%d)", nSelectId),
				"KÕt thóc ®èi tho¹i/OnCancel",
				
			}
		)
end

function zhongqiu0808_hecheng_comfirm(nSelectId)
	
	local tbRecipe = %tbFormula[nSelectId]
	zhongqiu0808_ComposeClass:Compose(tbRecipe.tbMaterial, tbRecipe.nMoney, tbRecipe.tbAward, "Ho¹t ®éng Lµm b¸nh trung thu")
	
end

function OnCancel()
	
end