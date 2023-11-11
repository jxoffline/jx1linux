-- ´äÑÌ°ïÖúNPC
-- By: Dan_Deng(2003-11-21)

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Ng¹o Mai"
	
function main(sel)
	UTask_cy = GetTask(6)
	player_faction = GetFaction()
	if (player_faction == "cuiyan") then		-- ±¾ÃÅµÜ×Ó
		RestoreLife()		-- ±¾ÃÅÃâ·ÑÖÎÁÆ
		RestoreMana()
		RestoreStamina()
		Say(" Ta võa ra ®êi ®· bŞ vøt bá, may nhê Ch­ëng m«n cøu gióp. 18 n¨m nay lín lªn t¹i ®©y, tõng ngän c©y cäng cá ®Òu quen thuéc.",7,"§èi tho¹i víi Long Ngò /Uworld1000_word","T×m hiÓu ®iÓn cè bæn m«n/faction","T×m hiÓu c¸c vŞ tû muéi/member","T×m hiÓu nhiÖm vô /task_get","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 70*256) then				-- ±¾ÃÅ³öÊ¦
		if (UTask_cy == 80*256) and (GetTask(1) == 70*256) and (HaveMagic(93) == -1) then		-- ĞŞÕı´äÑÌÖØ·µÃÅÅÉºóµÄÒ»¸öBUG£¬¼¼ÄÜ±ê¼ÇÎªÎ´Ñ§¡°´Èº½ÆÕ¶É¡±
			Talk(1,""," T©m tr¹ng cña tû cã chót hçn lo¹n, ®õng lo l¾ng n÷a, b©y giê ®· tèt råi!")
		else
			Say(" S­ tû khã thÓ trë vÒ, lÇn nµy ®Õn th¨m tû muéi ta cã chuyÖn g× kh«ng?",6,"¤n l¹i chuyÖn n¨m x­a bæn m«n/faction","¤n l¹i c¸c tû muéi n¨m x­a/member","Ta cßn cã thÓ gióp g× kh«ng/task_get","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng hái n÷a!/nothing")
		end
	elseif (player_faction ~= "") then			-- ·Ç±¾ÃÅ³öÊ¦¡¢ÆäËüÃÅÅÉ£¨ÃÅÅÉ²»Îª¿Õ¼´Ö¸·ÇĞÂÊÖ£©
		Say(" Xin hái ng­¬i ®Õn Thóy Yªn m«n ®Ó th¨m th©n hay th¨m b¹n? Cã g× kh«ng biÕt cø hái TiÓu muéi.",3,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c tû muéi Thóy Yªn/member","Kh«ng hái n÷a!/nothing")
	else													-- ĞÂÊÖ
		Say(" Tû ®Õn th¨m viÕng hay lµ b¸i s­? Cã g× kh«ng hiÓu cø hái muéi.",4,"T×m hiÓu quı ph¸i/faction","T×m hiÓu c¸c tû muéi Thóy Yªn/member","T×m hiÓu ®iÒu kiÖn nhËp m«n/task_get","Kh«ng hái n÷a!/nothing")
	end
end

----------------- ÃÅÅÉ½éÉÜ²¿·İ ----------------------------
function faction()
	Say(" ThÕ Tû muèn muéi giíi thiÖu g× vÒ bæn m«n?",5,"Khëi nguyªn m«n ph¸i/F1","VŞ trİ ®Şa lı /F2","§Şa vŞ giang hå /F3","§Æc s¾c m«n ph¸i/F4","Kh«ng hái n÷a!/nothing")
end

function F1()
	Say(" Tæ s­ s¸ng lËp m«n ph¸i do bŞ ®µn «ng phô b¹c, nªn Èn c­ ë biªn giíi V©n Nam, mét h«m trªn ®­êng ®i gÆp mÊy c« g¸i còng bŞ hÊt hñi ruång bá, nhí ®Õn ngµy x­a, sinh lßng tr¾c Èn nªn mang vÒ nu«i d­ìng vµ truyÒn d¹y vâ c«ng. Thuı Yªn cña chóng ta còng tõ ®ã mµ ®­îc s¸ng lËp.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F2()
	Say(" N¬i ®©y n»m bªn bê NhÜ H¶i Th­¬ng S¬n §¹i Lı phong c¶nh h÷u t×nh.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F3()
	Say(" Bæn ph¸i vµ §­êng M«n ®­îc gäi lµ 'Vâ L©m NhŞ M«n', dùa vµo sù thÇn bİ mµ danh ®éng giang hå, lµ giÊc méng võa ®Ñp võa m¬ hå cña c¸c trang nam tö. §èi víi ng­êi ngoµi mµ nãi th× kh«ng ai cã thÓ nãi râ m«n ph¸i Thuı Yªn m«n chóng ta lµ thiªn ®­êng hay ®Şa ngôc.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F4()
	Say(" Do ®Ö tö cña bæn ph¸i ai còng lµ nh÷ng tuyÖt s¾c giai nh©n, nªn khiÕn cho c¸c nam tö ®Òu rung ®éng ngay c¶ trong m¬ vÉn cßn thÌm muèn. Cho nªn s­ tæ s¸ng lËp m«n ph¸i ®· ®­a ra mét quy t¾c. V× ®Ó tr¸nh cho c¸c ®Ö tö cña Thuı yªn m«n kh«ng bŞ ®µn «ng lõa g¹t vµ ruång bá, phµm lµ nam tö muèn vµo Thuı Yªn m«n th× ph¶i cã vâ c«ng tuyÖt thÕ vµ ph¶i giao ra mét vËt quı hiÕm, ®ång thêi ®êi ®êi kh«ng ®­îc rêi khái Thuı Yªn M«n.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ³ÉÔ±½éÉÜ²¿·İ ----------------------------
function member()
	Say(" ThÕ Tû muèn t×m hiÓu vÒ vŞ tû muéi nµo?",11,"Ch­ëng m«n Do·n Hµm Yªn/Myun","H¶i §­êng Sø Gi¶ LÖ Thu Thñy/Mli","ThñyTiªn Sø Gi¶ Yªn HiÓu Tr¸i/Myan","T­êng Vi Sø Gi¶ Hµ Mé TuyÕt /Mhe","Lª Hoa Sø Gi¶ Chung Linh Tó /Mzhong","Xu©n H­¬ng bµ bµ /Mchun","Nh­îc Lan/Mruo","Phong Tróc/Mfeng","TiÕu Cóc/Mxiao","Ng¹o Mai/Mao","Kh«ng hái n÷a!/nothing")
end

function Myun()
	Say("Ch­ëng m«n Do·n Hµm Yªn   VŞ trİ: Thóy Yªn lÇu   Täa ®é: 35,75<enter> Do·n Ch­ëng m«n lín lªn t¹i Thuı Yªn m«n, sau nµy quen biÕt víi §­êng m«n §­êng NhÊt TrÇn, tr¶i qua nhiÒu gian khæ cuèi cïng sèng ®­îc víi nhau. HiÖn t¹i Thuı Yªn §­êng m«n ®­îc ng­êi ®êi ca th­ëng.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")

end

function Mli()
	Say("H¶i §­êng Sø Gi¶ LÖ Thu Thñy<enter> LÖ s­ tû tİnh c¸ch cao ng¹o, rÊt ghĞt ®µn «ng, nªn mét mùc ph¶n ®èi ch­ëng m«n kÕt th©n cïng víi §­êng NhÊt TrÇn.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Myan()
	Say("Thñy Tiªn Sø gi¶ Yªn HiÓu Tr¸i, VŞ trİ: Thñ Ngäc S¶nh, To¹ ®é: 43, 90<enter>tõ khi Yªn s­ tØ cßn nhá mÉu th©n bŞ phô th©n ruång bá, céng thªm bŞ bÖnh hiÓm nghÌo, bŞ ng­êi ta l¨ng nhôc mµ chÕt, t¹o ra mét vÕt th­¬ng s©u ®Ëm trong lßng tû Êy. Cho nªn tuy bÒ ngoµi yÓu ®iÖu, nh­ng néi t©m rÊt kiªn c­êng. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mhe()
	Say("T­êng Vi Sø Gi¶ Hµ Mé TuyÕt. VŞ trİ t¹i s¶nh B¸ch Hoa. Täa ®é: 52, 85<enter> Hµ tû tû dŞu dµng linh ho¹t, tÊt c¶ c¸c tû muéi chóng ta ai còng ®Òu thİch tû Êy, nh­ng tªn D­¬ng Hå ë Thiªn V­¬ng bang v× thï nhµ nî n­íc g× ®ã mµ kh«ng ngã ngµng ®Õn Hµ tû tû. ThËt ®¸ng th­¬ng. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mzhong()
	Say("Lª Hoa Sø Gi¶ Chung Linh Tó<enter>Chung muéi muéi nhá tuæi nhÊt, nh­ng lµ ng­êi cã tiÒn ®å nhÊt. Do cha mÑ cña muéi Êy bŞ giÆc Kim s¸t h¹i, ng­êi th©n bŞ l­u l¹c cho nªn rÊt c¨m thï giÆc Kim, chuyªn t©m luyÖn tËp vâ thuËt ®Ó ®îi ngµy b¸o thï cho cha mÑ.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mchun()
	Say("Xu©n H­¬ng bµ bµ   VŞ trİ: HËu hoa viÖn   Täa ®é: 40,74<enter> Xu©n H­¬ng bµ bµ lµ a hoµn cña ch­ëng m«n lËp ph¸i, bµ ta ®èi xö víi chóng ta v« cïng nh· nhÆn vµ th©n thiÕt.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mruo()
	Say("Nh­îc Lan  VŞ trİ: Qu·ng tr­êng   Täa ®é: 48,84  Phô tr¸ch: Giao dŞch binh khİ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mfeng()
	Say("Phong Tróc   VŞ trİ: Qu·ng tr­êng   Täa ®é: 51,85   Phô tr¸ch: Giao dŞch trang bŞ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mxiao()
	Say("TiÕu §µo   VŞ trİ: Qu·ng tr­êng   Täa ®é: 53,86   Phô tr¸ch: Giao dŞch d­îc phÈm",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mao()
	Say("Ng¹o Mai    ®©y chİnh lµ ta! ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ÈÎÎñ½éÉÜ²¿·İ ----------------------------
function task_get()
	UTask_cy = GetTask(6)
	if (UTask_cy < 10*256) then	-- Î´ÈëÃÅ
		Say("<#> Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô §¹i M¹n §µ La hoa, hiÖn ®·"..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_enroll","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 10*256) and (UTask_cy < 20*256) then
		Say("<#> NhiÖm vô cña ng­¬i hiÖn giê lµ nhiÖm vô Thóy Vò Tr©m, hiÖn ®·"..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L10","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 20*256) and (UTask_cy < 30*256) then
		Say("<#> Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô §¹i M¹n §µ La hoa, hiÖn ®·"..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L20","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 30*256) and (UTask_cy < 40*256) then
		Say("<#> NhiÖm vô hiÖn giê cña ng­¬i lµ Vò ı Nghª Th­êng. HiÖn ®· "..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L30","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 40*256) and (UTask_cy < 50*256) then
		Say("<#> Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô DiÖt ¸c B¸ §iÓm Th­¬ng S¬n, hiÖn ®·"..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L40","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 50*256) and (UTask_cy < 60*256) then
		Say("<#> Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô B¾t trém Thiªn TÇm Th¸p, hiÖn ®·"..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L50","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 60*256) and (UTask_cy < 70*256) then
		Say("<#> Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Bİ mËt Mª cung cÊm ®Şa, hiÖn ®·"..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L60","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_cy >= 70*256) and (UTask_cy < 80*256) then
		Say("<#> Ng­¬i hiÖn ®ang tiÕp nhËn lµ nhiÖm vô Trïng ph¶n s­ m«n, hiÖn ®·"..UTask_cy.."<#>.",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_return","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	else
		Say("<#> Ng­¬i b©y giê cã thÓ tù do ra vµo m«n ph¸i, t¹m thêi kh«ng cã nhiÖm vô míi, hiÖn ®·"..UTask_cy.."<#>.",3,"T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	end
end

function T_all()
	Say(" ThÕ Tû muèn t×m hiÓu nhiÖm vô nµo?",10,"NhiÖm vô nhËp m«n/T_enroll","NhiÖm vô Thóy Vò tr©m/T_L10","NhiÖm vô §¹i M¹n §µ La hoa/T_L20","NhiÖm vô Vò Y Nghª Th­êng/T_L30","NhiÖm vô §iÓm Th­¬ng s¬n diÖt trõ ¸c B¸ /T_L40","NhiÖm vô b¾t c­íp ë Thiªn TÇm Th¸p/T_L50","NhiÖm vô mª cung cÊm ®Şa/T_L60","NhiÖm vô trïng ph¶n s­ m«n/T_return","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Muèn nhËp m«n häc vâ, chØ cÇn thuéc tİnh hÖ Thñy, ch­a nhËp ph¸i kh¸c vµ ®¼ng cÊp trªn 10, ®Õn bÊt kú T©n Thñ Th«n ®èi tho¹i víi Hoa sø cña bæn m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­.")
end

function T_L10()
	Talk(4,"t_all","Sau khi nhËp m«n, ®ång thêi ®¼ng cÊp ®¹t trªn cÊp 10, b¹n cã thÓ tiÕp nhËn nhiÖm vô Thóy Vò Tr©m. V­ît qua nhiÖm vô nµy b¹n ®­îc th¨ng lµm Tam PhÈm Hoa Sø, häc ®­îc <color=blue>Thóy Yªn §ao ph¸p vµ Thóy Yªn song ®ao<color>. ","B­íc 1: T¹i <color=blue>lÇu Thóy Yªn<color> t×m gÆp <color=blue>ch­ëng m«n Do·n Hµm Yªn<color> TiÕp nhËn nhiÖm vô ®Õn <color=blue>c¸nh rõng phİa ®«ng nam<color> t×m c©y <color=red> Thóy Vò tr©m<color> bŞ mÊt. ","B­íc 2: Trong khu rõng phİa ®«ng nam ®¸nh b¹i <color=blue>Háa hå<color> nhÆt vÒ c©y <color=red> Thóy Vò tr©m<color> ","B­íc 3: VÒ ®Õn <color=blue>lÇu Thóy Yªn<color> phôc mÖnh víi ch­ëng m«n <color=blue>Do·n Hµm Yªn<color>, giao <color=red> Thóy Vò tr©m<color> nhiÖm vô hoµn thµnh ")
end

function T_L20()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm vô Thóy Yªn tr©m vµ ®¼ng cÊp trªn 20, b¹n cã thÓ nhËn nhiÖm vô §¹i Man §µ La Hoa. V­ît qua nhiÖm vô nµy b¹n sÏ ®­îc phong lµ: <color=blue>NhŞ PhÈm Hoa Sø<color>, häc ®­îc <color=red>B¨ng T©m Tr¸i ¶nh<color> ","B­íc 1: Trong <color=blue>Thñ Ngäc s¶nh<color>, gÆp <color=blue>Yªn HiÓu Tr¸i<color> nhËn nhiÖm vô ®i ®Õn <color=blue>v¸ch nói phİa t©y b¾c<color> h¸i <color=red>10 b«ng hoa §¹i Man §µ La<color> ","B­íc 2: Khi h¸i hoa Man §µ La ë v¸ch nói t©y b¾c th× cÇn ph¶i cÈn thËn <color=blue>tr­íc khi ®éc tİnh ph¸t t¸n<color> ph¶i quay vÒ <color=blue>Thñ Ngäc s¶nh<color> gi¶i ®éc nÕu kh«ng chÊt ®éc sÏ ph¸t t¸n toµn th©n ","B­íc 3: H¸i ®­îc 10 ®ãa §¹i M¹n §µ La hoa, vÒ Thñ Ngäc s¶nh phôc mÖnh, hoµn thµnh nhiÖm vô.")
end

function T_L30()
	Talk(7,"t_all","Sau khi hoµn thµnh nhiÖm vô §¹i Man §µ La Hoa vµ ®¼ng cÊp ®¹t trªn 30, b¹n cã thÓ tiÕp nhËn nhiÖm vô Vò Y Nghª Th­êng. V­ît qua nhiÖm vô nµy b¹n sÏ ®­îc phong lµ: NhÊt PhÈm Hoa Sø vµ sÏ ®­îc häc <color=blue>Vò §¶ Lª Hoa, Phï V©n T¶n TuyÕt<color>. ","B­íc 1: T¹i <color=blue>®iÖn B¸ch Hoa<color>, gÆp <color=blue>Hµ Mé TuyÕt<color> nhËn nhiÖm vô ®i ®Õn <color=blue>§oµn l·o n«ng<color> trong <color=blue> thµnh §¹i Lı<color> t×m hái bİ quyÕt trång <color=blue> Vò Y Nghª Th­êng<color> ","B­íc 2: §Õn thµnh §¹i Lı t×m ®Õn §oµn l·o n«ng ph¸t hiÖn «ng Êy ®au buån v× ®øa ch¸u g¸i bŞ bän thæ phØ trªn <color=blue>§iÓm Th­¬ng S¬n<color> b¾t ®i, bÌn ®i cøu <color=blue>ch¸u g¸i <color> «ng Êy tr­íc. ","B­íc 3: §Õn <color=blue>®éng thæ phØ ë §iÓm Th­¬ng s¬n<color>, ®¸nh b¹i <color=blue>tªn thñ lÜnh thæ phØ<color>, cøu tho¸t ®øa ch¸u cña §oµn l·o n«ng. ","B­íc 4: §­îc biÕt c¸ch trång Vò Y Nghª Th­êng cÇn ph¶i cã <color=blue>c¸ Ng©n TuyÕt<color> sèng trong <color=blue>NhÜ H¶i<color>, <color=red>Bİch Th­êng Ph­îng §iÖp<color> sèng c¹nh <color=blue>Hå ®iÖp TuyÒn<color>, vµ <color=red>con giun ®Êt ®á<color> ë gÇn <color=blue>V©n N«ng ®×nh<color>. ","B­íc 5: §Õn NhÜ H¶i t×m <color=blue>thuyÒn gia<color> mua <color=red>c¸ Ng©n TuyÕt<color>, ®Õn bê Hå §iÖp TuyÒn lÊy ®­îc Bİch Th­êng Ph­îng §iÖp, vµ ®µo lÊy giun ®Êt ®á gÇn N«ng V©n ®×nh ","B­íc 6: VÒ ®Õn <color=blue>B¸ch Hoa §iÖn<color> lÊy bİ quyÕt trång cÊy Vò Y Nghª Th­êng, nãi víi <color=blue>Hµ Mé TuyÕt<color>, ®ång thêi lÊy c¸ Ng©n TuyÕt, Bİch Th­êng Ph­îng §iÖp vµ giun ®Êt ®á giao cho c« Êy, nhiÖm vô hoµn thµnh. ")
end

function T_L40()
	Talk(5,"t_all","Hoµn thµnh nhiÖm vô ®ång thêi ®¼ng cÊp ®¹t 40, b¹n cã thÓ nhËn nhiÖm vô trõ ¸c b¸ §iÓm Th­¬ng S¬n. V­ît qua nhiÖm vô nµy b¹n sÏ trë thµnh Hoa Tiªn sø gi¶, ®­îc häc <color=blue>Hµn B¨ng Hé Th©n<color> ","B­íc 1: GÆp <color=blue>Yªn HiÓu Tr¸i<color> ë <color=blue>Thiªn §iÖn<color>, nhËn nhiÖm vô diÖt trõ <color=blue>¸c b¸<color> c­ìng ®o¹t thiÕu n÷ khĞt tiÕng trong <color=blue>thµnh §¹i Lı<color> ","B­íc 2: §Õn thµnh §¹i Lı, t×m <color=blue>tªn ¸c b¸<color>, ph¸t hiÖn ra mét <color=blue>lèi ®i bİ mËt xuèng lßng ®Êt<color> ë gãc v­ên. §i vµo mËt ®¹o ®¸nh b¹i <color=blue>trî thñ cña h¾n<color>, gi¶i cøu nh÷ng thiÕu n÷ trong mËt ®¹o, ®ång thêi biÕt tªn ¸c b¸ ®· b¾t vµi c« kh¸c lªn <color=blue>§iÓm Th­¬ng S¬n <color> råi. ","B­íc 3: §Õn <color=blue>§iÓm Th­¬ng s¬n ®éng<color>, ®¸nh b¹i <color=blue>trî thñ, hé viÖn, b¶o tiªu cña tªn ¸c b¸<color>, lÊy ®uîc <color=red>3 ch×a khãa më cöa<color>, cøu ®­îc nh÷ng <color=blue> thiÕu n÷<color> bŞ nhèt trong phßng tèi. ","B­íc 4: VÒ ®Õn <color=blue>Thiªn §iÖn Nga Mi<color>, gÆp Yªn HiÓu Tr¸i phôc mÖnh, nhiÖm vô hoµn thµnh. ")
end

function T_L50()
	Talk(5,"t_all","Sau khi hoµn thµnh nhiÖm vô §iÓm Th­¬ng s¬n diÖt ¸c b¸ vµ ®¼ng cÊp ®¹t trªn 50, b¹n cã thÓ nhËn nhiÖm vô Thiªn TÇm Th¸p. V­ît qua nhiÖm vô nµy b¹n sÏ trë thµnh Hoa Tinh, häc ®­îc <color=blue>TuyÕt ¶nh <color> ","B­íc 1: GÆp <color=blue>ch­ëng m«n Do·n Hµm Yªn<color> ë <color=blue>Thóy Yªn LÇu<color>, tiÕp nhËn nhiÖm vô, trî gióp Sïng Th¸nh tù b¾t <color=blue> ®¹o tÆc<color> ®· lÊy trém <color=red>Vò §ång Quan ¢m<color> ","B­íc 2: §Õn <color=blue>Sïng Th¸nh tù<color> ®èi thäai <color=blue>H­ Viªn ph­¬ng tr­îng<color>, ®­îc biÕt bän c­íp ®· ch¹y vµo trong <color=blue>Thiªn TÇm Th¸p<color>. ","B­íc 3: §i vµo Thiªn TÇm Th¸p, mçi tÇng lÇu ®Òu b¸nh b¹i bän ®¹o tÆc, ®o¹t l¹i <color=red>Vò §ång Quan ¢m<color>. ","B­íc 4: VÒ ®Õn <color=blue>Thóy Yªn lÇu<color>, gÆp Do·n Hµm Yªn phôc mÖnh, nhiÖm vô hoµn thµnh. ")
end

function T_L60()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô Thiªn TÇm Th¸p vµ ®¼ng cÊp ®¹t ®Õn 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô CÊm ®Şa mª cung. Hoµn thµnh nhiÖm vô nµy, ng­¬i ®uîc phong lµm Hoa Tiªn, thuËn lîi xuÊt s­.","B­íc 1: GÆp <color=blue>Xu©n H­¬ng bµ bµ<color> ë <color=blue>HËu Hoa Viªn<color>, tiÕp nhËn nhiÖm vô, ®Õn <color=blue>CÊm §Şa<color> t×m ra sù thËt vÒ lêi truyÒn m«n quy. ","B­íc 2: §Çu tiªn ë <color=blue>cÊm ®Şa mª cung<color> t×m ®­îc mét chiÕc <color=red>kh¨n lôa<color>, sau ®ã vµo ®Õn vïng cÊm ®Şa cuèi cïng lµ <color=blue>§o¹n Tr­êng Cèc<color> ","B­íc 3: ®èi tho¹i víi mét <color=blue>«ng l·o v« danh<color> trong §o¹n Tr­êng Cèc, nghe «ng Êy nãi vÒ nh÷ng chuyÖn cña vŞ s­ tæ lËp ph¸i, vµ cã ®­îc <color=red>bøc th­<color> ghi chĞp mäi viÖc ","B­íc 4: Sau khi trë l¹i <color=blue>HËu Hoa Viªn<color>, nãi cho Xu©n H­¬ng bµ bµ nghe nh÷ng ®iÒu m×nh ®· t×m ra. ","B­íc 5: §Õn lÇu <color=blue>Thóy Yªn<color> mang <color=red>th­<color> giao cho <color=blue>ch­ëng m«n<color>, nhiÖm vô hoµn thµnh ")
end

function T_return()
	Talk(3,"t_all","Sau khi thµnh tµi xuèng nói, ®ång thêi ®¼ng cÊp ®· ®¹t trªn 60, b¹n cã thÓ trïng ph¶n s­ m«n. SÏ ®­îc th¨ng lµm Hoa ThÇn, häc ®­îc tuyÖt häc trÊn ph¸i <color=blue>Môc D· L­u Tinh, Bİch H¶i TriÒu Sinh, vµ B¨ng Cèt TuyÕt T©m <color> ","B­íc 1: Sau khi ®¹t ®¼ng cÊp qu¸ cÊp 60, gÆp <color=blue>Do·n Hµm Yªn<color> t¹i <color=blue> Phßng chİnh<color>, cÇu xin bµ cho quay vÒ Thóy Yªn ","B­íc 2: Giao n¹p <color=red>50000 l­îng b¹c<color>, trë vÒ Thóy Yªn m«n ")
end

----------------- ½áÊø ---------------------------
function nothing()
end
