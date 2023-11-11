
-- = ===================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ëæ»úÈÎÎñ²Ø±¦Í¼ÊµÌå´¦ÀíÎÄ¼ş
-- Edited by peres
-- 2005/10/19 PM 14:22

-- Ö»ÓĞÍíÉÏËûÃÇÊÇÔÚÒ»ÆğµÄ
-- Ëû¿¿½üËı£¬Óµ±§Ëı
-- ËûµÄÊÖÖ¸ºÍÆ¤·ô
-- Ëı¿´×ÅËû£¬ĞÄÀïÈáÈí¶øÌÛÍ´
-- ËıÏë£¬Ëı»¹ÊÇ°®Ëû
-- Ëı²»Ïë±§Ô¹Ê²Ã´
-- Ã¿ÌìÍíÉÏËûÃÇ¶¼ÔÚ×ö°®
-- Ëı²»ÖªµÀ£¬³ıÁËÕâÖÖ½Ó´¥£¬ËıµÄ°²È«¸ĞºÍÎÂÅ¯£¬»¹ÄÜ´ÓÄÄÀïÈ¡µÃ
-- ËıÏ²»¶ÄÇÒ»Ë²¼ä¡£·Â·ğÔÚºÚ°µµÄ´óº£ÉÏ£¬Æ¯ÏòÊÀ½çµÄ¾¡Í·

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");
IncludeLib("PARTNER");

-- ÅÅÃûÏµÍ³Ö§³Ö
IncludeLib("RELAYLADDER")


-- À©Õ¹±í¸ñÎÄ¼şÀàµÄÖ§³Ö
Include("\\script\\class\\ktabex.lua");

-- ¶ÁÈë DEBUG Êä³ö´¦ÀíÎÄ¼ş
Include("\\script\\task\\system\\task_debug.lua");

-- ¶ÁÈëĞ´Èë RELAY Õ½¶ÓÊı¾İµÄÍ·ÎÄ¼ş
Include("\\script\\lib\\gb_taskfuncs.lua");

-- ¶ÁÈë¶Ô»°×Ö·û´¦ÀíÎÄ¼ş
Include("\\script\\task\\system\\task_string.lua");

tabTreaPos = new(KTabFileEx, "\\settings\\task\\random\\trea_pos.txt", "TreaPos");
tabTreaItem = new(KTabFileEx, "\\settings\\task\\random\\trea_item.txt", "TreaItem");
tabTreaBoss = new(KTabFileEx, "\\settings\\task\\random\\trea_boss.txt", "TreaBoss");
tabTreaOldBox = new(KTabFileEx, "\\settings\\task\\random\\trea_oldbox.txt", "OldBox");

MISS_DIS_X = 6;  -- ÍÚ±¦Ê±ÔÊĞíÆ«ÒÆµÄ X Öá×î´óÖµ
MISS_DIS_Y = 9;  -- ÍÚ±¦Ê±ÔÊĞíÆ«ÒÆµÄ Y Öá×î´óÖµ

ID_USETREAMAP_TIME = 1738;  -- ´¢´æÍæ¼ÒÍÚ±¦µÄ´ÎÊı

--  CALL BOSS ¾ØÕó

-- ____________________
--|                    |
--|         01         |
--|     16  03  10     |
--| 11   06   07   08  |
--| 09  04 Íæ¼Ò 05  12 |
--|     13  14  15     |
--|         02         |
--|____________________|

aryBossPos = {

	[1]  = {0, -3},

	[16]  = {-2, -2},
	[3]  = {0, -2},
	[10]  = {1, -2},

	[11]  = {-2, -1},
	[6]  = {-1, -1},
	[7]  = {1, -1},
	[8]  = {2, -1},
	
	[9]  = {-2, 0},
	[4] = {-1, 0},
	[5] = {1, 0},
	[12] = {2, 0},
	
	[13] = {-1, 1},
	[14] = {0, 1},
	[15] = {1, 1},

	[2] = {0, 3},

}


-- ²úÉúÒ»ÕÅ²Ø±¦Í¼
function CreateTreasureMap()

local nRow = SelectTreasurePos();

local nIndex = AddItem(6, 2, 3, 1, 0, 0, 0);

	-- ½«È¡µ½µÄÏàÓ¦ĞĞÊıĞ´ÈëµÚÒ»¸öÄ§·¨ÊôĞÔ
	SetItemMagicLevel(nIndex, 1, nRow);
	
	-- ÉèÖÃÄ¬ÈÏÎªÎ´¼ø¶¨
	SetItemMagicLevel(nIndex, 2, 0);
	
	-- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
	SyncItem(nIndex)
	
	CDebug:MessageOut("XuÊt hiÖn 1 m¶nh Tµng B¶o §å, sè l­îng nhËn ®­îc lµ "..nRow);
	
	-- ·µ»Ø²Ø±¦Í¼Ë÷Òı
	return nRow;

end;


-- ÓÉÖ¸¶¨µÄĞĞÊı²úÉú²Ø±¦Í¼
function CreateTreasureMapByRow(nRow)

local nIndex = AddItem(6, 2, 3, 1, 0, 0, 0);

	-- ½«È¡µ½µÄÏàÓ¦ĞĞÊıĞ´ÈëµÚÒ»¸öÄ§·¨ÊôĞÔ
	SetItemMagicLevel(nIndex, 1, nRow);
	
	-- ÉèÖÃÄ¬ÈÏÎªÎ´¼ø¶¨
	SetItemMagicLevel(nIndex, 2, 1);
	
end;


-- ÓÉÖ¸¶¨µÄÈÎÎñ±àºÅ´´½¨Ò»¸öÈÎÎñ¾íÖá
function CreateBookByNum(nNum)

local nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);

	SetItemMagicLevel(nRandomItemIndex, 1, nNum);
	
	-- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
	SyncItem(nRandomItemIndex);

	Msg2Player("B¹n nhËn ®ù¬c <color=green>nhiÖm vô ngÉu nhiªn!<color>");
	CDebug:MessageOut("phÇn th­ëng cña nhiÖm vô lµ ngÉu nhiªn, tiÕp theo lµ:"..nRandomItemIndex);

end;


-- Ñ¡ÔñÒ»¸ö²Ø±¦Í¼µÄÎ»ÖÃ
function SelectTreasurePos()

local nRow = random(2, tabTreaPos:getRow());
	CDebug:MessageOut("Chän ®­îc vŞ trİ kho tµng "..nRow);
	return nRow;

end;


-- ¼ì²â²Ø±¦Í¼µÄÎ»ÖÃÊÇ·ñÕıÈ·
function MapCheckTreasurePos(nIndex)
	
local nRow = GetItemMagicLevel(nIndex, 1);
local nIsOpen = GetItemMagicLevel(nIndex, 2);

local nMapID = tonumber(tabTreaPos:getCell("MapID", nRow));
local nMx = tonumber(tabTreaPos:getCell("WorldX", nRow));
local nMy = tonumber(tabTreaPos:getCell("WorldY", nRow));

local pMap, pMx, pMy = GetWorldPos();	

	-- Èç¹ûµØÍ¼¶¼²»¶Ô£¬Ôò·µ»Ø 0
	if pMap~=nMapID then return 0; end;
	
	-- Èç¹û»¹Î´¼ø¶¨£¬Ôò·µ»Ø 2
	if nIsOpen==0 then return 2; end;

	-- ¼ÆËã X ÖáÎó²î
	if (nMx>pMx and nMx-pMx<=MISS_DIS_X) or (nMx<pMx and pMx-nMx<=MISS_DIS_X) or (nMx==pMx) then
		-- ¼ÆËã Y ÖáÎó²î
		if (nMy>pMy and nMy-pMy<=MISS_DIS_Y) or (nMy<pMy and pMy-nMy<=MISS_DIS_Y) or (nMy==pMy) then
			return 1;
		end;
	end;
	
	return 0;
		
end;



-- Ê¹ÓÃÒ»ÕÅ²Ø±¦Í¼
-- ·µ»ØÖµ£º1Îª·ûºÏµØµã¡¢0Îª²»·ûºÏ
function UseTreasurePos(nIndex)

	-- ·ûºÏµØµãºó¿ªÊ¼ÍÚ±¦
	PayTreasure();
	
	-- ¼ÇÂ¼Íæ¼ÒÍÚ±¦µÄ´ÎÊı
	SetTask(ID_USETREAMAP_TIME, GetTask(ID_USETREAMAP_TIME) + 1);
	
	-- Ğ´ÈëÅÅÃû
	Ladder_NewLadder(10237, GetName(), GetTask(ID_USETREAMAP_TIME), 1);

end;


-- ÏÔÊ¾²Ø±¦Í¼µÄÏêÏ¸ĞÅÏ¢
function ShowTreasureMapInfo(nIndex)

local nRow = GetItemMagicLevel(nIndex, 1);
local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

local picLink = "";

	if nIndex==0 or nIndex==nil or nRow<1 or nRow==nil then
		Say("Hõm, tÊm Tµng B¶o §å nµy ®· bŞ ph¸ råi, cÆp m¾t l·o giµ nµy lµm sao mµ ®äc ®­îc?",0);
		return
	else
		picLink = "<link=image:"..picPath..">Th«ng tin vÒ Tµng B¶o §å:<link> Sau khi bá mét sè tiÒn lín, cuèi cïng b¹n còng ®· ®­îc Phã L«i Th­ chØ coh vŞ trİ kho b¸u<color=yellow>"..strInfo.."<color>.";
	end;

	Describe(picLink, 1, "KÕt thóc ®èi tho¹i/OnExit");

end;


-- ¼ì²é·ÅÈëµÄÎïÆ·ÊÇ·ñÎªÕæÕıµÄ²Ø±¦Í¼
function CheckTreasureMap(nCount)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = 0,0,0,0,0,0;
local nIndex = 0;

	if nCount~=1 then
		Say("Ng­¬i giÊu g× ®ã? Ta chØ cÇn <color=yellow>1 tÊm Tµng B¶o §å<color> lµ ®ñ råi!", 0);
		return
	end;
	
	nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(GetGiveItemUnit(1));
	nIndex  = GetGiveItemUnit(1);
	
	if nGenre==6 and nDetail==2 and nParticular==3 then
		
		-- Èç¹ûÃ»ÓĞ¼ø¶¨µÄ»°Ôò¼ø¶¨
		if GetItemMagicLevel(nIndex, 2)==0 then
			
			-- ¿Û³ıÍæ¼ÒµÄ½ğÇ®
			if Pay(300000)==1 then
				SetItemMagicLevel(nIndex, 2, 1);
				SyncItem(nIndex);
				Msg2Player("<color=yellow>B¹n ®­a cho Phã L«i Th­ 30 v¹n l­îng!<color>");
			else
				Say("Haha…B¹n trÎ, kh«ng ®ñ tiÒn th× nãi lµm g×, ®õng t­ëng l·o giµ nµy ngu muéi. Ng­¬i vµ vËt kú tr©n dŞ b¶o tuyÖt thÕ nµy cã thÓ lµ v« duyªn råi.",0);
				return
			end;
			
		elseif GetItemMagicLevel(nIndex, 2)==1 then
			Say("TÊm Tµng B¶o §å nµy ®· qua kiÓm ®Şnh, ng­¬i xem cã hiÓu kh«ng? NÕu kh«ng hiÓu h·y t×m hiÓu kü l¹i!", 0);
			return
		end;
		
		ShowTreasureMapInfo(GetGiveItemUnit(1));
		return
	else
		Say("Ng­¬i giÊu g× ®ã? Ta chØ cÇn <color=yellow>1 tÊm Tµng B¶o §å<color> lµ ®ñ råi!", 0);
		return
	end;

end;


-- ²úÉú±¦²Ø
function PayTreasure()

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

local nType = SelectTreasureType();
	CDebug:MessageOut("B¾t ®Çu ®µo t×m kho b¸u "..nType);

	-- ÏÈËæ»úÅĞ¶ÏÊÇ·ñ²úÉú½ğÇ®£¬ÓĞ 45% µÄ¸ÅÂÊ
	if random(1, 100)<=45 then
		SelectTreasureMoney();
	end;

	if nType==1 then   -- µÀ¾ß
		
		SelectTreasureItem();
		return 1;
		
	elseif nType==2 then   -- BOSS
	
		-- Èç¹ûÊÇ·ÇÕ½¶·×´Ì¬ÄÇÃ´Ö»¸øµÀ¾ß
		if GetFightState()==0 then
			SelectTreasureItem();
		else
			SelectTreasureBoss();
		end;
		return 1;
	
	elseif nType==3 then   -- ÉñÃØÏä×Ó	--by ×Ó·ÇÓã 2008/02/22 È¥³ı±¦Ïä¸ÅÂÊ
		
		AddItem(6, 1, 902, 1, 0, 0, 0);
		Msg2SubWorld("Ng­êi ch¬i <color=yellow>"..GetName().."<color> sö dông Tµng B¶o §å<color=green>"..mapname.."<color> ®· ®µo ®­îc 1 <color=green>B¶o r­¬ng cæ<color>!");
		return 1;
	
	end;

end;


-- Ñ¡ÔñÍÚ³öÀ´µÄ±¦²ØÀàĞÍ
-- ·µ»ØÖµ£º1 µÀ¾ß¡¢2 BOSS¡¢3 ÉñÃØÏä×Ó
function SelectTreasureType()

-- ¸÷ÖÖ±¦²ØµÄ¸ÅÂÊ£ºµÀ¾ß¡¢BOSS¡¢ÉñÃØÏä×Ó£¬±ØĞë±£Ö¤Ïà¼ÓÎª 100
local aryRate = {50,50,0}	--by ×Ó·ÇÓã 2008/02/22 È¥³ı±¦Ïä¸ÅÂÊ
local i,j,k = 0,0,0;
local nType = 0;

	k = random(1,100);

	for i=1, getn(aryRate) do
		j = j + aryRate[i];
		if j>=k then
			nType = i;
			break;
		end;
	end;
	
	return nType;

end;


-- ÔÚÍæ¼ÒµÄÖÜÎ§²úÉúÒ»¶ÑµÄÇ®
function SelectTreasureMoney()

local i=0;

	for i=1, 25 do AddMoneyObj(random(5000, 12000)); end;
	
	Msg2Player("<color=yellow>B¹n nhËn ®­îc mét ®èng tiÒn lín!<color>");

end;


-- Ñ¡ÔñÍÚ³öµÄ±¦²ØÎïÆ·
function SelectTreasureItem()

local nRow = tabTreaItem:countArrayRate("ItemRate");

local nGoods = {"",0,0,0,0,0,0,0};

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

	nGoods[1] = tabTreaItem:getCell("Name", nRow);
	nGoods[2] = tonumber(tabTreaItem:getCell("Quality", nRow));
	nGoods[3] = tonumber(tabTreaItem:getCell("Genre", nRow));
	nGoods[4] = tonumber(tabTreaItem:getCell("Detail", nRow));
	nGoods[5] = tonumber(tabTreaItem:getCell("Particular", nRow));
	nGoods[6] = tonumber(tabTreaItem:getCell("Level", nRow));
	nGoods[7] = tonumber(tabTreaItem:getCell("GoodsFive", nRow));
	nGoods[8] = tonumber(tabTreaItem:getCell("Magiclevel", nRow));

	if (nGoods[2]==1) then
		AddGoldItem(0, nGoods[3]);
		Msg2Player("B¹n lÊy ®­îc mét <color=yellow>"..nGoods[1].."<color>!");
		AddGlobalCountNews("Ng­êi ch¬i "..GetName().." sö dông Tµng B¶o §å"..mapname.."lÊy ®­îc trang bŞ hoµng kim "..nGoods[1].."mét bé!", 2);
	else
		AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
		Msg2Player("B¹n lÊy ®­îc mét <color=yellow>"..nGoods[1].."<color>!");
		-- Msg2SubWorld("Íæ¼Ò<color=yellow>"..GetName().."<color>ÀûÓÃ²Ø±¦Í¼ÔÚ<color=yellow>"..mapname.."<color>´¦ÍÚµ½ÁË<color=yellow>"..nGoods[1].."<color>£¡");
	end;

end;


-- Ñ¡ÔñÉú³É BOSS ÔÚ±¦²ØµØµã
function SelectTreasureBoss()

local nRow = tabTreaBoss:countArrayRate("Rate");  -- Ëæ»úÈ¡µÃÒ»¸ö BOSS µÄĞĞÊı

	-- Èç¹ûÈ¡²»µ½ÕıÈ·µÄĞĞÊıÔò·µ»Ø
	if nRow<1 or nRow==nil then
		CDebug:MessageOut("Tµng B¶o §å CALL BOSS: d·y sè kh«ng tån t¹i!");
		return
	end;

local nIndex   = tonumber(tabTreaBoss:getCell("NpcIndex", nRow));  -- BOSS INDEX
local nMin     = tonumber(tabTreaBoss:getCell("NumMin", nRow));    -- ÊıÁ¿×îĞ¡Öµ
local nMax     = tonumber(tabTreaBoss:getCell("NumMax", nRow));    -- ÊıÁ¿×î´óÖµ
local nFive    = tabTreaBoss:getCell("Five", nRow)

local strName  = tabTreaBoss:getCell("Name", nRow);

local subworld, x, y = GetWorldPos();
local mapindex = SubWorldID2Idx(subworld);
local mapname = SubWorldName(mapindex);

local nBossNum = random(nMin, nMax);

local aryOrg, aryDec = {},{};

local i,j = 0,0;


	-- ¶Ô¶á±¦ÔôµÄÌØÊâ´¦Àí
	if strName=="§o¹t B¶o TÆc" then
		for i,j in aryBossPos do
			tinsert(aryOrg, i);
		end;
		
		for i=1,nBossNum do
		
--			AddNpcEx(random(nIndex, nIndex + 8),  -- ´Ó10¸öÉ½ÔôµÄË÷ÒıÖĞÑ¡Ò»¸ö³öÀ´
--							95,
--							random(0,4),
--							mapindex,
--							(x+aryBossPos[i][1]) *32, -- ¼ÆËã X Æ«ÒÆ
--							(y+aryBossPos[i][2]) *32, -- ¼ÆËã Y Æ«ÒÆ
--							1,
--							strName,
--							1);
			
			-- Èç¹û±í¸ñµÄÎåĞĞÌî n »òÕß²»Ìî£¬ÔòÎªËæ»úÎåĞĞ
			if nFive=="n" or "" then
				nFive = random(0,4);
			else
				nFive = tonumber(nFive);
			end;
			
			AddNpcEx(random(nIndex, nIndex + 8),  -- ´Ó10¸öÉ½ÔôµÄË÷ÒıÖĞÑ¡Ò»¸ö³öÀ´
							95,
							nFive,
							mapindex,
							x*32, -- ¼ÆËã X Æ«ÒÆ
							y*32, -- ¼ÆËã Y Æ«ÒÆ
							1,
							strName,
							1);
		end;
					
		Msg2SubWorld("Ng­êi ch¬i <color=yellow>"..GetName().."<color> khi sö dông Tµng B¶o §å nhËn ®­îc mét<color=green>"..strName.."<color>");
		return 1;
	else

		-- Èç¹û±í¸ñµÄÎåĞĞÌî n »òÕß²»Ìî£¬ÔòÎªËæ»úÎåĞĞ
		if nFive=="n" or "" then
			nFive = random(0,4);
		else
			nFive = tonumber(nFive);
		end;
				
		AddNpcEx(nIndex, 95, nFive, mapindex, x*32, y*32, 1, strName, 1);
		
		-- AddGlobalCountNews("¹«¸æ£ºÍæ¼Ò "..GetName().." ÀûÓÃ²Ø±¦Í¼ÔÚ"..mapname.."ÍÚ±¦Ê±Óöµ½ÁË"..strName.."µÄ×èÄÓ£¡", 2);
		return 1;
	end;

end;


-- ¿ªÆôÒ»¸ö¹Å¾ÉµÄ±¦Ïä
function OpenOldBox()

local nRow = tabTreaOldBox:countArrayRate("ItemRate");
local nGoods = {"",0,0,0,0,0,0,0};
local nIsPublic = 0;

	nGoods[1] = tabTreaOldBox:getCell("Name", nRow);
	nGoods[2] = tonumber(tabTreaOldBox:getCell("Quality", nRow));
	nGoods[3] = tonumber(tabTreaOldBox:getCell("Genre", nRow));
	nGoods[4] = tonumber(tabTreaOldBox:getCell("Detail", nRow));
	nGoods[5] = tonumber(tabTreaOldBox:getCell("Particular", nRow));
	nGoods[6] = tonumber(tabTreaOldBox:getCell("Level", nRow));
	nGoods[7] = tonumber(tabTreaOldBox:getCell("GoodsFive", nRow));
	
	-- ÊÇ·ñ¹«¸æ
	nIsPublic = tonumber(tabTreaOldBox:getCell("IsPublic", nRow));
	
	-- ¶ÔÓÚ°ÂÔË½ä×ÓµÄ¼ì²é
	if nGoods[1]=="V« Danh ChØ Hoµn" or nGoods[1]=="V« Danh Giíi ChØ " then
		
		-- ¼ì²éÔÚ 180 ÌìÀïÊÇ·ñ²úÉú¹ı°ÂÔË½ä×ÓÖĞµÄÈÎºÎÒ»¸ö
		if CheckItemEnableData(nGoods[1], 180)==1 then
			
			AddGoldItem(0, nGoods[3]);
			
			-- Ğ´Èë RELAY µ±Ç°µÄÏµÍ³ÃëÊı
			WriteItemEnableData(nGoods[1]);
			
			WriteTaskLog("Më B¶o r­¬ng nhËn ®­îc mét:"..nGoods[1]);
			
			Msg2SubWorld("Ng­êi ch¬i <color=yellow>"..GetName().."<color> Më B¶o r­¬ng cæ hÕt søc ng¹c nhiªn, ph¸t hiÖn <color=green>"..nGoods[1].."<color>!!!");
			
			AddGlobalCountNews("Ng­êi ch¬i "..GetName().." Më B¶o r­¬ng cæ hÕt søc ng¹c nhiªn, ph¸t hiÖn"..nGoods[1].."!!!!!", 5);
			
			return
		else
			-- Èç¹ûÒÑ¾­²úÉú¹ıµÄ»°Ôò²¹³¥Ò»¸öÇüÔ­ôÕ×Ó
			AddItem(6, 1, 68, 1, 1, 0, 0);
			
			Msg2SubWorld("Ng­êi ch¬i <color=yellow>"..GetName().."<color> Më B¶o r­¬ng cæ hÕt søc ng¹c nhiªn, ph¸t hiÖn <color=green>B¸nh ch­ng<color>!");
			
			WriteTaskLog("Më B¶o r­¬ng ngÉu nhiªn nhËn ®­îc mét:"..nGoods[1]..", nh­ng do h¹n chÕ vÒ thêi gian nªn lÊy B¸nh ch­ng ®Ó ®Òn bï!");
			return
		end;
		
	end;
	
	if nGoods[1]=="Tµng B¶o §å" then
		CreateTreasureMap();
		Msg2Player("B¹n nhËn ®­îc mét <color=yellow>Tµng B¶o §å<color>!");
	elseif (nGoods[2]==1) then
		AddGoldItem(0, nGoods[3]);
		Msg2Player("B¹n nhËn ®­îc mét <color=yellow>"..nGoods[1].."<color>!");
	elseif (nGoods[2]==0) then
		AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
		Msg2Player("B¹n nhËn ®­îc mét <color=yellow>"..nGoods[1].."<color>!");
	end;
	
	-- Ğ´Èë LOG
	WriteTaskLog("Më B¶o r­¬ng nhËn ®­îc mét:"..nGoods[1]);
	
	if nIsPublic==1 then
		AddGlobalCountNews("Ng­êi ch¬i"..GetName().." Më B¶o r­¬ng cæ hÕt søc ng¹c nhiªn, ph¸t hiÖn"..nGoods[1], 1);
	end;
	
end;


-- ¼ì²éÒ»¸öÎïÆ·ÊÇ·ñÒÑ¾­´ïµ½ÁË²ú³öµÄÈÕÆÚ½çÏŞ
-- ´«Èë²ÎÊı strItemName£ºÎïÆ·Ãû³Æ
-- ´«Èë²ÎÊı nDay£ºÏëÒª¼ì²éµÄÌìÊı
-- ·µ»Ø²ÎÊı nEnable£º1Îª¿ÉÒÔÔÙCALL³ö 0Îª²»ÄÜCALL³öÁË
function CheckItemEnableData(strItemName, nDay)

	if strItemName==nil or strItemName=="" then return 0; end;

local nNowTime = GetCurrentTime();  -- »ñÈ¡ÏµÍ³ÔËĞĞÃëÊı
local nOldTime = gb_GetTask(strItemName, 1);  -- »ñÈ¡Ö®Ç°¼ÇÂ¼µÄ¸ÃÎïÆ·²úÉúÃëÊı

	-- Èç¹ûÁ½¸öÈÕÆÚÏà¼õ´óÓÚËùÒªÏŞÖÆµÄÈÕÆÚ£¬Ôò¿ÉÒÔÍ¨¹ı
	-- Ã¿ÌìÓĞ 86400 Ãë
	if nNowTime - nOldTime >= nDay*86400 then
		return 1;
	else
		return 0;
	end;
	
end;


-- Ğ´Èë RELAY ÎïÆ·²úÉúµÄÈÕÆÚ
-- ´«Èë²ÎÊı strItemName£ºÎïÆ·Ãû³Æ
function WriteItemEnableData(strItemName)

	if strItemName==nil or strItemName=="" then return 0; end;

local nNowTime = GetCurrentTime();  -- »ñÈ¡ÏµÍ³ÔËĞĞÃëÊı

	gb_SetTask(strItemName, 1, nNowTime);
	
end;


-- ÈÎÎñÏµÍ³µÄĞ´Èë LOG ¹ı³Ì
function WriteTaskLog(strMain)

	-- Èç¹ûÊÇ¿ÕÖµÔò²»Ğ´Èë
	if strMain==nil then return end;

	WriteLog(" [HÖ thèng nhiÖm vô]"..date(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]").." [mËt m·:"..GetAccount().."] [nh©n vËt:"..GetName().."]"..strMain);
end;


function OnExit()

end;
