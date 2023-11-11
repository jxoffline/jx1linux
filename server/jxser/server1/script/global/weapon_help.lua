-- Ö°ÄÜ¡¡Ìú½³
-- by£ºLi_Xin(2004-07-26)


function help()
        Say("GÇn ®©y trong giang hå xuÊt hiÖn vµi quyÓn ®å phæ vò khİ, theo h­íng dÉn cã thÓ n©ng cao ®¼ng cÊp vò khİ. Ta cã mét vµi manh mèi ®©y, ng­¬i cã muèn biÕt kh«ng? ",11,"Qu¸ tr×nh th¨ng cÊp ®å phæ vò khİ /onhelp","L¨ng V­¬ng Th­îng §o¹n T¹o Tµn biªn/onhelp","HuyÒn Vò Chïy Chi §óc T¹o thuËt /onhelp","Long Ng©m KiÕm §o¹n T¹o ®å /onhelp","Gia C¸t C¬ Qu¸t MËt yÕu /onhelp","LiÔu DiÖp To¸i Phong §ao. Tôy Thó biªn/onhelp","HuyÒn NguyÖt ®ao Tö Kinh b¶o lôc /onhelp","Thiªn C¬ C«n ®å phæ /onhelp","¸m Khİ Tæng phæ. QuyÓn 1/onhelp","Uyªn ¦¬ng ®ao. Khai Quang  biªn/onhelp","Kh«ng muèn biÕt g× hÕt/no")
end;

function onhelp(nSel)
        if(nSel == 0) then
        	Talk(1,"","§Ó ta gi¶i thİch cho ng­¬i vÒ c¸ch sö dông ®å phæ vò khİ. §em vò khİ cÇn th¨ng cÊp ®Æt vµo vŞ trİ kh¶m n¹m, ®å phæ ®Æt vµo hµng ®¼ng cÊp. NÕu phï hîp ®iÒu kiÖn th× ta cã thÓ gióp ng­¬i th¨ng ®¼ng cÊp vò khİ.")
        elseif(nSel == 1) then
        	Talk(1,"","L¨ng V­¬ng Th­¬ng §o¹n T¹o Tµn Biªn lµ ®å phæ dïng ®Ó n©ng cÊp c¸c lo¹i th­¬ng. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 2) then
        	Talk(1,"","HuyÒn Vò Chïy Chi §óc T¹o ThuËt lµ ®å phædïng ®Ó n©ng cÊp c¸c lo¹i Chïy. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 3) then
        	Talk(1,"","Long Ng©m KiÕm §o¹n T¹o ®å lµ ®å phæ dïng ®Ó n©ng cÊp c¸c lo¹i KiÕm. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 4) then
        	Talk(1,"","Gia C¸t C¬ Qu¸t MËt YÕu lµ ®å phæ dïng ®Ó n©ng cÊp c¸c lo¹i Ná. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 5) then
        	Talk(1,"","LiÔu DiÖp To¸i Phong §ao. Tôy Thó biªn lµ ®å phæ dïng ®Ó n©ng cÊp c¸c lo¹i phi ®ao. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 6) then
        	Talk(1,"","HuyÒn NguyÖt ®ao tö Kinh b¶o lôc lµ ®æ phæ dïng ®Ó n©ng cÊp c¸c lo¹i ®ao. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 7) then
        	Talk(1,"","Thiªn C¬ C«n ®å phæ lµ ®å phæ dïng ®Ó n©ng cÊp c¸c lo¹i c«n. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 8) then
        	Talk(1,"","¸m Khİ Tæng phæ. QuyÓn 1 lµ ®å phæ vò dïng ®Ó n©ng cÊp c¸c lo¹i ¸m khİ. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        elseif(nSel == 9) then
        	Talk(1,"","Uyªn ¦¬ng ®ao. Khai Quang biªn lµ ®å phæ dïng ®Ó n©ng cÊp c¸c lo¹i Song ®ao. Nghe nãi hiÖn ®ang ë trong tay cña ThÇn Bİ th­¬ng nh©n ë L©m An")
        end;
end;
   	
       