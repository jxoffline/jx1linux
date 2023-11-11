--description: ÌÆÃÅÌÆÒ»³¾ 20¼¶ÈÎÎñ¡¢50¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2004-05-25) Ï´ÇåÔ©ÇüÈÎÎñ

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
--	if (GetTask(123) >= 80) and (Uworld51 < 10) and (GetReputeLevel(GetRepute()) >= 8) then		-- Ï´ÇåÔ©ÇüÈÎÎñÆô¶¯
		--		Talk(2,"Uworld51_get", 13429, 13430)
	if (Uworld51 == 20) then
		Talk(5,"Uworld51_30","Ta còng kh«ng khohuynh Êyy ®øng nh×n, vÉn ®ang t×m c¸ch. ChØ v× cha ta hiÖn ®ang nghi ngê ta, ta hµnh ®éng e kh«ng tiÖn.","Nh­ng ta ®· biÕt ®­îc mÊy ngµy tr­íc cã mÊy vŞ cao thñ ThiÕu L©m gÆp n¹n, th­¬ng tİch rÊt gièng víi tuyÖt kü cña Bæn m«n g©y ra, cha ta nghi ngê ta ®· tiÕt lé tuyÖt kü cña m«n ph¸i.","Ng­êi n¬i ®i gÆp M«n chñ gi¶i thİch râ!","V« dông th«i! Cha ta ®ang tøc giËn vèn kh«ng cho ta c¬ héi gi¶i thİch. Ngay c¶ tin nµy ta còng chØ nghe §­êng H¹c nãi th«i.","NÕu vËy… M«n chñ kh«ng cã thµnh kiÕn víi ta, cã lÏ ta cã thÓ gióp «ng.")
	elseif (Uworld51 == 55) then
		Talk(6,"Uworld51_60","NhÊt TrÇn c«ng tö, ta võa nghe tin tøc tõ Thiªn NhÉn gi¸o, chuyÖn ¸m s¸t cao thñ ThiÕu L©m qu¶ nhiªn lµ do hä lµm. BÊt NhiÔm c«ng tö v× muèn tranh quyÒn víi ng­êi ®· ®em MËt tŞch Bæn m«n ®­a cho Thiªn NhÉn gi¸o.","Co chuyÖn vËy sao? BÊt NhiÔm cho dï muèn trë thµnh M«n chñ còng kh«ng nªn lµm vËy.","§¸nh tiÕc ta ®ang bŞ nghi ngê, cha ta l¹i kh«ng tin ta nãi, ta ph¶i lËp tøc ®Õn th­¬ng l­îng víi §­êng H¹c s­ phô mét chót.","Môc tiªu thİch s¸t tiÕp theo cña Thiªn NhÉn gi¸o lµ C¸i Bang, xin c«ng tö nh¾c nhë C¸i Bang tr¸nh ®Ó Thiªn NhÉn gi¸o thõa c¬ h·m h¹i.","Bİ kiÕp Bæn m«n lät vµo tay ®èi thñ nhÊt ®Şnh ph¶i lÊy l¹i, hay lµ nhê ng­¬i tiªu diÖt tªn thİch kh¸ch, lÊy l¹i bİ kiÕp.","§­îc th«i!")
	elseif (Uworld51 == 70) and (HaveItem(377) == 1) then				-- Ï´ÇåÔ©ÇüÈÎÎñ£ºÒÑ¾­¶á»ØÃØóÅ
		Talk(2,"Uworld51_80","NhÊt TrÇn c«ng tö! T¹i h¹ ®· hoµn thµnh sø mÖnh lÊy l¹i bİ kiÕp.","§a t¹ ng­¬i! Ta ®· th­¬ng l­îng víi §­êng H¹c s­ phô, xin ng­¬i h·y nãi râ ch©n t­íng víi cha ta. V× chuyÖn nµy do ng­¬i ®iÒu tra ®­îc, chØ cã ng­¬i nãi míi cã søc thuyÕt phôc.")
	elseif (Uworld51 == 90) then
		Talk(2,"Uworld51_100","Cha ta nãi thÕ µ? Hay qu¸! Ta ph¶i b¸o tin nµy cho Hµm Yªn míi ®­îc."," Ha ha! §Ó ta ®i mét chuyÕn, lÇn tr­íc lµ b¸o tin xÊu, lÇn nµy ph¶i ®Ó ta bï ®¾p.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 20*256) and (GetLevel() >= 20) then		--20¼¶ÈÎÎñÆô¶¯
			Talk(2, "L20_get", " Ta cã 1 ng­êi c« tªn lµ <color=Red>§­êng U<color>, lµ ng­êi muéi muéi duy nhÊt cña cha ta, nh­ng v× ®· lµm tr¸i m«n quy, kÕt h«n víi ng­êi bªn ngoµi, ®· bŞ Tæ phô trôc xuÊt khái gia m«n, hai m­¬i n¨m nay ch­a tõng gÆp mÆt, ta biÕt cha ta ngoµi mÆt kh«ng nãi, nh­ng trong lßng rÊt nhí ®Õn muéi muéi.", "VËy sao Ch­ëng m«n kh«ng ®ãn bµ ta vÒ, c¶ nhµ ®oµn viªn?")
		elseif (UTask_tm == 20*256+60) then 
			Talk(2, "", "§­êng U s­ c« ®· tha thø cho Ch­ëng m«n. Bµ ta b¶o ta ®em <color=Red>Kim H¹ng khuyªn<color> nµy giao cho Ch­ëng m«n.", "ThËt µ? Hay qu¸! Ng­¬i qu¶ lµ cã b¶n lÜnh, mau ®em<color=Red> Kim H¹ng khuyªn<color> giao cho cha ta! ¤ng ta ®ang ë <color=Red>phßng kh¸ch<color>.")
			Msg2Player("VÒ phßng NghŞ Sù t×m §­êng NhÊt TrÇn, ®­îc biÕt Ch­ëng m«n §­êng Cõu ®ang ë Phßng kh¸ch.")
			SetTask(2,20*256+70)
		elseif (UTask_tm == 20*256+70) then
			Talk(1, "", "Tèt qu¸! Mau ®em Kim H¹ng khuyªn giao cho cha ta! ¤ng ta ®ang ë <color=Red>phßng kh¸ch<color>.")
		elseif (UTask_tm == 50*256+20) then		--50¼¶ÈÎÎñ
			Talk(4, "", "§¹i s­ huynh! Huynh biÕt tèi qua ai vµo phßng ¸m khİ kh«ng?", "Tèi qua h×nh nh­ <color=Red>Tam s­ ®Ö §­êng Hßa<color> vµ <color=Red>Ngò s­ ®Ö §­êng Nguyªn <color> ë ®ã.", "Kh«ng biÕt hiÖn giê hä ®ang ë ®©u?", "<color=Red>Ngò s­ ®Ö<color> võa míi véi v· ®Õn <color=Red>Giang T©n th«n<color> ®Ó th¨m ng­êi cËu bŞ bÖnh, tam s­ ®Ö ra ngoµi nh­ng kh«ng biÕt ®i ®©u. ")
			SetTask(2, 50*256+40)
			Msg2Player("T¹i phßng NghŞ sù, tõ §­êng NhÊt TrÇn biÕt ®­îc tam s­ huynh §­êng Hßa vµ ngò s­ huynh §­êng Nguyªn cã ®i qua phßng ¸m Khİ, biÓu hiÖn kh¶ nghi nhÊt.")
			AddNote("T¹i phßng NghŞ sù, tõ §­êng NhÊt TrÇn biÕt ®­îc tam s­ huynh §­êng Hßa vµ ngò s­ huynh §­êng Nguyªn cã ®i qua phßng ¸m Khİ, hai ng­êi cã vÎ kh¶ nghi. §­êng Nguyªn ®i Giang T©n Th«n th¨m ng­êi cËu, cßn §­êng Hßa kh«ng biÕt ®i ®©u n÷a.")
		elseif (UTask_tm == 50*256+40) then							--50¼¶ÈÎÎñ
			Talk(1,"","Sao ng­¬i l¹i hái ai ®· vµo phßng ¸m khİ? §· x¶y ra chuyÖn g× ph¶i kh«ng?")
		elseif (UTask_tm > 20*256) and (UTask_tm < 30*256) then					--ÒÑ¾­½Óµ½20¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Chång c« chÕt ®i, c« c« cø ®Õn ë trong ng«i nhµ tranh ë hËu s¬n <color=Red>V« T©m cèc<color>. Tõ ®ã bµ Êy kh«ng muèn gÆp mÆt ng­êi trong §­êng m«n, ta ®· ®Õn ®ã nhiÒu lÇn nh­ng chØ ®øng <color=Red>tr­íc cöa<color> thØnh an bµ, lÇn nµy nhê ng­êi vËy! ")
		elseif (UTask_tm >= 30*256) then					--ÒÑ¾­Íê³É20¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","§a t¹ ng­¬i ®· hãa gi¶i ©n o¸n gi÷a cha ta vµ c« c«! ")
		else
			Talk(1,"","§­êng m«n lµ mét trô cét trong giíi vâ l©m, kh«ng nh÷ng dùa vµo vâ c«ng mµ cßn lµ c«ng phu ¸m khİ. VÒ mÆt ¸m khİ lµ thÕ m¹nh cña chóng ta.")
		end
	elseif (Uworld51 >= 10) and (Uworld51 < 100) then		-- Ï´ÇåÔ©ÇüÈÎÎñ£º½øĞĞÖĞ
		Talk(1,"","NhÊt TrÇn tuy lµ bÊt tµi tù nh­ng kh«ng v× thÕ mµ ®em tuyÖt häc vâ c«ng truyÒn ra ngoµi. ")
	elseif (Uworld51 >= 100) then					-- Ï´ÇåÔ©ÇüÈÎÎñ£ºÒÑ¾­Íê³É
		Talk(1,"","NÕu kh«ng ph¶i ng­¬i gióp ta röa s¹ch oan t×nh, chuyÖn nµy kh«ng biÕt sÏ ra sao n÷a, ta vµ Hµm Yªn ph¶i c¸m ¬n ng­¬i míi ®óng!")
	elseif (UTask_tm >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Cã r¶nh nhí vÒ th¨m chóng ta.")
	else
		Talk(1,"","Ng­¬i lµ ®Ö tö míi nhËp m«n ph¶i kh«ng?")
	end
end;

function L20_get()
	DelItem(41)							--·ÀÖ¹ÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ß
	Say("th­îng l­îng", 2, "§Ó ta nghÜ c¸ch xem sao/L20_get_yes", "Kh«ng cã c¸ch/L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","Chång c« chÕt ®i, c« c« cø ®Õn ë trong ng«i nhµ tranh ë hËu s¬n <color=Red>V« T©m cèc<color>. Tõ ®ã bµ Êy kh«ng muèn gÆp mÆt ng­êi trong §­êng m«n, ta ®· ®Õn ®ã nhiÒu lÇn nh­ng chØ ®øng <color=Red>tr­íc cöa<color> thØnh an bµ, lÇn nµy nhê ng­êi vËy! ")
	SetTask(2, 20*256+20)
	AddNote("T¹i phßng NghŞ sù (507,319) gÆp §­êng NhÊt TrÇn, nhËn<color=red> nhiÖm vô §­êng U<color>, ®Õn V« T©m Cèc hãa gi¶i ©n o¸n huynh ®Ö gi÷a s­ c« §­êng U vµ ch­ëng m«n.")
	Msg2Player("T¹i s·nh NghŞ sù gÆp §­êng NhÊt TrÇn, nhËn nhiÖm vô: §i V« T©m Cèc h­íng B¾c hãa gi¶i ©n o¸n huynh ®Ö gi÷a s­ c« §­êng U vµ ch­ëng m«n.")
end;

----------------------- ÊÀ½çÈÎÎñ --------------------------
function Uworld51_get()
	Say("Ai da! nãi ra dµi l¾m…cã thÓ gióp ta gióp ta chuyÓn lêi Do·n Hµm Yªn?",2,"ChuyÖn ®ã dÔ th«i, mµ néi dung trong tin lµ g× vËy?/Uworld51_get_yes","ta nhøc ®Çu l¾m, ngµi t×m ng­êi kh¸c gióp ®ì ®i./L20_get_no")
end

function Uworld51_get_yes()
	Talk(1,"","Nãi víi c« ta: Cha ta kh«ng biÕt thÕ nµo ®ét nhiªn l¹i ph¶n ®èi h«n sù cña chóng ta, h«n lÔ cã thÓ thÓ sÏ khã kh¨n, nh­ng c« ta ®õng qu¸ lo l¾ng.")
	SetTask(51,10)
	Msg2Player("TiÕp nhËn nhiÖm vô: Gióp §­êng NhÊt TrÇn mang tin tíi Do·n Hµm Yªn.")
	AddNote("TiÕp nhËn nhiÖm vô 'Röa s¹ch oan øc': Gióp §­êng NhÊt TrÇn ®­a tin tíi cho Do·n Hµm Yªn.")
end

function Uworld51_30()
	SetTask(51,30)
	Msg2Player("B¹n quyÕt ®Şnh ®i gÆp M«n chñ §­êng Cõu, gióp §­êng NhÊt TrÇn gi¶i thİch.")
end

function Uworld51_60()
	SetTask(51,60)
	Msg2Player("§­êng NhÊt TrÇn mêi b¹n ®i TiÕn Cóc ®éng tiªu diÖt thİch kh¸ch Kim Quèc, ®o¹t bİ kiÕp vÒ.")
end

function Uworld51_80()
	SetTask(51,80)
	Msg2Player("§­êng NhÊt TrÇn c¶m ¬n b¹n gióp ®ì, ®ång thêi hy väng b¹n cã thÓ gióp «ng ta nãi râ víi M«n chñ §­êng Cõu.")
end

function Uworld51_100()
	SetTask(51,100)
	i = random(35,45)
	AddRepute(i)		-- ¼ÓÉùÍû
	Msg2Player("§­êng NhÊt TrÇn c¸m ¬n sù gióp ®ì cña b¹n, Danh väng cña b¹n t¨ng thªm"..i.."®iÓm.")
	Msg2Player("B¹n tù nguyÖn ®em tin tèt b¸o cho Do·n Hµm Yªn, gióp c« ta gi¶m bít sù lo ©u chê ®îi.")
end

function L20_get_no()
end;
