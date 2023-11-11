
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if GetLastFactionNumber() == 12 then
	Describe("H­íng Chi Nam: Hãa ra lµ s­ ®Ö, cÇn gióp ®ì g×?",5,"T×m hiÓu m«n ph¸i/timhieuquyphai","T×m hiÓu ®ång m«n/timhieucaothu","T×m hiÓu nhiÖm vô/timhieunhiemvu","T×m hiÓu së tr­êng luyÖn c«ng/timhieusotruongluyencong","T×m hiÓu vâ nghÖ bæn m«n/timhieuvonghebonmon")
	else
	Describe("H­íng Chi Nam: §¹i hiÖp ®Õn tÖ ph¸i, ch¼ng hay cã chuyÖn g×?",2,"T×m hiÓu quı ph¸i/timhieuquyphai","T×m hiÓu c¸c vŞ cao thñ cña quı ph¸i./timhieucaothu")
end
end

------------------------------

function timhieuvonghebonmon() 
	Talk(3,"","Gièng ng­¬i <color=red>ph¸i Tiªu Dao<color>, vâ nghÖ ph¸t triÓn theo 2 ®­êng kh¸c nhau:","Thµnh th¹o ©m luËt vâ nghÖ, vâ c«ng lÊy CÇm KiÕm lµm vò khİ l­ìi ®ao, kh«ng bµn mµ hîp ©m luËt, chiªu thøc nho nh· l¹i kh«ng mÊt linh ®éng phiªu dËt, biÕn ¶o khã l­êng, cã thÓ c«ng cã thÓ thñ.")	
end

----------------------------
function timhieunhiemvu()
--if (GetTask(169) == 12) and (GetTask(169) < 20) then
if (GetTask(169) < 20) then
Describe("H­íng Chi Nam: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 2560. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô lÊy n­íc pha trµ./phatra")  			
elseif (GetTask(169) >= 20) and  (GetTask(169) < 30) then
Describe("H­íng Chi Nam: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 5120. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô Ngé kiÕm./ngokiem") 
elseif (GetTask(169) >= 30) and  (GetTask(169) < 40) then
Describe("H­íng Chi Nam: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 7680. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô B¨ng Tµm Ngäc Lé Cao./ngoclocao") 
elseif (GetTask(169) >= 40) and  (GetTask(169) < 50) then
Describe("H­íng Chi Nam: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 10240. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô V©n Tö Tr¾c Thu B×nh./tracthubinh") 
elseif (GetTask(169) >= 50) and  (GetTask(169) < 61) then
Describe("H­íng Chi Nam: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 12800. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô VÜnh L¹c Phong V©n./vinhlacphongvan") 
elseif (GetTask(169) >= 61) and  (GetTask(169) < 71) then
Describe("H­íng Chi Nam: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 15360. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"NhiÖm vô xuÊt s­./xuatsu") 
elseif (GetTask(169) == 71) and GetCurCamp() == 4 and GetCamp() == 4 or (GetTask(169) == 74) and GetCurCamp() == 4 and GetCamp() == 4 then
Describe("H­íng Chi Nam: Muèn gia nhËp m«n ph¸i häc vâ c«ng, cã thÓ th«ng qua viÖc hoµn thµnh nhiÖm vô nhËp m«n ®Ó thùc hiÖn. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô 5 m«n ph¸i lµ cã thÓ häc ®­îc vâ c«ng, nhËn ®­îc cÊp hµm, sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­ dÔ dµng. §¸nh dÊu nhiÖm vô cña ng­¬i lµ: 17920. TiÕp theo nh­ng viÖc ng­¬i cã thÓ lµm lµ: ",1,"Trïng ph¶n s­ m«n./trungphan") 
end;
end

-----------------------------------
function timhieusotruongluyencong()
if (GetLevel() >=10) and (GetLevel() < 20) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 10 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: GÇn bªn bæn m«n, c¸c thµnh thŞ næi danh.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")  			
elseif (GetLevel() >=20) and (GetLevel() < 30) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 20 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: KiÕm C¸c Trung Nguyªn, KiÕm C¸c T©y Nam, KiÕm C¸c T©y B¾c, La Tiªu S¬n, Vò L¨ng S¬n, TÇn L¨ng.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=30) and (GetLevel() < 40) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 30 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: B¹ch V©n §éng, Thôc C­¬ng s¬n, thæ phØ ®éng, vµ Phôc Ng­u S¬n §éng, Kim Quang §éng.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=40) and (GetLevel() < 50) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 40 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Phong Nh·n §éng, §iÓm th­¬ng ®éng tÇng 1, ThÇn Tiªn ®éng, vµ Phôc Ng­u S¬n T©y, Kinh Hoµng §éng.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=50) and (GetLevel() < 60) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 50 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: H­ëng Thñy §éng, Thiªn TÇm Th¸p tÇng 1,2, vµ tİn t­íng Tù ®Şa ®¹o, ¸c B¸ ®Şa ®¹o.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=60) and (GetLevel() < 70) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 60 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Thiªn TÇm Th¸p tÇng 3, 108 La H¸n TrËn, vµ cÊm ®Şa mª cung, Hoµnh S¬n Ph¸i.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=70) and (GetLevel() < 80) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 70 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Tr­êng Giang Nguyªn §Çu, S¬n B¶o §éng, vµ §µo Hoa Nguyªn, D­îc V­¬ng ®éng tÇng 2, L©m Du Quan.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=80) and (GetLevel() < 90) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 80 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Sa m¹c §Şa BiÓu, Phi Thiªn §éng, Phï Dung §éng, D­¬ng Trung §éng, Cæ D­¬ng §éng, D­îc V­¬ng §éng tÇng 3, Tr­êng B¹ch S¬n C­íc.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
elseif (GetLevel() >=90) then
Describe("H­íng Chi Nam: §èi víi hÖ <color=red>Thñy H¬n 90 cÊp <color> nh­ ng­¬i th× ®Şa ®iÓm luyÖn c«ng tèt nhÊt lµ: Sa m¹c s¬n ®éng tÇng 1,2,3, vµ Kháa Lang §éng, TiÕn Cóc §éng, Tr­êng B¹ch S¬n Nam Léc, Tr­êng B¹ch S¬n B¾c Léc.",1,"KÕt thóc ®èi tho¹i!/khonghoinua")
end;
end


---------------------------------------------
function timhieuquyphai()
Describe("H­íng Chi Nam: Muèn t×m hiÓu c¸i g×?",5,"Khái nguyªn m«n ph¸i/khoinguyenmonphai","VŞ trİ ®Şa lı/vitridialy","§Şa vŞ giang hå/diavigiangho","§Æc s¾c m«n ph¸i/dacsacmonphai","Kh«ng hái n÷a!/khonghoinua")  			
end;



function khoinguyenmonphai()
Describe("H­íng Chi Nam: Muén thêi nhµ §­êng kú, nh· sÜ Êm bay khanh t¹i Giang Hoµi mét vïng th­êng xuyªn tËp yÕn x­íng ho¹. Mçi khi gÆp nh· tËp, Th­¬ng rãt l­u hµnh, truyÒn v× ca tông, chóng v¨n nh©n mé danh mµ tíi, tô c­ phô kiÖn, lÊy v¨n héi b¹n, còng nghiªn tËp vâ häc. Sau nªn phª v¨n ng­êi nhµ th¬ dÇn dÇn tù thµnh mét ph¸i, s¸ng chÕ lÊy CÇm KiÕm lµm chñ, kh«ng bµn mµ hîp ©m luËt ®Æc biÖt chiªu thøc, khai s¬n lËp t«ng, ®èi ngo¹i tù x­ng Tiªu Dao ph¸i.",4,"VŞ trİ ®Şa lı/vitridialy","§Şa vŞ giang hå/diavigiangho","§Æc s¾c m«n ph¸i/dacsacmonphai","Kh«ng hái n÷a!/khonghoinua") 			
end;

function vitridialy()
Describe("H­íng Chi Nam: Hoa S¬n næi tiÕng lµ 'Tø nh¹c' trong 'ngò nh¹c', phİa B¾c gi¸p víi b×nh nguyªn VŞ Hµ b»ng ph¼ng vµ s«ng Hoµng Hµ, phİa Nam gi¸p TÇn LÜnh, trÊn gi÷ cöa T©y B¾c tiÕn vµo trung nguyªn. Hoa S¬n kh«ng chØ hïng vÜ hiÓm trë, mµ ®Şa thÕ nói non nguy nga ®å sé, tõ l©u ®· ®­îc mÖnh danh lµ 'Hoa S«n thiªn h¹ hiÓm', 'Kú hiÓm thiªn h¹ ®Ö nhÊt s¬n'.",4,"Khái nguyªn m«n ph¸i/khoinguyenmonphai","§Şa vŞ giang hå/diavigiangho","§Æc s¾c m«n ph¸i/dacsacmonphai","Kh«ng hái n÷a!/khonghoinua")  			
end;

function khonghoinua()
end;



function bietroi()
end;
