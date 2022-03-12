-- ÎÄ¼þÃû¡¡£ºyandiduihuan.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-05-14 16:38:43
--Ñ×µÛ×°±¸ÖØÖý
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
yandiduihuan_tbItemList = 
{
	{szName="To¹i Nh©n XÝch HuyÕt Nguyªn Vò Gi¸p", nQuality=1, tbProp={0, 442}},
	{szName="To¹i Nh©n B¸ch LuyÖn Kh«i", nQuality=1, tbProp={0, 443}},
	{szName="To¹i Nh©n Trôc Thiªn Ngoa", nQuality=1, tbProp={0, 445}},
	{szName="To¸i Nh©n Kim Lò NhuyÔn Vi Hé UyÓn", nQuality=1, tbProp={0, 446}},
	{szName="Phôc Hi Hoan ¶nh KÞch", nQuality=1, tbProp={0, 455}},
	{szName="Phôc Hi V« L­îng TÞch Tµ Thñ", nQuality=1, tbProp={0, 456}},
	{szName="Phôc Hi To¸i T©m", nQuality=1, tbProp={0, 457}},
	{szName="N÷ Oa Hång Nhan Ph¸t §¸i", nQuality=1, tbProp={0, 463}},
	{szName="N÷ Oa Lôc NghÖ Nghª Th­êng Thóc §¸i", nQuality=1, tbProp={0, 464}},
	{szName="N÷ Oa Hµn T­¬ng", nQuality=1, tbProp={0, 467}},
	{szName="Chóc Dung LiÖt DiÖm Né Phong Trang", nQuality=1, tbProp={0, 472}},
	{szName="Chóc Dung Kinh ChÝch BÊt DiÖt Tr¶o", nQuality=1, tbProp={0, 476}},
	{szName="Chóc Dung Ph¸ NhËt", nQuality=1, tbProp={0, 477}},
	{szName="ThÇn N«ng Tiªu D­¬ng §Þa Hoµng Y", nQuality=1, tbProp={0, 482}},
	{szName="ThÇn N«ng Né L«i §Çu Hoµn", nQuality=1, tbProp={0, 483}},
	{szName="ThÇn N«ng Ngù Phong L÷", nQuality=1, tbProp={0, 485}},
	{szName="ThÇn N«ng Tr¶m Nh¹c", nQuality=1, tbProp={0, 487}},
}

yandiduihuan_Material = 
{
	{szName="Ph­îng Minh Chïy", tbProp={6, 1, 1746}},
	{szName="HuyÒn tinh kho¸ng th¹ch cÊp 8", tbProp={6, 1, 147, 8}},
	{szName="M¶nh Bæ Thiªn Th¹ch (trung)", tbProp={6, 1, 1309}},
	{szName="ThÇn bÝ kho¸ng th¹ch", tbProp={6, 1, 398}},
}
yandiduihuan_CostMoney = 10000000 --1QW


function yandiduihuan_CalcItemCount(tbMaterial)
	if type(tbMaterial[1]) == "table" then
		local nNeedCount = 0
		local tbNeedCount = {}
		for i = 1, getn(tbMaterial) do
			local nCount = 0
			nCount, tbNeedCount[i] = yandiduihuan_CalcItemCount(tbMaterial[i])
			nNeedCount = nNeedCount + nCount
		end
		return nNeedCount, tbNeedCount
	else
		local nCount = tbMaterial.nCount or 1
		return nCount, nCount
	end
	
end

function yandiduihuan_checkGoldItem(nCount)
	for i=1, nCount do
		local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
		if tbItem.nQuality == 1 then
			if yandiduihuan_tbItemList ~= nil then
				for j=1,getn(yandiduihuan_tbItemList) do
					if (yandiduihuan_checkOne(yandiduihuan_tbItemList[j], tbItem) == 1) then
						return tbItem,i
					end
				end
			end
		end
	end
end


function yandiduihuan_GiveStep(nCount)

	local tbMaterial = yandiduihuan_Material
	local nNeedCount, tbNeedCount = yandiduihuan_CalcItemCount(tbMaterial)
	
	
	if nCount ~=  nNeedCount + 1 then
		Msg2Player("Bá vµo sè l­îng kh«ng ®óng.")
		return Say("§¹i hiÖp bá nguyªn liÖu vµo kh«ng ®óng, kh«ng thÓ tiÕn hµnh trïng luyÖn ®­îc. Nguyªn liÖu ®Ó trïng luyÖn trang bÞ hoµng kim Viªm §Õ lµ 1 trang bÞ hoµng kim Viªm §Õ, 1 Phông Minh chïy, 1 huyÒn tinh cÊp 8, 1 m¶nh bæ thiªn th¹ch (trung), 1000 v¹n ng©n l­îng", 0)
	end
	
	local tbAwardItem, nCheckedId = yandiduihuan_checkGoldItem(nCount)
	
	if tbAwardItem == nil then
		Msg2Player("Bá trang bÞ viªm ®Õ vµo kh«ng phï hîp víi yªu cÇu.")
		return Say("Bá trang bÞ viªm ®Õ vµo kh«ng phï hîp víi yªu cÇu.", 0)
	end
	
	for i=1,nCount do
		if i ~= nCheckedId then
			local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
			local nId,nItemCount = yandiduihuan_checkItem(tbMaterial, tbItem)
			if nId > 0 and tbNeedCount[nId] >= nItemCount then
				nNeedCount = nNeedCount - nItemCount
				tbNeedCount[nId] = tbNeedCount[nId] - nItemCount
			else
				Msg2Player("Bá vµo nguyªn liÖu kh«ng ®óng");
				return Say(format("Cung cÊp cho ta nguyªn liÖu kh«ng ®óng nªn kh«ng thÓ trïng luyÖn ®­îc.  Nguyªn liÖu trïng luyÖn<color=yellow>%s<color>lµ 1 <color=yellow>%s<color>, 1 Ph­îng Minh chïy, 1 huyÒn tinh cÊp 8, 1 bæ thiªn th¹ch (trung), 1000 v¹n ng©n l­îng", tbAwardItem.szName, tbAwardItem.szName), 0)
			end
		end
			
	end	
	if (nNeedCount == 0) then
		if  Pay(yandiduihuan_CostMoney) == 1 then 
			local nItemIndex = GetGiveItemUnit(nCheckedId)
			yandiduihuan_LogEquip(nItemIndex, "Tr­íc khi trïng luyÖn Viªm §Õ")
			for i = 1, nCount do
				RemoveItemByIndex(GetGiveItemUnit(i))
			end
			tbAwardItem.CallBack = yandiduihuan_LogEquip
			tbAwardTemplet:GiveAwardByList(tbAwardItem, "Sau khi trïng luyÖn Viªm §Õ")
			return Say(format("VËt phÈm <color=yellow>%s<color> ®· trïng luyÖn thµnh c«ng", tbAwardItem.szName), 0)
		else
			return Say("Kh«ng ®ñ tiÒn ®Ó tiÕn hµnh trïng luyÖn nµy.", 0)
		end
				
	else
		Msg2Player("Bá vËt phÈm vµo kh«ng ®óng yªu cÇu");
	end
end


function yandiduihuan_MakeItemTable(nItemIndex)
	local tbItem = {}
	tbItem.szName		= GetItemName(nItemIndex)
	tbItem.nQuality		= GetItemQuality(nItemIndex);
	tbItem.nBindState	= GetItemBindState(nItemIndex);
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1
	tbItem.tbProp = {}
	if tbItem.nQuality == 0 then -- ÆÕÍ¨ÎïÆ·
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --»Æ½ð or °×½ð
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		else
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)	
		end
	elseif tbItem.nQuality == 2 then -- ×ÏÉ«×°±¸
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end



function yandiduihuan_checkItem(tbMaterial,tbItem)	
	for i = 1, getn(tbMaterial) do
		if yandiduihuan_checkOne(tbMaterial[i], tbItem) == 1 then
			return i, tbItem.nCount
		end
	end
	return 0;
end

function yandiduihuan_checkOne(tbSrcItem, tbDecItem)
	if tbSrcItem == nil or tbDecItem == nil then
		return 0;
	end
	if tbSrcItem.tbProp == nil or tbDecItem.tbProp == nil then
		return 0;
	end
	if tbSrcItem.nQuality ~= nil and tbSrcItem.nQuality ~= tbDecItem.nQuality then
		return 0;
	end
	if tbSrcItem.nBindState ~= nil and tbSrcItem.nBindState ~= tbDecItem.nBindState then
		return 0;
	end
	local i;
	for i=1,getn(tbSrcItem.tbProp) do
		if (tbSrcItem.tbProp ~= nil) then
			if (tbSrcItem.tbProp[i] ~= tbDecItem.tbProp[i]) then
				return 0;
			end
		end
	end
	return 1;
end

function yandiduihuan_LogEquip(nItemIndex, szLogTitle)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	local arynMagLvl	= GetItemAllParams(nItemIndex);
	local nQuality		= GetItemQuality(nItemIndex);
	local uRandSeed		= ITEM_GetItemRandSeed(nItemIndex)
	local szItemName	= GetItemName(nItemIndex)
	
	local szLogMsg = format("%s, {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d}", szItemName, 4,uRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,unpack(arynMagLvl))
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",szLogTitle or "Sau khi trïng luyÖn Viªm §Õ",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szLogMsg))	
	
end


function yandiduihuan_main()
	GiveItemUI("Giao diÖn trïng luyÖn trang bÞ hoµng kim Viªm §Õ", "1 Phông Minh chïy, 1 huyÒn tinh cÊp 8, 1 bæ thiªn th¹c (trung), 1 thÇn bÝ kho¸ng th¹ch, 1000 v¹n ng©n l­îng, 1 trang bÞ hoµng kim Viªm §Õ", "yandiduihuan_GiveStep", "yandiduihuan_OnCancel", 1)
end


function yandiduihuan_shuoming()
	local tbSay = 
	{
		"<dec><npc>Trïng luyÖn trang bÞ Viªm §Õ, cÇn 1 Phông Minh Chïy, 1 bæ thiªn th¹ch (trung), 1 thÇn bÝ kho¸ng th¹ch, 1000 v¹n ng©n l­îng vµ 1 trang bÞ hoµng kim Viªm §Õ.<enter>Trang bÞ Viªm §Õ dïng ®Ó trïng luyÖn vµ trang bÞ sau khi trïng luyÖn lµ 1 lo¹i trang bÞ hoµng kim, nÕu nh­ sö dông to¸i nh©n xÝch huyÕt nguyªn vâ gi¸p trïng luyÖn th× nhÊt ®Þnh sÏ ra trang bÞ to¸i nh©n xÝch huyÕt nguyªn vâ vµ cã thuéc tÝnh ngÉu nhiªn.<enter>Ngo¹i trõ trang søc Viªm §Õ ra th× tÊt c¶ nh÷ng Viªm §Õ ®Òu cã thÓ trïng luyÖn.",
		"Ta ®· hiÓu râ råi/yandiduihuan_OnCancel",
	}
	CreateTaskSay(tbSay)
end

function yandiduihuan_OnCancel()
	
end