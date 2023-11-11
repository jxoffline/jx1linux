-- Îå¶¾½Ì°ïÖúNPC
-- By: Dan_Deng(2003-12-06)

function main(sel)
	UTask_wu = GetTask(10)
	player_faction = GetFaction()
	if (player_faction == "shaolin") then		-- ±¾ÃÅµÜ×Ó
		RestoreLife()		-- ±¾ÃÅÃâ·ÑÖÎÁÆ
		RestoreMana()
		RestoreStamina()
		Say("Trong bæn gi¸o nµy, mçi ngµy nÕu kh«ng luyÖn c«ng th× kh«ng thÓ sèng ®­îc. Ng­¬i ®Õn ®©y t×m ta cã chuyÖn g×?",4,"T×m hiÓu ®iÓn cè bæn m«n/faction","T×m hiÓu c¸c vŞ t«n tr­ëng/member","T×m hiÓu nhiÖm vô /task_get","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 70*256) then				-- ±¾ÃÅ³öÊ¦
		Say("Ng­êi ®· xuÊt s­ tõ bæ gi¸o İt ai quay trë l¹i? Ng­¬i quay l¹i lÇn nµy cã chuyÖn g× vËy?",4,"¤n l¹i chuyÖn n¨m x­a bæn m«n/faction","Nh×n l¹i ®¹o h÷u n¨m x­a/member","Ta cßn cã thÓ gióp g× kh«ng/task_get","Kh«ng hái n÷a!/nothing")
	elseif (player_faction ~= "") then			-- ·Ç±¾ÃÅ³öÊ¦¡¢ÆäËüÃÅÅÉ£¨ÃÅÅÉ²»Îª¿Õ¼´Ö¸·ÇĞÂÊÖ£©
		Say("Ng­¬i cã thÓ xuyªn qua trïng trïng ®éc vËt ®Ó vµo ®­îc ®©y, xem nh­ lµ kú tµi. Bæn gi¸o t«n träng nh÷ng ng­êi anh tµi. Hoan nghªnh tham quan!",3,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c vŞ ®¹o tr­ëng/member","Kh«ng hái n÷a!/nothing")
	else													-- ĞÂÊÖ
		Say("Ng­¬i ®Õn ®Ó dß th¸m hay ®Ó b¸i s­? NÕu nh­ kh«ng cã lÔ vËt g× ra m¾t th× ta kh«ng cã høng thó. ",4,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c vŞ ®¹o tr­ëng/member","T×m hiÓu ®iÒu kiÖn nhËp m«n/task_get","Kh«ng hái n÷a!/nothing")
	end
end

----------------- ÃÅÅÉ½éÉÜ²¿·İ ----------------------------
function faction()
	Say("VËy th× ng­¬i muèn ta giíi thiÖu vÒ c¸i g× cña bæn m«n?",5,"Khëi nguyªn m«n ph¸i/F1","VŞ trİ ®Şa lı /F2","§Şa vŞ giang hå /F3","§Æc s¾c m«n ph¸i/F4","Kh«ng hái n÷a!/nothing")
end

function F1()
	Say("Bæn gi¸o chØ míi thµnh lËp vµi n¨m nay nh­ng ph¸t triÓn rÊt m¹nh. Néi bé tæ chøc nghiªm mËt. Gi¸o chñ H¾c DiÖn Lang Qu©n chİnh lµ ng­êi ®· s¸ng lËp nªn Ngò §éc Gi¸o",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F2()
	Say("Xung quanh bæn gi¸o lµ n¨m ngän §éc phong LÜnh, ai muèn vµo ®©y ph¶i qua trïng trïng thö th¸ch. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F3()
	Say("T«n chØ cña Ngò §éc gi¸o lµ 'Lîi İch quyÕt ®Şnh b¹n thï', cã lîi míi lµm, kh«ng qu¶n bÊt kÓ chuyÖn thŞ phi chİnh tµ. Ngò §éc gi¸o cßn cã 1 ®iÒu lµ 'KÎ ®¾c téi víi Ngò §éc gi¸o, sÏ chÕt kh«ng toµn th©y'.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F4()
	Say("Bæn gi¸o hµnh tung Èn bİ,hµnh ®éng kh«ng ®Ó l¹i dÊu tİch. ¤ng chñ qu¸n trµ bªn ®­êng còng cã thÓ lµ m«n ®å cña ngò ®éc ph¸i cã thÓ giÕt ng­êi trong nh¸y m¾t, h¹ thñ v« t×nh. ThËm chİ nh÷ng ng­êi ®ång m«n víi nhau còng ®Òu lµ ng­êi v« t×nh. Gi¸o ®å víi nhau vÉn cã thÓ h¹ ®éc lÉn nhau. Ng­êi bŞ tróng ®éc sÏ bŞ xem lµ b¶n lÜnh kĞm câi",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ³ÉÔ±½éÉÜ²¿·İ ----------------------------
function member()
	Say("Muèn t×m hiÓu vŞ nµo cña bæn gi¸o?",10,"Gi¸o chñ H¾c DiÖn Lang Qu©n /M01","Kim Xµ H­¬ng Chñ V©n BÊt Tµ /M02","Xİch YÕt H­¬ng chñ §å DŞ /M03","MÆc Thï H­¬ng Chñ tang Chu /M04","Ng©n ThiÒm H­¬ng Chñ B¹ch Doanh Doanh /M05","Thanh Ng« H­¬ng Chñ Thang BËt /M06","§éc Nha /M101","§éc Thİch /M102","§éc T©m /M103","Kh«ng hái n÷a!/nothing")
end

function M01()
	Say("Gi¸o chñ H¾c DiÖn Lang Qu©n      VŞ trİ: Tæng tr¹i      Täa ®é:  220/166<enter>Lµ ng­êi l·nh ®¹m v« t×nh, lßng d¹ s¾t ®¸, ch­a ai thÊy h¾n c­êi. ChØ quan t©m nghiªn cøu chÕ t¹o c¸c lo¹i ®éc d­îc, muèn dïng ®éc ®Ó thèng trŞ Vâ l©m.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M02()
	Say("Kim Xµ H­¬ng chñ V©n BÊt Tµ      VŞ trİ: Kim Xµ tr¹i      VŞ trİ:156/170<enter> Cö chØ nh­ nhi n÷, khi h¾n nh×n xuèng ®Êt c­êi lµ ®Õn lóc ph¶i giÕt ng­êi, thiªn h¹ chØ cã mét thó vui lµ thÊy ng­êi kh¸c ®au ®ín v× tróng ®éc.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M03()
	Say("Xİch YÕt H­¬ng chñ §å DŞ      VŞ trİ: Xİch YÕt tr¹i      Täa ®é: 169/184<enter> lµ kÎ tham lam h¸m lîi. TuyÒn C¬ Tö cña C«n L«n ph¸i®· dïng tiÒn hèi lé nhê h¾n h¹ ®éc ch­ëng m«n C«n L«n",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M04()
	Say("MÆc Thï H­¬ng Chñ Tang Chu",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M05()
	Say("Ng©n ThiÒm H­¬ng chñ B¹ch Doanh Doanh      VŞ trİ: Ng©n ThiÒm tr¹i  Täa ®é: 220/209<enter> MÆt nh­ hoa ®µo, t©m nh­ r¾n rÕt, khu«n mÆt lóc nµo còng në mét nô c­êi l¼ng l¬, nh­ng ra tay rÊt ®éc ¸c. CÊu kÕt víi Chu KhuyÕt C«n L«n ph¸i, muèn mª hoÆc  Tõ Trung Nguyªn cña Vâ §ang ph¸i.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M06()
	Say("Thanh Ng« Tr¹i Chñ Thang BËt      VŞ trİ: Thanh Ng« tr¹i      Täa ®é: 200/201<enter> §éc ¸c v« sØ, n¨m x­a h¹i chÕt mÑ cña Yªn HiÓu Tr¸i (Thóy Yªn m«n) .",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M101()
	Say("§éc Nha      VŞ trİ:      Täa ®é: 182/194      Phô tr¸ch: Giao dŞch binh khİ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M102()
	Say("§éc Thİch      VŞ trİ:      Täa ®é: 184/193      Phô tr¸ch: Giao dŞch trang bŞ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M103()
	Say("§éc T©m      VŞ trİ:      Täa ®é: 187/191      Phô tr¸ch: Giao dŞch d­îc phÈm",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ÈÎÎñ½éÉÜ²¿·İ ----------------------------
function task_get()
	UTask_wu = GetTask(10)
	if (UTask_wu < 10*256) then	-- Î´ÈëÃÅ
		Say("Ng­¬i hiÖn ch­a nhËp m«n. Muèn nhËp m«n, cã thÓ ®Õn bÊt kú T©n Thñ Th«n ®Ö tö tiÕp dÉn cña bæn m«n.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_enroll","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 10*256) and (UTask_wu < 20*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô NhÒn nhÖn vµ Tİn Th¹ch",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L10","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 20*256) and (UTask_wu < 30*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Nh©n §Çu Tr¸ng.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L20","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 30*256) and (UTask_wu < 40*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Méc H­¬ng §Ønh.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L30","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 40*256) and (UTask_wu < 50*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Nh·n Kİnh V­¬ng M·ng Xµ.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L40","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 50*256) and (UTask_wu < 60*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Ngäc San H«.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L50","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 60*256) and (UTask_wu < 70*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Tİch §éc Chu.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L60","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_wu >= 70*256) and (UTask_wu < 80*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Trïng ph¶n s­ m«n.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_return","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	else
		Say("Ng­¬i cã thÓ tù do ra vµo m«n ph¸i, t¹m thêi kh«ng cã nhiÖm vô míi.",3,"T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	end
end

function T_all()
	Say("Muèn t×m hiÓu nhiÖm vô g×?",10,"NhiÖm vô nhËp m«n/T_enroll","NhiÖm vô NhÒn NhÖn vµ Tİn Th¹ch /T_L10","NhiÖm vô Nh©n §Çu Tr¸ng /T_L20","NhiÖm vô Méc H­¬ng §Ønh /T_L30","nhiÖm vô Nh·n Kİnh V­¬ng M·ng Xµ  /T_L40","NhiÖm vô Ngäc San H« /T_L50","NhiÖm vô Tõ §éc Chu  /T_L60","NhiÖm vô trïng ph¶n s­ m«n/T_return","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Muèn nhËp m«n häc nghÖ, chØ cÇn thuéc hÖ Méc vµ ®¹t ®Õn cÊp 10. §Õn bÊt kú T©n thñ th«n nµo ®Ó gÆp ®Ö tö tiÕp dÉn cña bæn m«n lµ ®­îc. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu. Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­ ")
end

function T_L10()
	Talk(5,"t_all","Sau khi nhËp m«n vµ ®¼ng cÊp ®· ®¹t ®Õn 10, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô NhÒn nhÖn vµ Tİn th¹ch. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ §o¹t Hån T¶n Nh©n, häc ®­îc vâ c«ng Ngò §éc §ao ph¸p,Ngò §éc Ch­ëng Ph¸p","B­íc 1: §Õn MÆc Thï tr¹i gÆp Tang Chu, tiÕp nhËn nhiÖm vô, ®i b¾t 10 con NhÖn vµ mua 10 bao Tİn Th¹ch cho bµ ta luyÖn c«ng","B­íc 2: §Õn Nh¹n §·ng s¬n b¾t 10 con nhÖn","B­íc 3: §Õn D­îc ®iÕm ë Long TuyÒn th«n mua 10 bao Tİn Th¹ch","B­íc 4: Trë vÒ MÆc Thï tr¹i, giao NhÒn nhÖn vµ Tİn th¹ch cho Tang Chu. Hoµn thµnh nhiÖm vô.")
end

function T_L20()
	Talk(4,"t_all","Hoµn thµnh nhiÖm vô NhÒn nhÖn vµ Tİn th¹ch vµ ®¼ng cÊp ®¹t ®Õn 20,ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Nh©n ®Çu tr¸ng. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Th«i MÖnh Sø Gi¶, häc ®­îc vâ c«ng Xİch DiÖm thùc Thiªn, T¹p Nan D­îc Kinh","B­íc 1: §Õn Ng©n ThiÒm tr¹i gÆp B¹ch Doanh Doanh, tiÕp nhËn nhiÖm vô, ®i giÕt La Tiªu ThÊt Quû, lÊy vÒ 7 c¸i ®Çu!","B­íc 2: §Õn La Tiªu s¬n, ®¸nh b¹i La Tiªu ThÊt Quû ","B­íc 3: Trë vÒ Ng©n ThiÒm tr¹i, gÆp B¹ch Doanh Doanh phôc mÖnh, hoµn thµnh nhiÖm vô.")
end

function T_L30()
	Talk(6,"t_all","Hoµn thµnh nhiÖm vô Nh©n ®Çu tr¸ng vµ ®¼ng cÊp ®¹t ®Õn 30,ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Méc H­¬ng §Ønh. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ H¾c Am Diªm La, häc ®­îc vâ c«ng U Minh Kh« L©u, V« H×nh §éc, B¸ch §éc Xuyªn T©m, B¨ng Lam HuyÒn Tinh","B­íc 1: §Õn Xİch YÕt tr¹i gÆp §å DŞ, tiÕp nhËn nhiÖm vô, ®i trõ ph¶n ®å lÊy l¹i Méc H­¬ng §Ønh.","B­íc 2: §Õn Vò Di s¬n, ®¸nh b¹i Ph¶n ®å, lÊy ®­îc Méc H­¬ng §Ønh.","B­íc 3: Trë vÒ Xİch YÕt tr¹i, §å DŞ ph¸t hŞªn Méc H­¬ng §Ønh lµ gi¶, cÇn ph¶i ®i lÊy l¹i Méc H­¬ng §Ønh thËt","B­íc 4: Trë l¹i Vò Di s¬n, ®¸nh b¹i ph¶n ®å §Çu Môc, lÊy ®­îc Méc H­¬ng §Ønh thËt!","B­íc 5: Trë l¹i Xİch YÕt tr¹i, giao Méc H­¬ng §Ønh thËt cho §å DŞ, hoµn thµnh nhiÖm vô.")
end

function T_L40()
	Talk(5,"t_all","Hoµn thµnh nhiÖm vô Méc H­¬ng §Ønh vµ ®¼ng cÊp ®¹t ®Õn 40, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Nh·n Kİnh V­¬ng M·ng Xµ. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ V« §æng La S¸t, häc ®­îc vâ c«ng V¹n §éc Thùc T©m, Xuyªn Y Ph¸ Gi¸p","B­íc 1: §Õn Kim Xµ tr¹i gÆpV©n BÊt Tµ, tiÕp nhËn nhiÖm vô, ®Õn Kim Xµ HuyÕt Tr¹ch b¾t cho V©n BÊt Tµ 1 con Nh·n Kİnh V­¬ng M·ng Xµ.","B­íc 2: Tr­íc khi ®i vµo Kim Xµ HuyÕt Tr¹ch cÇn ®Õn D­îc ®iÕm mua X¹ H­¬ng","B­íc 3: vµo Kim Xµ HuyÕt Tr¹ch, ®¸nh b¹i Nh·n Kİnh V­¬ng M·ng Xµ ","B­íc 4: Trë vÒ Kim Xµ tr¹i, giao Nh·n Kİnh V­¬ng M·ng Xµ cho V©n BÊt Tµ, hoµn thµnh nhiÖm vô.")
end

function T_L50()
	Talk(6,"t_all","Hoµn thµnh nhiÖm vô Nh·n Kİnh V­¬ng M·ng Xµ vµ ®¼ng cÊp ®¹t ®Õn 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Ngäc san h«. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Co §éc T«n Gi¶, häc ®­îc vâ c«ng Xuyªn T©m §éc Thİch","B­íc 1: §Õn Thanh Ng« tr¹i gÆp Thang BËt, tiÕp nhËn nhiÖm vô, ®i ®o¹t l¹i Ngäc san h«.","B­íc 2: §Õn Vò Di s¬n, vµo Ngäc Hoa ®éng, ®¸nh b¹i L­u KhÊu, biÕt ®­îc Ngäc san h« ®· bŞ mang vµo NghiÖt Long ®éng","B­íc 3: TiÕp tôc vµo NghiÖt Long ®éng, ®¸nh b¹i c­êng ®¹o, lÊy ®­îc Ngäc san h«.","B­íc 4: Trë vÒ Thanh Ng« tr¹i, giao Ngäc san h« cho Thang BËt, hoµn thµnh nhiÖm vô.")
end

function T_L60()
	Talk(5,"t_all","Hoµn thµnh nhiÖm vô Ngäc san h« vµ®¼ng cÊp ®¹t ®Õn 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Tİch §éc Chu. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ U Minh Quû Sø, thuËn lîi xuÊt s­.","B­íc 1: §Õn Tæng tr¹i gÆp gi¸o chñ H¾c DiÖn Lang Qu©n, tiÕp nhËn nhiÖm vô, ®o¹t l¹i Tİch §éc Chu tõ tay Nh¹n §·ng ph¸i","B­íc 2: §Õn Nh¹n §·ng s¬n, vµo D­¬ng Gi¸c ®éng ®¸nh b¹i v« sè ®Ö tö Nh¹n §·ng ph¸i, cuèi cïng ch­ëng m«n cña chóng ph¶i lé diÖn","B­íc 3: §¸nh b¹i Ch­ëng m«n Nh¹n §·ng ph¸İ, lÊy l¹i Tİch §éc Chu.","B­íc 4: Trë vÒ Tæng tr¹i, giao Tİch §éc Chu cho H¾c DiÖn Lang Qu©n, hoµn thµnh nhiÖm vô.")
end

function T_return()
	Talk(3,"t_all","Th«ng qua trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ U Minh Quû V­¬ng, häc ®­îc tuyÖt häc trÊn ph¸i Ngò §éc Kú Kinh, vâ c«ng Thiªn C­¬ng §Şa S¸t, Chu C¸p Thanh Minh","B­íc 1: Sau khi ®¼ng cÊp ®¹t ®Õn cÊp 60, ®Õn Tæng tr¹i gÆp gi¸o chñ H¾c DiÖn Lang Qu©n, xin trïng ph¶n Ngò §éc gi¸o","B­íc 2: TÆng cho m«n ph¸i 50000 l­îng, trïng ph¶n Ngò §éc gi¸o")
end

----------------- ½áÊø ---------------------------
function nothing()
end
