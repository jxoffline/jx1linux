-- ÉÙÁÖÅÉ°ïÖúNPC
-- By: Dan_Deng(2003-12-01)

function main(sel)
	UTask_sl = GetTask(7)
	player_faction = GetFaction()
	if (player_faction == "shaolin") then		-- ±¾ÃÅµÜ×Ó
		RestoreLife()		-- ±¾ÃÅÃâ·ÑÖÎÁÆ
		RestoreMana()
		RestoreStamina()
		Say("Bæn tù ®· cã tõ ngµn n¨m lŞch sö, vÒ ph­¬ng diÖn vâ nghÖ cã thÓ ®Õn t×m Ph­¬ng tr­îng hay c¸c vŞ thñ täa mµ hái, cßn vÊn ®Ò kh¸c cã thÓ ®Õn hái bÇn t¨ng lµ ®­îc.",4,"T×m hiÓu ®iÓn cè bæn m«n/faction","T×m hiÓu c¸c vŞ t«n tr­ëng/member","T×m hiÓu nhiÖm vô /task_get","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 70*256) then				-- ±¾ÃÅ³öÊ¦
		Say("Lóc tr­íc ng­êi tõ Méc Nh©n H¹ng ®Õn La H¸n TrËn trong kho¶n thêi gian rÊt ng¾n, b©y giê hËu bèi ai còng noi g­¬ng ng­¬i, mau ®i xem c¸c s­ ®Ö ®i.",4,"¤n l¹i chuyÖn n¨m x­a bæn m«n/faction","Nh×n l¹i ®¹o h÷u n¨m x­a/member","Ta cßn cã thÓ gióp g× kh«ng/task_get","Kh«ng hái n÷a!/nothing")
	elseif (player_faction ~= "") then			-- ·Ç±¾ÃÅ³öÊ¦¡¢ÆäËüÃÅÅÉ£¨ÃÅÅÉ²»Îª¿Õ¼´Ö¸·ÇĞÂÊÖ£©
		Say("Hoan nghªnh ®Õn víi ThiÕu L©m! C¸c vŞ cã thÓ tù tóc du ngo¹n trong tù. Cã vÊn ®Ò g× th× cø ®Õn hái l·o n¹p.",3,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c vŞ ®¹o tr­ëng/member","Kh«ng hái n÷a!/nothing")
	else													-- ĞÂÊÖ
		Say("Hoan nghªnh ®Õn víi ThiÕu L©m Tù! Kh«ng biÕt ®Õn b¸i s­ hay lÔ PhËt vËy?",4,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c vŞ ®¹o tr­ëng/member","T×m hiÓu ®iÒu kiÖn nhËp m«n/task_get","Kh«ng hái n÷a!/nothing")
	end
end

----------------- ÃÅÅÉ½éÉÜ²¿·İ ----------------------------
function faction()
	Say("Ng­¬i muèn biÕt vÒ bé phËn nµo trong ThiÕu L©m ®©y?",5,"Khëi nguyªn m«n ph¸i/F1","VŞ trİ ®Şa lı /F2","§Şa vŞ giang hå /F3","§Æc s¾c m«n ph¸i/F4","Kh«ng hái n÷a!/nothing")
end

function F1()
	Say("Bæn tù ®­îc s¸ng lËp t¹i B¾c Ngôy HiÕu V¨n §Õ Th¸i Hßa ThËp Cöu Niªn (C«ng nguyªn 49 n¨m) . Thiªn Tróc t¨ng nh©n B¹t §µ tõ T©y Vùc ®Õn Trung Nguyªn, do HiÕu V¨n §Õ t¹i ThiÕu ThÊt S¬n x©y dùng lªn chïa ThiÕu L©m ®Ó cung d­ìng. 30 n¨m sau, Nam Thiªn Tróc t¨ng nh©n Bå §Ò §¹t Ma ®Õn ThiÕu L©m Tù, chiªu n¹p ®Ö tö, truyÒn thô ThiÒn T«ng, chİnh v× thÕ ®· trë thµnh PhËt gi¸o ThiÒn T«ng khai s¬n Tæ S­.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F2()
	Say("Bæn tù n»m t¹i TØnh Hµ Nam Tung S¬n, Tung S¬n lµ do c¸c d·y nói h×nh thµnh, bªn §«ng lµ Th¸i ThÊt S¬n, bªn T©y lµ ThiÕu ThÊt S¬n, mçi bªn cã 16 ®Ønh, ®Ønh nµo còng næi danh, bæn tù täa l¹c t¹i Tróc L©m Mao ThÊt, ThiÕu ThÊt S¬n Ngò Nhu Phong H¹, cè danh 'ThiÕu L©m'.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F3()
	Say("Bæn ph¸i tõ tr­íc giê ®­îc x­ng tông lµ vâ l©m ®Ö nhÊt m«n ph¸i, ®­îc xem lµ Th¸i S¬n B¾c §Èu cña Vâ L©m Trung Nguyªn. T¨ng chóng trong ThiÕu L©m Tù x­a nay cã truyÒn thèng häc vâ, víi '72 tuyÖt kü cña ThiÕu L©m' ®· vang danh thiªn h¹.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F4()
	Say("Bæn ph¸i cã truyÒn thèng b¸i PhËt vµ luyÖn vâ, ®Ö tö trong m«n vâ c«ng cao siªu, l¹i cã tİnh nghÜa hiÖp. §Ö tö bæn ph¸i lµ nam giíi ph©n ra cã ®Ö tö xuÊt gia vµ ®Ö tö tôc gia hai lo¹i, xuÊt gia ®Ö tö tu luyÖn trong tù, cßn tôc gia ®Ö tö ph©n r¶i r¸c kh¾p n¬i, hµnh hiÖp tr­îng nghÜa.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ³ÉÔ±½éÉÜ²¿·İ ----------------------------
function member()
	Say("Ng­¬i muèn biÕt vÊn ®Ò g× cña bæn tù?",9,"Ph­¬ng Tr­îng HuyÒn Nh©n ®¹i s­ /M01","§¹t Ma ®­êng ®Çu täa HuyÒn Bi/M02","Bµn Nh­îc ®­êng ®Çu täa HuyÒn Gi¸c/M03","Tµng Kinh c¸c ®Çu täa HuyÒn Tõ /M04","La H¸n ®­êng ®Çu täa HuyÒn Nan/M05","Trõng M¹c/M101","Trõng TiÕt/M102","Trõng Vi/M103","Kh«ng hái n÷a!/nothing")
end

function M01()
	Say("ph­¬ng tr­îng HuyÒn NhÊt ®¹i s­  VŞ trİ: ph­¬ng tr­îng ThiÒn phßng  Täa ®é: 230,184<enter> Trİ tuÖ xuÊt chóng, vâ nghÖ cao c­êng, khiªm nh­êng ®é l­îng ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M02()
	Say("§¹t Ma §­êng ®Çu täa HuyÒn Bi  VŞ trİ: §¹t Ma §­êng  Täa ®é: 210,188<enter> Lµ ng­êi thiÕt diÖn v« t­, c«ng chİnh nghiªm minh, tuy cã lóc h¬i gi¸o ®iÒu nh­ng rÊt ®­îc c¸c ®Ö tö yªu quı ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M03()
	Say("Bµn Nh­îc ®­êng ®Çu täa HuyÒn Gi¸c  VŞ trİ: hå Phãng sinh  Täa ®é: 220,193<enter> C¨m ghĞt c¸i ¸c, tİnh nãng nh­ löa, kh¶ng kh¸i hµo hiÖp",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M04()
	Say("Chñ täa Tµng Kinh c¸c HuyÒn Tõ       VŞ trİ: Tµng Kinh c¸c       Täa ®é: 218,190<enter> cã tµi thao l­îc, th«ng biÕt mäi sù, lµ mét con mät s¸ch, lµ ng­êi thİch hßa b×nh, ghĞt tranh ®Êu víi ng­êi kh¸c, phµm chuyÖn g× còng lÊy ch÷ nhÉn lµm ®Çu, cã lóc h¬i cæ hñ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M05()
	Say("La H¸n ®­êng ®Çu täa HuyÒn Nan  VŞ trİ: La H¸n §­êng  Täa ®é: 201,192<enter> Träng quan niÖm ®Şa vŞ x· héi, lµ ng­êi cao ng¹o, tranh c­êng h¸o th¾ng, lu«n muèn cïng §¹t Ma viÖn thñ täa HuyÒn Bi tranh tµi cao thÊp. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M101()
	Say("Trõng M¹c  VŞ trİ: Qu·ng tr­êng  Täa ®é: 211,196  Phô tr¸ch: Giao dŞch binh khİ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M102()
	Say("Trõng TiÕt  VŞ trİ: Qu·ng tr­êng  Täa ®é: 209,194  Phô tr¸ch: Giao dŞch trang bŞ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function M103()
	Say("Trõng Vi  VŞ trİ: Qu·ng tr­êng  Täa ®é: 208,195  Phô tr¸ch: Giao dŞch D­îc phÈm",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ÈÎÎñ½éÉÜ²¿·İ ----------------------------
function task_get()
	UTask_sl = GetTask(7)
	if (UTask_sl < 10*256) then	-- Î´ÈëÃÅ
		Say("Ng­¬i hiÖn ch­a nhËp m«n, muèn nhËp m«n ®Õn c¸c T©n Thñ th«n gÆp §Ö tö tiÕp dÉn",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_enroll","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 10*256) and (UTask_sl < 20*256) then
		Say(" Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Méc Nh©n H¹ng",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L10","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 20*256) and (UTask_sl < 30*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Di nh©n",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L20","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 30*256) and (UTask_sl < 40*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Th¸p l©m nghi tung",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L30","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 40*256) and (UTask_sl < 50*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô TŞch DiÖt NhŞ T¨ng",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L40","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 50*256) and (UTask_sl < 60*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô DŞch Cèt Kinh",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L50","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 60*256) and (UTask_sl < 70*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô La H¸n TrËn,",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L60","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_sl >= 70*256) and (UTask_sl < 80*256) then
		Say("Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Trïng ph¶n s­ m«n",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_return","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	else
		Say("Ng­¬i cã thÓ tù do ra vµo m«n ph¸i, t¹m thêi kh«ng cã nhiÖm vô míi",3,"T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	end
end

function T_all()
	Say("Muèn t×m hiÓu nhiÖm vô g×?",10,"NhiÖm vô nhËp m«n/T_enroll","NhiÖm vô Méc Nh©n h¹ng/T_L10","NhiÖm vô Di nh©n/T_L20","NhiÖm vô Th¸p L©m nghi tung/T_L30","NhiÖm vô TŞch DiÖt NhŞ t¨ng/T_L40","NhiÖm vô DŞch Cèt Kinh/T_L50","NhiÖm vô La H¸n trËn/T_L60","NhiÖm vô trïng ph¶n s­ m«n/T_return","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Muèn nhËp m«n häc nghÖ, chØ cÇn thuéc hÖ Kim vµ ®¹t cÊp 10. §Õn ®èi tho¹i víi ®Ö tö tiÕp dÉn ThiÕu l©m t¹i c¸c T©n thñ th«n lµ ®­îc. Sau khi nhËp m«n, lÇn l­ît hoµn thµnh nhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng, ®­îc phong Danh hiÖu. Sau khi hoµn thµnh nhiÖm vô xuÊt s­ lµ cã thÓ xuÊt s­.")
end

function T_L10()
	Talk(4,"t_all","Sau khi nhËp m«n vµ ®¹t ®Õn cÊp 10, cã thÓ tiÕp nhËn nhiÖm vô Méc Nh©n h¹ng. Hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ ®­îc phong lµ Hé ViÖn Vâ T¨ng, häc ®­îc vâ c«ng ThiÕu L©m QuyÒn ph¸p, ThiÕu L©m C«n ph¸p, ThiÕu L©m §ao ph¸p.","B­íc 1: §Õn ThiÒn phßng gÆp ph­¬ng tr­îng, tiÕp nhËn nhiÖm vô Méc Nh©n h¹ng, ®i lÊy Kim Liªn hoa.","B­íc 2: §i vµo hÎm Méc nh©n, ®¸nh b¹i Méc nh©n, sÏ cã 30% c¬ héi lÊy ®­îc Kim Liªn hoa.","B­íc 3: Trë l¹i ThiÒn phßng giao Kim Liªn hoa cho HuyÒn Nh©n ph­¬ng tr­îng, hoµn thµnh nhiÖm vô.")
end

function T_L20()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm vô Méc nh©n h¹ng vµ ®¹t ®Õn cÊp 20, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Man Di. Hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Hé Tr× Kim Cang, häc ®­îc vâ c«ng BÊt §éng Minh V­¬ng","B­íc 1: §Õn §¹t Ma §­êng gÆp HuyÒn Bi, tiÕp nhËn nhiÖm vô, ®Õn Phôc Ng­u s¬n T©y gi¸o huÊn 5 tªn Man Di.","B­íc 2: §Õn Phôc Ng­u s¬n T©y, lÇn l­ît ®¸nh b¹i 5 tªn Man Di.","B­íc 3: Trë l¹i §¹t Ma §­êng, gÆp HuyÒn Bi phôc mÖnh, hoµn thµnh nhiÖm vô.")
end

function T_L30()
	Talk(5,"t_all","Sau khi hoµn thµnh nhiÖm vô Man Di vµ ®¹t ®Õn trªn cÊp 30, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô Th¸p L©m Nghi Tung. Hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Hé ph¸p La H¸n, häc ®­îc vâ c«ng La H¸n TrËn","B­íc 1: §Õn hå Phãng sinh gÆp HuyÒn Gi¸c, tiÕp nhËn nhiÖm vô, ®Õn Th¸p L©m ®¸nh b¹i nh÷ng kÎ cã hµnh tung mê ¸m.","B­íc 2: §Õn Th¸p L©m, ®¸nh b¹i bän chóng, ph¸t hiÖn bän chóng chİnh lµ gi¸n ®iÖp cña Kim Quèc, ®ång ®¶ng bän chóng ®· ®¸nh c¾p 'B¸t Nh· T©m Kinh', ch¹y ®Õn Kim Quang §éng.","B­íc 3: §Õn Kim Quang §éng, ®¸nh b¹i gi¸n ®iÖp Kim Quèc, ®o¹t l¹i 'B¸t Nh· T©m Kinh'.","B­íc 4: Quay l¹i hå Phãng sinh, giao 'B¸t Nh· T©m Kinh' cho HuyÒn Gi¸c, hoµn thµnh nhiÖm vô.")
end

function T_L40()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô Th¸p L©m Nghi Tung vµ ®¹t trªn cÊp 40, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô TŞch DiÖt NhŞ T¨ng. Hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ TruyÒn Kinh La H¸n, häc ®­îc vâ c«ng S­ Tö Hèng","B­íc 1: §Õn Ph­¬ng Tr­îng ThiÒn Phßng gÆp HuyÒn Nh©n Ph­¬ng Tr­îng, tiÕp nhËn nhiÖm vô, t×m TŞch DiÖt nhŞ thÇn t¨ng thØnh gi¸o chuyÖn thiªn h¹ côc thÕ.","B­íc 2: §Õn MËt ThÊt phİa sau nói, tr¶ lêi chİnh x¸c c©u hái ®Ó vµo mËt thÊt.","B­íc 3: §¸nh b¹i bän ng­êi ®ång trong mËt thÊt, cã thÓ më cöa sæ biÕt ®­îc khÈu quyÕt ®Ó nãi chuyÖn víi NhŞ T¨ng.","B­íc 4: §Õn phİa tr­íc cöa sæ nhá cuèi MËt ThÊt, ®äc chİnh x¸c khÈu quyÕt, thØnh gi¸o thiªn h¹ côc thÕ tõ NhŞ T¨ng.","B­íc 5: Quay l¹i Ph­¬ng Tr­îng ThiÒn Phßng, truyÒn ®¹t chİnh x¸c ®iÒu NhŞ T¨ng ®· nãi cho HuyÒn Nh©n ph­¬ng tr­îng nghe, hoµn thµnh nhiÖm vô. NÕu quªn, cã thÓ ®i thØnh gi¸o l¹i.")
end

function T_L50()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô TŞch DiÖt NhŞ T¨ng vµ ®¹t trªn cÊp 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô DŞch Cèt Kinh. Hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ Phôc Ma Thiªn V­¬ng, häc ®­îc vâ c«ng Ma Ha V« L­îng, Long Tr¶o Hæ Tr¶o, Hoµnh T¶o Lôc Hîp","B­íc 1: §Õn Tµng Kinh C¸c gÆp HuyÒn Tõ, tiÕp nhËn nhiÖm vô, t×m Trõng ViÔn liÒu m¹ng lÊy l¹i 'DŞch Cèt Kinh' trong Tµng Kinh C¸c.","B­íc 2: §Õn khu luyÖn vâ ®èi tho¹i víi TiÓu hßa th­îng Trõng T©m, biÕt ®­îc cã thÓ dïng mét con gµ quay ®Ó Trõng t©m nãi ra bİ mËt cña Trõng ViÔn.","B­íc 3: §Õn Töu lÇu ë BiÖn Kinh mua mét con gµ quay, sau ®ã quay l¹i t×m Trõng T©m biÕt ®­îc bİ mËt.","B­íc 4: C¨n cø lêi nãi cña Trõng T©m, ®Õn t×m d­íi t¶ng ®¸ to trong rõng tïng sau nói lÊy ®­îc 'DŞch Cèt Kinh'.","B­íc 5: Quay l¹i Tµng Kinh C¸c, giao 'DŞch Cèt Kinh' cho HuyÒn Tõ, hoµn thµnh nhiÖm vô.")
end

function T_L60()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm vô DŞch Cèt Kinh vµ ®¹t trªn cÊp 50, ng­¬i cã thÓ nhËn nhiÖm vô La H¸n trËn. Hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ V« L­îng Thİch T«n, thuËn lîi xuÊt s­.","B­íc 1: §Õn La H¸n §­êng gÆp HuyÒn Nan, tiÕp nhËn nhiÖm vô, vµo La H¸n TrËn lÊy bèn tİn vËt: trµng h¹t, thiÒn tr­îng, Méc ng­ vµ b¸t nhµ s­.","B­íc 2: Vµo La H¸n TrËn, ®¸nh b¹i qu¸i vËt lÊy ®­îc bèn tİn vËt.","B­íc 3: Quay l¹i La H¸n §­êng, giao tİn vËt cho HuyÒn Nan, hoµn thµnh nhiÖm vô.")
end

function T_return()
	Talk(3,"t_all","Sau khi hoµn thµnh nhiÖm vô Trïng ph¶n s­ m«n, ng­¬i ®­îc phong lµ Hé Ph¸p Tr­ëng L·o, häc ®­îc vâ c«ng trÊn ph¸i DŞch C©n Kinh, Nh­ Lai Thiªn DiÖp","B­íc 1: Sau khi ®¹t cÊp 60 trë lªn, ®Õn Ph­¬ng Tr­îng ThiÒn Phßng gÆp HuyÒn Nh©n Ph­¬ng Tr­îng, xin trïng ph¶n ThiÕu L©m ph¸i.","B­íc 2: Giao nép 50000 l­îng b¹c, trïng ph¶n ThiÕu L©m ph¸i.")
end

----------------- ½áÊø ---------------------------
function nothing()
end
