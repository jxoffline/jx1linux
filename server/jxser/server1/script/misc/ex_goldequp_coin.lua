-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - »Æ½ð×°±¸ÅÆ×Ó¶Ò»»»Æ½ð×°±¸
-- ÎÄ¼þÃû¡¡£ºex_goldequp_coin.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-05-21 13:59:02

-- ======================================================

Include("\\script\\lib\\composelistclass.lua")
IncludeLib("LEAGUE")

local tbGoldEquip_Coin = {
	[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "KÕ NghiÖp Kim Bµi", tbProp = {6,1,2075,1,0,0}, nCount = 100}},
		tbProduct = {szName = "KÕ NghiÖp HuyÒn Vò Hoµng Kim Kh¶i", nQuality = 1, tbProp = {0,22}},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Méng Long Kim Bµi", tbProp = {6,1,2076,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Méng Long HuyÒn Ti Ph¸t ®¸i", nQuality = 1, tbProp = {0,3}},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Minh ¶o Kim Bµi", tbProp = {6,1,2077,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Minh ¶o U §éc ¸m Y", nQuality = 1, tbProp = {0,62}},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "§Þa Ph¸ch Kim Bµi", tbProp = {6,1,2078,1,0,0}, nCount = 100}},
		tbProduct = {szName = "§Þa Ph¸ch Ngò hµnh Liªn Hoµn Qu¸n", nQuality = 1, tbProp = {0,86}},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V« TrÇn Kim Bµi", tbProp = {6,1,2079,1,0,0}, nCount = 100}},
		tbProduct = {szName = "V« TrÇn Ngäc N÷ Tè T©m qu¸n", nQuality = 1, tbProp = {0,41}},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "BÝch H¶i Kim Bµi", tbProp = {6,1,2080,1,0,0}, nCount = 100}},
		tbProduct = {szName = "BÝch H¶i Hång Linh Kim Ti ®¸i", nQuality = 1, tbProp = {0,53}},
	},
	[7] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Vô ¶o Kim Bµi", tbProp = {6,1,2081,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Vô ¶o Tung Phong TuyÕt ¶nh ngoa", nQuality = 1, tbProp = {0,140}},
	},
	[8] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Ma ThÞ Kim Bµi", tbProp = {6,1,2082,1,0,0}, nCount = 100}},
		tbProduct = {szName = "Ma ThÞ HuyÕt Ngäc ThÊt S¸t Béi", nQuality = 1, tbProp = {0,114}},
	},
	[9] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "T¨ng m·o kim bµi", tbProp = {6,1,2203,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Méng Long ChÝnh Hång T¨ng M·o",
			[1]	= {szName = "Méng Long ChÝnh Hång T¨ng M·o", nQuality = 1, tbProp = {0,1}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>Méng Long ChÝnh Hång T¨ng M·o<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
			
	},
	[10] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "U lung kim bµi", tbProp = {6,1,2204,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "U Lung XÝch YÕt MËt trang",
			[1]	= {szName = "U Lung XÝch YÕt MËt trang", nQuality = 1, tbProp = {0,57}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>U Lung XÝch YÕt MËt Trang<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		},
	},
	[11] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Ma s¸t kim bµi", tbProp = {6,1,2205,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Ma S¸t Cö Háa Liªu Thiªn Hoµn",
			[1]	= {szName = "Ma S¸t Cö Háa Liªu Thiªn Hoµn", nQuality = 1, tbProp = {0,104}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>Ma S¸t Cö Háa Liªu Thiªn UyÓn<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			},
		}
	},
	[12] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "§Þch kh¸i kim bµi", tbProp = {6,1,2206,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "§Þch Kh¸i TriÒn M·ng yªu ®¸i",
			[1]	= {szName = "§Þch Kh¸i TriÒn M·ng yªu ®¸i", nQuality = 1, tbProp = {0,98}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>§Þch  Kh¸i TriÒn M·ng Yªu §¸i<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},

}

local tbGoldEquip_Coin_2 = {
		[1] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "H¸m Thiªn Kim Bµi", tbProp = {6,1,2237,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "H¸m Thiªn Hæ ®Çu KhÈn Thóc UyÓn",
			[1]	= {szName = "H¸m Thiªn Hæ ®Çu KhÈn Thóc UyÓn", nQuality = 1, tbProp = {0,19}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>H¸m Thiªn Hæ §Çu KhÈn Thóc UyÓn<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[2] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "Thiªn Quang Kim Bµi", tbProp = {6,1,2238,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "Thiªn Quang Thóc Thiªn Ph­îc §Þa Hoµn",
			[1]	= {szName = "Thiªn Quang Thóc Thiªn Ph­îc §Þa Hoµn", nQuality = 1, tbProp = {0,80}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>Thiªn Quang Thóc Thiªn Ph­îc §Þa Hoµn<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[3] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "BÝch H¶i Kim Bµi", tbProp = {6,1,2239,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "BÝch H¶i Hång L¨ng Ba",
			[1]	= {szName = "BÝch H¶i Hång L¨ng Ba", nQuality = 1, tbProp = {0,54}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>BÝch H¶i Hång L¨ng Ba<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[4] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "V« Ma Kim Bµi", tbProp = {6,1,2240,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "V« Ma B¨ng Tinh ChØ Hoµn",
			[1]	= {szName = "V« Ma B¨ng Tinh ChØ Hoµn", nQuality = 1, tbProp = {0,38}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>V« Ma B¨ng Tinh ChØ Hoµn<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[5] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "L¨ng Nh¹c Kim Bµi", tbProp = {6,1,2241,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "L¨ng Nh¹c Thiªn §Þa HuyÒn Hoµng giíi",
			[1]	= {szName = "L¨ng Nh¹c Thiªn §Þa HuyÒn Hoµng giíi", nQuality = 1, tbProp = {0,120}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>L¨ng Nh¹c Thiªn §Þa HuyÒn Hoµng Giíi<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
	[6] = {
		nFreeItemCellLimit = 12,
		tbMaterial = {{szName = "S­¬ng Tinh Kim Bµi", tbProp = {6,1,2242,1,0,0}, nCount = 100}},
		tbProduct =
		{
			szName = "S­¬ng Tinh Phong B¹o chØ hoµn",
			[1]	= {szName = "S­¬ng Tinh Phong B¹o chØ hoµn", nQuality = 1, tbProp = {0,130}},
			[2] = 
			{
				pFun = function (self, nCount, szLogTilte)
					szAllNews = format("Chóc mõng cao thñ %s ®· nhËn ®­îc <color=yellow>S­¬ng Tinh Phong B¹o ChØ Hoµn<color>", GetName());
					AddGlobalNews(szAllNews);
					LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
				end
			}
		},
	},
}
function ex_goldequp_coin()
	if not tbComposeGoldEquipCoin then
		tbComposeGoldEquipCoin = tbComposeListClass:new("tbComposeGoldEquipCoin", %tbGoldEquip_Coin);
	end
	
	local szTitle = "<dec><npc>".."C¸c h¹ muèn ®æi lo¹i lÖnh bµi nµo?";
		
	local tbSay = tbComposeGoldEquipCoin:MakeOptByProductName("§æi");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel");
	
	CreateTaskSay(tbSay)
end

function ex_goldequp_coin_2()
	if not tbComposeGoldEquipCoin_b then
		tbComposeGoldEquipCoin_b = tbComposeListClass:new("tbComposeGoldEquipCoin_b", %tbGoldEquip_Coin_2);
	end
	
	local szTitle = "<dec><npc>".."C¸c h¹ muèn ®æi lo¹i lÖnh bµi nµo?";
		
	local tbSay = tbComposeGoldEquipCoin_b:MakeOptByProductName("§æi");
	tinsert(tbSay, 1, szTitle);
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel");
	
	CreateTaskSay(tbSay)
end

