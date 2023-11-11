--À¥ÂØÅÉ°ïÖúNPC
-- ¼Ç×¡ĞèÒª¼ÓÈëGetTask(9) == 127µÄÈİ´í£¨ÉĞÎ´¼Ó£©
-- By: Dan_Deng(2003-12-01)

function main(sel)
	UTask_kl = GetTask(9)
	player_faction = GetFaction()
	if (player_faction == "kunlun") then		-- ±¾ÃÅµÜ×Ó
		RestoreLife()		-- ±¾ÃÅÃâ·ÑÖÎÁÆ
		RestoreMana()
		RestoreStamina()
		Say("L·o phu ®· ë bæn m«n mÊy m­¬i n¨m, chøng kiÕn bao nhiªu sù thay ®æi, biÕt râ ®iÒu nªn nãi sÏ nãi, ®iÒu g× kh«ng nãi ®­îc th× ®õng bao giê truy t×m c¨n céi",4,"T×m hiÓu ®iÓn cè bæn m«n/faction","T×m hiÓu c¸c vŞ t«n tr­ëng/member","T×m hiÓu nhiÖm vô /task_get","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 70*256) then				-- ±¾ÃÅ³öÊ¦
		Say("HiÕm khi gÆp ®­îc nh÷ng ®ång m«n ®· thµnh nghÖ quay l¹i n¬i ®©y. Nh×n c¸c ng­¬i nhËp m«n, råi l¹i thÊy c¸c ng­¬i thµnh nghÖ hµnh tÈu giang hå, kh«ng thÓ kh«ng c¶m thÊy thêi gian tr«i nhanh nh­ tªn",4,"¤n l¹i chuyÖn n¨m x­a bæn m«n/faction","Nh×n l¹i ®¹o h÷u n¨m x­a/member","Ta cßn cã thÓ gióp g× kh«ng/task_get","Kh«ng hái n÷a!/nothing")
	elseif (player_faction ~= "") then			-- ·Ç±¾ÃÅ³öÊ¦¡¢ÆäËüÃÅÅÉ£¨ÃÅÅÉ²»Îª¿Õ¼´Ö¸·ÇĞÂÊÖ£©
		Say("Hoan nghªnh ®· ®Õn C«n L«n ph¸i, ®­êng xa vÊt v¶ ®Õn ®©y, kh«ng biÕt cã ®iÒu g× chØ gi¸o?",3,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c vŞ ®¹o tr­ëng/member","Kh«ng hái n÷a!/nothing")
	else													-- ĞÂÊÖ
		Say("C«n L«n ph¸i §¹o ph¸p tæ tiªn, rÊt hoan nghªnh quı vŞ tham quan häc nghÖ ",4,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c vŞ ®¹o tr­ëng/member","T×m hiÓu ®iÒu kiÖn nhËp m«n/task_get","Kh«ng hái n÷a!/nothing")
	end
end

----------------- ÃÅÅÉ½éÉÜ²¿·İ ----------------------------
function faction()
	Say("VËy th× ng­¬i muèn ®­îc giíi thiÖu ph­¬ng diÖn nµo cña bæn m«n? ",5,"Khëi nguyªn m«n ph¸i/F1","VŞ trİ ®Şa lı /F2","§Şa vŞ giang hå /F3","§Æc s¾c m«n ph¸i/F4","Kh«ng hái n÷a!/nothing")
end

function F1()
	Say("C«n L«n ph¸i ë tËn T©y Vùc, tuy ®­îc s¸ng lËp ®· l©u nh­ng sau khi S­ Tæ khai ph¸i qua ®êi, trong ph¸i kh«ng cã ai lµ xuÊt chóng. M·i cho ®Õn h¬n tr¨m n¨m tr­íc, C«n Lu©n ph¸i xuÊt hiÖn mét vŞ kú nh©n. Ng­êi nµy kh«ng nh÷ng t¹o ®­îc uy danh lõng lÉy trong vâ l©m Trung Nguyªn mµ cßn gióp tªn tuæi cña C«n Lu©n b¾t ®Çu lan réng kh¾p vâ l©m.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F2()
	Say("C«n L«n S¬n to¹ l¹c t¹i T©n C­¬ng, giao giíi cña Thanh H¶i, l¹i cã ®­îc ®Şa vŞ huy hoµng cña 'V¹n S¬n Chi Tæ', ®­îc xem lµ 'Trung Quèc ®Ö nhÊt s¬n'",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F3()
	Say("Bæn ph¸i tuy xa tËn T©y Vùc, nh­ng vÉn hy väng cã thÓ ®¹t ®­îc ®Şa vŞ t­¬ng xøng t¹i Trung Nguyªn, hiÖn t¹i ®· dÇn b×nh ®¼ng ®Şa vŞ víi ThiÕu L©m, Vâ §ang vµ Nga Mi",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F4()
	Say("Bæn ph¸i ®Ö tö cã c¶ nam n÷,tİn phôc ®¹o gi¸o. §Ö tö ®­îc phĞp h«n phèi, kh«ng cÊm ¨n mÆn. §Æc ®iÓm lín nhÊt cña bæn ph¸i cã 2 ®iÒu: 1 lµ d· t©m, 2 lµ bÒ ngoµi cã vÎ chİnh nh©n qu©n tö, nh­ng bªn trong cùc kú nham hiÓm x¶o tr¸, néi bé ®ång m«n còng kh«ng tİn nhiÖm lÉn nhau, lo¹i trõ lÉn nhau, tranh quyÒn t­íc vŞ. Ng­¬it¹i bæn m«n nãi n¨ng ph¶i lu«n cÈn thËn, bÊt cø chuyÖn g× còng kh«ng nªn nhiÒu lêi",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ³ÉÔ±½éÉÜ²¿·İ ----------------------------
function member()
	Say("VËy ng­¬i muèn ®­îc giíi thiÖu vŞ nµo cña bæn m«n?",11,"Ch­ëng m«n TuyÒn C¬ Tö /Mxuan","Thanh Liªn Tö /Mqing","Ngäc Hoµnh Tö /Myu","Chu KhuyÕt/Mzhu","§ång TŞch Nhan/Mtong","TiÓu Hµn/Mxiao","Th¸n Tøc L·o Nh©n/Mtan","TrÇn T©m/Mxin","TrÇn Duyªn/Myuan","TrÇn NiÖm/Mnian","Kh«ng hái n÷a!/nothing")
end

function Mxuan()
	Say("Ch­ëng m«n TuyÒn C¬ Tö   VŞ trİ: Chİnh ®iÖn   Täa ®é: 190,196<enter> §Çy r¾c d· t©m, ngoµi mÆt ra vÎ qu©n tö nhòn nhÆn, thùc tÕ t©m hiÓm ®éc ¸c, ch­a ®¹t môc ®İch kh«ng tõ mäi thñ ®o¹n. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mqing()
	Say("Thanh Liªn Tö   VŞ trİ: Tö Vi ®iÖn   Täa ®é: 186/199<enter>Lµ ng­êi İch kû, môc ®İch lín nhÊt muèn lµm ch­ëng m«n C«n L«n Ph¸i, v× ®¹t môc ®İch, kh«ng tiÕc lîi dông lÉn nhau víi Ngäc Hoµnh Tö ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Myu()
	Say("Ngäc Hoµnh Tö  VŞ trİ: Thiªn Vi ®iÖn   Täa ®é: 195/195<enter>Lµ ng­êi cã lßng ®è kş cao, bao gåm c¶ ®Ö tö cña m×nh. V× muèn ®¹t ®­îc chøc ch­ëng m«n cña C«n L«n Ph¸i nªn lîi dông  lÉn nhau víi Thanh Liªn Tö, thùc chÊt ai còng mang d· t©m.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mzhu()
	Say("Chu KhuyÕt    VŞ trİ:  Bªn trong §¹i m«n        Täa ®é: 198/200<enter>§¹i §Ö Tö cña TuyÒn C¬ Tö, tİnh t×nh l·nh ®¹m, nham hiÓm ®è kş. BŞ B¹ch Doanh Doanh cña Ngò §éc gi¸o lîi dông",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mtong()
	Say("§ång TŞch Nhan   VŞ trİ: hËu Hoa viªn   Täa ®é: 178,195<enter> con g¸i TuyÒn C¬ Tö, ng­êi trong tr¾ng ng©y th¬, t©m tİnh l­¬ng thiÖn",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mxiao()
	Say("TiÓu Hµn   VŞ trİ: TŞch Nhan ®×nh   Täa ®é: 184,196<enter> a hoµn cña §ång TŞch Nhan, lµ mét c« g¸i nhá nh¾n, th«ng minh lanh lîi. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mtan()
	Say("Th¸n Tøc L·o Nh©n   VŞ trİ: phßng §Ö tö   Täa ®é: 191,201<enter> Ch­ëng m«n cña ®êi tr­íc, s­ phô cña 3 ng­êi TuyÒn C¬ Tö, Thanh Liªn Tö vµ Ngäc Hoµnh Tö. Ngµy tr­íc lóc ®­¬ng nhiÖm Ch­ëng m«n, b¶n tİnh tµn nhÉn, ®èi ®·i m«n ®å th« b¹o v« ¬n, khiÕn 3 ®å ®Ö uÊt hËn r¾p kÕ h·m h¹i ra n«ng næi nµy. Nh­ng v× 3 ®å ®Ö nghi sî lÉn nhau, nªn kh«ng d¸m h¹i chÕt l·o",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mxin()
	Say("TrÇn T©m   VŞ trİ: Qu·ng tr­êng   Täa ®é: 189,197   Phô tr¸ch: Giao dŞch binh khİ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Myuan()
	Say("TrÇn Duyªn   VŞ trİ: Qu·ng tr­êng   Täa ®é: 193,195   Phô tr¸ch: Giao dŞch trang bŞ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mnian()
	Say("TrÇn NiÖm   VŞ trİ: Qu·ng tr­êng   Täa ®é: 193,197   Phô tr¸ch: Giao dŞch D­îc phÈm",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ÈÎÎñ½éÉÜ²¿·İ ----------------------------
function task_get()
	UTask_kl = GetTask(9)
	if (UTask_kl < 10*256) then	-- Î´ÈëÃÅ
		Say("Ng­¬i hiÖn ch­a nhËp m«n, muèn nhËp m«n ®Õn c¸c T©n Thñ th«n gÆp §Ö tö tiÕp dÉn cña bæn ph¸i lµ ®­îc",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_enroll","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 10*256) and (UTask_kl < 20*256) then
		Say("Ng­¬i hiÖn ®ang tiÕn hµnh lµ nhiÖm vô h¸i thuèc.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L10","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 20*256) and (UTask_kl < 30*256) then
		Say("Ng­¬i hiÖn ®ang tiÕn hµnh lµ nhiÖm vô x­¬ng ®Çu con l¹c ®µ.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L20","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 30*256) and (UTask_kl < 40*256) then
		Say("Ng­¬i hiÖn ®ang tiÕn hµnh lµ nhiÖm vô d¹ minh ch©u.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L30","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 40*256) and (UTask_kl < 50*256) then
		Say("Ng­¬i hiÖn ®ang tiÕn hµnh lµ nhiÖm vô huyÕt hån thÇn kiÕm.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L40","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 50*256) and (UTask_kl < 60*256) then
		Say("Ng­¬i hiÖn ®ang tiÕn hµnh lµ nhiÖm vô huyÖt qu¸i nh©n.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L50","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 60*256) and (UTask_kl < 70*256) then
		Say("Ng­¬i hiÖn ®ang tiÕn hµnh lµ nhiÖm vô ngò s¾c th¹ch.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L60","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_kl >= 70*256) and (UTask_kl < 80*256) then
		Say("Ng­¬i hiÖn ®ang tiÕn hµnh lµ nhiÖm vô trïng ph¶n s­ m«n.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_return","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	else
		Say("HiÖn t¹i ng­¬i cã thÓ tù do ra vµo m«n ph¸i, t¹m thêi ch­a cã nhiÖm vô míi!",3,"T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	end
end

function T_all()
	Say("Muèn t×m hiÓu nhiÖm vô g×?",10,"NhiÖm vô nhËp m«n/T_enroll","NhiÖm vô h¸i thuèc/T_L10","NhiÖm vô x­¬ng ®Çu con l¹c ®µ/T_L20","NhiÖm vô d¹ minh ch©u/T_L30","NhiÖm vô b¨ng huyÖt/T_L40","NhiÖm vô huyÕt hån thÇn kiÕm/T_L50","NhiÖm vô ngò s¾c th¹ch/T_L60","NhiÖm vô trïng ph¶n s­ m«n/T_return","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Muèn nhËp m«n häc nghÖ, chØ vÇn thuéc hÖ Thæ, ®¼ng cÊp ®Õn 10, ch­a gia nhËp m«n ph¸i nµo. §Õn ®èi thaäi víi ®Ö tö bæn m«n ë c¸c T©n thñ th«n lµ ®­îc. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh 5 nhiÖm vô cña m«n ph¸i, sÏ häc ®­îc vâ c«ng, ®­îc phong danh hiÖu. Hoµn thµnh nhiÖm vô xuÊt s­ th× cã thÓ xuÊt s­ ")
end

function T_L10()
	Talk(4,"t_all","Sau khi nhËp m«n vµ ®¼ng cÊp ®· ®¹t ®Õn 10, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô h¸i thuèc. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Phông KiÕm §Ö tö, häc ®­îc vâ c«ng C«n L«n §ao ph¸p, C«n L«n KiÕm ph¸p, Thóc Ph­îc Chó, Thanh Phong phï ","B­íc 1: §Õn TŞch Nhan ®×nh gÆp TiÓu Hµn, tiÕp nhËn nhiÖm vô. §Õn D­îc V­¬ng cèc h¸i ®ñ 5 lo¹i Tö Môc Tóc, §Şa CÈm Th¶o, ThiÕn Th¶o, Hæ NhÜ th¶o vµ Linh Chi","B­íc 2: §Õn D­îc V­¬ng Cèc ®¸nh qu¸i, sÏ lÊy ®ñ d­îc liÖu","B­íc 3: Mang 5 lo¹i d­îc liÖu vÒ giao cho TiÓu Hµn, hoµn thµnh nhiÖm vô.")
end

function T_L20()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm vô h¸i thuèc vµ ®¼ng cÊp ®¹t ®Õn 20, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô X­¬ng ®Çu L¹c ®µ. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Tö Vi Hé Ph¸p, häc ®­îc vâ c«ng Ki B¸n Phï ","B­íc 1: §Õn tr­íc phßng §Ö tö gÆp Th¸n Tøc L·o Nh©n, tiÕp nhËn nhiÖm vô, ®i lÊy vÒ X­¬ng ®Çu L¹c ®µ.","B­íc 2: §Õn tÇng 1 D­îc V­¬ng ®éng, ®¸nh b¹i Thæ phØ, lÊy ®­îc X­¬ng ®Çu L¹c ®µ.","B­íc 3: Trë vÒ phßng §Ö tö, giao X­¬ng ®Çu L¹c ®µ cho Th¸n Tøc L·o Nh©n, hoµn thµnh nhiÖm vô.")
end

function T_L30()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm X­¬ng ®Çu L¹c ®µ vµ ®¼ng cÊp ®¹t ®Õn 30, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô D¹ Minh Ch©u. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Th¸i Vi Hé ph¸p, häc ®­îc vâ c«ng: NhÊt Khİ Tam Thanh, B¾c Minh §¸o H¶i, Thiªn TÕ TÊn L«i, Thiªn Thanh §Şa Träc","B­íc 1: §Õn ®¹i m«n gÆp Chu KhuyÕt, tiÕp nhËn nhiÖm vô. §Õn D­îc V­¬ng cèc, vµo TuyÕt B¸o ®éng t×m D¹ Minh Ch©u.","B­íc 2: §Õn tÇng 1 TuyÕt B¸o ®éng, ®¸nh b¹i TuyÕt B¸o, lÊy ®­îc 3 viªn D¹ Minh Ch©u","B­íc 3: Trë vÒ C«n L«n ph¸i, giao 3 viªn D¹ Minh Ch©u cho Chu KhuyÕt, hoµn thµnh nhiÖm vô.")
end

function T_L40()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm D¹ Minh Ch©u vµ ®¼ng cÊp ®¹t ®Õn 40, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô HuyÕt Hån ThÇn KiÕm. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Thiªn Vi Hé ph¸p, häc ®­îc vâ c«ng Khi Hµn Ng¹o TuyÕt, Khİ T©m phï ","B­íc 1: §Õn Tö Vi ®iÖn gÆp Thanh Liªn Tö, tiÕp nhËn nhiÖm vô, ®Õn KiÕn Tİnh phong t×m HuyÕt Hån ThÇn KiÕm.","B­íc 2: §Õn KiÕn Tİnh phong s¬n ®éng ®¸nh b¹i s¬n tÆc TiÒu ®Çu môc vµ s¬n tÆc ®Çu lÜnh, lÊy ®­îc ch×a khãa më b¶o r­¬ng lÊy HuyÕt Hån ThÇn KiÕm","B­íc 3: Trë vÒ Tö Vi ®iÖn, giao HuyÕt Hån ThÇn KiÕm cho Thanh Liªn Tö, hoµn thµnh nhiÖm vô.")
end

function T_L50()
	Talk(5,"t_all","Sau khi hoµn thµnh nhiÖm vô HuyÕt Hån ThÇn KiÕm vµ ®¼ng cÊp ®¹t ®Õn 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô b¨ng huyÖt Qu¸i nh©n. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Thô Phï Thiªn T­íng, häc ®­îc vâ c«ng Cuång Phong S©u §iÖn, Mª Tung ¶o ¶nh","B­íc 1: §Õn Thiªn Vi ®iÖn gÆp Ngäc Hoµnh Tö, tiÕp nhËn nhiÖm vô, ®Õn B¨ng lao thu phôc Qu¸i nh©n.","B­íc 2: §Õn B¨ng huyÖt ®éng, ®¸nh b¹i 5 tªn TuyÕt Qu¸i, t×m thÊy B¨ng lao","B­íc 3: §¸nh b¹i Qu¸i nh©n trong B¨ng lao, lÊy ®­îc 1 nóa tãc","B­íc 4: Trë vÒ Thiªn Vi ®iÖn, gÆp Ngäc Hoµnh Tö phôc mÖnh, hoµn thµnh nhiÖm vô.")
end

function T_L60()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô Qu¸i nh©n vµ ®¼ng cÊp ®¹t ®Õn 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Ngò S¾c th¹ch. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Tiªn Phï Ch©n Qu©n, thuËn lîi xuÊt s­.","B­íc 1: §Õn Chİnh ®iÖn gÆp Ch­ëng m«n TuyÒn C¬ Tö, tiÕp nhËn nhiÖm vô, ®i t×m Ngò S¾c th¹ch.","B­íc 2: §Õn Hoµng Hµ Nguyªn ®Çu, gÆp1 l·o giµ, biÕt ®­îc Ngò S¾c th¹ch ®­îc giÊu trong L­u Tiªn ®éng, cÇn t×m 5 chiÕc 'Thiªn táa'","B­íc 3: Vµo L­u Tiªn ®éng, t¹i mçi tÇng ®¸nh b¹i 1 tªn gi÷ ch×a khãa, lÊy ®­îc ®ñ chiÕc ch×a khãa","B­íc 4: §Õn mËt thÊt ë tÇng cuèi cïng dïng 5 chiÕc ch×a khãa më B¶o r­¬ng, lÊy ®­îc Ngò S¾c th¹ch.","B­íc 5: Trë vÒ Chİnh ®iÖn, giao Ngò S¾c th¹ch cho Ch­ëng m«n, hoµn thµnh nhiÖm vô.")
end

function T_return()
	Talk(3,"t_all","Th«ng qua trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ Hé Ph¸i Ch©n Qu©n, häc ®­îc tuyÖt häc trÊn ph¸i Ngò L«i Ch¸nh Ph¸p, S­¬ng Ng¹o C«n L«n","B­íc 1: Sau khi ®¼ng cÊp ®¹t ®Õn 60, ®Õn Chİnh ®iÖn gÆp TuyÒn C¬ Tö, xin trïng ph¶n C«n L«n.","B­íc 2: giao n¹p 50000 ng©n l­îng, trïng ph¶n C«n L«n ph¸i.")
end

----------------- ½áÊø ---------------------------
function nothing()
end
