
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


function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local nRow = magiclevel1;

	if magiclevel2==0 then
		return "<enter>Mét bøc ®Şa ®å, h×nh nh­ h­íng dÉn ®­êng ®Õn kho b¸u.<enter> Tuy nhiªn ®· qu¸ cò kh«ng thÓ xem ®­îc, chØ cßn c¸ch ®Õn <color=green>Long TuyÒn Th«n<color> t×m <color=green>Phã L«i Th­<color> nhê gióp ®ì";
	else
		return showTreasureText(nRow)
	end;

end;

-- ÏÔÊ¾²Ø±¦Í¼¾ßÌåµÄÎ»ÖÃĞÅÏ¢
function showTreasureText(nRow)

local strInfo = tabTreaPos:getCell("Text", nRow);
local picPath = tabTreaPos:getCell("Pic", nRow);

	return "<enter>Mét bøc ®Şa ®å, h×nh nh­ h­íng dÉn ®­êng ®Õn kho b¸u.<enter><enter>"..
		   "Trªn tranh Èn Èn hiÖn hiÖn ra n¬i ®©y lµ<color=green>"..strInfo.."<color><enter><enter>"..
		   "<color=yellow>NhÊn chuét ph¶i cã thÓ b¾t ®Çu ®µo<color><enter>";

end;