--description: ÌìÈÌ½ÌÓÒ»¤·¨Ò®ÂÉ±ÙÀë¡¡ÌìÈÌ40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø£¨È¡ÏûÓë´Ë½Å±¾Ïà¹Ø²¿·İ£©

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 40*256) and (GetLevel() >= 40) then		-- 40¼¶ÈÎÎñÆô¶¯
			Say("Theo tin b¸o vÒ, träng thÇn Th¸i Uı cña TriÒu ®×nh <color=Red>LiÖu Kú<color> vèn lµ gi¸n ®iÖp cña Tèng triÒu, tuy «ng ta ®· c¸o l·o håi h­¬ng, nh­ng còng kh«ng thÓ ®Ó «ng ta rêi khái Kim quèc. Tin tøc cho biÕt, LiÖu Kú chuÈn bŞ theo ®­êng <color=Red>KiÕm C¸c<color> vÒ Tø Xuyªn, ta ph¸i ng­¬i ®i tiªu diÖt h¾n, nhÊt ®Şnh ph¶i biÕn KiÕm C¸c Thôc §¹o thµnh må ch«n th©y h¾n!", 2, "Thuéc h¹ tu©n mÖnh/L40_get_yes", "Thuéc h¹ e r»ng kh«ng ®¶m nhiÖm næi/L40_get_no")
		elseif (UTask_tr == 40*256+20) and (HaveItem(159) == 1) then
			Talk(1,"L40_prise", "§©y lµ bøc mËt th­ thuéc h¹ lÊy ®­îc trªn ng­êi LiÖu Kú.")
		elseif (UTask_tr >= 10*256) and (UTask_tr < 40*256) then					--ÉĞÎ´½Ó40¼¶ÈÎÎñ
			Talk(1,"","LuyÖn binh ngh×n ngµy, dïng trong mét trËn, chØ cÇn toµn t©m toµn ı phông mÖnh bæn gi¸o, bæn gi¸o sÏ kh«ng b¹c ®·i ng­¬i!")
		elseif (UTask_tr > 40*256) and (UTask_tr < 50*256) then					--ÒÑ¾­½Óµ½40¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Tin b¸o <color=Red>LiÖu Kú<color> ®· ®Õn <color=Red>Táa V©n §éng<color> ë KiÕm C¸c Thôc §¹o, ®Şa h×nh ë ®ã rÊt phøc t¹p, ng­¬i cã thÓ ®­a İt tiÒn ®Ó <color=Red>¤ §µn Chñ<color> ®­a ng­¬i ®i, h·y ®i nhanh ®i!")
		else							--ÒÑ¾­Íê³É40¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","Nh÷ng kÎ ph¶n béi bæn gi¸o, ha ha…Ta quyÕt cho bän chóng sèng kh«ng §­îc!chÕt còng kh«ng xong!")
		end
	elseif (UTask_tr >= 70) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","NghÜ kü ch­a? Muèn ë l¹i ®©y, hay Nam h¹ Trung Nguyªn?")
	else
		Talk(1,"","Ng­¬i lµ ai? Ch¼ng lÏ lµ gi¸n ®iÖp cña Trung Nguyªn?")
	end
end;

function L40_get_yes()
	Talk(1,"","Tin b¸o <color=Red>LiÖu Kú<color> ®· ®Õn <color=Red>Táa V©n §éng<color> ë KiÕm C¸c Thôc §¹o, ®Şa h×nh ë ®ã rÊt phøc t¹p, ng­¬i cã thÓ ®­a İt tiÒn ®Ó <color=Red>¤ §µn Chñ<color> ®­a ng­¬i ®i, h·y ®i nhanh ®i!")
	SetTask(4, 40*256+20)
	AddNote("T¹i tÇng thø ba Thiªn NhÉn gi¸o gÆp H÷u Hé Ph¸p Gia LuËt TŞ Li, nhËn nhiÖm vô hµnh thİch, ®Õn Táa V©n ®éng thİch s¸t gian tÕ LiÖu Kú ")
	Msg2Player("T¹i tÇng thø ba Thiªn NhÉn gi¸o gÆp H÷u Hé Ph¸p Gia LuËt TŞ Li, nhËn nhiÖm vô hµnh thİch, ®Õn Táa V©n ®éng thİch s¸t gian tÕ LiÖu Kú ")
end;

function L40_get_no()
	Talk(1,"","ChuyÖn nhá nµy mµ ng­¬i còng lµm kh«ng xong, bæn gi¸o nu«i ng­¬i ®Ó lµm g×?")
end;

function L40_prise()
	Talk(1, "", "Lµm thËt tèt! LÇn nµy ng­¬i ®· lËp c«ng lín, ta nhÊt ®Şnh sÏ nãi tèt ng­¬i víi Gi¸o chñ!")
	SetRank(59)
	DelItem(159)
	SetTask(4, 50*256)
--	AddMagic(364)
--	AddMagic(146)				-- ÎåĞĞÕó
	add_tr(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §­îc phong lµ: Ch­ëng Kú sø! Häc ®­îc vâ c«ng Bi T« Thanh Phong. ")
	AddNote("Quay l¹i Thiªn NhÉn Gi¸o, ®­a bøc mËt th­ cho H÷u Hé Ph¸p Gia LuËt TŞ Li, hoµn thµnh nhiÖm vô hµnh thİch. Th¨ng cÊp Ch­ëng Kú Sø. ")
end;
