-- Ö°ÄÜ¡¡Ìú½³
-- by£ºLi_Xin(2004-08-18)


function help()
	str = 
	{
		"<#> Qu¸ tr×nh kh¶m n¹m: ®Æt trang bÞ vµo giao diÖn chÝnh gi÷a, sau ®ã ®em vËt phÈm kh¶m n¹m ®Æt vµo chç t­¬ng øng. VËt phÈm kh¶m n¹m t¨ng vµ gi¶m ®¼ng cÊp ®Æt vµo thanh ®¼ng cÊp; thay ®æi thuéc tÝnh ma ph¸p ®Æt vµo thanh linh lùc; thay ®æi thuéc tÝnh ngò hµnh ®Æt vµo thanh ngò hµnh. NhÊn 'Kh¶m n¹m' ®Ó hoµn thµnh. MÆt n¹ kh«ng thÓ kh¶m n¹m.",
		"<#> Liªn quan kh¶m n¹m thñy tinh/crystalhelp",
		"<#> Liªn quan kh¶m n¹m vò khÝ /weaponhelp",
		"<#> Liªn quan kh¶m n¹m y phôc/armorhelp",
		"<#> Liªn quan kh¶m n¹m nãn/helmhelp",
		"<#> Ta ®· biÕt råi /no",
	};
	Say(str[1], 5, str[2], str[3], str[4], str[5],str[6])
   	-- Say(str[1], 3,str[2], str[3], str[4])
end

function crystalhelp()
	Talk(1,"","Muèn kh¶m nh÷ng vËt nµy kh«ng ®¬n gi¶n chót nµo, tiÒn c«ng rÊt cao, lµm xong còng ch­a ch¾c lµ ®· võa ý, thÕ nµo cã nuèn kh¶m kh«ng? §ång ý? VËy kh¶m nh÷ng thø g×? ")
end

function weaponhelp()
	str = {
		"<#> GÇn ®©y giang hå xuÊt hiÖn ®å phæ cã thÓ t¨ng ®¼ng cÊp vò khÝ. Ng­¬i cã muèn nghe kh«ng?",
		"<#> Qu¸ tr×nh th¨ng cÊp ®å phæ vò khÝ /onweaponhelp",
		"<#> L¨ng V­¬ng Th­îng §o¹n T¹o Tµn Biªn/onweaponhelp",
		"<#> HuyÒn Vò Chïy Chi §óc T¹o ThuËt/onweaponhelp",
		"<#> Long Ng©m KiÕm §o¹n T¹o §å/onweaponhelp",
		"<#> Gia C¸t C¬ Qu¸t MËt YÕu/onweaponhelp",
		"<#> LiÔu DiÖp To¸i Phong §ao. Tôy Thó Biªn/onweaponhelp",
		"<#> HuyÒn NguyÖt ®ao Tö Kinh b¶o lôc/onweaponhelp",
		"<#> Thiªn C¬ C«n ®å phæ /onweaponhelp",
		"<#> ¸m KhÝ Tæng phæ. QuyÓn 1/onweaponhelp",
		"<#> Uyªn ¦¬ng ®ao. Khai Quang biªn/onweaponhelp",
		"<#> Kh«ng quan t©m!/no",
	};
    Say(str[1],11,str[2], str[3], str[4], str[5],str[6], str[7], str[8], str[9],str[10], str[11], str[12])
end

function onweaponhelp(nSel)
	strHelp = 
	{
		"<#> §Æt vò khÝ cÇn th¨ng cÊp gi÷a giao diÖn kh¶m n¹m, ®å phæ ®Æt vµo thanh ®¼ng cÊp. NÕu phï hîp ®iÒu kiÖn sÏ th¨ng ®¼ng cÊp",
		"<#> L¨ng V­¬ng Th­îng §o¹n T¹o Tµn Biªn lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp th­¬ng. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> HuyÒn Vâ Chïy Chi §óc T¹o ThuËt lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp chïy. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> Long Ng©m KiÕm §o¹n T¹o §å lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp kiÕm. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> Gia C¸t C¬ Qu¸t MËt YÕu lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp ná. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> LiÔu DiÖp To¸i Phong §ao. Tôy Thó Biªn lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp phi ®ao. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> HuyÒn NguyÖt §ao Tö Kinh B¶o Lôc lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp ®ao. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> Thiªn C¬ C«n ®å phæ lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp c«n. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> ¸m KhÝ Tæng phæ. QuyÓn 1 lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp phi tiªu. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"<#> Uyªn ¦¬ng ®ao. Khai Quang biªn lµ ®å phæ vò khÝ lo¹i song ®ao, sö dông cã thÓ t¨ng cÊp song ®ao. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
	};
	Talk(1,"",strHelp[nSel + 1]);   
end

function armorhelp()
	Talk(1,"","Ta gi¶i thÝch ph­¬ng ph¸p kh¶m n¹m y phôc. Dùa vµo B¨ng Tµm V« Cùc T¬ cña Thiªn s¬n TuyÕt Linh phèi hîp víi ph­¬ng ph¸p bÝ truyÒn cña ta qua bao lÇn ®óc luyÖn sÏ thµnh c«ng th¨ng cÊp ®­îc ®¼ng cÊp y phôc. Dùa vµo Nam Minh Chi Tinh cña Tam Miªu Hoang Nguyªn kÕt hîp víi ph­¬ng ph¸p bÝ truyÒn cña ta qua c¸c giai ®o¹n ®óc luyÖn sÏ thµnh c«ng gi¶m ®­îc ®¼ng cÊp y phôc.")
end

function helmhelp()
	Talk(1,"","Nh÷ng thø cßn l¹i nµy sÏ gióp ng­¬i t¨ng ®­îc ®¼ng cÊp mò, nh­ng ng­¬i ph¶i thùc hiÖn ®óng theo c¸c b­íc tr×nh tù cña nã, nÕu kh«ng th× sè ®iÓm cña ng­¬i sÏ l¹i bÞ gi¶m xuèng ")
end

