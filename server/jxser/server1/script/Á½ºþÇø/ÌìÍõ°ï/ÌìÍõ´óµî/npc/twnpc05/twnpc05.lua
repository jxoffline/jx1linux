--description: ÌìÍõ°ïÌì»¤·¨Â·ÔÆÔ¶ ÌìÍõ°ï40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/26
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-25), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø£¨È¡ÏûÓë´Ë½Å±¾Ïà¹Ø²¿·İ£©

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 40*256) and (GetLevel() >= 40) then
			Talk(2, "L40_get", "Lé l·o hé ph¸p, nh×n vÎ mÆt cña ng­êi d­êng nh­ cã chuyÖn g× buån rÇu?", "§Ö tö ta Ng« C­¬ng Thİch míi võa råi ë bªn hå kh«ng cÈn thËn ®· bŞ r¾n Xİch LuyÖn c¾n, b©y giê tİnh m¹ng nh­ ngµn c©n treo sîi tãc. ChÊt ®éc ®· lang ®Õn lôc phñ ngò t¹ng råi, kh«ng thÓ lµm g× ®­îc. Nghe nãi <color=Red>Ng« ThÇn Y<color> ë <color=Red>Ba L¨ng huyÖn<color> cã thÓ cøu ®­îc! Ng­¬i....")
		elseif (UTask_tw == 40*256+50) and (HaveItem(93) == 1) and (HaveItem(94) == 1) then
			L40_prise()
		elseif (UTask_tw > 40*256+20) and (UTask_tw < 50*256) then					--ÒÑ¾­½Óµ½40¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Xin ®­îc thuèc gi¶i råi µ?")
		elseif (UTask_tw >= 50*256) then					--ÒÑ¾­Íê³É40¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","Ng­¬i kh«ng nh÷ng giái vâ c«ng mµ t©m tİnh l¹i cßn rÊt tèt! Ta thİch ng­¬i®ã!")
		else										--ÉĞÎ´½Ó40¼¶ÈÎÎñ
			Talk(1,"","§óng lµ Tr­êng Giang sãng sau x« sãng tr­íc, nh÷ng l·o gia nh­ chóng ta kh«ng phôc còng kh«ng ®­îc!")
		end
	elseif (UTask_tw >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Thêi thÕ t¹o anh hïng, ngµy nay anh hïng®· tÒ tô, ng­êi tµi cã nhiÒu, mong ng­¬i sau nay cã thÓ lµm ®­îc mét viÖc g× ®ã kinh thiªn ®éng ®Şa, ®Ó vang danh thiªn h¹ ")
	else
		Talk(1,"","Bæn bang Nam kh¸ng TriÖu Tèng, B¾c chèng Kim binh. D­¬ng bang chñ th©n lµ n÷ nhi mµ l¹i l·nh ®¹o bang chóng ta cã ®­îc mét c¬ ®å lín nh­ h«m nay qu¶ thËt lµ kh«ng ®¬n gi¶n!")
	end
end;

function L40_get()
	Say("Ng­¬i cã thÓ ®Õn Ba L¨ng huyÖn t×m <color=Red>Ng« ThÇn y<color> xin thuèc gi¶i kh«ng?", 2, "Thuéc h¹ ®ång ı /L40_get_yes", "Thuéc h¹ cã viÖc kh¸c /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","Tèt l¾m! Mau ®i mau vÒ!")
	SetTask(3, 40*256+20)
	SetTask(14,0)
	AddNote("T¹i Thiªn V­¬ng ®¹i ®iÖn gÆp Lé V©n ViÔn tiÕp nhËn <color=red>nhiÖm vô ®i t×m thuèc gi¶i<color>, ®i ®Õn Ba L¨ng huyÖn t×m Ng« ThÇn y xin thuèc. ")
	Msg2Player("T¹i Thiªn V­¬ng ®¹i ®iÖn gÆp Lé V©n ViÔn tiÕp nhËn nhiÖm vô ®i t×m thuèc gi¶i, ®i ®Õn Ba L¨ng huyÖn t×m Ng« ThÇn y xin thuèc. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","Tèt qu¸! Cã nh÷ng d­îc liÖu nµy th× Ng« C­¬ng sÏ ®­îc cøu! ThËt kh«ng biÕt ph¶i c¶m ¬n ng­¬i thÕ nµo ®©y?!")
	DelItem(93)
	DelItem(94)
	SetRank(47)
	SetTask(3, 50*256)
--	AddMagic(40)
	add_tw(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Mang hai vŞ thuèc giao cho Lé V©n ViÔn, hoµn thµnh nhiÖm vô, ®­îc phong lµm Thuû §¹o thèng lÜnh. Häc ®­îc: §o¹n Hån Thİch ")
	AddNote("Quay vÒ ®¹i ®iÖn Thiªn V­¬ng mang hai vŞ thuèc giao cho Lé V©n ViÔn, hoµn thµnh nhiÖm vô. §­îc phong lµ: Thuû §¹o thèng lÜnh ")
end;
