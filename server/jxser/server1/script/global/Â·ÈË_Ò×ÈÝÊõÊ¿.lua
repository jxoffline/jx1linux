-- ÓÃÍ­Ç®³öÊÛÒ×ÈİÎïÆ·µÄNPC
-- Fanghao Wu
-- 2004.11.1

function main()

	Say("Kh¸ch quan muèn b¶o vËt g× cã thÓ trùc tiÕp ®Õn <color=yellow>Kú Tr©n C¸c<color> chän mua lµ ®­îc, l·o phu cuèi cïng còng ®­îc nghØ ng¬i råi! Sao? Kh«ng biÕt ®­êng ®Õn <color=yellow>Kú Tr©n C¸c<color> ­?   NhÊn trùc tiÕp <color=green>vµo h×nh trßn ë d­íi bªn tay ph¶i<color> lµ ®­îc råi.", 0);
	return
	
	-- Say ( "Ò×ÈİÊõÊ¿£ºÏëÑ§Ò×ÈİÊõ£¿ÆäÊµºÜ¼òµ¥£¬ÔÚÎÒÕâÂòÒ»¸öÌØÖÆµÄÒ×ÈİÃæ¾ßÎÒ¾Í¿ÉÒÔ½ÌÄã¡£²»Í¬µÄÃæ¾ß¿ÉÒÔÒ×Èİ³É²»Í¬µÄÑù×Ó£¬´óÏÀÒª²»Òª¿´Ò»¿´£¿", 3, "¹ºÂò/OnBuy", "ÔİÊ±²»ÂòÁË/OnCancel", "¹ØÓÚÒ×ÈİÃæ¾ß/OnAbout" );
end

function OnBuy()
	Sale( 95, 3 );
end

function OnCancel()
end

function OnAbout()
	Say( "§em trang bŞ MÆt n¹ bÊt k× ®Æt vµo n¬i trang bŞ<color=yellow> MÆt n¹ <color>, nh©n vËt  khi mang vµo lËp tøc biÕn thµnh NPC, tªn nh©n vËt vµ tÊt c¶ thuéc tİnh ®Òu<color=yellow> kh«ng thay ®æi <color>, còng<color=yellow> kh«ng ¶nh h­ëng <color>®Õn c¸c dông cô trang bŞ vµ c«ng n¨ng cña nh©n vËt th­êng dïng. Lóc ta cëi bá MÆt n¹ trong « trang bŞ ra, nh©n vËt sÏ trë l¹i ban ®Çu, sè lÇn sö dông MÆt n¹<color=yellow> gi¶m ®i mét lÇn<color>.", 0 );
end