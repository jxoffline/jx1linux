Include("\\script\\misc\\timeline\\timelinemanager.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
if (tbItemExchangValue == nil) then
	tbItemExchangValue = {}
	tbItemExchangValue.ExchangeDiscount = 0;
end


function CalcItemExchangValue(nItemIndex, nExchangeValue)
--	if (tbItemExchangValue.ExchangeDiscount == nil or tbItemExchangValue.ExchangeDiscount == 0) then
--		local tbExchange1 = tbTimeLineManager:GetTimeLine("ItemExchange1");
--		local tbExchange2 = tbTimeLineManager:GetTimeLine("ItemExchange2");
--		local tbExchange3 = tbTimeLineManager:GetTimeLine("ItemExchange3");
--		local tbExchange4 = tbTimeLineManager:GetTimeLine("ItemExchange4");
--		local tbExchange5 = tbTimeLineManager:GetTimeLine("ItemExchange5");
		
--		if (tbExchange5 ~= nil and tbExchange5:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.5;
--		elseif (tbExchange4 ~= nil and tbExchange4:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.6;
--		elseif (tbExchange3 ~= nil and tbExchange3:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.7;
--		elseif (tbExchange2 ~= nil and tbExchange2:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.8;
--		elseif (tbExchange1 ~= nil and tbExchange1:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.9;
--		else
			tbItemExchangValue.ExchangeDiscount = 1;
--		end
		
--	end
	
	local nQuality = GetItemQuality(nItemIndex);
	
	if (nExchangeValue <= 0) then
		return 0
	end
	
	--¼Ó8ÒÔÉÏ°×½ð²»ÄÜ¶Ò»»
	local nPlatinaLevel = GetPlatinaLevel(nItemIndex);
	if (nQuality == 4 and nPlatinaLevel > 8) then
		return 0
	end
	
	if (nQuality == 4 and (nPlatinaLevel >= 6 and nPlatinaLevel <= 7)) then
		local nPtMagicAttrExValue = GetPtMagicAttrExValue(nItemIndex);
		if (nPtMagicAttrExValue and nPtMagicAttrExValue > 0) then
			nExchangeValue = nExchangeValue + nPtMagicAttrExValue;
		end
	end
	
	-- Èç¹ûÊÇ×ÏÑb
	if (nQuality == 2) then
		nExchangeValue = nExchangeValue/150;
	end
	
	nExchangeValue = nExchangeValue * tbItemExchangValue.ExchangeDiscount;
	
	return nExchangeValue
end

function exchange_olditem()
	GiveItemUI("§æi hån th¹ch", "Mét lÇn chØ cã thÓ ®æi 1 trang bÞ kh«ng h¹n sö dông vµ kh«ng khãa thµnh hån th¹ch", "exchange_olditem_compose")
end

function exchange_olditem_compose(nCount)
	if (nCount <= 0) then
		Talk(1, "", "Xin mêi bá vµo trang bÞ cã thÓ ®æi ®­îc.");
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "Mét lÇn chØ cã thÓ dïng mét trang bÞ ®Ó ®æi thµnh hån th¹ch");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", "Xin mêi bá vµo trang bÞ cã thÓ ®æi ®­îc.");
		return
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	
	if (nBindState ~= 0) then
		Talk(1, "", "ChØ cã thÓ dïng trang bÞ kh«ng khãa vµ kh«ng cã thêi h¹n sö dông ®æi thµnh hån th¹ch");
		return
	end
	
	local nUseTime = ITEM_GetLeftUsageTime(nItemIndex);
	local nExpireTime = ITEM_GetExpiredTime(nItemIndex);
	
	if ((nUseTime > 0 and nUseTime ~= 4294967295)or (nExpireTime > 0)) then
		Talk(1, "", "ChØ cã thÓ dïng trang bÞ kh«ng khãa vµ kh«ng cã thêi h¹n sö dông ®æi thµnh hån th¹ch");
		return
	end
	
	local nExchangeValue = GetItemExchangeValue(nItemIndex);
	
	if (nExchangeValue <= 0) then
		Talk(1, "", "Xin mêi bá vµo trang bÞ cã thÓ ®æi ®­îc.");
		return
	end
	
	exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue);
end

function exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue)
	local tbSay = {};
	tbSay[1] = format("<dec><npc>X¸c nhËn muèn ®æi <color=red>%s<color> thµnh hån th¹ch cã chøa <color=red>%d<color> tinh lùc?", GetItemName(nItemIndex), nExchangeValue);
	
	tinsert(tbSay, format("X¸c nhËn/#exchange_olditem_compse_confirm(%d, %d)",nItemIndex,nExchangeValue));
	
	tinsert(tbSay, "§Ó ta suy nghÜ kü l¹i xem/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_olditem_compse_confirm(nItemIndex, nExchangeValue)
	if (IsMyItem(nItemIndex) ~= 1) then
		return 
	end
	local nBind = GetItemBindState(nItemIndex);
	--local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	--local arynMagLvl = GetItemAllParams(nItemIndex);
	--local nQuality = GetItemQuality(nItemIndex);
	local uRandSeed = ITEM_GetItemRandSeed(nItemIndex)
	--local szLogMsg = format("{%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d}", 4,uRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,unpack(arynMagLvl))
	local szLogMsg = getItemInfo(nItemIndex);
	WriteLog(format("%s\t%s\t%s\t%d\t%s\t%s\t%d\t%s\t%s",GetAccount(), GetName(), "§æi hån th¹ch", GetItemQuality(nItemIndex), szLogMsg, GetItemName(nItemIndex), 0, format("{6,1,2356,1,0,0,%d,0,0,0,0,0}", nExchangeValue), "Hån Th¹ch"))
	
	local szLog = format("%d\t%s\t%u", nExchangeValue, GetItemName(nItemIndex), uRandSeed)
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	tbAwardTemplet:GiveAwardByList({szName="Hån Th¹ch", tbProp={6,1,2356,1,0,0}, tbParam={nExchangeValue,0,0,0,0,0},nBindState=nBind}, format("§æi hån th¹ch (%d)",nExchangeValue));
	_WritePlayerLog("Equip Exchange ", szLog)
end

tbExchangeLingPai = 
{
	["Thanh C©u LÖnh"] = 
	{
		tbItem = {szName="Thanh C©u LÖnh", tbProp={6,1,2369,1,0,0}},
		szComposFunc = "exchange_lingpai_qingju",
		nRequireJingLianShi = 1500,
	},
	["V©n Léc LÖnh"] = 
	{
		tbItem = {szName="V©n Léc LÖnh", tbProp={6,1,2353,1,0,0}},
		szComposFunc = "exchange_lingpai_yunlu",
		nRequireJingLianShi = 4000,
	},
	["Th­¬ng Lang LÖnh"] = 
	{
		tbItem = {szName="Th­¬ng Lang LÖnh", tbProp={6,1,2352,1,0,0}},
		szComposFunc = "exchange_lingpai_canglang",
		nRequireJingLianShi = 13000,
	},
	["HuyÒn Viªn LÖnh"] = 
	{
		tbItem = {szName="HuyÒn Viªn LÖnh", tbProp={6,1,2351,1,0,0}},
		szComposFunc = "exchange_lingpai_xuanyuan",
		nRequireJingLianShi = 46000,
	},
	["Tö M·ng LÖnh"] = 
	{
		tbItem = {szName="Tö M·ng LÖnh", tbProp={6,1,2350,1,0,0}},
		szComposFunc = "exchange_lingpai_zimang",
		nRequireJingLianShi = 70000,
	},
--	["½ðÎÚÁî"] = 
--	{
--		tbItem = {szName="½ðÎÚÁî", tbProp={6,1,2349,1,0,0}},
--		szComposFunc = "exchange_lingpai_wujin",
--		nRequireJingLianShi = 250000,
--	},
--	["°×»¢Áî"] = 
--	{
--		tbItem = {szName="°×»¢Áî", tbProp={6,1,2357,1,0,0}},
--		szComposFunc = "exchange_lingpai_baihu",
--		nRequireJingLianShi = 500000,
--	},
	["§å Phæ Tö M·ng Th­îng Giíi ChØ"] = 
	{
		tbItem = {szName="§å Phæ Tö M·ng Th­îng Giíi ChØ", tbProp={6,1,2721,1,0,0}},
		szComposFunc = "exchange_Dopho_Tumang_Thuonggioi",
		nRequireJingLianShi = 100000,
	},
	["§å Phæ Tö M·ng H¹ Giíi ChØ"] = 
	{
		tbItem = {szName="§å Phæ Tö M·ng H¹ Giíi ChØ", tbProp={6,1,2722,1,0,0}},
		szComposFunc = "exchange_Dopho_Tumang_Hagioi",
		nRequireJingLianShi = 100000,
	},
	["§å Phæ Tö M·ng KhÝ Giíi"] = 
	{
		tbItem = {szName="§å Phæ Tö M·ng KhÝ Giíi", tbProp={6,1,2723,1,0,0}},
		szComposFunc = "exchange_Dopho_Tumang_Khigioi",
		nRequireJingLianShi = 100000,
	},
}

function exchange_lingpai()
	local tbSay = {};
	tbSay[1] = "<dec><npc>Mét lÇn chØ cã thÓ dïng 1 hån th¹ch ®æi thµnh 1 lÖnh bµi.";
	-- format("<enter>ÔÆÂ¹Áî:ÐèÒªÒ»¸öÖÁÉÙ¹à×¢ÁË<color=green>%d<color>¾«Á¦µÄ»êÊ¯<enter>²ÔÀÇÁî:ÐèÒªÒ»¸öÖÁÉÙ¹à×¢ÁË<color=green>%d<color>¾«Á¦µÄ»êÊ¯<enter>ÐþÔ³Áî:ÐèÒªÒ»¸öÖÁÉÙ¹à×¢ÁË<color=green>%d<color>¾«Á¦µÄ»êÊ¯<enter>×ÏòþÁî:ÐèÒªÒ»¸öÖÁÉÙ¹à×¢ÁË<color=green>%d<color>¾«Á¦µÄ»êÊ¯<enter>½ðÎÚÁî:ÐèÒªÒ»¸öÖÁÉÙ¹à×¢ÁË<color=green>%d<color>¾«Á¦µÄ»êÊ¯", 800,2600,9300,22000,24000)
	
--	for sz_key, tb in tbExchangeLingPai do
--		tbSay[1] = tbSay[1].."<enter>"..format("%s:ÐèÒªÒ»¸öÖÁÉÙ¹à×¢ÁË<color=green>%d<color>¾«Á¦µÄ»êÊ¯", sz_key, tb.nRequireJingLianShi);
--		tinsert(tbSay, format("»»È¡%s/#exchange_lingpai_main_dlg('%s')",sz_key,sz_key));
--	end
	
	
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "Thanh C©u LÖnh", tbExchangeLingPai["Thanh C©u LÖnh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "V©n Léc LÖnh", tbExchangeLingPai["V©n Léc LÖnh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "Th­¬ng Lang LÖnh", tbExchangeLingPai["Th­¬ng Lang LÖnh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "HuyÒn Viªn LÖnh", tbExchangeLingPai["HuyÒn Viªn LÖnh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "Tö M·ng LÖnh", tbExchangeLingPai["Tö M·ng LÖnh"].nRequireJingLianShi);
	--DinhHQ
	--20110413: b¸n ®å ph??th?rÌn thÇn b?LA
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "§å Phæ Tö M·ng Th­îng Giíi ChØ", tbExchangeLingPai["§å Phæ Tö M·ng Th­îng Giíi ChØ"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "§å Phæ Tö M·ng H¹ Giíi ChØ", tbExchangeLingPai["§å Phæ Tö M·ng H¹ Giíi ChØ"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: cÇn Ýt nhÊt hån th¹ch cã chøa<color=green>%d<color> tinh lùc", "§å Phæ Tö M·ng KhÝ Giíi", tbExchangeLingPai["§å Phæ Tö M·ng KhÝ Giíi"].nRequireJingLianShi);
	
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","Thanh C©u LÖnh","Thanh C©u LÖnh"));
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","V©n Léc LÖnh","V©n Léc LÖnh"));
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","Th­¬ng Lang LÖnh","Th­¬ng Lang LÖnh"));
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","HuyÒn Viªn LÖnh","HuyÒn Viªn LÖnh"));
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","Tö M·ng LÖnh","Tö M·ng LÖnh"));
	--tinsert(tbSay, format("»»È¡%s/#exchange_lingpai_main_dlg('%s')","½ðÎÚÁî","½ðÎÚÁî"));
	--tinsert(tbSay, format("»»È¡%s/#exchange_lingpai_main_dlg('%s')","°×»¢Áî","°×»¢Áî"));
	--DinhHQ
	--20110413: b¸n ®å ph??th?rÌn thÇn b?LA
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","§å Phæ Tö M·ng Th­îng Giíi ChØ","§å Phæ Tö M·ng Th­îng Giíi ChØ"));
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","§å Phæ Tö M·ng H¹ Giíi ChØ","§å Phæ Tö M·ng H¹ Giíi ChØ"));
	tinsert(tbSay, format("§æi %s/#exchange_lingpai_main_dlg('%s')","§å Phæ Tö M·ng KhÝ Giíi","§å Phæ Tö M·ng KhÝ Giíi"));
	
	tinsert(tbSay, "§Ó ta suy nghÜ kü l¹i xem/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_lingpai_main_dlg(szLingpai)
	local tbLingpai = tbExchangeLingPai[szLingpai];
	
	if (tbLingpai == nil) then
		return
	end
	
	local szComposeFun = tbExchangeLingPai[szLingpai].szComposFunc;
	
	GiveItemUI(format("§æi %s",szLingpai), format("Mét lÇn chØ cã thÓ dïng Ýt nhÊt hån th¹ch cã chøa %d tinh lùc ®Ó ®æi %s.", tbLingpai.nRequireJingLianShi, szLingpai), szComposeFun)
end

function exchange_lingpai_compose(nCount, szLingpai)
	if (nCount <= 0) then
		Talk(1, "", format("Xin h·y bá hån th¹ch cã chøa Ýt nhÊt <color=green>%d<color> tinh lùc.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "Mét lÇn chØ cã thÓ bá 1 hån th¹ch.");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", format("Xin h·y bá hån th¹ch cã chøa Ýt nhÊt <color=green>%d<color> tinh lùc.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	if (nGenre ~= 6 or nDetailType ~= 1 or nParticular ~= 2356) then
		Talk(1, "", format("Xin h·y bá hån th¹ch cã chøa Ýt nhÊt <color=green>%d<color> tinh lùc.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	
	if (nJinglianshiCount < tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		Talk(1, "", format("Xin h·y bá hån th¹ch cã chøa Ýt nhÊt <color=green>%d<color> tinh lùc.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	exchange_lingpai_confirm_dlg(nItemIndex, szLingpai);
end

function exchange_lingpai_qingju(nCount)
	exchange_lingpai_compose(nCount, "Thanh C©u LÖnh");
end

function exchange_lingpai_yunlu(nCount)
	exchange_lingpai_compose(nCount, "V©n Léc LÖnh");
end

function exchange_lingpai_canglang(nCount)
	exchange_lingpai_compose(nCount, "Th­¬ng Lang LÖnh");
end

function exchange_lingpai_xuanyuan(nCount)
	exchange_lingpai_compose(nCount, "HuyÒn Viªn LÖnh");
end

function exchange_lingpai_zimang(nCount)
	exchange_lingpai_compose(nCount, "Tö M·ng LÖnh");
end

function exchange_lingpai_wujin(nCount)
	exchange_lingpai_compose(nCount, "Kim ¤ LÖnh");
end

function exchange_lingpai_baihu(nCount)
	exchange_lingpai_compose(nCount, "B¹ch Hæ LÖnh");
end

function exchange_Dopho_Tumang_Thuonggioi(nCount)
	exchange_lingpai_compose(nCount, "§å Phæ Tö M·ng Th­îng Giíi ChØ");
end

function exchange_Dopho_Tumang_Hagioi(nCount)
	exchange_lingpai_compose(nCount, "§å Phæ Tö M·ng H¹ Giíi ChØ");
end

function exchange_Dopho_Tumang_Khigioi(nCount)
	exchange_lingpai_compose(nCount, "§å Phæ Tö M·ng KhÝ Giíi");
end

function exchange_lingpai_confirm_dlg(nItemIndex, szLingpai)
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	local tbSay = {};
	tbSay[1] = format("<dec><npc>X¸c nhËn muèn dïng hån th¹ch cã chøa <color=red>%d<color> tinh lùc ®æi thµnh <color=red>%s<color>?", nJinglianshiCount, szLingpai);
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbSay[1] = format("%s<enter><color=red>Hån th¹ch cã sè l­îng tinh lùc v­ît qu¸ sè l­îng ®Ó ®æi <color=yellow>%s<color>, sè cÇn thiÕt lµ<color=green>%d<color>, sè l­îng thõa sÏ tr¶ l¹i, ®¹i hiÖp cã muèn ®æi kh«ng?<color>", tbSay[1], szLingpai, tbExchangeLingPai[szLingpai].nRequireJingLianShi);
	end
	tinsert(tbSay, format("X¸c nhËn/#exchange_lingpai_confirm(%d, '%s')",nItemIndex,szLingpai));
	
	tinsert(tbSay, "§Ó ta suy nghÜ kü l¹i xem/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_lingpai_confirm(nItemIndex, szLingpai)
	if (IsMyItem(nItemIndex) ~= 1) then
		return 
	end
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
			return 0;
	end
	
	local nBind = GetItemBindState(nItemIndex);
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	--20110419: modified by DinhHQ
	--Fix bug using 1 Soul Stone to buy 2 Lingpai
	if (nJinglianshiCount < tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		Talk(1, "", format("Xin h·y bá hån th¹ch cã chøa Ýt nhÊt <color=green>%d<color> tinh lùc.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",format("§æi %s",szLingpai),GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),format("Dïng hån th¹ch (%d) ®æi thµnh %s",nJinglianshiCount,szLingpai)))
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbAwardTemplet:GiveAwardByList({szName="Hån Th¹ch", tbProp={6,1,2356,1,0,0}, tbParam={nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi,0,0,0,0,0}, nBindState=nBind}, format("Dïng hån th¹ch (%d) ®æi %s vµ tr¶ l¹i hån th¹ch cã  %d tinh lùc",nJinglianshiCount,szLingpai,nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi));
	end
		
	local tbLinPaiItem = clone(tbExchangeLingPai[szLingpai].tbItem);
	tbLinPaiItem.nBindState = nBind;
	tbAwardTemplet:GiveAwardByList(tbLinPaiItem, format("Dïng hån th¹ch (%d) ®æi thµnh %s",nJinglianshiCount,szLingpai));

	local szLog = format("%s\t%d",tbLinPaiItem.szName, tbExchangeLingPai[szLingpai].nRequireJingLianShi)
	
	_WritePlayerLog("Exchange Token", szLog)
end

function OnExit()
end
