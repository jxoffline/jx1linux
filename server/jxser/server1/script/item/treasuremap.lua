
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ëæ»úÈÎÎñ²Ø±¦Í¼ÎïÆ·Ê¹ÓÃ´¦ÀíÎÄ¼ş
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

Include("\\script\\task\\random\\treasure_head.lua");  -- ²Ø±¦Í¼¼øÉÍ¹¦ÄÜ
Include("\\script\\activitysys\\g_activity.lua")			--»î¶¯±à¼­Æ÷
Include("\\script\\activitysys\\playerfunlib.lua")		--»î¶¯±à¼­Æ÷

function main(nIndex)

local nRow = GetItemMagicLevel(nIndex, 1);

	if nRow==0 or nRow==nil then
		Msg2Player("<color=Orange>TÊm b¶n ®å kho b¸u nµy ®· cò r¸ch, kh«ng thÓ sö dông ®­îc n÷a.<color>");
		return 1;
	end;

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

local nMapState = GetItemMagicLevel(nIndex, 2);

local nResult = 0;
local picLink = "";

	if nMapState==0 then
		Msg2Player("<color=Orange>B¹n dùa theo tÊm b¶n ®å kho b¸u nµy t×m kiÕm kh¾p vÉn kh«ng thu ho¹ch ®­îc g×, khuyªn b¹n nªn ®Õn Long TuyÒn Th«n t×m Phã L«i Th­ chØ gi¸o ®i!<color>");
		return 1;
	else
		picLink = "<link=image:"..picPath..">Th«ng tin vÒ Tµng B¶o §å:<link> Sau khi bá mét sè tiÒn lín, cuèi cïng b¹n còng ®· ®­îc Phã L«i Th­ chØ coh vŞ trİ kho b¸u<color=yellow>"..strInfo.."<color>.";
		Describe(picLink, 2,
				 "b¾t ®Çu khai quËt/#useTreasureMap("..nIndex..")",
				 "§ãng/OnExit");
		return 1;
	end;

end;

function useTreasureMap(nIndex)

local nResult = MapCheckTreasurePos(nIndex);
local nDelResult = 0;

	if nResult==1 then
		
		-- Èç¹û³É¹¦ÍÚ³ö¶«Î÷ÁË£¬Ôò½«¸ÃÎïÆ·É¾³ı
		nDelResult = RemoveItemByIndex(nIndex);
		
		if nDelResult==1 then
			UseTreasurePos();
			
			G_ACTIVITY:OnMessage("FinishCangBaoTu");
			
			return 1;
		else
			Msg2Player("<color=Orange>Nh×n tÊm b¶n ®å kho b¸u ®µo qua ®µo l¹i ë ®©y vÉn kh«ng t×m ®­îc g×…...<color>");
			return 1;	
		end;
		
	elseif nResult==0 then
		Msg2Player("<color=Orange>Nh×n tÊm b¶n ®å kho b¸u ®µo qua ®µo l¹i ë ®©y vÉn kh«ng t×m ®­îc g×…...<color>");
		return 1;
	elseif nResult==2 then
		Msg2Player("Nh×n <color=yellow>h×nh vÏ<color> trªn <color=green>b¶n ®å kho b¸u<color> d­êng nh­ kh«ng hiÓu g×, cã thÓ ®Õn <color=yellow>Long TuyÒn Th«n<color> <color=green>t×m<color> <color=yellow>Phã L«i Th­<color> gi¸m ®Şnh xem sao!");
		return 1;
	end;
		
end;


function OnExit()

end;