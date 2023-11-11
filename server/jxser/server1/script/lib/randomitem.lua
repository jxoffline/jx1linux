
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ëæ»úÑ¡È¡Ò»¸öÎïÆ·µÄÀà
-- Edited by peres
-- 2006/08/01 AM 09:52

-- I hope you still feel small when you stand beside the ocean,
-- Whenever one door closes I hope one more opens,
-- Promise me that youll give faith a fighting chance,
-- And when you get the choice to sit it out or dance.

-- ======================================================

IL("ITEM");

-- À©Õ¹±í¸ñÎÄ¼şÀàµÄÖ§³Ö
Include("\\script\\class\\ktabex.lua");

-- ¿ªÆôÒ»¸öËæ»úÎïÆ·µÄÖ÷º¯Êı
function openRandomItem(tabItem, szBoxName)

local nRow = tabItem:countArrayRate("ItemRate");
local szName,nQuality,nGenre,nDetail,nParticular,nLevel,nGoodsFive = "", 0, 0, 0, 0, 0, 0;
local nIndex, nLimitTime = 0;
local nIsPublic = 0;

	szName      = tabItem:getCell("Name", nRow);
	nQuality    = tonumber(tabItem:getCell("Quality", nRow));
	nGenre      = tonumber(tabItem:getCell("Genre", nRow));
	nDetail     = tonumber(tabItem:getCell("Detail", nRow));
	nParticular = tonumber(tabItem:getCell("Particular", nRow));
	nLevel      = tonumber(tabItem:getCell("Level", nRow));
	nGoodsFive  = tonumber(tabItem:getCell("GoodsFive", nRow));
	
	nLimitTime  = tonumber(tabItem:getCell("LimitTime", nRow));
	
	-- ÊÇ·ñ¹«¸æ
	nIsPublic = tonumber(tabItem:getCell("IsPublic", nRow));
	
	if nQuality==1 then
		nIndex = AddGoldItem(0, nGenre);
		if nLimitTime~=nil and nLimitTime>0 then
			ITEM_SetLeftUsageTime(nIndex, nLimitTime * 60);
			SyncItem(nIndex);
		end;
	else
		AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
	end;
	
	Msg2Player(format("B¹n më %s nhËn ®­îc <color=green>%s<color>", szBoxName, szName));
	
	if nIsPublic==1 then
		AddGlobalCountNews(format("C«ng bè: Ng­êi ch¬i %s ®· më  %s vµ nhËn ®­îc %s!", GetName(), szBoxName, szName), 1);
	end;
	
	WriteTaskLog(format("Më %s nhËn ®­îc %s", szBoxName, szName));

end;

-- ÈÎÎñÏµÍ³µÄĞ´Èë LOG ¹ı³Ì
function WriteTaskLog(strMain)

	-- Èç¹ûÊÇ¿ÕÖµÔò²»Ğ´Èë
	if strMain==nil then return end;

	WriteLog(" [HÖ thèng nhiÖm vô]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]").." [mËt m·:"..GetAccount().."] [nh©n vËt:"..GetName().."]"..strMain);
end;
