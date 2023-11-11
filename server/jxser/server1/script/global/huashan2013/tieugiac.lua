--Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if GetLastFactionNumber() == 10 then
Describe("Tiªu Gi¸c: Hãa ra lµ s­ ®Ö, cÇn gióp ®ì g×?",5,"T×m hiÓu m«n ph¸i/timhieuquyphai","T×m hiÓu ®ång m«n/timhieucaothu","T×m hiÓu nhiÖm vô/timhieunhiemvu","T×m hiÓu së tr­êng luyÖn c«ng/timhieusotruongluyencong","T×m hiÓu vâ nghÖ bæn m«n/timhieuvonghebonmon")
else
Describe("Tiªu Gi¸c: §¹i hiÖp ®Õn tÖ ph¸i, ch¼ng hay cã chuyÖn g×?",2,"T×m hiÓu quı ph¸i/timhieuquyphai","T×m hiÓu c¸c vŞ cao thñ cña quı ph¸i./timhieucaothu")
end
end

------------------------------

function timhieuvonghebonmon() 
Talk(3,"","Gièng ng­¬i <color=red>ph¸i Hoa S¬n<color>, vâ nghÖ ph¸t triÓn theo 2 ®­êng kh¸c nhau:","§­êng thø nhÊt lµ 'Hoa S¬n KiÕm T«ng', cã nh÷ng kü n¨ng chİnh nh­ sau: b¹ch hång qu¸n nhËt, kiÕm t«ng tæng quyÕt, d­ìng ng« kiÕm ph¸p, kim nh¹n hoµnh kh«ng, hy di kiÕm ph¸p, thiªn th©n ®¶o huyÒn, th­¬ng tïng nghªnh kh¸ch, huyÓn nh·n v©n yªn, ®o¹t mÖnh liªn.","§­êng thø hai lµ 'Hoa S¬n Khİ T«ng', cã nh÷ng kü n¨ng chİnh nh­ sau: thanh phong tèng sang, long nhiÔu quyªn, h¶i n¹p b¸ch xuyªn, long tuyÒn kiÕm khİ, khİ chÊn s¬n hµ, khİ qu¸n tr­êng hång, ma v©n kiÕm khİ, huyÔn nh·n v©n yªn, ph¸ch th¹ch ph¸ ngäc.")	
end

----------------------------
function timhieunhiemvu()
--if (GetTask(169) == 10) and (GetTask(169) < 20) then
if (GetTask(169) < 20) then
Describe("Tiªu Gi¸c: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 2560. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô lÊy n­íc pha trµ./phatra")  			
elseif (GetTask(169) >= 20) and  (GetTask(169) < 30) then
Describe("Tiªu Gi¸c: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 5120. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô Ngé kiÕm./ngokiem") 
elseif (GetTask(169) >= 30) and  (GetTask(169) < 40) then
Describe("Tiªu Gi¸c: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 7680. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô B¨ng Tµm Ngäc Lé Cao./ngoclocao") 
elseif (GetTask(169) >= 40) and  (GetTask(169) < 50) then
Describe("Tiªu Gi¸c: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 10240. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô V©n Tö Tr¾c Thu B×nh./tracthubinh") 
elseif (GetTask(169) >= 50) and  (GetTask(169) < 61) then
Describe("Tiªu Gi¸c: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 12800. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô VÜnh L¹c Phong V©n./vinhlacphongvan") 
elseif (GetTask(169) >= 61) and  (GetTask(169) < 71) then
Describe("Tiªu Gi¸c: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 15360. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô xuÊt s­./xuatsu") 
elseif (GetTask(169) == 71) and GetCurCamp() == 4 and GetCamp() == 4 or (GetTask(169) == 74) and GetCurCamp() == 4 and GetCamp() == 4 then
Describe("Tiªu Gi¸c: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 17920. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"Trïng ph¶n s­ m«n./trungphan") 
end;
end

function phatra() 
Talk(4,"","Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ t¨ng cÊp thµnh ®Ö tö phông trµ, häc ®­îc vâ c«ng KiÕm T«ng Tæng QuyÕt, Long NhiÔu Th©n <enter> TiÕp nhËn nhiÖm vô nµy ph¶i lµ ®Ö tö bæn m«n cÊp 10 trë lªn.","B­íc 1: t¹i chç V¹n T­ ViÔn (182,185) nhËn nhiÖm vô. NhËn ®­îc Gµo n­íc.","B­íc 2: t¹i chæ khe suèi ngo¹i cæng Nam ph¸i Hoa S¬n sö dông Gµo n­íc thu thËp. NhËn ®­îc Thanh LiÖt Kho¸ng Thñy.","B­íc 3: Giao n­íc Thanh LiÖt Kho¸ng Thñy cho V¹n T­ ViÔn.")	
end 

function ngokiem() 
Talk(6,"","Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ t¨ng cÊp thµnh T­ M¹c §Ö tö, häc ®­îc vâ c«ng D­ìng Ng« KiÕm Ph¸p, H¶i N¹p B¸ch Xuyªn <enter> TiÕp nhËn nhiÖm vô nµy ph¶i lµ ®Ö tö bæn m«n cÊp 20 trë lªn, ®ång thêi ®· hoµn thµnh nhiÖm vô lÊy n­íc pha trµ.","B­íc 1: t¹i chç Tõ Mé(188,180) nhËn nhiÖm vô. NhËn ®­îc Thïng n­íc.","B­íc 2: t¹i chæ th¸c n­íc phİa T©y B¾c ph¸i Hoa S¬n sö dông Thïng N­íc nhËn ®­îc Dung TuyÕt Chi Thñy, ®Õn T­ Qu¸ Nhai phİa §«ng ph¸i Hoa S¬n thu thËp Nhai Bİch Chi Th¹ch, Th­¬ng Tïng Ch©m DiÖp.","B­íc 3: t¹i chæ qu¶ng tr­êng trung t©m ph¸i Hoa S¬n t×m ®­îc §Ö tö luyÖn kiÕm Hoa S¬n(173,192).","B­íc 4: §Õn luyÖn Vâ §­êng ph¸i Hoa S¬n tû thİ víi §Ö Tö luyÖn kiÕm Hoa S¬n(184,186) vµ giµnh chiÕn th¾ng.","B­íc 5: Giao Dung TuyÕt Chi Thñy, Nhai Bİch Chi Th¹ch, Th­¬ng Tïng Ch©m DiÖp cho Tõ Mé.")	
end 

function ngoclocao() 
Talk(7,"","Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ t¨ng cÊp thµnh §Ö Tö ChÊp KiÕm, häc ®­îc vâ c«ng Kim Nh¹n Hoµnh Kh«ng, Long HuyÒn KiÕm Khİ <enter> TiÕp nhËn nhiÖm vô nµy ph¶i lµ ®Ö tö bæn m«n cÊp 30 trë lªn, ®ång thêi ®· hoµn thµnh nhiÖm vô Ngé KiÕm.","B­íc 1: §Õn chæ LËn V©n Mi(163,189) nhËn nhiÖm vô.","B­íc 2: §Õn Ph­îng T­êng t×m ¤ng chñ d­îc ®iÕm mua B¨ng Tµm Ngäc Lé Cao.","B­íc 3: §Õn KiÕm C¸c T©y B¾c tiªu diÖt c­êng ®¹o. NhËn ®­îc B¨ng T»m TuÕ.","B­íc 4: Trë vÒ Ph­îng T­êng, giao B¨ng T»m TuÕ cho ¤ng chñ d­îc ®iÕm.","B­íc 5: §èi tho¹i víi «ng chñ d­îc ®iÕm. NhËn ®­îc B¨ng Tµm Ngäc Lé Cao.","B­íc 6: Giao B¨ng Tµm Ngäc Lé Cao cho LËn V©n Mi.")	
end 

function tracthubinh() 
Talk(5,"","Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ t¨ng cÊp thµnh §an Thanh Sø, häc ®­îc vâ c«ng Hi Di KiÕm Ph¸p, Khİ ChÊn S¬n Hµ <enter> TiÕp nhËn nhiÖm vô nµy ph¶i lµ ®Ö tö bæn m«n cÊp 40 trë lªn, ®ång thêi ®· hoµn thµnh B¨ng Tµm Ngäc Lé Cao.","B­íc 1: §Õn chæ ThÈm MÆc(179,185) nhËn nhiÖm vô.","B­íc 2: §Õn Ph­îng T­êng t×m ¤ng chñ t¹p hãa t×m hiÓu th«ng tin vÒ dông cô ®¸nh cê.","B­íc 3: t×m ®­îc L­u Viªn Ngo¹i ë Ph­îng T­êng, hái han vÒ dông cô ®¸nh cê, tr¶ lêi ®óng 3 c©u hái sÏ nhËn ®­îc V©n Tö Tr¾c Thu B×nh.","B­íc 4: giao V©n Tö Tr¾c Thu B×nh cho ThÈm MÆc.")	
end 

function vinhlacphongvan() 
Talk(6,"","Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ t¨ng cÊp thµnh DŞch Thu Sø, häc ®­îc vâ c«ng Thiªn Kh«n §¶o HuyÒn, Khİ Qu¸n Tr­êng Hång <enter> TiÕp nhËn nhiÖm vô nµy ph¶i lµ ®Ö tö bæn m«n cÊp 50 trë lªn, ®ång thêi ®· hoµn thµnh V©n Tö Tr¾c Thu B×nh nhiÖm vô.","B­íc 1: §Õn chæ L©n H¹o Thiªn(170,191) nhËn nhiÖm vô.","B­íc 2: §Õn VÜnh L¹c TrÊn ®èi tho¹i víi Hoµng Thóc, §æng §¹i Thóc, Th­ N·i N·i, t×m hiÓu sù t×nh.","B­íc 3: §Õn Kim Quang §éng tiªu diÖt S¬n PhØ. NhËn ®­îc 3 s¶n vËt cña th«n d©n.","B­íc 4: Quay l¹i VÜnh L¹c TrÊn, giao s¶n vËt th«n d©n cho Hoµng Thóc, §æng §¹i Thóc, Th­ N·i N·i.","B­íc 5: trë vÒ Hoa S¬n phôc mÖnh LËn H¹o Thiªn.")	
end 

function xuatsu() 
Talk(11,"","Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ t¨ng cÊp thµnh Lôc NghÖ TruyÒn Nh©n, xuÊt s­ thuËn lîi<enter> TiÕp nhËn nhiÖm vô nµy ph¶i lµ ®Ö tö bæn m«n cÊp 50 trë lªn, ®ång thêi ®· hoµn thµnh nhiÖm vô VÜnh L¹c Phong V©n.","B­íc 1: t¹i chæ Ch­ëng m«n Nam Cung TuyÖt(177,191) nhËn nhiÖm vô. NhËn ®­îc cÈm nang.","B­íc 2: kiÓm tra cÈm nang. Nh©n ®­îc lêi nh¾n #thø 1.","B­íc 3: §Õn chæ Ên KiÕm Thu(171,182), nhËn nhiÖm vô lÊy B¹ch Hæ HuyÕt.","B­íc 4: §Õn TuyÕt Lang §éng tiªu diÖt §iÕu T×nh B¹ch Hæ. NhËn ®­îc B¹ch Hæ HuyÕt.","B­íc 5: giao B¹ch Hæ HuyÕt cho Ên KiÕm Thu.","B­íc 6: kiÓm tra cÈm nang. NhËn ®­îc lêi nh¾n #thø 2.","B­íc 7: §Õn thung lòng ph¸i Hoa S¬n tÜnh t©m.","B­íc 8: kiÓm tra cÈm nang. NhËn ®­îc lêi nh¾n #thø 3.","B­íc 9: §Õn KiÕm C¸c T©y Nam tiªu diÖt ph¶n ®å Khóc V« H×nh ph¸i Hoa S¬n.","B­íc 10: Trë vÒ ph¸i Hoa S¬n phôc mÖnh ch­ëng m«n Nam Cung TuyÖt.")	
end 

function trungphan() 
Talk(4,"","Trë l¹i Hoa S¬n. §¹i hiÖp t¨ng cÊp thµnh Th¸i Häc C¸t Chñ, häc ®­îc vâ c«ng HuyÒn Nh¹n V©n Yªn, Th­¬ng Tïng Nghªn Kh¸ch, Ma V©n KiÕm Khİ.","B­íc 1: Sau khi ®¹i hiÖp t¨ng ®Õn cÊp 60. §Õn chæ Ch­ëng M«n Nam Cung TuyÖt(177,191), xin trë vÒ ph¸i Hoa S¬n.","B­íc 2: N¹p 50 l­îng cã thÓ trë vÒ ph¸i Hoa S¬n.")	
end 

-----------------------------------
function timhieusotruongluyencong()
if (GetLevel() >=10) and (GetLevel() < 20) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 10 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: GÇn bªn bæn m«n, c¸c thµnh thŞ næi danh.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")  			
elseif (GetLevel() >=20) and (GetLevel() < 30) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 20 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: KiÕm C¸c Trung Nguyªn, KiÕm C¸c T©y Nam, KiÕm C¸c T©y B¾c, La Tiªu S¬n, Vò L¨ng S¬n, TÇn L¨ng.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=30) and (GetLevel() < 40) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 30 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: B¹ch V©n §éng, Thôc C­¬ng s¬n, thæ phØ ®éng, vµ Phôc Ng­u S¬n §éng, Kim Quang §éng.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=40) and (GetLevel() < 50) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 40 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Phong Nh·n §éng, §iÓm th­¬ng ®éng tÇng 1, ThÇn Tiªn ®éng, vµ Phôc Ng­u S¬n T©y, Kinh Hoµng §éng.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=50) and (GetLevel() < 60) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 50 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: H­ëng Thñy §éng, Thiªn TÇm Th¸p tÇng 1,2, vµ tİn t­íng Tù ®Şa ®¹o, ¸c B¸ ®Şa ®¹o.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=60) and (GetLevel() < 70) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 60 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Thiªn TÇm Th¸p tÇng 3, 108 La H¸n TrËn, vµ cÊm ®Şa mª cung, Hoµnh S¬n Ph¸i.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=70) and (GetLevel() < 80) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 70 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Tr­êng Giang Nguyªn §Çu, S¬n B¶o §éng, vµ §µo Hoa Nguyªn, D­îc V­¬ng ®éng tÇng 2, L©m Du Quan.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=80) and (GetLevel() < 90) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 80 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Sa m¹c §Şa BiÓu, Phi Thiªn §éng, Phï Dung §éng, D­¬ng Trung §éng, Cæ D­¬ng §éng, D­îc V­¬ng §éng tÇng 3, Tr­êng B¹ch S¬n C­íc.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=90) then
Describe("Tiªu Gi¸c: §èi víi hÖ <color=red>Thñy H¬n 90 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Sa m¹c s¬n ®éng tÇng 1,2,3, vµ Kháa Lang §éng, TiÕn Cóc §éng, Tr­êng B¹ch S¬n Nam Léc, Tr­êng B¹ch S¬n B¾c Léc.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
end;
end


---------------------------------------------
function timhieuquyphai()
Describe("Tiªu Gi¸c: Muèn t×m hiÓu c¸i g×?",5,"Khái nguyªn m«n ph¸i/khoinguyenmonphai","VŞ trİ ®Şa lı/vitridialy","§Şa vŞ giang hå/diavigiangho","§Æc s¾c m«n ph¸i/dacsacmonphai","Kh«ng hái n÷a!/khonghoinua")  			
end;



function khoinguyenmonphai()
Describe("Tiªu Gi¸c: LŞch sö ph¸i Hoa S¬n ®· rÊt l©u ®êi, t­¬ng truyÒn b¾t ®Çu tõ D­¬ng B¸ KiÒu thêi Xu©n Thu ®· cã ng­êi lªn ®Ønh Hoa S¬n dùng lÒu khæ häc. Gi÷a thêi tiÒn triÒu n¨m Hµm Th«ng, cã mét th­ sinh tªn lµ Tiªu Tö L¨ng, lµ kÕ nghiÖp cña ®¹i t­íng qu©n Bïi M©n, khi ®Õn ngao du Hoa S¬n ®· nhËn ®­îc sù trî gióp cña ®Ö tö D­¬ng ThŞ, vÒ sau c¸c cao nh©n trong thiªn h¹ Èn c­ t¹i Hoa S¬n, khiÕn cho vâ c«ng cã dŞp tô héi, t¹o nªn ph¸i Hoa S¬n vang danh thiªn h¹ ngµy nay víi vâ c«ng KiÕm Khİ kú diÖu.",4,"VŞ trİ ®Şa lı/vitridialy","§Şa vŞ giang hå/diavigiangho","§Æc s¾c m«n ph¸i/dacsacmonphai","Kh«ng hái n÷a!/khonghoinua") 			
end;

function vitridialy()
Describe("Tiªu Gi¸c: Hoa S¬n næi tiÕng lµ 'Tø nh¹c' trong 'ngò nh¹c', phİa B¾c gi¸p víi b×nh nguyªn VŞ Hµ b»ng ph¼ng vµ s«ng Hoµng Hµ, phİa Nam gi¸p TÇn LÜnh, trÊn gi÷ cöa T©y B¾c tiÕn vµo trung nguyªn. Hoa S¬n kh«ng chØ hïng vÜ hiÓm trë, mµ ®Şa thÕ nói non nguy nga ®å sé, tõ l©u ®· ®­îc mÖnh danh lµ 'Hoa S«n thiªn h¹ hiÓm', 'Kú hiÓm thiªn h¹ ®Ö nhÊt s¬n'.",4,"Khái nguyªn m«n ph¸i/khoinguyenmonphai","§Şa vŞ giang hå/diavigiangho","§Æc s¾c m«n ph¸i/dacsacmonphai","Kh«ng hái n÷a!/khonghoinua")  			
end;

function diavigiangho()
Describe("Tiªu Gi¸c: Ph¸i Hoa S¬n lµ ®¹i ph¸i vâ l©m næi tiÕng trung nguyªn, ®Ö tö th­êng ë Hoa S¬n ®äc s¸ch häc ch÷ ch¬i cê luyÖn kiÕm, rÊt hiÕm lo toan chuyÖn vâ l©m thÕ tô. Do nhiÒu n¨m tr­íc ch­ëng m«n Phông HÊp Nh­ t¹o ph¶n råi ®Õn Thiªn NhÉn Gi¸o, ph¸i Hoa S¬n bŞ ®· kİch m¹nh bÌn mai danh Èn tİch, kh«ng muèn mµng ®Õn viÖc trong vâ l©m. ThÕ nh­ng gÇn ®©y cã tin ®ån m¶nh b¶n ®å S¬n Hµ X· T¾c xuÊt hiÖn t¹i Hoa S«n, c¸c ph¸i giang hå rôc rŞch manh ®éng, muèn ®Õn Hoa S¬n kiÕm t×m, khi Êy giang hå dËy sãng, næi lªn mét trËn phong ba quyÕt liÖt. C¸c ch­ëng m«n ®êi tr­íc cña Hoa S¬n bÊt ®¾c dÜ ph¶i ph¸ tö quan ®Ó tho¸t th©n, l·nh ®¹o ®Ö tö Hoa S¬n ®èi phã víi cuéc phong v©n thiªn h¹ nµy.",4,"Khái nguyªn m«n ph¸i/khoinguyenmonphai","VŞ trİ ®Şa lı/vitridialy","§Æc s¾c m«n ph¸i/dacsacmonphai","Kh«ng hái n÷a!/khonghoinua")   			
end;

function dacsacmonphai()
Describe("Tiªu Gi¸c: §Ö tö Hoa S¬n chia thµnh tu th©n h÷u vi vµ tu t©m v« vi, kiÕm t«ng nghiªn cøu chiªu thøc tinh x¶o kú diÖu, v¹n ph¸p tinh th«ng; khİ t«ng nghiªn cøu cÇu ch©n t¹i t©m, nhÊt ph¸p th«ng v¹n ph¸p. §Ö tö Hoa S¬n rÊt hiÕm khi xuèng nói, chØ khi vµo tu vi vâ c«ng ®¹t ®Õn c¶nh giíi nhÊt ®Şnh míi xuèng nói ®Ó rÌn luyÖn tr¶i nghiÖm, ®ét ph¸ ch­íng ng¹i, mong cã thÓ khiÕn tu vi cña b¶n th©n ®¹t ®Õn tÇm cao míi, lµ mét ph­¬ng ph¸p ®Ó t×m thÊy chİnh m×nh.",4,"Khái nguyªn m«n ph¸i/khoinguyenmonphai","VŞ trİ ®Şa lı/vitridialy","§Şa vŞ giang hå/diavigiangho","Kh«ng hái n÷a!/khonghoinua") 			
end;

function khonghoinua()
end;


------------------------------------------
function timhieucaothu()
Describe("Tiªu Gi¸c: Ng­¬i muèn t×m ai?",13,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;



function namcungtuyet()
Describe("VŞ trİ Chİnh Khİ §­êng Täa ®é: 177,191 C«ng dông: nhiÖm vô <enter> s­ thóc cña Phông HÊp Nh­, nguyªn ch­ëng m«n ph¸i Hoa S¬n, còng lµ ch­ëng m«n ®êi tr­íc cña ph¸i Hoa S¬n, trong cuéc ®¹i häa m«n ph¸i do Phông HÊp Nh­ lµm ph¶n, do bÕ quan nªn kh«ng bŞ ¶nh h­ëng nhiÒu. Vµi n¨m tr­íc, Nam Cung TuyÖt ®ét nhiªn xuÊt quan, g¸nh v¸c ®¹i cuéc, l·nh ®¹o m«n ®Ö cßn l¹i cña Hoa S¬n cïng nhau vùc dËy danh tiÕng cña Hoa S¬n ph¸i. Sau khi xuÊt quan, nghe nãi vâ c«ng cña Nam Cung TuyÖt ®· ®¹t ®Õn møc kh«ng thÓ ngê tíi.",12,"BiÕt råi!/bietroi","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu") 			
end;

function tumo()
Describe("VŞ trİ Ngäc N÷ §iÖn Täa ®é: 188,180 C«ng dông: nhiÖm vô <enter> S­ Phô Khİ T«ng ph¸i Hoa S¬n, KiÕm ph¸p th©m hËu, tinh th«ng lôc nghÖ, cã phong th¸i nho sÜ, «n hßa lÔ ®é, th­êng d¹y cho d®Ö tö trong ph¸i tu luyÖn kiÕm thuËt, nghiªn cøu häc thuËt triÕt lı, ®­îc chóng ®Ö tö v« cïng t«n kİnh.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")			
end;

function lanhaothien()
Describe("VŞ trİ Liªn Hoa §iÖn Täa ®é: 170,191 C«ng dông: nhiÖm vô <enter> S­ Phô KiÕm T«ng ph¸i Hoa S«n, tİnh t×nh nghiªm nghŞ c­¬ng trùc, İt khi c­êi nãi, «m hËn kÎ ph¶n gi¸o Phông HÊp Nh­, ngµy ®ªm t×m c¸ch b¸o thï Thiªn NhÉn Gi¸o.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function vantuvien()
Describe("VŞ trİ DËt Mİnh Hiªn Täa ®é: 182,185 C«ng dông: nhiÖm vô <enter> §å ®Ö cña Tõ Mé, lín lªn ë Hoa S¬n, c­êng tr¸ng linh ho¹t, tİnh t×nh còng «n hßa, lÔ ®é gièng s­ phô, rÊt quı mÕn S­ ®Ö T« Phãng.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function tophong()
Describe("VŞ trİ T­ Qu¸ Nhai Täa ®é: 195,197 C«ng dông: nhiÖm vô <enter> S­ ®Ö cña Van T­ ViÔn, tİnh t×nh ngang ng­îc ng¹o m¹n, b¹n th©n cña h¾n ®· chÕt trong cuéc ph¶n gi¸o cña Phông HÊp Nh­, nªn rÊt o¸n hËn Phông HÊp Nh­ vµ Thiªn NhÉn Gi¸o, nªn th­êng xuyªn theo dâi t×nh t×nh biÕn ®éng cña Thiªn NhÉn Gi¸o, hy v«ng sím ngµy b¸o thï Thiªn NhÉn Gi¸o.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function lanvanmi()
Describe("VŞ trİ L¹c Nh¹n C¸c Täa ®é: 163,189 C«ng dông: nhiÖm vô <enter> con g¸i cña LËn H¹o Thiªn, th«ng minh l­¬ng thiÖn, cïng lín lªn víi V¹n T­ ViÔn vµ T« Phãng, nªn quan hÖ víi 2 ng­êi nµy rÊt th©n thiÕt.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function thammac()
Describe("VŞ trİ §iÓm M¹c Hiªn Täa ®é: 179,185 C«ng dông: nhiÖm vô <enter> ®å ®Ö cña LËn H¹o Thiªn, tõ nhá ®· rÊt th«ng minh, hiÓu biÕt s©u réng. Vµo n¨m Phông HÊp Nh­ ph¶n gi¸o khi Êy tuæi cßn nhá, ®· bŞ kİch ®éng lín nªn tİnh t×nh nhót nh¸t, rÊt sî xuèng nói.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function ankiemthu()
Describe("VŞ trİ §iÓm MÆc Hiªn Täa ®é: 179,185 C«ng dông: nhiÖm vô <enter> s­ phô ®óc kiÕm ph¸i Hoa S¬n, kü n¨ng ®øc kiÕm cùc kú giái.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function tieungoc()
Describe("Täa ®é 186,191 C«ng dông: nhiÖm vô <enter> tİnh t×nh tho¶i m¸i, thİch uèng r­îu",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function macphongnhu()
Describe("Täa ®é 160,190 C«ng dông: giao dŞch trang bŞ.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","Phô Dung/phudung","TiÓu Viªn Tö/tieuvientu")
end;

function phudung()
Describe("Täa ®é: 179,198 C«ng dông: giao dŞch d­îc phÈm.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","TiÓu Viªn Tö/tieuvientu")
end;

function tieuvientu()
Describe("Täa ®é: 166,184 C«ng dông: giao dŞch binh khİ.",12,"BiÕt råi!/bietroi","Ch­ëng m«n Nam Cung TuyÖt/namcungtuyet","Khİ T«ng S­ Phô Tõ Mé/tumo","KiÕm T«ng S­ Phô LËn H¹o Thiªn/lanhaothien","V¹n T­ ViÔn/vantuvien","T« Phãng/tophong","LËn V©n Mi/lanvanmi","ThÈm MÆc/thammac","Ên KiÕm Thu/ankiemthu","Tiªu Ngäc/tieungoc","M¹c Phong Nhø/macphongnhu","Phô Dung/phudung")
end;

function bietroi()
end;
