
Include("\\script\\task\\newtask\\newtask_head.lua");
-- Include("\\script\\task\\newtask\\master\\xiepai\\giveaward.lua");
Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

--   ////////////////////////////
--  //  Ğ°½ÌÖ÷ÏßÈÎÎñÄ£¿éÊµÀı  //
-- ////////////////////////////

-- Edited by peres
-- 2004/12/23

-- ¹ı³Ìº¯ÊıÃûÃüÃûĞÎÊ½£ºtask_ + level(ÈÎÎñµÈ¼¶)_ + ¹ı³Ì»·½ÚID


--   ///////////////////////////////
--  //  20 ¼¶Ö÷ÏßÈÎÎñµÄ´¦Àí¹ı³Ì  //
-- ///////////////////////////////

-- ÓëÖìÏÉÕòÔÆ¶ùµÄ¶Ô»°
function task_level20_00()

		-- ÅĞ¶ÏÍæ¼ÒµÄĞÔ±ğËµ²»Í¬µÄ»°
		if (GetSex()==0) then
			Talk(10,"task_level20_01","¤!Chµo hiÖp kh¸ch! T×m ta cã viÖc g×?","µ......Nghe nãi muéi biÕt 'Thiªn Hoµng Long Khİ'?","Ai da! §õng nh¾c ®Õn Long khİ Hæ khİ, nãi chót chuyÖn vui víi n« gia ®­îc kh«ng?","ViÖc nµy...... NÕu muéi biÕt tin tøc 'Thiªn Hoµng Long Khİ'......cã thÓ nãi víi ta ®­îc kh«ng......","Hõm! Muèn moi tin cña ta ®©u cã dÔ!","Muéi muèn thÕ nµo míi chŞu nãi ra tung tİch cña Long Khİ?","§Ó xem ng­¬i cã thÓ lµm l·o n­¬ng vui kh«ng?","ChuyÖn nµy......","ChuyÖn nµy c¸i g×? Ta chØ muèn b¶o ng­¬i ®Õn L©m An t×m <color=yellow>Th¸i C«ng C«ng<color> lÊy 1 b×nh Thiªn H­¬ng Ngäc Chi Cao."," Ta t­ëng......®¬n gi¶n th«i, t×m <color=yellow> Th¸i C«ng C«ng<color> lÊy Thiªn H­¬ng Ngäc Chi Cao ®óng kh«ng? H·y chê tin ta!");
		else
			Talk(8,"task_level20_01","TiÓu muéi t×m tû tû cã viÖc g×?","µ......Tû tû biÕt tung tİch 'Thiªn Hoµng Long Khİ'?","Thiªn Hoµng Long Khİ? Nghe ra h×nh nh­ lµ thø ®¾t tiÒn µ......TiÓu muéi hái viÖc nµy ®Ó lµm g×?","Ta rÊt hiÕu kú, muèn xem thö nã lµ c¸i g× mµ ai còng muèn cã vËy?","µ......GÇn ®©y ta gÆp mét chuyÖn khã kh¨n, kh«ng biÕt muéi muéi cã thÓ gióp ta ®­îc kh«ng?","§­îc! Tû tû cã chuyÖn g× xin cø nãi th¼ng","GÇn ®©y khİ trêi se l¹nh, Th¸i C«ng C«ng <color=yellow>ë L©m An<color> cã 1 lo¹i Thiªn H­¬ng Ngäc Chi Cao cã thÓ chèng phong hµn. Muéi muéi cã thÓ gióp ta ®Õn gÆp Th¸i C«ng C«ng lÊy 1 b×nh vÒ kh«ng?","RÊt ®¬n gi¶n, Tû tû h·y ®îi ta.");
		end
end

-- ÓëÔÆ¶ùµÄ¶Ô»°½áÊø£¬ÕıÊ½¿ªÊ¼Ğ°½ÌÖ÷Ïß£¬µ¯³öÈÎÎñÃæ°æ
function task_level20_01()
	nt_setTask(1003,20)
	DelItem(506)
end

-- ÓëÁÙ°²µÄ²Ì¹«¹«¶Ô»°
function task_level20_02()
	Talk(8,"task_level20_03","Nghe nãi Th¸i C«ng C«ng cã 1 lo¹i Thiªn H­¬ng Ngäc Chi Cao?","Cã th× cã ®Êy, nh­ng ng­¬i muèn lµm gi?","Xem ra Th¸i C«ng C«ng h«m nay t©m tr¹ng kh«ng tèt l¾m?","H«m tr­íc bŞ 1 tªn TiÓu Th¸i gi¸m lÊy trém cña ta 1 pho t­îng Kim PhËt, ®ã lµ Tóc Kim Xİch PhËt, thËt lµ tøc qu¸!","Trong cung còng cã chuyÖn mÊt trém sao? Tªn Th¸i gi¸m ®ã hiÖn giê ë ®©u?","Hõm! Tªn sóc sinh ®ã ®· trèn lªn <color=yellow>Phôc Ng­u s¬n<color>.","T×m ng­êi lµ trß mµ ta thİch nhÊt, nÕu ta ®em t­îng PhËt trë vÒ C«ng C«ng cã thÓ cho ta 1 b×nh Thiªn H­¬ng Ngäc Chi Cao kh«ng?","ChØ cÇn ng­¬i ®em t­îng Kim PhËt vÒ ®õng nãi 1 b×nh c¶ r­¬ng ta còng cho ng­¬i!");	
end

-- Óëãê¾©µÄ²Ì¹«¹«¶Ô»°½áÊø£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level20_03()
	nt_setTask(1003,30)
end

-- É±ËÀĞ¡Ì«¼àºó£¬ÌáÊ¾ÒÑ¾­ÄÃµ½½ğ·ğ£¨ÈÎÎñ±äÁ¿Îª 35£©£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level20_04()
	Msg2Player("B¹n nhËn ®­îc 1 Tóc Kim PhËt T­îng!")
end

-- µÃµ½½ğ·ğºó£¬»Øµ½ãê¾©Óë²Ì¹«¹«µÄ¶Ô»°
function task_level20_05()
	Talk(3,"task_level20_06","Th¸i C«ng C«ng! §©y cã ph¶i t­îng Kim PhËt cña «ng bŞ c­íp ®i?","A! Kh«ng ngê ng­¬i cã thÓ lÊy vÒ cho ta!","B¹n trÎ lµm tèt l¾m! §©y Thiªn H­¬ng Ngäc Chi Cao cña ng­¬i.");
end

-- Óëãê¾©µÄ²Ì¹«¹«¶Ô»°½áÊø£¬µÃµ½ÌìÏãÓñÖ¬¸à£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level20_06()
	nt_setTask(1003,50)
	Msg2Player("B¹n nhËn ®­îc 1 b×nh Thiªn H­¬ng Ngäc Chi Cao!")
end



--   ///////////////////////////////
--  //  30 ¼¶Ö÷ÏßÈÎÎñµÄ´¦Àí¹ı³Ì  //
-- ///////////////////////////////

-- ÄÃµ½ÌìÏãÓñÖ¬¸àºóÓëÔÆ¶ùµÄ¶Ô»°
function task_level30_01()
	Talk(8,"task_level30_02","Sao d¹o nµy nhiÒu ng­êi ®Õn t×m ta hái vÒ viÖc nµy vËy nhØ?","Tû cã biÕt lµm viÖc nµy khã kh¨n l¾m kh«ng, h·y cho ta biÕt tû thÊy 'TrÊn Minh Chi Liªn' ë ®©u?","Ng­¬i nãi sîi d©y chuyÒn nµy µ......ThËt ra mÊy n¨m tr­íc ta cã nghe mét ng­¬i ®µn «ng tõng nãi......","HoÆc lµ mÊy n¨m tr­íc nghe qua...","§óng vËy! Cho nªn tr­íc tiªn b¶o ng­¬i gióp ta t×m b×nh g× ®ã mµ th«i, nÕu nh­ ta cã ta ®· b¶o ng­¬i ®i lÊy viªn minh ch©u trªn ®Çu Hoµng Th­îng vÒ råi.","Ng­êi ch¬i:......ThÕ c« gÆp qua ng­êi ®µn «ng cã sîi d©y chuyÒn ®ã kh«ng?","Lµ mét vŞ Tiªu s­ ®Õn tõ <color=yellow>D­¬ng Ch©u<color>, ngoµi ra ta còng kh«ng ®­îc râ.","Tiªu S­ ë <color=yellow>D­¬ng Ch©u<color>? §­îc! Ta ®i t×m h¾n!");
end

-- ÓëÔÆ¶ùµÄ¶Ô»°½áÊø£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ£¬ÔÚ´Ë·¢Óè½±Àø
function task_level30_02()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,100)
	
	myText1 = "B¹n nhËn ®­îc 30.000 ®iÓm kinh nghiÖm"
	myText2 = "1 con ngùa cÊp 20"
	myText3 = "Mét ®«i giµy"
	
	
	if (curCamp==2) then
		AddOwnExp(30000)
		AddItem(0,10,2,1,1,1)  --Ôö¼Ó20¼¶Âí
		AddGoldItem(0,184) --Ôö¼ÓÒ»Ë«20ÅÜµÄĞ¬×Ó
		ex_add_xp_level20();
		
		Msg2Player("B¹n nhËn ®­îc"..myText1);
		Msg2Player("B¹n nhËn ®­îc"..myText2);
		Msg2Player("B¹n nhËn ®­îc"..myText3);
		
		Say("ThÊy ng­¬i cùc khæ v× ta, ta tÆng ng­¬i vËt nµy: <enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color><enter><color=yellow>"..myText3.."<color>",0);		
	else
		AddOwnExp(30000)
		
		Msg2Player("B¹n nhËn ®­îc"..myText1);
		
		Say("ThÊy ng­¬i cùc khæ v× ta, ta tÆng ng­¬i vËt nµy: <enter><enter><color=yellow>"..myText1.."<color>",0);
	end
	
end


-- ÓëÑïÖİïÚÊ¦µÄ¶Ô»°
function task_level30_03()
	Talk(3,"task_level30_03_01"," Xin hái vŞ §¹i ca cã biÕt tung tİch cña 'TrÊn Minh Chi Liªn' kh«ng?","B¹n trÎ, ng­¬i nghe tin nµy tõ ®©u vËy? Tr­íc ®©y cã nghe Tiªu ®Çu H¹ HÇu Phôc cã mét sîi d©y chuyÒn ®Æc biÖt, nh­ng kh«ng biÕt lµ 'TrÊn Minh Chi Liªn' g× ®ã.","ThÕ b©y giê H¹ HÇu Phôc ë ®©u?");
end

-- ÅĞ¶ÏÍæ¼ÒÊÇ·ñÒÑ¾­´ïµ½ÁË 30 ¼¶
function task_level30_03_01()
	if (GetLevel() >= 30) then
		nt_setTask(1003,109)
		task_level30_03_04()
	else
		task_level30_03_02()
	end
end


-- Èç¹ûÃ»ÓĞ´ïµ½ 30 ¼¶Ê±µÄ¶Ô»°Óë¸Ä±äÈÎÎñ±äÁ¿
function task_level30_03_02()
	nt_setTask(1003,108)
	Talk(2,"","Hai ngay n÷a ta cã mét chuyÕn tiªu, ®­êng rÊt xa, kh«ng biÕt bao giê míi vÒ.","Ng­¬i hiÖn nay cßn yÕu qu¸, hay lµ ®îi ®Õn cÊp <color=yellow>cÊp 30<color> h·y ®Õn t×m h¾n.");
end

-- µ±ÉÏÒ»´ÎµÈ¼¶Î´¹» 30 ¼¶±»¾Ü¾ø£¬Õâ´Î´ïµ½Ìõ¼şÊ±ÔÙ»ØÀ´ÓëïÚÊ¦¶Ô»°
function task_level30_03_03()
	Talk(2,"task_level30_04","LÇn tr­íc hái H¹ HÇu Phôc ë ®©u, b©y giê cã thÓ tr¶ lêi ta råi chø?","H¾n hiÖn ®ang chuyÓn tiªu ë <color=yellow>Thanh Thµnh s¬n<color>, kh«ng biÕt lóc nµo míi vÒ.");
end

-- Èç¹ûÍæ¼ÒµÈ¼¶´ïµ½ÁË 30 ¼¶
function task_level30_03_04()
	Talk(1,"task_level30_04","H¾n hiÖn ®ang chuyÓn tiªu ë <color=yellow>Thanh Thµnh s¬n<color>, kh«ng biÕt lóc nµo míi vÒ.");
end

-- ÓëÑïÖİïÚÊ¦¶Ô»°½áÊø£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level30_04()
	nt_setTask(1003,110)
end

-- ÓëÏÄºî¸´Õ½¶·²¢ÇÒÊ¤Àûºó£¬ÓëÆä¶Ô»°
function task_level30_05()
	Talk(6,"task_level30_06","Nghe nãi huynh ®ang gi÷ 'TrÊn Minh Chi Liªn'?","Hõ......Th× ra ng­¬i muèn t×m mãn ®ã......Nh­ng m­êi mÊy n¨m tr­íc ®· bŞ ng­êi ®µn bµ ®ã lÊy ®i!","Ng­êi ®µn bµ nµo? ¤ng h·y nãi râ h¬n!","Chİnh lµ Th¸i Nghª vî ta......Nh­ng Thiªn h¹ réng lín, ng­¬i muèn t×m bµ ta th× h¬i khã, ha ha ha......","Th¸i Nghª......?","Kh«ng biÕt lµ ai, hay lµ ®i hái <color=yellow>V©n Nhi<color>, cã thÓ c« ta biÕt.")
end

-- ÓëÏÄºî¸´µÄ¶Ô»°½áÊøºó£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level30_06()
--	nt_setTask(1003,130)
	Msg2Player("B¹n ®· ®¸nh b¹i H¹ HÇu Phôc, quay vÒ t×m V©n Nhi!");
end

-- »Øµ½ÖìÏÉÕòÓëÔÆ¶ùµÄ¶Ô»°
function task_level30_07()
	Talk(9,"task_level30_08","Ng­¬i véi v· quay l¹i t×m ta cã viÖc g×?","Ta ®Õn hái th¨m hµnh tung 1 ng­êi con g¸i.","C« g¸i nµo khiÕn ng­¬i ®iªn ®¶o thÕ?","HiÓu lÇm råi! Ng­êi ®ã lµ Th¸i Nghª vî tr­íc cña Tiªu s­ H¹ HÇu Phôc.","Ng­¬i muèn biÕt chuyÖn g×?",".....….","Ng­¬i h·y ®Õn Long TuyÒn th«n t×m <color=yellow>Phã L«i Th­<color>, Y tù x­ng lµ Giang Nam V¹n Sù Th«ng, c¶ vïng Giang Nam chuyÖn g× còng biÕt.","Cã ng­êi nh­ thÕ ­? §Ó ta ®i xem thö.","LÇn sau ®õng ®i tay kh«ng ®Õn!");
end

-- ÓëÔÆ¶ùµÄ¶Ô»°½áÊøºó£¬¸Ä±äÈÎÎñ±äÁ¿²¢ÇÒµ¯³öÈÎÎñÃæ°æ
function task_level30_08()
	nt_setTask(1003,140)
end

-- À´µ½ÁúÈª´åÓë¸µÀ×ÊéµÄ¶Ô»°
function task_level30_09()
	Talk(17,"task_level30_10","Khô! Khô! Ai da! NghÌo thËt lµ khæ!..","L·o b¸ b¸......","§Õn mêi l·o giµ nµy uèng ruîu ch¨ng?","L·o tr­îng phu......","Bé ta giµ l¾m råi ­?","L·o tiªn sinh...","µ...... B¹n trÎ cã chuyÖn g×?","Nghe nãi Tiªn sinh am hiÓu vïng Giang Nam, ta muèn hái th¨m mét ng­êi?","Ha ha ha! B¹n trÎ hái ®óng råi ng­êi råi! Ta ®· cã biÖt hiÖu lµ Giang Nam V¹n Sù Th«ng th× kh«ng cã chuyÖn g× kh«ng biÕt.","Ha ha! ThÕ th× c¸m ¬n l·o tiªn sinh.","VËy th× ®­a tiÒn ®©y.","H¶?!","H¶ c¸i g×? Ch¼ng lÏ muèn biÕt chuyÖn mµ kh«ng ph¶i tr¶ tiÒn sao?","ViÖc nµy......Ta muèn biÕt Th¸i Nghª vî cña D­¬ng Ch©u Tiªu S­ H¹ HÇu Phôc hiÖn ®ang ë ®©u mÊt bao nhiªu tiÒn?","T×m ng­êi µ......Th©n phËn ng­êi muèn t×m cµng cao th× ph¶i tr¶ cµng nhiÒu tiÒn, cho nªn muèn biÕt Th¸i Nghª vî cña H¹ HÇu Phôc......","Ng­êi nµy lai lŞch kh«ng ®¬n gi¶n, vËy ph¶i mÊt 1 v¹n l­îng.","C¸i g×! §óng lµ......#??%%?%");
end

-- ÓÃÒÔÅĞ¶ÏÍæ¼ÒÉíÉÏËù³ÖÓĞµÄ½ğÇ®ÊÇ·ñ´ïµ½ÒªÇó
function task_level30_10()

local n

n = Pay(10000)

	if (n == 1) then -- Èç¹û³É¹¦µÄ¿Û³ıÁËÍæ¼ÒÒ»ÍòÁ½Òø×Ó
		nt_setTask(1003,150)
		-- ÔÚ´ËÖÃÈë¸Ä±äÈÎÎñÃæ°æµÄÑ¡Ïî£¬µ«²»µ¯³ö½çÃæ
		Talk(6,"task_level30_11","Võa ®óng 1 v¹n l­îng. Th¸i Nghª vèn lµ vî cña H¹ HÇu Phôc, nh­ng do H¹ HÇu Phôc ®am mª töu s¾c, phô rÉy Th¸i Nghª. Cuèi cïng Th¸i Nghª quyÕt ®Şnh chon con ®­êng cña m×nh","Th¸i Nghª quyÕt t©m khæ luyÖn ®éc thuËt, trong 10 n¨m ng¾n ngñi ®· luyÖn thµnh......","ThÕ c« ta ®ang ë ®©u?","Th¸i Nghª b©y giê lµ 1 trong Ngò §¹i H­¬ng chñ <color=yellow>Ngò §éc gi¸o<color> <color=yellow> MÆc Thï H­¬ng chñ<color>!","Th× ra lµ vËy....ThÕ t¹m biÖt ë ®©y vËy.","LÇn sau nhí ®em nhiÒu tiÒn qua..");
	else
		Talk(2,"task_level30_12","ThÕ......¤ng xem nhiªu ®©y tiÒn cã ®ñ kh«ng?","B¹n trÎ, l·o tuy giµ nh­ng m¾t vÉn s¸ng l¾m, ®ñ tiÒn råi quay l¹i.");
	end
	
end

-- ³É¹¦µÄ¿Û³ıÁËÍæ¼ÒµÄÒø×ÓÖ®ºó£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level30_11()
	nt_setTask(1003,150)
end

-- ÉíÉÏµÄÇ®²»¹»£¬¼ÇÂ¼±äÁ¿²¢µ¯³öÈÎÎñÃæ°æµÄ¹ı³Ì
function task_level30_12()
	nt_setTask(1003,151)
end

-- Ö®Ç°Ã»ÓĞÇ®£¬µÈÉíÉÏÓĞÁË×ã¹»µÄÒø×Ó¸ø¸µÀ×ÊéºóµÄ¶Ô»°
function task_level30_13()
	Talk(10,"task_level30_11","ThÕ nµo? §em tiÒn ®i hái ng­êi kh¸c µ?","......¤ng ®Õm thö xem.?§au lßng?","B¹n trÎ? Ng­¬i lµm sao thÕ? T¹i sao l¹i r¬i n­íc m¾t?","Kh«ng sao......bŞ c¸t v« m¾t th«i......","Võa ®óng 1 v¹n l­îng. Th¸i Nghª vèn lµ vî cña H¹ HÇu Phôc, nh­ng do H¹ HÇu Phôc ®am mª töu s¾c, phô rÉy Th¸i Nghª. Cuèi cïng Th¸i Nghª quyÕt ®Şnh chon con ®­êng cña m×nh","Th¸i Nghª quyÕt t©m khæ luyÖn ®éc thuËt, trong 10 n¨m ng¾n ngñi ®· luyÖn thµnh......","ThÕ c« ta ®ang ë ®©u?","Th¸i Nghª lµ mét trong Ngò §¹i H­¬ng chñ Ngò §éc gi¸o MÆc Thï H­¬ng chñ!","Th× ra lµ vËy....ThÕ t¹m biÖt ë ®©y vËy.","LÇn sau nhí ®em nhiÒu tiÒn qua..");
end

-- À´µ½Îå¶¾½ÌºóÓëÉ£ÖéµÄ¶Ô»°
function task_level30_14()
	Talk(10,"task_level30_14_01","Sao ng­¬i d¸m tù tiÖm x«ng vµo ®©y?","MÆc H­¬ng chñ thø lçi! T¹i h¹ m¹o muéi ®Õn hái th¨m tung tİch  'TrÊn Minh Chi Liªn'.","TrÊn Minh Chi Liªn? Ta ch­a tõng nghe qua mãn nµy.","Ta nghe..... chång tr­íc cña bµ nãi, lóc bµ bá «ng ta cã ®em theo sîi d©y chuyÒn ®ã.","Hõ! Th× ra lµ thÕ! Ta còng muèn biÕt tung tİch cña nã, nã ë trªn m×nh ®øa con ®· bŞ thÊt l¹c cña ta!","MÆc H­¬ng chñ cßn cã mét ®øa con?","Hõ......N¨m ®ã sau khi rêi khái tªn phô b¹c ®ã ta ®· mang thai..Lóc ®øa con ch­a ®ñ tuæi trong mét lÇn chiÕn lo¹n ta ®· thÊt l¹c nã. Bao n¨m tr«i qua cø nghÜ ®Õn chuyÖn nµy th× ta..","Th× ra lµ thÕ......Ta cã thÓ gióp bµ t×m tung tİch cña ®øa con g¸i.","NÕu ng­¬i cã thÓ gióp ta t×m ®­îc ®øa con th× qu¸ tèt!","VËy MÆc H­¬ng chñ cø ®îi tin tøc cña ta.");
end


function task_level30_14_01()
	Talk(1,"task_level30_15","Ng­êi ch¬i:?Th¶m råi! Thiªn h¹ lín nh­ vËy biÕt ®Õn ®©u mµ t×m ®øa con thÊt l¹c nhiÒu n¨m hay lµ quay vÒ gÆp «ng giµ gi÷ ®å hái xem.?");
end

-- ÓëÉ£Öé¶Ô»°½áÊøºó£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level30_15()
	nt_setTask(1003,160)
end

-- »Øµ½ÁúÈª´åÓë¸µÀ×ÊéµÄ¶Ô»°
function task_level30_16()
	Talk(9,"task_level30_17","L·o......tiªn sinh.?l¹i tèn tiÒn råi!?","B¹n trÎ, lÇn nµy l¹i muèn hái g×?","Ta muèn biÕt con g¸i cña Tang Chu ®ang ë ®©u? Muèn bao nhiªu tiÒn cø nãi!","õ......C¸i nµy......ta kh«ng lÊy tiÒn.","¤i! V¹n lÇn c¶m ¬n!","Bëi v× ta còng kh«ng biÕt.","L·o...","Ta ®ïa th«i! Ng­¬i h·y ®Õn <color=yellow>Vâ §ang ph¸i<color>, kh«ng chõng cã chót manh mèi.","C¶m ¬n l·o tiªn sinh!");
end

-- »Øµ½ÁúÈª´åÓë¸µÀ×ÊéµÄ¶Ô»°½áÊøºó£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ£¬ÔÚ´Ë·¢Óè½±Àø
function task_level30_17()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,170)
	
	myText1 = "80.000 ®iÓm kinh nghiÖm"
	myText2 = "B¹n nhËn ®­îc 1 kh«i m·o"
	
	if (curCamp==2) then
	
		AddOwnExp(80000)	
		AddGoldItem(0,177)
		ex_add_xp_level30();
		
		Msg2Player("B¹n nhËn ®­îc"..myText1);
		Msg2Player("B¹n nhËn ®­îc"..myText2);
		
		Say("B¹n trÎ! Giang hå rÊt nguy hiÓm! Ta cã vËt nµy cã thÓ gióp ®­îc ng­¬i.<enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color>",0);
	else
	
		AddOwnExp(80000)
		Msg2Player("B¹n nhËn ®­îc"..myText1);
		
		Say("B¹n trÎ! Giang hå rÊt nguy hiÓm! Ta cã vËt nµy cã thÓ gióp ®­îc ng­¬i.<enter><enter><color=yellow>"..myText1.."<color>",0);
	
	end
	
end


--   ///////////////////////////////
--  //  40 ¼¶Ö÷ÏßÈÎÎñµÄ´¦Àí¹ı³Ì  //
-- ///////////////////////////////



-- À´µ½Îäµ±ÅÉºóÓëÒ¦Ê¯ÃÅµÄ¶Ô»°
function task_level40_01()
	Talk(9,"task_level40_01_01"," (Trªn cæ h¾n ®eo sîi d©y chuyÒn g× l¹ qu¸??","Sîi d©y chuyÒn nµy huynh tõ ®©u mµ cã?","Sîi d©y chuyÒn nµy? Ta còng kh«ng râ......S­ phô nãi lóc nhÆt ta vÒ trªn ng­êi ®· cã nã "," (§óng lµ huynh råi! VËy sîi nµy nhÊt ®Şnh lµ TrÊn Minh Chi Liªn råi!?","ThÕ ThiÕu hiÖp cã tõng nghÜ sÏ ®i t×m mÑ kh«ng?","ChuyÖn nµy ta tr­íc giê ch­a nghÜ tíi, S­ phô hiÖn nay Quèc gia l©m n¹n, chóng ta nh÷ng ng­êi tËp vâ nªn gãp mét phÇn søc lùc.","Nh­ng cã thÓ mÑ ng­¬i ®ang chê ng­¬i? Ta t­ëng cã thÓ gióp huynh t×m l¹i mÑ m×nh.","ThËt µ? Ng­¬i ®· gÆp qua mÑ ta?","Cã lÏ cã mét ng­êi ®óng thËt lµ mÑ ng­¬i......ta còng kh«ng ch¾c l¾m, hay lµ cïng ta ®i th¨m bµ ta mét chuyÕn?");
end

-- ¶Ô»°À©Õ¹
function task_level40_01_01()
	Talk(3,"task_level40_02","Nh­ng b©y giê kh«ng ®­îc! Vâ §ang ph¸i ta hiÖn cã mét tªn ph¶n ®å, y ®· lÊy l­îc ®å qu©n sù c¶ vïng Giang Nam ®­a cho Kim quèc! HiÖn Vâ l©m Trung nguyªn tÊt c¶ ®Òu truy b¾t tªn nµy. Ngµy nµo ch­a lÊy l¹i ChiÕn l­îc ®å ta ¨n ngñ kh«ng yªn!"," (§©y ®©u ph¶i lµ viÖc cña mét m×nh ng­¬i!) ","Chi b»ng thÕ nµy, ta gióp ng­¬i xö lı tªn b¹i ho¹i cña Vâ §ang, sau ®ã cã thÓ cïng ta ®i t×m mÑ ng­¬i?");
end

-- ÅĞ¶ÏÍæ¼Òµ±Ç°µÈ¼¶ÊÇ·ñ´ïµ½ÁË 40 ¼¶
function task_level40_02()

	if (GetLevel() >= 40) then
		nt_setTask(1003,209)
		Talk(3,"task_level40_04","NÕu ng­¬i t×m ®­îc tªn ph¶n ®å ®ã thËt sù lµ phóc lín cña Vâ l©m! Ta nghÜ ng­¬i còng nªn gãp chót søc cho §¹i Tèng!","§óng vËy!?ChØ cÇn lÊy ®­îc sîi d©y chuyÒn cña huynh c¸i g× còng dÔ nãi?","Ph¶n ®å ®ã tªn <color=yellow>Tiªu V« Th­êng<color>, ®ang trèn trªn <color=yellow>Thôc C­¬ng S¬n<color>.",0);
	else
		Talk(1,"task_level40_03","Nh­ng mµ ng­¬i kh«ng rµnh vâ nghÖ, ta nghÜ ng­¬i ®Şch kh«ng l¹i h¾n ®©u, ®îi ng­¬i ®¹t ®Õn <color=yellow>cÊp 40<color> råi tİnh.",0);
	end
	
end

-- Íæ¼ÒµÈ¼¶²»¹» 40 ¼¶£¬ËùÒÔÔİ´æ±äÁ¿
function task_level40_03()
	nt_setTask(1003,208)
end

-- Íæ¼ÒµÈ¼¶ÒÑ¾­´ïµ½ÁË 40 ¼¶£¬±£´æÈÎÎñ±äÁ¿²¢ÇÒµ¯³öÈÎÎñÃæ°æ
function task_level40_04()
	nt_setTask(1003,210)
end

-- Íæ¼ÒÕ½Ê¤ÁËĞ¤ÎŞ³£ºó£¬±£´æÈÎÎñ±äÁ¿²¢ÇÒµ¯³öÈÎÎñÃæ°æ
function task_level40_05()
--	nt_setTask(1003,220)
	Msg2Player("B¹n nhËn ®­îc B¶n ®å chiÕn l­îc cña Trung nguyªn tõ Tiªu V« Th­êng!");
-- ÈÎÎñ±äÁ¿ÔÚĞ¤ÎŞ³£ÉíÉÏÖ±½Ó¸Ä±ä£¬´Ë´¦½öµ¯³öÈÎÎñÃæ°æ
end

-- Íæ¼ÒÕ½Ê¤ÁËĞ¤ÎŞ³£ºó»Øµ½Îäµ±É½ÓëÒ¦Ê¯ÃÅ¶Ô»°
function task_level40_06()
	Talk(10,"task_level40_06_01","A! §· do¹t l¹i ChiÕn l­îc ®å! Ng­¬i ®· gióp Vâ l©m thanh trõ tªn b¹i lo¹i ®ã! ThËt sù ®¸ng chóc mõng!","Ha ha! ChuyÖn nhá th«i mµ! Chóng ta ®i t×m mÑ cña huynh ®i!","Bµ ta hiÖn ®ang ë ®©u?","Chİnh lµ MÆc Thï Ngò §éc gi¸o Tang Chu.","C¸i g×?","¥? Sao vËy?"," Ng­¬i b¶o ta ®i gÆp ng­êi cña Ngò §éc gi¸o!? Kh«ng bao giê!","?......Kh«ng cÇn thay ®æi nhanh vËy??","Nh­ng......bµ ta lµ mÑ cña huynh! D©y chuyÒn trªn cæ huynh chİnh lµ lóc bµ sinh huynh ®· ®Ó l¹i","X­a nay Chİnh Tµ bÊt ph©n l­ìng lËp, ta thµ kh«ng cã ng­êi mÑ nµy!");
end

-- ¶Ô»°µÄµÚ¶şĞĞ
function task_level40_06_01()
	Talk(2,"task_level40_07","Sîi d©y chuyÒn nµy ®­a ng­¬i, nãi víi bµ ta sau nµy sÏ gÆp l¹i ë trªn chiÕn tr­êng!","C«ng Tö ®· quyÕt nh­......vËy ta kh«ng lµm phiÒn n÷a. (Ha ha! ThËt kh«ng phİ c«ng, Vâ §ang l¹i cã nh©n tµi nh­ thÕ??");
end

-- Íæ¼ÒÄÃµ½ÁËÕòÚ¤Ö®Á´ºó£¬±£´æÈÎÎñ±äÁ¿£¬
function task_level40_07()

local myText1, myText2, myText3 = "", "", ""
local curCamp = nt_getCamp()

	nt_setTask(1003,230)
	
	myText1 = "280.000 ®iÓm kinh nghiÖm"
	myText2 = "B¹n ®· ®­îc tÈy toµn bé ®iÓm kü n¨ng!"	
	
	Msg2Player("B¹n nhËn ®­îc TrÊn Minh Chi Liªn!");
	
	if (curCamp==2) then
		AddOwnExp(280000)
		ex_add_xp_level40();
		ClearMagicPoint()  --Ôö¼Ó40¼¶Ê±Ï´µãµÄ¹¦ÄÜ
		Talk(1,"task_level40_08","LÇn nµy may nhê ng­¬i gióp, nh÷ng thø nµy ta tÆng ng­¬i <enter><enter><color=yellow>"..myText1.."<color><enter><color=yellow>"..myText2.."<color>");
	else
		AddOwnExp(280000)
		Talk(1,"task_level40_08","LÇn nµy may nhê ng­¬i gióp, nh÷ng thø nµy ta tÆng ng­¬i <enter><enter><color=yellow>"..myText1.."<color>");
	
	end
	
-- ÔÚÕâÀïµ¯³öÈÎÎñÃæ°å

end

-- ¸æËßÍæ¼ÒÏÂÒ»²½Ó¦ÔõÑù×ö
function task_level40_08()
	Talk(2,0,".....….","Sîi d©y chuyÒn cã bİ mËt g× ®ã...... Hay lµ t×m <color=yellow>«ng giµ gi÷ ®å<color> hái th¨m lai lŞch cña 'Thiªn Hoµng Long Khİ'.");
end


--   ///////////////////////////////
--  //  50 ¼¶Ö÷ÏßÈÎÎñµÄ´¦Àí¹ı³Ì  //
-- ///////////////////////////////

-- ÔÚÁúÈª´åÓë¸µÀ×ÊéµÄ¶Ô»°
function task_level50_01()
	Talk(5,"task_level50_01_01","Tiªn sinh! ¤ng biÕt lai lŞch cña d©y chuyÒn nµy?","VËt nµy......kh«ng ph¶i lµ 'TrÊn Minh Chi Liªn' trong 'Thiªn Hoµng Long Khİ' sao?","VËy cuèi cïng Long Khİ cã bİ mËt g×?","Ng­¬i cã biÕt  'Thiªn Hoµng Long Khİ' tæng céng cã 8 c¸i, ®­îc chÕ t¹o t¹i Hµm D­¬ng. Sau ®ã TÇn Thñy Hoµng qua ®êi nã còng mÊt tİch theo. NÕu tËp hîp ®ñ 8 mãn sÏ biÕt ®­îc 1 bİ mËt kinh ng­êi.","Mét bİ mËt kinh ng­êi? VËy cuèi cïng lµ thÕ nµo?");
end


function task_level50_01_01()
	Talk(9,"task_level50_02","ViÖc nµy...... Ng­¬i chØ cã t×m ®ñ 8 mãn Long Khİ míi cã thÓ biÕt.","¤ng biÕt tung tİch c¸c mãn Long Khİ cßn l¹i kh«ng?","NÕu nh­ ta biÕt ta cßn cã m¹ng trªn ®êi sao? Trong Vâ l©m gÇn ®©y sè ng­êi chÕt v× mÊy mãn ®å nµy kh«ng İt......","LÏ nµo thËt sù hiÓm nguy ®Õn vËy sao?","B¹n trÎ nghe nãi ng­¬i rÊt cã chİ? Tin tøc Long Khİ hÇu nh­ ai còng biÕt chót İt......","Nh­ng ph¶i nép tiÒn ®óng kh«ng?","Khµ! Khµ! ChØ lµ ®ñ uèng r­îu th«i mµ! Tin tøc kh«ng ®óng ta kh«ng lÊy tiÒn.","Kim  quèc ®ang ph¸t sinh kh«ng İt chuyÖn, h×nh nh­ cã liªn quan ®Õn 'Bµn Long C«i'!","Kim quèc?.....ta sÏ ®Õn <color=yellow>BiÖn Kinh<color> t×m chót manh mèi! C¸m ¬n tiªn sinh!");
end


-- Óë¸µÀ×Êé¶Ô»°ºó£¬±£´æÈÎÎñ±äÁ¿²¢ÇÒµ¯³öÈÎÎñÃæ°æ
function task_level50_02()
	nt_setTask(1003,300)
end

-- ÔÚãê¾©ÓëÈçÓñµÄ¶Ô»°
function task_level50_03()
	Talk(5,"task_level50_04","GÇn ®©y Kim binh kh«ng biÕt ®ang lµm g×, c¶ ngµy triÖu tËp binh m· trong thµnh, h×nh nh­ ®ang t×m thø g×......","C« biÕt bän ta ®ang t×m g× µ?","ChuyÖn cña ng­êi Kim ta nµo d¸m hái! NÕu nhiÒu chuyÖn sÏ bŞ ®i tï n÷a n¨m, ta cßn ph¶i lo viÖc nhµ n÷a!","Thêi nay chØ cã nh÷ng kÎ chŞu luån cói Kim quèc míi ®­îc sèng an nhµn, ng­¬i h·y nh×n <color=yellow>TrÇn Tam B¶o<color> xem, h¾n ®­îc bao nhiªu ng­êi ng­ìng mé.","ThÕ µ......xem ra <color=yellow>TrÇn Tam B¶o<color> tiÕp xóc víi ng­êi Kim kh«ng İt.");
end

-- ÓëÈçÓñ¶Ô»°½áÊøºó£¬±£´æÈÎÎñ±äÁ¿²¢ÇÒµ¯³öÈÎÎñÃæ°æ
function task_level50_04()
	nt_setTask(1003,310)
end

-- ÔÚãê¾©Óë³ÂÈı±¦¶Ô»°
function task_level50_05()
	Talk(8,"task_level50_06"," Ai......","VŞ ®¹i ca nµy sao l¹i ë ®©y than ng¾n thë dµi?","Xem ra tİnh m¹ng c¶ gia ®×nh mÊt trong tay ta......","ChuyÖn g× mµ nghiÖm träng thÕ?","§å §¬n §¹i nh©n trong triÒu muèn mét b×nh Lam Hoa, ai ngê ta nhê ng­êi vËn chuyÓn tõ C¶nh §øc trÊn bŞ giÆc c­íp ®i!","LÇn nay e r»ng tİnh m¹ng c¶ gia ®×nh khã b¶o toµn......","Xem ra lÇn nµy tİnh m¹ng c¶ nhµ «ngthËt sù mong manh! Kh«ng sao ®©u, ta sÏ gióp «ng.","ThËt µ......?");
end

-- ÅĞ¶ÏÍæ¼ÒµÈ¼¶ÊÇ·ñ´ïµ½ 50 ¼¶£¬Ö®ºóÔÙ½Ó×Å×öÈÎÎñ
function task_level50_06()
	if (GetLevel() >= 50) then
		nt_setTask(1003,329)
		Talk(3,"task_level50_08","§­¬ng nhiªn, c¸i b×nh «ng nãi bŞ c­íp ë ®©u?","Cã mét tªn ®¹o tÆc tªn <color=yellow>Lôc Phi<color=> ë gÇn <color=yellow>Nh¹n §·ng S¬n<color>......","§­îc råi! H·y chê ë ®©y ta gióp «ng lÊy l¹i!");
	else
		Talk(1,"task_level50_07","Ng­¬i......thËt sù cã thÓ gióp ta? ThÊy ng­¬i nh­ thÕ ta còng kh«ng nhÉn t©m nh×n ng­¬i chŞu chÕt. Hay lµ ng­¬i luyÖn ®Õn cÊp 50 h·y tİnh.");
	end
end

-- Èç¹ûÍæ¼ÒµÈ¼¶Ã»ÓĞ´ïµ½ 50 ¼¶µÄ¶Ô»°£¬²¢±£´æÈÎÎñ±äÁ¿
function task_level50_07()
	nt_setTask(1003,328)
end

-- Íæ¼ÒµÈ¼¶µ½ÁË 50 ¼¶£¬½ÓÏÂÁË³ÂÈı±¦µÄÈÎÎñ£¬µ¯³öÈÎÎñÃæ°æ
function task_level50_08()
	nt_setTask(1003,330)
end

-- Íæ¼ÒÕ½Ê¤ÁËÂ½·Çºó±£´æÈÎÎñ±äÁ¿£¬µ¯³öÈÎÎñÃæ°æ
function task_level50_09()
--	nt_setTask(1003,340)
	Msg2Player("B¹n ®¸nh th¾ng Lôc Phi lÊy ®­îc b×nh Lam Hoa!");
-- ÈÎÎñ±äÁ¿ÔÚÂ½·ÇÉíÉÏÖ±½Ó¸Ä±ä£¬´Ë´¦½öµ¯³öÈÎÎñÃæ°æ
end

-- Íæ¼ÒÄÃµ½ÁËÀ¶»¨´ÉÆ¿ºó»ØÀ´Óë³ÂÈı±¦µÄ¶Ô»°
function task_level50_10()
	Talk(8,"task_level50_11","§©y lµ b×nh Lam Hoa «ng ®Æt mua kh«ng? Ta ®· ®em vÒ råi.","A! §óng lµ b×nh §å §¬n §¹i nh©n thİch! Ta thËt kh«ng d¸m tin vµo m¾t m×nh!","Ng­¬i ®· cøu tİnh m¹ng c¶ nhµ ta, kh«ng biÕt ®Òn ¬n ng­¬i thÕ nµo?","ChØ lµ chuyÖn nhá! Ta chØ muèn biÕt gÇn ®©y §å §¬n §¹i nh©n ®ang lµm g×?","§å §¬n §¹i nh©n gÇn ®©y nhËn ®­îc 1 b¶o vËt, nh­ng h×nh nh­ «ng ta kh«ng muèn ai biÕt chuyÖn nµy.","A? Ch¼ng lÏ ®ã lµ 'Bµn Long C«i'? VËy §å §¬n §¹i nh©n th­êng ®i ®©u?","¤ng ta gÇn ®©y hay ®i <color=yellow>ThiÕt Th¸p<color>, ng­¬i ®Õn ®ã cã thÓ gÆp","§­îc! C¶m ¬n tiªn sinh!");
end

-- Íæ¼ÒÔÚÓë³ÂÈı±¦¶Ô»°½áÊøºó£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level50_11()
	nt_setTask(1003,350)
end

-- Íæ¼ÒÔÚÕ½Ê¤ÁËÍ½µ¥´óÈËºó£¬¸Ä±äÈÎÎñ±äÁ¿
function task_level50_12()

local curCamp = nt_getCamp()

--	nt_setTask(1003,360)
	Msg2Player("B¹n chiÕn th¾ng §å §¬n §¹i nh©n!");
	-- Íæ¼ÒÔÚÓëÍ½µ¥´óÈË¶Ô»°½áÊøºó£¬µ¯³öÈÎÎñÃæ°æ
	if (curCamp==2) then
		AddOwnExp(350000)
		AddExp_Skill_Extend(350000)
		AddItem(6,1,71,1,1,1)  --Ôö¼ÓÒ»¸öÏÉ²İÂ¶
		ex_add_xp_level50();
	
		Msg2Player("B¹n nhËn ®­îc 350.000 ®iÓm kinh nghiÖm");
		Msg2Player("B¹n nhËn ®­îc mét b×nh Tiªn Th¶o Lé ");
	else
		AddOwnExp(350000)
		AddExp_Skill_Extend(350000)
		Msg2Player("B¹n nhËn ®­îc 350.000 ®iÓm kinh nghiÖm");
	end
	
	Talk(8,"","Ng­¬i......T¹i sao ng­¬i l¹i truy s¸t ta?","RÊt ®¬n gi¶n! Ta muèn lÊy 'Bµn Long C«i' cña «ng","Hõ......Th× ra lµ v× thø nµy.","RÊt tiÕc mét th¸ng tr­íc ®· bŞ Hoµn Nhan Hïng Khang c­íp ®i......","Hoµn Nhan Hïng Khang?","Lµ Quèc s­ §¹i Kim Hoµn Nhan Hïng Khang! Cã b¶n lÜnh th× h·y ®Õn t×m h¾n!",".....….","Sî g× chø! Ta sÏ ®Õn <color=yellow>Thiªn NhÉn Gi¸o<color> xem thö!");
end


--   ///////////////////////////////
--  //  60 ¼¶Ö÷ÏßÈÎÎñµÄ´¦Àí¹ı³Ì  //
-- ///////////////////////////////

-- Íæ¼ÒÔÚÌìÈÌ½Ì´óÌÃÓë¶ËÄ¾î£µÄ¶Ô»°
function task_level60_01()
	Talk(6,"task_level60_02","Ng­êi t×m Hoµn Nhan Hïng Khang lµm g×?","V× muèn mét mãn ®å.","Ha ha ha...... LÇn ®Çu tiªn thÊy mét ng­êi nh­ ng­¬i.","T¹i sao?","D¸m tr­íc mÆt Quèc s­ §¹i Kim ®ßi vËt, trªn thÕ gian nµy e lµ chØ cã m×nh ng­¬i.","Nh­ng ta thİch tİnh c¸ch cña ng­¬i,  ng­¬i ®Õn <color=yellow>Long M«n TrÊn<color> t×m muéi muéi cña ta <color=yellow> §oan Méc Thanh<color>, chØ cã c« ta míi biÕt Hoµn Nhan Hïng Khang ë ®©u.");
end

-- Óë¶ËÄ¾î£µÄ¶Ô»°½áÊø£¬¸Ä±äÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°æ
function task_level60_02()
	nt_setTask(1003,400)
end

-- ÔÚÁúÃÅÕòÓë¶ËÄ¾ÇåµÄ¶Ô»°
function task_level60_03()
	Talk(10,"task_level60_03_01","C« lµ T¶ Hé sø cña Thiªn NhÉn Gi¸o muéi muéi cña §oan Méc DuÖ?","Hõ, ch¾c lµ anh ta b¶o ng­¬i ®Õn ph¶i kh«ng? Ng­¬i vÒ nãi víi huynh Êy, ta kh«ng bao giê trë vÒ!",".....….","Tuy anh c« b¶o ta ®Õn, nh­ng y kh«ng cã b¶o c« quay vÒ.","VËy ng­¬i ®Õn ®©y lµm g×?","Ta muèn biÕt tung tİch cña Hoµn Nhan Hïng Khang.","Ng­¬i t×m Hïng Khang ®Ó lµm g×?","V× trong tay h¾n cã mãn ®å ta cÇn.","Hµ? ViÖc ®ã cßn ph¶i xem ng­¬i cã kh¶ n¨ng lÊy mãn ®å trong tay h¾n kh«ng.","Ta ph¶i lµm thÕ nµo míi cã thÓ gÆp y?");
end

-- ¶Ô»°À©Õ¹
function task_level60_03_01()
	Talk(4,"task_level60_04","ViÖc nµy......®Ó  ta nghÜ xem,  T­íng lÜnh Liªu §Şnh n­íc Tèng ®ang chèng l¹i §¹i Kim ta, nÕu ng­¬i cã thÓ ®¸nh th¾ng h¾n cã lÏ ta sÏ cho ng­¬i gÆp Hïng Khang.","T¹i sao ta ph¶i nghe lêi c«?","Ha ha! ChØ sî trªn thÕ gian nµy ngoµi ta ra kh«ng cã ai biÕt hµnh tung cña Hïng Khang.","VËy ®­îc, cho ta biÕt Liªu §Şnh ®ang ë ®©u?");
end

-- ÅĞ¶ÏÍæ¼ÒµÈ¼¶ÊÇ·ñ´ïµ½ 60 ¼¶
function task_level60_04()
	if (GetLevel() >= 60) then
		nt_setTask(1003,409)
		Talk(2,"task_level60_05","Tªn kh«ng biÕt trêi cao ®Êt réng ®ang ë <color=yellow> Linh Cèc ®éng<color>, ng­¬i ®Õn lÊy thñ cÊp h¾n vÒ cho ta.",".....….");
	else
		nt_setTask(1003,408)
		Talk(1,"","Hõ! Ng­¬i dùa vµo c¸i g× mµ muèn giÕt Liªu §Şnh? §õng väng t­ëng! §Õn <color=yellow> cÊp 60<color> h·y quay l¹i ®©y!");
	end
end

-- Èç¹ûÍæ¼ÒµÈ¼¶´ïµ½ 60 ¼¶£¬±£´æÈÎÎñ±äÁ¿²¢µ¯³öÈÎÎñÃæ°å
function task_level60_05()
	nt_setTask(1003,410)
end


-- Èç¹ûÍæ¼ÒÕ½Ê¤ÁËÁÎ¶¨
function task_level60_06()

--	nt_setTask(1003,420)
	Msg2Player("B¹n ®· ®¸nh th¾ng Liªu §Şnh!");
	
	AddOwnExp(800000)
	AddExp_Skill_Extend(800000)
	Msg2Player("B¹n nhËn ®­îc 800.000 ®iÓm kinh nghiÖm!");
	
	Talk(10,"",":......",".....Ch¼ng ngê Liªu §Şnh ta......cuèi cïng chÕt d­íi tay ng­êi Tèng!","Liªu t­íng qu©n, ta víi ng­¬i vèn kh«ng thï kh«ng o¸n, nh­ng v× thñ cÊp ng­¬i cã thÓ gióp ta cã ®­îc mãn ®å ®ang cÇn.","Ha ha......Ta ch¼ng ngê ®Çu cña Liªu §Şnh ta chØ ®¸ng ®æi mét vËt g× th«i sao?","Bµn Long C«i trong Thiªn Hoµng Long Khİ.",":......","B¹n trÎ......Lêi cña bän Kim kh«ng ®¸ng tin......","Thiªn Hoµng Long Khİ mµ ng­¬i muèn t×m...mét khi tËp hîp ®ñ cã thÓ gióp §¹i Tèng ®o¹t l¹i giang s¬n, còng cã thÓ gióp §¹i Kim x©m chiÕm ®¹i giang nam b¾c, b¸ t¸nh sinh linh ®å th¸n!"," Tµ chİnh x­a nay vèn kh«ng ®éi trêi chung! ThËt uæng cho ng­¬i.....",".....….");
end

-- Íæ¼ÒÕ½Ê¤ÁËÁÎ¶¨Ö®ºó»Øµ½ÁúÃÅÕòÓë¶ËÄ¾ÇåµÄ¶Ô»°
function task_level60_07()
	Talk(11,"task_level60_08","?nĞm ®Çu Liªu §Şnh xuèng ®Êt?","§©y lµ ®Çu cña Liªu §Şnh.","RÊt tèt! Qu¶ nhiªn kh«ng phô lßng ta.","§õng nhiÒu lêi! Hoµn Nhan Hïng Khang hiÖn ®ang ë ®©u?","Hïng Khang ®ang bËn, t¹m thêi kh«ng thÓ gÆp h¾n ®­îc.","Ng­¬i giìn víi ta h¶?","Ha ha...... Ng­¬i t­ëng bæn c« n­¬ng lµ kÎ hai lêi sao? ThËt ra Hïng Khang ®· sím biÕt ng­¬i muèn g×.","VËy lµ ı g×?","Y biÕt ®­îc ng­¬i lµ ng­êi d¸m b¸n m¹ng v× §¹i Kim, cho nªn dÆn ta tÆng ng­¬i mãn ®å nµy.","Nhí lÊy! Sau nµy lµm viÖc cho §¹i Kim sÏ kh«ng thiÖt thßi ®©u. Ha! Ha! Ha!",".....….");
end

-- Íæ¼ÒµÃµ½ÅÍÁú¹å£¬Ğ°½ÌÖ÷ÏßÕıÊ½½áÊø
function task_level60_08()
	nt_setTask(1003,430)
	ex_add_xp_level60();
	Msg2Player("B¹n nhËn ®­îc Bµn Long C«i!");
	AddSkillState( 509, 1, 0, 180);
end