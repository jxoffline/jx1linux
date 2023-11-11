-- ¹¦ÄÜ£º×ÏÉ«×°±¸ÏµÍ³ - ×ÏÉ«×°±¸¼°»Æ½ğ×°±¸ÖıÔì

Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\compound\\atlas.lua" );
function onFoundry()
	Say( "NÕu ®¹i hiÖp muèn cã mét mãn ®å võa ı th× ®em ®Çy ®ñ nguyªn liÖu tíi ®©y. Ta sÏ ®óc luyÖn mét vËt phÈm ng­¬i thİch nhÊt!", 4, "B¾t ®Çu chÕ t¹o/onFoundryItem", "Liªn quan chÕ t¹o/onAbout", "T×m hiÓu m¶nh Hoµng Kim./onQueryPiece","§Ó ta suy nghÜ kü l¹i xem/onCancel");
end

-- ¿ªÊ¼ÖıÔì
function onFoundryItem()
	if( isCompoundableToday() == 1 ) then
		FoundryItem();
	else
		Say( "L·o phu h«m nay mÖt råi, mai tr¸ng sÜ ghĞ ®óc luyÖn trang bŞ nha!", 1, "§­îc! VËy ta ®i tr­íc ®©y!/onCancel" );
	end
end

function onQueryPiece()
	QueryPiece()
end
-- ¹ØÓÚÖıÔì
function onAbout()
	Talk( 3, "onAbout2", "Sö dông c¸c nguyªn liÖu ®Æc biÖt nh­ kho¸ng th¹ch cã thuéc tİnh, HuyÒn Tinh Kho¸ng Th¹ch, Trang bŞ HuyÒn Tinh, ®å phæ Hoµng Kim cã thÓ chÕ t¹o ®­îc Trang bŞ HuyÒn Tinh hoÆc trang bŞ Hoµng Kim. §óc luyÖn trang bŞ ®­îc ph©n ra: tinh luyÖn, chÕ t¹o, n©ng cÊp, kh¶m n¹m vµ ®å phæ 5 bé phËn nµy. NÕu cã ®­îc c¸c thø nguyªn liÖu nµy th× cã thÓ ®Õn chç ta nhê ®óc luyÖn.", "<color=yellow>HuyÒn Tinh Kho¸ng Th¹ch<color>: Lµ mét lo¹i kho¸ng th¹ch ®Æc biÖt, thø nguyªn liÖu dïng ®Ó n©ng cÊp, chÕ t¹o, kh¶m n¹m, ®Ó n©ng cao chÊt l­îng thuéc tİnh trong qu¸ tr×nh ®óc luyÖn hoÆc tİnh thµnh c«ng cao. Cã tÊt c¶ 10 cÊp ®é, ®¼ng cÊp kho¸ng cµng cao th× hiÖu qu¶ cho ra cµng lín.", "<color=yellow>Kho¸ng th¹ch cã thuéc tİnh<color>: Ta ®em kho¸ng cã thuéc tİnh n©ng cÊp t­¬ng øng lªn trang bŞ mµu xanh cã thuéc tİnh sÏ cã c¬ héi nhËn ®­îc thuéc tİnh cña kho¸ng th¹ch ®ã. NÕu sö dông kho¸ng mang thuéc tİnh Èn th× ngò hµnh thuéc tİnh cña trang bŞ mµu xanh ph¶i gièng víi thuéc tİnh Èn cña kho¸ng. Kho¸ng th¹ch cã thuéc tİnh cã tíi 10 cÊp ®é, ®¼ng cÊp cµng cao khi kh¶m n¹m cho ra ®iÓm thuéc tİnh cµng cao." );
end

function onAbout2()
	Talk( 2, "", "<color=yellow>Trang bŞ HuyÒn Tinh<color>: Dïng 1 trang bŞ mµu xanh hoÆc mµu tr¾ng kÕt hîp víi HuyÒn Tinh Kho¸ng Th¹ch chÕ t¹o sÏ cã c¬ héi nhËn ®­îc 1 Trang bŞ HuyÒn Tinh tõ 1~5 lÇn c¬ héi kh¶m n¹m. C¸c hµng thuéc tİnh kh¸c cña trang bŞ sÏ gièng víi nguyªn liÖu trang bŞ ®­îc sö dông.", "<color=yellow>§å phæ Hoµng Kim<color>: Mçi mét bé trang bŞ Hoµng Kim ®Òu cã nh÷ng ®å phæ Hoµng Kim t­¬ng øng, theo nh÷ng g× ghi l¹i trªn ®å phæ Hoµng Kim cã ®­îc b¹n sÏ t×m ®­îc c¸c mãn cßn l¹i kÕt hîp chóng thµnh bé trang bŞ Hoµng Kim." );
end

-- È¡Ïû
function onCancel()
end