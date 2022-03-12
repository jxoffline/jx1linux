-- ÎÄ¼şÃû¡¡£ºlingjiang.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-04-14 14:34:01

-- °ÑÌúÅ£ÀÉÑÀÅåµ½¸÷ĞÂÊÖ´åµÄÀñ¹ÙNPC ³ö¶Ò»»½±Àø¡£
-- ½±Àø°üÀ¨£ºÒ»ÕÅÕ½±¸ÒøÆ±+1¸ö8Ğş¾§+ÏÂÃæÎïÆ·ÁĞ±íÖĞµÄËæ»úÒ»¸ö

Include("\\script\\event\\jiefang_jieri\\200804\\lib\\compose.lua")
jiefang_0804_mieshanzei = {}

jiefang_0804_mieshanzei.szName = "jiefang_0804_mieshanzei"

jiefang_0804_mieshanzei.tbRecipe = 
{
	tbItemList = 
	{
		{szName="ThiÕt Ng­u Lang Nha Béi", tbProp={6, 1, 1733}, nCount = 1},		
	},
	nMoney = 0,
	tbAwardItem = 
	{
		[1] = {szName="Ng©n phiÕu chiÕn bŞ", tbProp={6, 1, 1732, 1, 0, 0}, nExpiredTime = 20090111},
		[2] = {szName="HuyÒn tinh kho¸ng th¹ch cÊp 8", tbProp={6, 1, 147, 8, 0, 0}},
		[3] = {
			{szName="§éng S¸t B¹ch Kim §iªu Long Giíi", nQuality=1, tbProp={0, 143},nRate = 25},
			{szName="§éng S¸t B¹ch Ngäc Cµn Kh«n Béi", nQuality=1, tbProp={0, 144},nRate = 25},
			{szName="§éng S¸t B¹ch Kim Tó Phông Giíi", nQuality=1, tbProp={0, 145},nRate = 25},
			{szName="§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn", nQuality=1, tbProp={0, 146},nRate = 25},
		}
	},
}

function jiefang_0804_mieshanzei:main()
	local tbSay = 
	{
		"<dec><npc>GÇn ®©y, mét nhãm s¬n tÆc th­êng xuyªn ®Õn c¸c th«n trÊn quÊy nhiÔu d©n lµnh, t×nh h×nh ngµy cµng nghiªm träng, c¸c ®¹i hiÖp h·y ra søc ®¸nh ®uæi bän giÆc nµy. Ngoµi c¬ héi nhÆt ®­îc <color=yellow>ThiÕt Ng­u Lang Nha Béi<color> trªn ng­êi bän chóng, l·o phu cßn cã phÇn th­ëng hËu hØ göi tÆng.",
		format("Ta ®· nhÆt ®­îc ThiÕt Ng­u Lang Nha Béi/#%s:Compose()", self.szName),
		"KÕt thóc ®èi tho¹i/no"
	}
	CreateTaskSay(tbSay);
end

function jiefang_0804_mieshanzei:Compose()
	local szMsg = "§¹i hiÖp xin h·y nhanh chãng tham gia ®éi ngò tiªu diÖt s¬n tÆc?"
	local tbRecipe = self.tbRecipe
	jiefang_0804_ComposeClass:Compose(szMsg, tbRecipe.tbItemList, tbRecipe.nMoney,  tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbRecipe.tbAwardItem, self.szName, 1, Say, "§¹i hiÖp ®· cã thµnh tİch rÊt xuÊt s¾c trong viÖc ®¸nh ®uæi s¬n tÆc, xin h·y nhËn lÊy phÇn th­ëng nµy?", 0)
end
