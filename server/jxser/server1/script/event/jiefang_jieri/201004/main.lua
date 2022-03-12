Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\itemset.lua")
Include("\\script\\item\\class\\virtualitem.lua")

if (FreedomEvent2010 == nil) then
	FreedomEvent2010 = {}
end

FreedomEvent2010.START_DATE = 20100426
FreedomEvent2010.END_DATE = 20100607
FreedomEvent2010.END_DATE1 = 20100531

FreedomEvent2010.tbBuyItem = 
{
	["H¹t Thiªn TuÕ"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng ­¬m mÇm h¹nh phóc \t Mua %s", "H¹t Thiªn TuÕ"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = {{nJxb = 1000000, nCount=1}},
			tbProduct = {szName = "H¹t Thiªn TuÕ", tbProp = {6,1,2294,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Tói Ph©n Bãn"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng ­¬m mÇm h¹nh phóc \t Mua %s", "Tói Ph©n Bãn"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "Tói Ph©n Bãn", tbProp = {6,1,2295,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Thïng N­íc"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng ­¬m mÇm h¹nh phóc \t Mua %s", "Thïng N­íc"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "Thïng N­íc", tbProp = {6,1,2296,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Thuèc Trõ S©u"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng ­¬m mÇm h¹nh phóc \t Mua %s", "Thuèc Trõ S©u"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "Thuèc Trõ S©u", tbProp = {6,1,2297,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Cuén V¶i H¶o H¹ng"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü \t Mua%s", "Cuén V¶i H¶o H¹ng"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 40000, nCount=1}},
			tbProduct = {szName = "Cuén V¶i H¶o H¹ng", tbProp = {6,1,2302,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["ChiÕc Mò ChiÕn SÜ"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü\t§æi %s", "ChiÕc Mò ChiÕn SÜ"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "Hép Kim ChØ", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "Cuén V¶i", tbProp = {6,1,2301,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "ChiÕc Mò ChiÕn SÜ", tbProp = {6,1,2304,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["§«i Giµy Bé §éi"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü\t§æi %s", "§«i Giµy Bé §éi"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "Hép Kim ChØ", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "Cuén V¶i H¶o H¹ng", tbProp = {6,1,2302,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "§«i Giµy Bé §éi", tbProp = {6,1,2305,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["TÊm ¸o ChiÕn SÜ"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü\t§æi %s", "TÊm ¸o ChiÕn SÜ"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "Hép Kim ChØ", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "Cuén V¶i Th­îng H¹ng", tbProp = {6,1,2303,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "TÊm ¸o ChiÕn SÜ", tbProp = {6,1,2306,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["ChiÕc vâng Tr­êng S¬n 1"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü\t§æi %s", "ChiÕc vâng Tr­êng S¬n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "HuyÒn Tinh Kho¸ng Th¹ch (cÊp 5) ", tbProp = {6,1,147,5,0,0}, nCount = 5},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Thñy Tinh"),
				{szName = "Ba l« Con Cãc", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "ChiÕc vâng Tr­êng S¬n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["ChiÕc vâng Tr­êng S¬n 2"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü\t§æi %s", "ChiÕc vâng Tr­êng S¬n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "HuyÒn Tinh Kho¸ng Th¹ch (cÊp 6) ", tbProp = {6,1,147,6,0,0}, nCount = 3},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Thñy Tinh"),
				{szName = "Ba l« Con Cãc", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "ChiÕc vâng Tr­êng S¬n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["ChiÕc vâng Tr­êng S¬n 3"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü\t§æi %s", "ChiÕc vâng Tr­êng S¬n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "HuyÒn Tinh Kho¸ng Th¹ch (cÊp 7) ", tbProp = {6,1,147,7,0,0}, nCount = 2},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Thñy Tinh"),
				{szName = "Ba l« Con Cãc", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "ChiÕc vâng Tr­êng S¬n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["ChiÕc vâng Tr­êng S¬n 4"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho¹t ®éng tÊm ¸o chiÕn sü\t§æi %s", "ChiÕc vâng Tr­êng S¬n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "HuyÒn Tinh Kho¸ng Th¹ch (cÊp 8) ", tbProp = {6,1,147,8,0,0}, nCount = 1},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Thñy Tinh"),
				{szName = "Ba l« Con Cãc", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "ChiÕc vâng Tr­êng S¬n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["NhÊt Kû Cµn Kh«n Phï"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("BÐ long\t§æi %s", "NhÊt Kû Cµn Kh«n Phï"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "Ngò Hµnh Kú Th¹ch", tbProp = {6,1,2125,-1,-1,0}, nCount = 300},
			},
			tbProduct = 
			{
				szName = "NhÊt Kû Cµn Kh«n Phï",
				[1]	= {szName = "NhÊt Kû Cµn Kh«n Phï", tbProp = {6,1,2126,1,0,0}, nExpiredTime = 30*24*60}, --change item expired time to 30days - Modified by DinhHQ - 20110428
				[2] = 
				{
					pFun = function (self, nCount, szLogTilte)
						szAllNews = format("Cao thñ <color=yellow>%s<color> ®· nhËn ®­îc <color=green>%d<color> [<color=yellow>%s<color>], giang hå tõ ®©y dËy sãng trë l¹i", GetName(), 1, "NhÊt Kû Cµn Kh«n Phï");
						LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
					end
				},
			},
		},
		pCompos = nil;
	},
	["MÆt n¹ quû ¶nh"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("BÐ long\t§æi %s", "MÆt n¹ quû ¶nh"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "Ngò Hµnh Kú Th¹ch", tbProp = {6,1,2125,-1,-1,0}, nCount = 3},
			},
			tbProduct = {szName = "MÆt n¹ quû ¶nh", tbProp = {0,11,455,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
	["MÆt n¹ cöu mÖnh"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("BÐ long\t§æi %s", "MÆt n¹ cöu mÖnh"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "Ngò Hµnh Kú Th¹ch", tbProp = {6,1,2125,-1,-1,0}, nCount = 5},
			},
			tbProduct = {szName = "MÆt n¹ cöu mÖnh", tbProp = {0,11,454,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
}

FreedomEvent2010.tbSongjinSoldier =
{
	{szName="Tói Ph©n Bãn", tbProp={6,1,2295,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="Thïng N­íc", tbProp={6,1,2296,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="Thuèc Trõ S©u", tbProp={6,1,2297,1,0,0}, nRate=34, nExpiredTime = 20100531},
}

FreedomEvent2010.tbMonsterDrop =
{
	{
		{szName="Tói Dông Cô", tbProp={6,1,2299,1,0,0}, nRate=1.2, nExpiredTime = 20100531},
	},
}

FreedomEvent2010.tbSoldierToolBag =
{
	{szName="Hép Kim ChØ", tbProp={6,1,2300,1,0,0}, nRate=70, nExpiredTime = 20100531},
	{szName="Cuén V¶i", tbProp={6,1,2301,1,0,0}, nRate=30, nExpiredTime = 20100531},
}

FreedomEvent2010.tbClothExp =
{
	exp=
	{
		30,
		40,
		60,
		80,
		200,
	},
	rate=
	{
		24,
		67,
		5,
		3,
		1,
	},
}

FreedomEvent2010.tbClothAwardSpecial =
{
	{szName="ChiÕc gËy Tr­êng S¬n", tbProp={6,1,2298,1,0,0}, nRate=35.8, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ChiÕc gËy Tr­êng S¬n") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ChiÕc gËy Tr­êng S¬n")) end end},
	{szName="ThÐp Tinh LuyÖn(cÊp 5)", tbProp={6,1,2293,5,0,0}, nRate=20, nExpiredTime = 20100607},
	{szName="T¨ng m·o kim bµi", tbProp={6,1,2203,1,0,0}, nRate=3,},
	{szName="U lung kim bµi", tbProp={6,1,2204,1,0,0}, nRate=2,},
	{szName="Ma s¸t kim bµi", tbProp={6,1,2205,1,0,0}, nRate=2,},
	{szName="§Þch kh¸i kim bµi", tbProp={6,1,2206,1,0,0}, nRate=3,},
	{szName="H¸m Thiªn Kim Bµi", tbProp={6,1,2237,1,0,0}, nRate=6,},
	{szName="Thiªn Quang Kim Bµi", tbProp={6,1,2238,1,0,0}, nRate=4,},
	{szName="T©n BÝch H¶i Kim Bµi", tbProp={6,1,2239,1,0,0}, nRate=3,},
	{szName="V« Ma Kim Bµi", tbProp={6,1,2240,1,0,0}, nRate=8,},
	{szName="L¨ng Nh¹c Kim Bµi", tbProp={6,1,2241,1,0,0}, nRate=8,},
	{szName="S­¬ng Tinh Kim Bµi", tbProp={6,1,2242,1,0,0}, nRate=4,},
	{szName="Kim Quang B¾c Kinh Chi Méng", tbProp={0,197},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang B¾c Kinh Chi Méng") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang B¾c Kinh Chi Méng")) end end},
	{szName="Kim Quang Nh· §iÓn Chi Hån", tbProp={0,202},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang Nh· §iÓn Chi Hån") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang Nh· §iÓn Chi Hån")) end end},
	{szName="ThÇn bÝ kho¸ng th¹ch", tbProp={6,1,398,1,0,0}, nRate=1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ThÇn bÝ kho¸ng th¹ch") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ThÇn bÝ kho¸ng th¹ch")) end end},

}

FreedomEvent2010.tbClothAwardNormal =
{
	{szName="Ba l« Con Cãc", tbProp={6,1,2308,1,0,0}, nRate=18, nExpiredTime = 20100607},
	{szName="Ngò Hµnh Kú Th¹ch", tbProp={6,1,2125,1,0,0}, nRate=20},
	{szName="ChiÕc gËy Tr­êng S¬n", tbProp={6,1,2298,1,0,0}, nRate=10, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ChiÕc gËy Tr­êng S¬n") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ChiÕc gËy Tr­êng S¬n")) end end},
	{szName="Tiªn Th¶o Lé ®Æc biÖt", tbProp={6,1,1181,1,0,0}, nRate=2},
	{szName="ThiÕt La H¸n", tbProp={6,1,23,1,0,0}, nRate=5},
	{szName="Bµn Nh­îc T©m Kinh", tbProp={6,1,12,1,0,0}, nRate=2},
	{szName="ThÐp Tinh LuyÖn(cÊp 3)", tbProp={6,1,2293,3,0,0}, nRate=8, nExpiredTime = 20100607},
	{szName="ThÐp Tinh LuyÖn(cÊp 4)", tbProp={6,1,2293,4,0,0}, nRate=5, nExpiredTime = 20100607},
	{szName="ThÐp Tinh LuyÖn(cÊp 5)", tbProp={6,1,2293,5,0,0}, nRate=1, nExpiredTime = 20100607},
	{szName="T¨ng m·o kim bµi", tbProp={6,1,2203,1,0,0}, nRate=0.5,},
	{szName="U lung kim bµi", tbProp={6,1,2204,1,0,0}, nRate=0.3,},
	{szName="Ma s¸t kim bµi", tbProp={6,1,2205,1,0,0}, nRate=0.3,},
	{szName="§Þch kh¸i kim bµi", tbProp={6,1,2206,1,0,0}, nRate=0.5,},
	{szName="H¸m Thiªn Kim Bµi", tbProp={6,1,2237,1,0,0}, nRate=1,},
	{szName="Thiªn Quang Kim Bµi", tbProp={6,1,2238,1,0,0}, nRate=1,},
	{szName="T©n BÝch H¶i Kim Bµi", tbProp={6,1,2239,1,0,0}, nRate=0.6,},
	{szName="V« Ma Kim Bµi", tbProp={6,1,2240,1,0,0}, nRate=1.2,},
	{szName="L¨ng Nh¹c Kim Bµi", tbProp={6,1,2241,1,0,0}, nRate=1.2,},
	{szName="S­¬ng Tinh Kim Bµi", tbProp={6,1,2242,1,0,0}, nRate=0.8,},
	{szName="Khiªu chiÕn LÔ bao", tbProp={6,1,2006,1,0,0}, nRate=11.26},
	{szName="Kim Quang B¾c Kinh Chi Méng", tbProp={0,197},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang B¾c Kinh Chi Méng") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang B¾c Kinh Chi Méng")) end end},
	{szName="Kim Quang Nh· §iÓn Chi Hån", tbProp={0,202},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang Nh· §iÓn Chi Hån") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"Kim Quang Nh· §iÓn Chi Hån")) end end},
	{szName="ThÇn bÝ kho¸ng th¹ch", tbProp={6,1,398,1,0,0}, nRate=0.3,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ThÇn bÝ kho¸ng th¹ch") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Chóc mõng <color=yellow>%s<color> ®· nhËn ®­îc <color=yellow>%s<color>",GetName(),"ThÇn bÝ kho¸ng th¹ch")) end end},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch (cÊp 6) ", tbProp={6,1,147,6,0,0}, nRate=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch (cÊp 7) ", tbProp={6,1,147,7,0,0}, nRate=3},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch (cÊp 8) ", tbProp={6,1,147,8,0,0}, nRate=2},
}

function FreedomEvent2010:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE or now < self.START_DATE) then
		return 0;
	end
	return 1;
end

function FreedomEvent2010:IsActive1()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE1 or now < self.START_DATE) then
		return 0;
	end
	return 1;
end

function FreedomEvent2010:LingFanSoldierItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "Chµo mõng ngµy ®Êt n­íc ®­îc gi¶i phãng!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","Cuén V¶i H¶o H¹ng","Cuén V¶i H¶o H¹ng"));
	end
	tinsert(tbSay, format("§æi [%s]/#FreedomEvent2010:BuyCotDlg()","ChiÕc vâng Tr­êng S¬n"));
	
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LingFanPlantItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "Chµo mõng ngµy ®Êt n­íc ®­îc gi¶i phãng!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","H¹t Thiªn TuÕ","H¹t Thiªn TuÕ"));
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","Tói Ph©n Bãn","Tói Ph©n Bãn"));
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","Thïng N­íc","Thïng N­íc"));
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","Thuèc Trõ S©u","Thuèc Trõ S©u"));
	end
	
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LiGuanEventItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "Chµo mõng ngµy ®Êt n­íc ®­îc gi¶i phãng!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("§æi [%s]/#FreedomEvent2010:BuyItem('%s')","ChiÕc Mò ChiÕn SÜ","ChiÕc Mò ChiÕn SÜ"));
		tinsert(tbSay, format("§æi [%s]/#FreedomEvent2010:BuyItem('%s')","§«i Giµy Bé §éi","§«i Giµy Bé §éi"));
		tinsert(tbSay, format("§æi [%s]/#FreedomEvent2010:BuyItem('%s')","TÊm ¸o ChiÕn SÜ","TÊm ¸o ChiÕn SÜ"));
	end
	
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyCotDlg()
	local tbSay = {};
	tbSay[1] = "Cã thÓ sö dông 4 c¸ch ®Ó ®æi <enter>5huyÒn tinh kho¸ng th¹ch(cÊp5)+1thñy tinh+1Ba l« Con Cãc<enter>3huyÒn tinh kho¸ng th¹ch(cÊp6)+1thñy tinh+1Ba l« Con Cãc<enter>2huyÒn tinh kho¸ng th¹ch(cÊp7)+1thñy tinh+1Ba l« Con Cãc<enter>1huyÒn tinh kho¸ng th¹ch(cÊp8)+1thñy tinh+1Ba l« Con Cãc";
	tinsert(tbSay, format("C¸ch ®æi 1/#FreedomEvent2010:BuyItem('%s')","ChiÕc vâng Tr­êng S¬n 1"));
	tinsert(tbSay, format("C¸ch ®æi 2/#FreedomEvent2010:BuyItem('%s')","ChiÕc vâng Tr­êng S¬n 2"));
	tinsert(tbSay, format("C¸ch ®æi 3/#FreedomEvent2010:BuyItem('%s')","ChiÕc vâng Tr­êng S¬n 3"));
	tinsert(tbSay, format("C¸ch ®æi 4/#FreedomEvent2010:BuyItem('%s')","ChiÕc vâng Tr­êng S¬n 4"));
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LongerEventItemDlg()
	local tbSay = {};
	tbSay[1] = "<#><npc>BÐ Long: §¹i hiÖp cã thÊy ta dÔ th­¬ng kh«ng. å nh÷ng viªn ®¸ nµy ®Ñp qu¸, ®¹i hiÖp muèn ®æi lÊy vËt phÈm g× trong kho b¶o vËt cña gia ®×nh ta";
	tinsert(tbSay, format("§æi [%s]/#FreedomEvent2010:BuyItem('%s')","NhÊt Kû Cµn Kh«n Phï","NhÊt Kû Cµn Kh«n Phï"));
	tinsert(tbSay, format("§æi [%s]/#FreedomEvent2010:BuyItem('%s')","MÆt n¹ quû ¶nh","MÆt n¹ quû ¶nh"));
	tinsert(tbSay, format("§æi [%s]/#FreedomEvent2010:BuyItem('%s')","MÆt n¹ cöu mÖnh","MÆt n¹ cöu mÖnh"));
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("Mua [%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end
