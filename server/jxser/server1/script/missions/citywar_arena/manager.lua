--²ÎÈüÁ÷³Ì
--1¡¢ÓëÖ÷Èë¿ÚµÄNpc¶Ô»°£¬Ñ¡Ôñ½øÈëµÚ¼¸¸öÕ½Çø
--2¡¢Èç¹û·ûºÏ²ÎÈüÌõ¼şÔò½øÈëÕ½ÇøÄÚ£¨ÁíÒ»ÕÅµØÍ¼£©£¬²¢ÒÔ0ÕóÓªÄ£Ê½½øÈë
--3¡¢Íæ¼ÒÓëÁ½±ßµÄNpc¶Ô»°£¬×ÔÓÉÑ¡Ôñ²ÎÓëµÄÕóÓª¡£
--4¡¢Íæ¼ÒPkËÀÍöºó½«×Ô¶¯±»ÈÔ³ö³¡Íâ£¬µ«ÔÚ±¾µØÍ¼ÄÚ
--5¡¢µ±Íæ¼ÒËÀÍöÊ±£¬»á×Ô¶¯ÏòÍ¬µØÍ¼µÄËùÓĞÍæ¼Ò¹«²¼µ±Ç°µÄÕ½¿ö¡£
--6¡¢Èç¹û¿ÉÒÔ£¬¿ÉÒÔ´ÓNpc¶Ô»°ÖĞÁË½âµ±Ç°µÄ×ÜÅÅĞĞ
--7¡¢±ÈÈü¿ÉÒÔ°´ÕÕµÈ¼¶·Ö³É¸÷ÖÖÈü³¡
--ÈëÕ½ÇøµÄNpc¡¢Ñ¡ÔñÕóÓªµÄNpc
Include("\\script\\missions\\citywar_arena\\head.lua");
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

function main()
	--ÉèÖÃ·µ»Øµã
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);
	Say("Ng­¬i muèn vµo ®Êu tr­êng khiªu chiÕn µ?", 9, "§Êu tr­êng 1 /EnterBattle", "§Êu tr­êng 2 /EnterBattle", "§Êu tr­êng 3 /EnterBattle", "§Êu tr­êng 4 /EnterBattle", "§Êu tr­êng 5 /EnterBattle", "§Êu tr­êng 6 /EnterBattle", "§Êu tr­êng 7 /EnterBattle", "§Êu tr­êng 8 /EnterBattle","Kh«ng ®i n÷a/OnCancel");
end;

function EnterBattle(nBattleId)
	SetFightState(0)
	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;

function OnHelp()
	Talk(8, "",	"L«i ®µi bang héi lµ n¬i häc hái vâ nghÖ gi÷a c¸c bang héi trªn giang hå! §©y sÏ lµ n¬i thi ®Êu c«ng b»ng",	"Muèn tham gia L«i ®µi bang héi, tr­íc hÕt ph¶i gÆp ta ®Ó xin phĞp! Ng­êi xin phĞp ph¶i lµ bang chñ cña bang héi thi ®Êu!",	"Sau khi tæ ®éi, ®éi tr­ëng 2 bªn sÏ ®Õn b¸o danh. Bang chñ hai bªn  mçi ng­êi ph¶i ®Æt c­îc thi ®Êu 1000 v¹n l­îng. ",	"Sau khi ®Æt c­îc xong, xin phĞp thi ®Êu ®· hoµn thµnh. Trong lóc cã 2 bang héi kh¸c ®ang thi ®Êu, kh«ng cho phĞp b¸o danh",	"Xin phĞp thµnh c«ng xong, thµnh viªn cña hai bang héi cã10 phót gia nhËp ®Êu tr­êng. Sau ®ã thi ®Êu sÏ chİnh thøc b¾t ®Çu!" ,"Th¾ng b¹i phô thuéc vµo ®iÓm tİch lòy thi ®Êu cña hai bªn. Mçi thµnh viªn bang héi lµm träng th­¬ng ®èi ph­¬ng sÏ ®­îc 3 ®iÓm, ®èi ph­¬ng bŞ trõ 1 ®iÓm", 	"KÕt thóc thi ®Êu, bang héi nµo tİch lòy ®iÓm cao h¬n sÏ giµnh th¾ng lîi!",	"Ngoµi ra, trong lóc thi ®Êu mét bªn nµo kh«ng cßn thµnh viªn nµo ë l¹i ®Êu tr­êng th× th¾ng lîi sÏ thuéc vÒ bªn kia. ","Bang héi chiÕn th¾ng cã thÓ thu håi 1000 v¹n l­îng ®· ®ãng, ngoµi ra cßn ®­îc 800 v¹n l­îng tiÒn th­ëng vµ 12.000 ®iÓm kinh nghiÖm bang héi. Bang héi thua cuéc sÏ kh«ng lÊy l¹i ®­îc tiÒn ®· ®ãng, mµ cßn bŞ trõ 14.000 ®iÓm kinh nghiÖm bang héi");
end;

function OnCancel()

end;
