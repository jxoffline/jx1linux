Include("\\script\\item\\forbiditem.lua")

tbVNGForbidItem = {}
tbVNGForbidItem.CHALLENGE_OF_TIME = 1
tbVNGForbidItem.SEVEN_CITY = 2
tbVNGForbidItem.VLDNB = 3
tbVNGForbidItem.tbForbidItem = 
	{
		["ThÇn Hµnh Phï"] = {6, 1, 1266},
--		["T©m T©m T­¬ng ¸nh phï"] = {6, 1, 18}, disable trong file forbitheart.txt
--		["Håi thµnh phï (nhá) "] = {6, 1, 1082},
--		["Håi thµnh phï (lín) "] = {6, 1, 1083},
		["Tèng Kim Chiªu th­ "] = {6, 1, 155},
		["M¹c B¾c TruyÒn Tèng LÖnh"] = {6, 1, 1448},
		["LÖnh bµi Vi S¬n ®¶o"] = {6, 1, 2432},
		["LÖnh bµi vi s¬n ®¶o lÔ bao"] = {6, 1, 2525},
	}

tbVNGForbidItem.tbMapSet = 
	{
		--Vuot ai
		[1] =
			{
				464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479,
				480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 
				957, --ai 30
			},
		--seven city
		[2] = 
			{
				926, 927, 928, 929, 930, 931, 932,
			},
		--VLDNB	
		[3] =
			{
				605, 608, 609, 606, 610, 611, 607, 612, 613,
			},
		--Arena
		[4] =
			{
				975,
			},
	}
	
tbVNGForbidItem.tbItemList = {
	["6,1,218"] = {strName = "C«ng Tèc hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,219"] = {strName = "Bµo Tèc hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,220"] = {strName = "Phæ Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,221"] = {strName = "§éc Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,222"] = {strName = "B¨ng Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,223"] = {strName = "Háa Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,224"] = {strName = "L«i Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,225"] = {strName = "Gi¶m Th­¬ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,226"] = {strName = "Gi¶m H«n hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,227"] = {strName = "Gi¶m §éc hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,228"] = {strName = "Gi¶m B¨ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,229"] = {strName = "Phæ C«ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,230"] = {strName = "§éc C«ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,231"] = {strName = "B¨ng C«ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,232"] = {strName = "Háa C«ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,233"] = {strName = "L«i C«ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,234"] = {strName = "Tr­êng MÖnh hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,235"] = {strName = "Tr­êng Néi hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,115"] = {strName = "Yªn Hång ®an", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,116"] = {strName = "X¸ Lam ®an", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,117"] = {strName = "Néi Phæ hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,118"] = {strName = "Néi §éc hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,119"] = {strName = "Néi B¨ng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,120"] = {strName = "Néi Háa hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,121"] = {strName = "Néi §iÖn hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,1"] = {strName = "Tr­êng MÖnh hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,2"] = {strName = "Gia Bµo hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,3"] = {strName = "§¹i Lùc hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,4"] = {strName = "Cao ThiÓm hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,5"] = {strName = "Cao Trung hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,6"] = {strName = "Phi Tèc hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,7"] = {strName = "B¨ng Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,8"] = {strName = "L«i Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,9"] = {strName = "Háa Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,10"] = {strName = "§éc Phßng hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,60"] = {strName = "B¸nh ch­ng H¹t dÎ", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,61"] = {strName = "B¸nh ch­ng ThÞt heo", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,62"] = {strName = "B¸nh ch­ng ThÞt bß", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,73"] = {strName = "B¸ch Qu¶ Lé", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,19"] = {strName = "C¸t t­êng hång bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,69"] = {strName = "Hoµng Kim B¶o H¹p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,885"] = {strName = "TÝn Sø Méc yªu bµi", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,886"] = {strName = "TÝn Sø §ång yªu bµi", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,887"] = {strName = "TÝn Sø Ng©n yªu bµi", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,888"] = {strName = "TÝn Sø Kim yªu bµi", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,889"] = {strName = "Ngù Tø TÝn Sø yªu bµi", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,910"] = {strName = "Bao D­îc hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1074"] = {strName = "Hép lÔ vËt Hång bao thÇn bÝ", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1075"] = {strName = "Hép lÖ vËt [qu¶ Huy Hoµng]", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1389"] = {strName = "H×nh ném", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1781"] = {strName = "CÈm nang thay ®æi trêi ®Êt", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2318"] = {strName = "Méc ChÕ B¶o H¹p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2319"] = {strName = "§ång ChÕ B¶o H¹p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2320"] = {strName = "Ng©n ChÕ B¶o H¹p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2321"] = {strName = "Hoµng Kim B¶o r­¬ng", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2322"] = {strName = "B¶o r­¬ng B¹ch Kim", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2347"] = {strName = "S¸t Thñ BÝ B¶o", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2374"] = {strName = "B¶o r­¬ng thÇn bÝ cña D· TÈu", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2375"] = {strName = "ChÝ T«n BÝ B¶o", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2376"] = {strName = "Tµi B¶o Thñy TÆc", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2527"] = {strName = "Håi thiªn t¸i t¹o lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2520"] = {strName = "Phi tèc hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2517"] = {strName = "§¹i lùc hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2377"] = {strName = "C«ng Thµnh ChiÕn LÔ Bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2524"] = {strName = "§éc phßng hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2515"] = {strName = "Tr­êng mÖnh hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2516"] = {strName = "Gia tèc hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2518"] = {strName = "Cao thiÓm hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2519"] = {strName = "Cao trung hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2520"] = {strName = "Phi tèc hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2521"] = {strName = "B¨ng phßng hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2522"] = {strName = "L«i phßng hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2523"] = {strName = "Háa phßng hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2524"] = {strName = "§éc phßng hoµn lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2525"] = {strName = "LÖnh bµi vi s¬n ®¶o lÔ bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2830"] = {strName = "Hoµn Hån §¬n LÔ Bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2831"] = {strName = "Tiªu Diªu T¸n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2837"] = {strName = "Hoµn Hån §¬n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2953"] = {strName = "¢m D­¬ng Ho¹t HuyÕt §¬n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2952"] = {strName = "KÝch C«ng Trî Lùc Hoµn", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
}

function tbVNGForbidItem:IsForbidMap(strItemName, tbMapSet)
	local nW, _, _ = GetWorldPos()
	local tbTempMapSet = {}
	for i = 1, getn(tbMapSet) do
		tbTempMapSet = self.tbMapSet[tbMapSet[i]]
		if not tbTempMapSet then
			Msg2Player("Kh«ng x¸c ®Þnh ®­îc khu vùc giíi h¹n sö dông vËt phÈm")
			return 1
		end
		for j = 1, getn(tbTempMapSet) do
			if nW == tbTempMapSet[j] then
				Msg2Player( format("Khu vùc hiÖn t¹i kh«ng ®­îc phÐp sö dông <color=yellow>%s",strItemName ))
				return 1
			end
		end
	end	
	return 0	
end

function tbVNGForbidItem:CheckItemUsable(nMapID, strItemCode)
	if not self.tbItemList[strItemCode] then
		return 1
	end
	local tbForbidMap = self.tbItemList[strItemCode].tbForbidInMap
	for i = 1, getn(tbForbidMap) do
		for j = 1, getn(tbForbidMap[i]) do
			if nMapID == tbForbidMap[i][j] then
				return 0
			end
		end
	end
	return 1
end