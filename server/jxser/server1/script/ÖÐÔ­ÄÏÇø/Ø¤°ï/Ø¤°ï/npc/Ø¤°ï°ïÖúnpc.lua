--¶ëáÒÅÉ°ïÖúNPC
-- By: Dan_Deng(2003-11-25)

Include("\\script\\global\\map_helper.lua")
npc_name = "Khëi ¤ng"

function main(sel)
	UTask_gb = GetTask(8)
	player_faction = GetFaction()
	if (player_faction == "gaibang") then		-- ±¾ÃÅµÜ×Ó
		RestoreLife()		-- ±¾ÃÅÃâ·ÑÖÎÁÆ
		RestoreMana()
		RestoreStamina()
		Say("Ta theo C¸i bang ®· 50 mÊy n¨m råi, nÕu tİnh ra th× còng lµ s­ thóc cña Hµ Bang Chñ. Cã vÊn ®Ò g× kh«ng hiÓu th× cø hái ta lµ ®­îc råi.",6,"T×m hiÓu viÖc cña bæn bang/faction","T×m hiÓu c¸c vŞ trong bæn bang/member","T×m hiÓu nhiÖm vô /task_get","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 70*256) then				-- ±¾ÃÅ³öÊ¦
		Say("Ng­¬i xuÊt s­ ®· mÊy n¨m, ch¼ng lÏ vÉn cßn nhí ®­îc nh÷ng sù gian khæ lóc ®ã ­? Khµ! Khµ! Khµ!",6,"¤n l¹i bæn m«n cè sù /faction","Th¨m l¹i huynh ®Ö ®ång m«n/member","Ta cßn cã thÓ gióp g× kh«ng/task_get","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng hái n÷a!/nothing")
	elseif (player_faction ~= "") then			-- ·Ç±¾ÃÅ³öÊ¦¡¢ÆäËüÃÅÅÉ£¨ÃÅÅÉ²»Îª¿Õ¼´Ö¸·ÇĞÂÊÖ£©
		Say("Hoan nghªnh ®Õn C¸i Bang! Kh«ng biÕt cã g× chØ gi¸o?",3,"T×m hiÓu quı bang/faction","T×m hiÓu c¸c vŞ anh hïng/member","Kh«ng hái n÷a!/nothing")
	else													-- ĞÂÊÖ
		Say("C¸i Bang lu«n hoan nghªnh c¸c vŞ ®ång ®¹o cã cïng chİ h­íng chèng Kim!",4,"T×m hiÓu quı bang/faction","T×m hiÓu c¸c vŞ anh hïng/member","T×m hiÓu ®iÒu kiÖn nhËp m«n/task_get","Kh«ng hái n÷a!/nothing")
	end
end

----------------- ÃÅÅÉ½éÉÜ²¿·İ ----------------------------
function faction()
	Say("VËy th× ng­¬i muèn nghe ta giíi thiÖu vÒ bé phËn nµo cña bæn bang? ",5,"Khëi nguyªn C¸i bang/F1","VŞ trİ ®Şa lı /F2","§Şa vŞ giang hå /F3","§Æc s¾c m«n ph¸i/F4","Kh«ng hái n÷a!/nothing")
end

function F1()
	Say("LŞch sö cña bæn bang ®· cã tõ l©u. Tõ lóc s¬ Tèng ®· cã danh x­ng 'Thiªn h¹ ®Ö nhÊt bang' råi. Danh chÊn giang hå, anh tµi cña bæn bang nh­ 'Ngäa hæ tµng long', thêi nµo còng cã!",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F2()
	Say("Suèt §«ng T©y Nam B¾c, n¬i nµo cã ¨n mµy, n¬i ®ã cã C¸i bang!",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F3()
	Say("C¸i Bang x­ng lµ 'Thiªn h¹ ®Ö nhÊt bang', ®· gÆp kh«ng İt phiÒn phøc víi giíi vâ l©m Trung Nguyªn. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F4()
	Say("NĞt ®Æc s¾c nhÊt cña C¸i Bang lµ: xin ¨n ®Ó sèng, xem nh­ lµ gia tµi quı nhÊt vËy. Gia nhËp C¸i bang ph¶i tõ bá hÕt gia s¶n, ¨n xin mµ sèng. Bëi v× sù ph©n bè cña bæn bang rÊt réng, cho nªn tai m¾t còng nhiÒu, tin tøc cùc kú mau lÑ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ³ÉÔ±½éÉÜ²¿·İ ----------------------------
function member()
	Say("Muèn nghe ta giíi thiÖu vŞ nµo trong bæn bang?",11,"Bang chñ Hµ Nh©n Ng· /Mhe","ChÊp ph¸p tr­ëng l·o M¹nh Th­¬ng L­¬ng/Mmeng","Ch­ëng bæng tr­ëng l·o La Khu«ng Sinh/Mluo","TruyÒn c«ng tr­ëng l·o Ngôy LiÔu ¤ng/Mwei","Ch­ëng B¸t tr­ëng l·o Xµ Tam Tr­îng/Mshe","TriÖu ®µ chñ /Mzhao","M¹nh ViÔn Tµi/Myuan","Tr­¬ng T¸n/Mzhang","Lı Tı /Mli","V­¬ng Ng« /Mwang","Kh«ng hái n÷a!/nothing")
end

function Mhe()
	Say("Bang chñ Hµ Nh©n Ng·   VŞ trİ: C¸i Bang Qu¶ng tr­êng   Täa ®é: 191,231<enter>hµo hiÖp tr­îng nghÜa, khİ kh¸i h¬n ng­êi. RÊt xem träng nghÜa khİ, thİch uèng r­îu. MÆc dï th­êng uèng ®Õn say tóy lóy nh­ng xö lı nh÷ng sù viÖc cña bæn bang th× l¹i v« cïng s¸ng suèt",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mmeng()
	Say("ChÊp ph¸p tr­ëng l·o M¹nh Th­¬ng L­¬ng   VŞ trİ: C¸i Bang Qu¶ng tr­êng   Täa ®é: 194,236<enter>C«ng chİnh nghiªm minh, chÊp ph¸p nh­ s¬n. Cã lóc xö lı gièng nh­ kh«ng cã t×nh ng­êi. Víi huynh ®Ö trong bang kh«ng cßn t×nh c¶m s©u ®Ëm. ¤ng ta v« cïng yªu quı M¹nh ViÔn tµi",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mluo()
	Say("Ch­ëng Bæng tr­ëng l·o La Khu«ng Sinh   VŞ trİ: C¸i Bang Qu¶ng tr­êng   Täa ®é: 190,226<enter>Lµ ng­êi trung hËu, trÇm lÆng İt nãi. Mét lêi nãi ra ch¾c nh­ ®inh ®ãng cét. RÊt İt khi xuÊt hiÖn trong bæn bang.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mwei()
	Say("TruyÒn c«ng tr­ëng l·o Ngôy LiÔu ¤ng   VŞ trİ: C¸i Bang Qu¶ng tr­êng   Täa ®é: 191,241<enter> tİnh t×nh nãng n¶y, cã thï kh«ng tha.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mshe()
	Say("Ch­ëng B¸t tr­ëng l·o Xµ Tam Tr­îng   VŞ trİ: C¸i Bang Qu¶ng tr­êng   Täa ®é: 189,236<enter> lµ mét ng­êi b×nh dŞ dÔ gÇn, th­êng thİch nãi chuyÖn tiÕu l©m víi mäi ng­êi. Lµ mét trong nh÷ng bang chñ ®­îc ®Ö tö cña C¸i bang yªu thİch.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mzhao()
	Say("TriÖu §µ chñ   VŞ trİ: D­¬ng Ch©u Tø Väng ®×nh B¾c   Täa ®é: 213,177<enter> D­¬ng Ch©u lµ ®µ chñ ph©n ®µ thø 3 ë D­¬ng Ch©u, tİnh t×nh cÈn thËn! Nghiªm minh chİnh trùc.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Myuan()
	Say("M¹nh ViÔn Tµi   VŞ trİ: Khu rõng ngoµi C¸i Bang <enter> lµ ®Ö tö 5 tói. Lµ ch¸u cña ChÊp ph¸p tr­ëng l·o M¹nh Th­¬ng L­¬ng. Lµ ng­êi tham lam h¸o danh, ®· tõng bŞ c¸c vŞ tr­ëng l·o gi¸o huÊn. Nh­ng h¾n lµ ng­êi rÊt th«ng minh, nãi chuyÖn rÊt cã høng thó.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mzhang()
	Say("Tr­¬ng T¶n   VŞ trİ: Qu¶ng tr­êng   Täa ®é: 48,84   Phô tr¸ch: Giao dŞch binh khİ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mli()
	Say("Lı Tı   VŞ trİ: Qu¶ng tr­êng   Täa ®é: 51,85   Phô tr¸ch: Giao dŞch trang bŞ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mwang()
	Say("V­¬ng Ng«   VŞ trİ: Qu¶ng tr­êng   Täa ®é: 53,86   Phô tr¸ch: Giao dŞch D­îc phÈm",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ÈÎÎñ½éÉÜ²¿·İ ----------------------------
function task_get()
	UTask_gb = GetTask(8)
	if (UTask_gb < 10*256) then	-- Î´ÈëÃÅ
		Say("ng­¬i hiÖn t¹i ch­a nhËp m«n, nÕu muèn nhËp m«n, chØ cÇn t×m ®­îc ®Ö tö tiÕp dÉn bæn m«n ë bÊt k× th«n míi nµo lµ ®­îc, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_enroll","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 10*256) and (UTask_gb < 20*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô mua r­îu, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L10","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 20*256) and (UTask_gb < 30*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L20","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 30*256) and (UTask_gb < 40*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô N¸o Quû Phong Ba, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L30","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 40*256) and (UTask_gb < 50*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô b¶o vÖ Tr­¬ng TuÊn, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L40","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 50*256) and (UTask_gb < 60*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô Trung Nguyªn §Şa H×nh §å, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L50","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 60*256) and (UTask_gb < 70*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô XuÊt s­, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L60","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 70*256) and (UTask_gb < 80*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô Trïng ph¶n s­ m«n, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_return","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	else
		Say("B©y giê ng­¬i cã thÓ tù do hµnh tÈu giang hå, t¹m thêi ch­a cã nhiÖm vô míi, ®· ®­îc ghi nhí "..UTask_gb..".",3,"T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	end
end

function T_all()
	Say("Muèn t×m hiÓu nhiÖm vô g×?",10,"NhiÖm vô nhËp m«n/T_enroll","NhiÖm vô mua r­îu/T_L10","NhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi/T_L20","NhiÖm vô n¸o quû phong ba/T_L30","NhiÖm vô b¶o hé Tr­¬ng TuÊn/T_L40","NhiÖm vô Trung nguyªn ®Şa ®å/T_L50","NhiÖm vô xuÊt s­ /T_L60","NhiÖm vô trïng ph¶n s­ m«n/T_return","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Muèn nhËp m«n häc nghÖ, chØ thuéc hÖ Háa, ch­a gia nhËp ph¸i kh¸c ®ång thêi ®¼ng cÊp trªn 10, ®Õn bÊt kú T©n Thñ Th«n nµo ®èi tho¹i víi §Ö tö bæn ph¸i.Tr­íc tiªn ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­!")
end

function T_L10()
	Talk(5,"t_all","Sau khi nhËp m«n vµ ®¼ng cÊp cña ng­¬i ®· lªn ®Õn cÊp 10. ng­¬i cã thÓ tiÕp nhËn nhiÖm vô ®i Giao dŞch r­îu. Th«ng qua viÖc hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ ®­îc th¨ng lµ: ChÊp ®¹i ®Ö tö, ®­îc häc vâ c«ng<color=blue> C¸i Bang Bæng Ph¸p, C¸i bang quyÒn ph¸p<color>. ","B­íc thø nhÊt: §Õn chç cña<color=blue> Bang chñ Hµ Nh©n Ng·<color> TiÕp nhËn nhiÖm vô. §i mua 5 lo¹i r­îu næi tiÕng: Trung TuyÒn < color=red>, Kim L¨ng Xu©n, B¸ch hoa n­¬ng, Kinh Hoa Lé, Song C©u §¹i Khóc. <color>. ","B­íc thø hai: GÆp<color=blue> D­¬ng Ch©u töu lÇu <color> mua ®­îc 4 lo¹i r­îu, <color> nh­ng <color=red>cßn Trung TuyÒn töu<color> th× ®· bŞ Tóy B¸n Tiªn< color>®Õn mua tr­íc råi ","B­íc thø ba: T×m<color=blue> ®­îc Tóy B¸n Tiªn <color>bªn c¹nh töu lÇu <color=blue>. §¸p øng ®­îc nh÷ng yªu cÇu cña h¾n, <color=blue>nhËn ®­îc Trung TuyÒn Töu ","B­íc thø t­: Trë vÒ <color=blue> C¸i bang <color>, gÆp<color=blue>Hµ Nh©n Ng·<color>Giao n¨m lo¹i r­îu<color=red>cho ¤ng Êy <color>Hoµn thµnh nhiÖm vô ")
end

function T_L20()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm vô Giao dŞch r­îu vµ ®¼ng cÊp cña ng­¬i ®· t¨ng lªn cÊp 20. ng­¬i ®· cã thÓ tiÕp TiÕp nhËn nhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi. §i ®Õn hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ ChÊp B¸t ®Ö tö ®­îc häc vâ c«ng<color=blue>Hãa KiÕm Vi Di<color>. ","B­íc thø nhÊt: §Õn <color=blue> th«n Thô L©m<color>®Ó t×m gÆp mét vŞ<color=blue> ®Ö tö C¸i bang<color>, tiÕp nhËn nhiÖm vô gi¸o huÊn tªn kho¸c l¸c <color=blue>M¹nh ViÔn Tµi<color>. ","B­íc 2: T×m ®­îc M¹nh ViÔn Tµi, ®¸nh b¹i h¾n.","B­íc thø ba: Trë vÒ<color=blue>C¸i Bang<color>, gÆp<color=blue>M¹nh Th­¬ng L­¬ng<color>Phôc mÖnh, hoµn thµnh nhiÖm vô. ")
end

function T_L30()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi vµ ®¼ng cÊp cña ng­¬i ®· t¨ng lªn 30, ng­¬i ®· cã thÓ tiÕp TiÕp nhËn nhiÖm vô N¸o Quû Phong Ba. §i ®Õn hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc th¨ng lµ ChÊp Bæng ®Ö tö. Häc ®­îc vâ c«ng<color=blue>Gi¸ng Long Ch­ëng; §¶ CÈu TrËn<color>. ","B­íc thø nhÊt: §Õn gÆp<color=blue>La Khu«ng Sinh<color>, tiÕp nhËn nhiÖm vô, thay ¤ng ta ®Õn<color=blue> D­¬ng Ch©u gÆp TriÖu §µ chñ <color>®Ó lÊy quyÓn s¸ch mµ <color=red> ¤ng ta ®ang viÕt dë<color>. ","B­íc thø hai: §Õn<color=blue>D­¬ng Ch©u Tø Väng §×nh<color>gÆp ®­îc<color=blue>TriÖu §µ chñ<color>, th× ra mÊy ngµy nay ®Ö tö cña TriÖu chñ ë<color=blue>Thôc c­¬ng s¬n <color>®· g©y nªn nh÷ng chuyÖn n¸o lo¹n, g©y ra lêi ®µm tiÕu ","B­íc thø ba: §i ®Õn <color=blue> Thôc C­¬ng s¬n <color>, ®¸nh b¹i ®¸m phôc binh <color=blue> ng­êi Kim<color>, cøu ®­îc ®Ó tö C¸i bang<color=blue> ®ang bŞ chóng b¾t<color>. ","B­íc thø t­: Trë vÒ<color=blue>gÆp<color>TriÖu ®µ chñ. ¤ng Êy ®· viÕt xong, <color=red>quyÓn s¸ch <color>, nhê ng­¬i ®em vÒ giao cho <color=blue>La Khu«ng Sinh<color>. ","B­íc thø n¨m: Trë vÒ<color=blue>C¸i Bang<color>, giao<color=red>quyÓn s¸ch<color> cho<color=blue>La Khu«ng Sinh<color>, Hoµn thµnh nhiÖm vô ")
end

function T_L40()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô N¸o Quû phong ba vµ ®¼ng cÊp cña ng­¬i t¨ng lªn cÊp 40, th× ng­¬i ®· cã thÓ tiÕp nhËn nhiÖm vô b¶o hé Tr­¬ng TuÊn. Th«ng qua viÖc hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ ®­îc th¨ng lµ Long §Çu ®Ö tö ®­îc häc vâ c«ng<color=blue>ho¹t BÊt L­u Thñ<color>. ","B­íc thø nhÊt: §i t×m TruyÒn c«ng tr­ëng l·o <color=blue>Ngôy Tñ c«ng<color>, TiÕp nhËn nhiÖm vô: Tiªu diÖt<color=blue>bän s¸t thñ<color>ng­êi Kim ®ang <color=blue>mai phôc ë La Tiªu s¬n <color>, b¶o vÖ <color=blue>Tr­¬ng TuÊn<color>an toµn ","B­íc thø hai: §Õn <color=blue> Long Quan ®éng ë La Tiªu s¬n <color> t×m thÊy vµ tiªu diÖt bän s¸t thñ Kim quèc<color=blue>®ang mai phôc ë ®ã<color>, ng­¬i nhÊt ®Şnh ph¶i lÊy ®­îc mét bøc <color=red>mËt hµm<color>. ","B­íc thø ba: Trë vÒ C¸i Bang<color=blue>gÆp<color>Ngôy Tö ¤ng, giao<color=red> mËt hµm <color> cho<color=blue>Ngôy Tö ¤ng<color>, th× ra trong bøc mËt hµm ®ã ®· viÕt ®Çy ®ñ tªn nh÷ng quan trong triÒu ®×nh cÊu kÕt víi Kim quèc, yªu cÇu ®em bøc, <color=red> mËt hµm <color>giao cho <color=blue>Tr­¬ng TuÊn<color>. ","B­íc thø t­: §Õn <color=blue> mét l÷ qu¸n bİ mËt ë D­¬ng Ch©u<color>t×m Tr­¬ng TuÊn<color=blue> <color>, giao bøc mËt hµm cho ¤ng Êy. ","B­íc thø n¨m: Trë l¹i<color=blue> C¸i Bang<color>, gÆp<color=blue> Ngôy Tö c«ng<color> b¸o tin, hoµn thµnh nhiÖm vô ")
end

function T_L50()
	Talk(10,"t_all","Sau khi hoµn thµnh nhiÖm vô b¶o hé Tr­¬ng TuÊn vµ ®¼ng cÊp cña ng­¬i ®· t¨ng lªn cÊp 50, th× ng­¬i cã thÓ tiÕp nhËn nhiÖm vô B¶n ®å Trung Nguyªn. §i ®Õn hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ §¹i Long §Çu. Häc ®­îc vâ c«ng<color=blue> Bæng §¶ ¸c CÈu; Kh¸ng Long H÷u bèi <color>. ","B­íc thø nhÊt: §Õn gÆp bang chñ<color=blue>Hµ Nh©n Ng·<color>®Ó tiÕp nhËn nhiÖm vô. giao<color=red>bøc b¶n ®å Trung Nguyªn<color>mang ®Õn<color=blue>L©m An<color> giao cho triÒu ®×nh ","B­íc thø hai: Tr­íc<color=blue>cöa Hoµng Cung<color>, bŞ vÖ binh ng¨n c¶n, kh«ng cã lÖnh bµi th«ng hµnh th× kh«ng thÓ vµo ®­îc Hoµng cung ","B­íc thø ba: T×m ®­îc <color=blue> Tr­¬ng TuÊn <color>, yªu cÇu cho m­în tÊm lÖnh bµi th«ng hµnh <color=red>®Ó vµo Hoµng Cung<color>. ","B­íc thø t­: Trë l¹i<color=blue>tr­íc cöa Hoµng Cung<color>, sau khi ®èi tho¹i víi vÖ binh, ®i vµo Hoµng Cung, gÆp l·o th¸i gi¸m<color=blue>Tµo c«ng c«ng<color>, giao <color=red>bøc b¶n ®å Trung Nguyªn <color> cho h¾n ","B­íc thø n¨m: Quay l¹i <color=blue> chç <color> Tr­¬ng TuÊn, ph¸t hiÖn ra l·o Tµo c«ng c«ng ®ã sím ®· c©u kÕt víi Kim quèc. Bøc b¶n ®å ®ã ®· bŞ g¹t lÊy mÊt råi ","B­íc thø s¸u: LÇn thø ba quay l¹i <color=blue> cæng Hoµng cung <color>, lÇn nµy Tµo c«ng c«ng sím ®· ®o¸n tr­íc, cã ®­îc lÖnh bµi th«ng hµnh vÉn kh«ng thÓ vµo ®­îc Hoµng Cung. ","B­íc thø b¶y: ng­¬i ph¶i hèi lé <color=blue> tªn tiÓu th¸i gi¸m ë cæng bªn <color>, ®i vµo Hoµng cung lÇn n÷a t¹i <color=blue> mét mËt ®¹o ë Ngù Hoa viªn <color> t×m gÆp ®­îc <color=blue>Tµo c«ng c«ng<color>. Sau khi ®¸nh b¹i bän vÖ sÜ, ®o¹t l¹i< color=red>B¶n ®å Trung Nguyªn<color>. ","B­íc thø t¸m: ng­¬i quay l¹i <color=blue> gÆp <color>Tr­¬ng TuÊn, ®­a<color=red>bøc B¶n ®å Trung Nguyªn <color>cho ¤ng ta. ","B­íc thø chİn: Trë vÒ<color=blue>C¸i Bang<color>, gÆp<color=blue>Hµ Nh©n Ng·<color> b¸o tin, hoµn thµnh nhiÖm vô. ")
end

function T_L60()
	Talk(4,"t_all","Hoµn thµnh nhiÖm vô Trung Nguyªn ®Şa ®å vµ ®¼ng cÊp trªn 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô xuÊt s­. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµm Tiªu Dao ThÇn C¸i, thuËn lîi xuÊt s­.","B­íc thø nhÊt: §Õn gÆp Ch­ëng B¸t tr­ëng l·o <color=blue>X¸ tam Tr­îng<color>®Ó tiÕp nhËn nhiÖm vô, <color=blue>T­êng V©n ®éng<color>®Ó t×m<color=red>9 c¸i tói v¶i<color>. ","B­íc thø hai: Vµo<color=blue>T­êng V©n ®éng<color>t×m trong mét c¸i B¶o r­¬ng<color=blue>t×m ®­îc<color>, 9 c¸i<color=red>tói v¶i<color>. ","B­íc thø ba: Trë l¹i<color=blue>C¸i Bang <color>, giao <color=red> 9 c¸i tói v¶i <color>giao cho Ch­ëng B¸t tr­ëng l·o <color=blue>X¸ tam Tr­îng, <color>, hoµn thµnh nhiÖm vô ")
end

function T_return()
	Talk(3,"t_all","Th«ng qua Trïng ph¶n s­ m«n, ng­¬i ®­îc th¨ng lµ tr­ëng l·o 9 tói. Häc ®­îc TuyÖt Häc chİnh ph¸i<color=blue>: Tiªu diªu c«ng vµ Tóy ®iÖp cuång vò<color>. ","B­íc thø nhÊt: Sau khi ®¼ng cÊp cña ng­¬i ®· v­ît qua 60, ng­¬i ®i gÆp bang chñ<color=blue>Hµ Nh©n Ng·<color>, xin ®­îc quay l¹i C¸i bang ","B­íc thø hai: Th«ng qua ®ãng gãp<color=red>50000 l­îng b¹c tr¾ng <color>, quay l¹i C¸i Bang ")
end

----------------- ½áÊø ---------------------------
function nothing()
end
