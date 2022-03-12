-- ÎÄ¼şÃû¡¡£ºhechengqizi.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-14 14:32:38

--10 ÆìµÄËéÆ¬1 + 6 ÆìµÄËéÆ¬2 + 3 ÆìµÄËéÆ¬3 + 1 ÆìµÄËéÆ¬4 + 3 ÍòÁ½	»ñµÃ£º1ÕÅÕ½Ê¤Æì
--±»×¢£º- Ô­ÁÏ½«»áÔÚÍæ¼Ò±³°üÖÖ×Ô¶¯¿Û³ı¡£

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_zhanshengqi = {}

jiefang_0804_zhanshengqi.szName = "jiefang_0804_zhanshengqi"

jiefang_0804_zhanshengqi.tbRecipe =
{
	tbItemList = {
		{szName="M¶nh cê 1", tbProp={6, 1, 1735}, nCount = 10},
		{szName="M¶nh cê 2", tbProp={6, 1, 1736}, nCount = 6},
		{szName="M¶nh cê 3", tbProp={6, 1, 1737}, nCount = 3},
		{szName="M¶nh cê 4", tbProp={6, 1, 1738}, nCount = 1},
	},
	nMoney = 30000,
	tbAwardItem =
	{
		{szName="L¸ Cê ChiÕn Th¾ng", tbProp={6, 1, 1739, 1, 0, 0}},
	}
}

function jiefang_0804_zhanshengqi:main()
	local tbSay = 
	{
		"<dec><npc>Tõ 26-04-2008 ®Õn 24h00 18-05-2008, khi ®¸nh qu¸i sÏ thu thËp ®­îc c¸c m¶nh cê, cã thÓ mang c¸c m¶nh cê ®Õn l·o phu ®Ó hîp thµnh l¸ cê chiÕn th¾ng hoµn chØnh.",
		format("Ta muèn hîp thµnh L¸ cê chiÕn th¾ng/#%s:Compose()", self.szName),
		"Ta sÏ ghĞ l¹i sau/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_zhanshengqi:Compose()
	if (CalcFreeItemCellCount() < 10) then
		Say("Tói hµnh trang ®· ®Çy, h·y dän dÑp hµnh trang ®Ó b¶o ®¶m an toµn cho vËt phÈm.",0)
		return 0;
	end
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose("Hîp thµnh 1 l¸ cê chiÕn th¾ng", tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "LÔ Quan: Chóc mõng ®¹i hiÖp ®· hîp thµnh l¸ cê chiÕn th¾ng hoµn chØnh!", 0)
end