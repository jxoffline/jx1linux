--description: Îäµ±ÅÉĞìá·ÔÀ¡¡Îäµ±30¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\timerhead.lua")
Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	Uworld50 = GetTask(50)
--	Uworld31 = GetByte(GetTask(31),1)
	if (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 30*256) and (GetLevel() >= 30) then
			for i = 1,GetItemCount(133) do DelItem(133) end
			Talk(2, "L30_get", "Ng­¬i ë Vâ §ang häc vâ còng ®­îc nhiÒu ngµy råi, ta muèn thö vâ c«ng cña ng­¬i, xem ng­¬i cã tiÕn bé ch­a.", "Ph­¬ng ph¸p cô thÓ lµ ta muèn ng­¬i trong mét thêi gian nhÊt ®Şnh, h·y ®Õn Phôc Ng­u s¬n lÊy 5 c©y Häa Mi th¶o, nÕu qu¸ thêi gian quy ®Şnh hoÆc sè l­îng kh«ng ®ñ th× coi nh­ ng­¬i thÊt b¹i.")
--		Îª¼ÆÊ±Æ÷´íÎó´ò²¹¶¡£¬±äÁ¿ÖµÎª35¡¢Ñ§»áÁË´¿ÑôĞÄ·¨(156)¡¢Îäµ±½£·¨(151)µÄÒ²¿ÉÒÔ½Ó30¼¶ÈÎÎñ£¨ÒÑÈ¡Ïû£©
--		elseif  (UTask_wd == 35) and (HaveMagic(156) >= 0) and (HaveMagic(151) >= 0) and (GetLevel() >= 30) then
--			for i = 1,GetItemCount(133) do DelItem(133) end
--			Talk(2, "L30_get", "Ğìá·ÔÀ£ºÄãÏëÔÙ¶È³¢ÊÔ»­Ã¼²İµÄ¿¼Ñé£¬ºÜºÃ¡£", "ÔÚ¹æ¶¨Ê±¼äÀï£¬µ½·üÅ£É½ÉÏ²É»ØÎåÖê»­Ã¼²İ£¬Èç¹û³¬¹ı¹æ¶¨Ê±¼ä»òÕß²ÉµÄÊıÄ¿²»¹»£¬¶¼ËãÊ§°Ü¡£")
		elseif (UTask_wd == 30*256+20) then
			Say("Ng­¬i ®· lÊy 5 c©y Häa Mi th¶o ch­a?",2,"§· h¸i ®ñ hoa/L30_finish_yes","VÉn ch­a ®ñ/L30_finish_no")
		elseif (UTask_wd == 30*256+50) then 						--¼ÆÊ±ÒÑµ½
			L30_fail()
		elseif (UTask_wd > 30*256) and (UTask_wd < 40*256) then					--ÒÑ¾­½Óµ½30¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			L30_finish_no()
--			Talk(1,"","Ğìá·ÔÀ£ºÄãÒªÔÚ<color=Red>¶şÊ®ËÄ¸öÊ±³½<color>ÀïÈ¥<color=Red>·üÅ£É½<color>²É»Ø<color=Red>ÎåÖê»­Ã¼²İ<color>£¬ÒÑ¾­Ö»Ê£"..GetRestCTime(2).."ÁË£¬ÄãÒª×¥½ô°¡£¡")
		else					--ÒÑ¾­Íê³É30¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦£¨È±Ê¡¶Ô»°£©
			Talk(1,"","Vâ c«ng bæn ph¸i rÊt chó träng viÖc tu luyÖn néi c«ng, di chuyÓn linh ho¹t, nh­ng kh«ng xem thÊp néi c«ng thuÇn khiÕt, còng ph¸t huy trong ®ã kh«ng İt uy lùc ch©n chİnh.")
		end
--	elseif (Uworld50 < 10) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 4) then		-- µãĞÑĞìÖĞÔ­ÈÎÎñ£¬Æô¶¯
		--		Talk(3,"Uworld50_get","Ğìá·ÔÀ£ºÖĞÔ­£¬²»ÊÇÎª¸¸ÓĞËù³É¼û£¬ÄÇ°×Ó¨Ó¨ĞÄÈçÉßĞ«£¬ÒõÏÕ¶¾À±£¬¾ø·ÇÁ¼Å¼¡£","ĞìÖĞÔ­£ºµù£¬ÄãÃ»ÓĞºÍÓ¨Ó¨¼û¹ıÃæ£¬¹âÆ¾½­ºş´«ÑÔ¾ÍÕâÑù°ÑÈË¼Ò¸øÁ¿ËÀÁË£¬ÆäÊµÓ¨Ó¨ËıÕæµÄÊÇ³öÓÙÄà¶ø²»È¾µÄºÃ¹ÃÄï£¬¾ø·ÇÈËÃÇ¿ÚÖĞËùËµµÄÄÇÑù¡£","Íæ¼Ò£ºĞìÇ°±²£¬ÄúÇÒ±ğĞÄ¼±£¬ĞìÉÙÏÀÈÃÎÒÀ´È°È°°É¡£")
	elseif (Uworld50 == 30) then
		Talk(2,"","Yªu n÷ B¹ch Doanh Doanh dïng lêi ®­êng mËt ®Ó lõa g¹t ng­¬i råi ®ã!"," B©y giê ta còng chØ b¸n tİn b¸n nghi, kh«ng hoµn toµn tin t­ëng c« ta. NÕu c« Êy ®óng lµ ch©n thËt, chóng ta nªn cho c« ta c¬ héi míi ®­îc")
	elseif (Uworld50 == 50) then		-- ½±Àø2£¬ÈÎÎñÍê³É
		Talk(1,"U50_Prise2","Hõ! Ta ®· sím nãi tªn yªu n÷ nµy kh«ng ph¶i ng­êi tèt qu¶ nhiªn nh­ vËy!Kh«ng biÕt c¶m ¬n ng­¬i thÕ nµo. §­îc! §Ó ta chØ ng­¬i 2 chiªu tuyÖt kiÕm nhĞ!")
	elseif (UTask_wd >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","B¶o kiÕm phong tïng ma lÖ xuÊt mai hoa h­¬ng tù khæ hµn lai muèn trë thµnh cao thñ ®æ må h«i h¬n ng­¬× kh¸c thËt nhiÒu.")
	else
		Talk(1,"","§¹o häc vâ, cã t­ chÊt tèt nh­ng kh«ng cÇn cï luyÖn tËp còng kh«ng thÓ trë thµnh cao thñ.")
	end
end;

function L30_get()
	Say("Ng­¬i cã tù tin nhËn nhiÖm vô lÇn nµy kh«ng?", 2, "Kh«ng thµnh vÊn ®Ò!/L30_get_yes", "§Ö tö n¨ng lùc kĞm câi, e khã hoµn thµnh nhiÖm vô nµy/L30_get_no")
end;

function L30_get_yes()
	i = GetTimerId()
	if (i > 0) and (i ~= 2) then		-- ÁíÓĞ¼ÆÊ±Æ÷ÔÚÔËĞĞÖĞ£¬²¢ÇÒ²»ÊÇ´ËÈÎÎñ
		Talk(1,"","Ng­¬i ®ang mang nhiÖm vô cÊp b¸ch nh­ thÕ, mµ cßn ch¹y lung tung µ?")
		return
	end
	Talk(1,"","Hay l¾m! B©y giê b¾t ®Çu tİnh thêi gian, néi trong <color=Red>72 giê<color> lªn <color=Red>Phôc Ng­u s¬n<color> h¸i vÒ <color=Red>5 c©y Häa Mi th¶o<color>, ®i ®i!")
	StopTimer()
	SetTimer(72 * CTime * FramePerSec, 2)										--¿ªÆô¼ÆÊ±Æ÷:72¸öÊ±³½ * Ê±³½³¤ * Ö¡Êı
	SetTask(5, 30*256+20)
	AddNote("GÆp Tõ §¹i Nh¹c tiÕp nhËn nhiÖm vô, néi trong 72 giê ®Õn Phôc Ng­u s¬n ®«ng h¸i vÒ 5 c©y Häa mi th¶o.")
	Msg2Player("GÆp Tõ §¹i Nh¹c tiÕp nhËn nhiÖm vô, néi trong 72 giê ®Õn Phôc Ng­u s¬n ®«ng h¸i vÒ 5 c©y Häa mi th¶o.")
end;

function L30_get_no()
	Talk(1,"","Ta sÏ cè g¾ng hÕt møc!")
end;

function L30_finish_yes()
	if (GetItemCount(133) >= 5) then 
		L30_prise() 
	else
		Talk(1,"L30_finish_no","Ng­¬i vÉn ch­a lÊy ®ñ 5 c©y!")
	end
end;

function L30_finish_no()
	if (GetRestSec(2) > 0) then
		Talk(1,"","Ng­¬i hiÖn chØ cßn thêi h¹n lµ "..GetRestCTime(2).."th«i, mau tranh thñ thêi gian ®i!")
	else
		i = GetTimerId()
		if (i == 2) or (i == 0) then
			StopTimer()
		end
		L30_fail()
	end
end;

function L30_prise()
	for i = 1,GetItemCount(133) do DelItem(133) end
	if (GetTimerId() == 2) then			-- ÕıÔÚÈÎÎñ¼ÆÊ±ÖĞ
		StopTimer()					--½áÊø¼ÆÊ±
	end
	Talk(1,"","Xem ra vâ c«ng cña ng­¬i qua nhiªn tiÕn bé rÊt mau! ThËt ®¸ng mõng! ")
	SetRank(10)
	SetTask(5, 40*256)
--	AddMagic(164)
--	AddMagic(158)
	add_wd(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®­îc phong lµ TuÇn S¬n §¹o Nh©n! Häc ®­îc vâ c«ng Vâ §ang ph¸i lµ B¸t CËp Nhi Phôc, KiÕm Phi Kinh Thiªn.")
	AddNote("Trong thêi gian quy ®Şnh quay vÒ ThËp Ph­¬ng §iÖn, ®­a 5 c©y Häa mi th¶o cho Tõ §¹i Nh¹c, hoµn thµnh nhiÖm vô Häa mi th¶o, th¨ng lµm TuÇn S¬n §¹o Nh©n.")
end;

function L30_fail()
	for i = 1,GetItemCount(133) do DelItem(133) end
	SetTask(5, 30*256)
	AddNote("V­ît qu¸ thêi gian quy ®Şnh, nhiÖm vô Häa mi th¶o ®· thÊt b¹i.")
	Msg2Player("V­ît qu¸ thêi gian quy ®Şnh, nhiÖm vô Häa mi th¶o ®· thÊt b¹i.")
	Talk(1,"","Thêi gian ®· hÕt! Ng­¬i khiÕn ta qu¸ thÊt väng! B×nh th­êng cã ph¶i ng­¬i l­êi tËp luyÖn kh«ng? NhÊt ®Şnh ph¶i siªng n¨ng luyÖn tËp míi thµnh!Khi nµo chuÈn bŞ tèt råi,th× cã thÓ ®Õn t×m ta.")
end;

function Uworld50_get()
	SetTask(50,10)
	Msg2Player("TiÕp nhËn nhiÖm vô: Thøc tØnh Tõ Trung Nguyªn kh«ng nªn mª muéi v× yªu n÷ B¹ch Doanh Doanh.")
	AddNote("TiÕp nhËn nhiÖm vô: Thøc tØnh Tõ Trung Nguyªn kh«ng nªn mª muéi v× yªu n÷ B¹ch Doanh Doanh.")
end

function U50_Prise2()
	SetTask(50,255)
	AddProp(1)
	AddEng(1)
	Task88_4 = GetByte(GetTask(88),4) + 1
	if (Task88_4 > 255) then Task88_4 = 255 end
	Task88 = SetByte(GetTask(88),4,Task88_4)
	SetTask(88,Task88)			-- ¼ÇÂ¼ÈÎÎñµÃÄÚ¹¦µã×ÜÊı

	Msg2Player("Nhê sù chØ ®iÓm cña Tõ §¹i Nh¹c, néi lùc cña b¹n ®· th¨ng lªn 1 ®iÓm. NhiÖm vô thøc tØnh Tõ Trung Nguyªn ®· hoµn thµnh.")
	AddNote("Hoµn thµnh nhiÖm vô thøc tØnh Tõ Trung Nguyªn.")
end

function no()
end
