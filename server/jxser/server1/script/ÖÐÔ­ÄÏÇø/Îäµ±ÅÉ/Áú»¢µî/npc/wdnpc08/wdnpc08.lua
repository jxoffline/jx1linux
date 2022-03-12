--description: Îäµ±ÅÉµ¥Ë¼ÄÏ¡¡Îäµ±50¼¶ÈÎÎñ
--author: yuanlan
--date: 2003/5/16
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wd = GetTask(5)
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
		if (UTask_wd == 50*256) and (GetLevel() >= 50) then		-- 50¼¶ÈÎÎñÆô¶¯
			Say("§Ö tö bæn ph¸i lÊy nghÜa hiÖp hµnh tÈu thiªn h¹. Th©n lµ ®Ö tö Vâ §ang theo lı ph¶i lu«n lµm ®iÒu thiÖn. GÇn ®©y ë <color=Red>Thiªn T©m ®éng<color> xuÊt hiÖn 1 ®¸m ®¹o phØ ®øng ®Çu lµ <color=Red>ThiÕt C¸c<color>. Chóng chuyªn c­íp cña giÕt ng­êi", 2, "ViÖc nghÜa nªn lµm /L50_get_yes", "E r»ng khã cã thÓ nhËn nhiÖm vô /L50_get_no")
		elseif (UTask_wd == 50*256+80) then 			-- 50¼¶ÈÎÎñÍê³É
			Talk(2, "L50_prise", "§Ö tö ®· ®em toµn bé sè tiÒn lÊy ®­îc cña bän thæ phØ ®­a cho d©n nghÌo.", "Lµm RÊt tèt! Xøng ®¸ng lµ ®Ö tö bæn ph¸i! ")
		elseif (UTask_wd > 50*256) and (UTask_wd < 50*256+50) then					--50¼¶ÈÎÎñµÚÒ»½Ú£¬ÉĞÎ´Íê³É
			Talk(1,"","N¬i Èn n¸u cña bän thæ phØ ®ã ë <color=Red>Thiªn T©m §éng<color>, tªn cÇm ®Çu lµ<color=Red>ThiÕt C¸c<color>. Nhí ®em toµn bé <color=Red>ng©n l­îng<color> tÆng cho d©n nghÌo ë <color=Red>T­¬ng D­¬ng<color>. ")
		elseif (UTask_wd >= 50*256+50) and (UTask_wd < 60*256) then					--50¼¶ÈÎÎñµÚ¶ş½Ú£¬ÉĞÎ´Íê³É
			AddNote("Trë l¹i Long Hæ ®iÖn gÆp §¬n T­ Nam, biÕt ®­îc ph¶i ®em toµn bé ng©n l­îng giao cho §Æng tÈu nghÌo nhÊt ë Thµnh b¾c. ")
			Msg2Player("§em toµn bé ng©n l­îng tÆng cho §Æng tÈu nghÌo nhÊt ë thµnh B¾c. ")
			Talk(1,"","Nghe nãi trong <color=Red>T­¬ng D­¬ng<color> ng­êi nghÌo nhÊt lµ <color=Red>chŞ d©u §Æng gia<color>, ng­¬i ®em <color=Red>toµn bé ng©n l­îng<color> lÊy ®­îc cña bän thæ phØ tÆng cho chŞ ta.")
		else					--ÒÑ¾­Íê³É50¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","Ta b×nh sinh thİch nhÊt giao kÕt víi nh÷ng ng­êi cã t×nh cã nghÜa,®¹i gia ra giang hå,hµnh hiÖp tr­îng nghÜa.")
		end
	elseif (UTask_wd >= 70) then									--ÒÑ¾­³öÊ¦
		Talk(1,"","ViÖc cña ®êi ng­êi, còng ®õng qu¸ th­¬ng c¶m, thiªn h¹ réng lín ®ñ chç ®Ó ta dung th©n. Hy väng ng­¬i b¶o träng! ")
	else
		Talk(1,"","Thiªn h¹ lo¹n l¹c, sãi hæ hîp quÇn, g©y häa thÕ nh©n, g©y ra ®¹i ho¹! Ta lµ ng­êi häc vâ, thÊy c¶nh nh­ vËy lµm sao cã thÓ ®øng nh×n, lµm sao xøng ®¸ng víi hai ch÷ ' hiÖp nghÜa'!")
	end
end;

function L50_get_yes()
	Talk(1,"","RÊt tèt! Nh­ng ®õng quªn ®em <color=Red>ng©n l­îng<color> lÊy ®­îc cho l·o b¸ t¸nh nghÌo khæ trong <color=Red>T­¬ng D­¬ng<color>.")
	SetTask(5, 50*256+20)
	AddNote("T¹i ®iÖn Long Hæ Vâ §ang ph¸i gÆp §¬n T­ Nam, nhËn nhiÖm vô hµnh thiÖn, ®i ®éng Thiªn T©m Phôc Ng­u s¬n v× d©n trõ h¹i. ")
	Msg2Player("T¹i ®iÖn Long Hæ Vâ §ang ph¸i gÆp §¬n T­ Nam, nhËn nhiÖm vô hµnh thiÖn, ®i ®éng Thiªn T©m Phôc Ng­u s¬n v× d©n trõ h¹i. ")
end;

function L50_get_no()
	Talk(1,"","Trõ b¹o cho d©n lµ tr¸ch nhiÖm cña ng­êi häc vâ, t¹i sao ng­¬i kh­íc tõ?")
end;

function L50_prise()
	SetRank(12)
	SetTask(5, 60*256)
--	AddMagic(157)
	add_wd(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! B¹n ®· trë thµnh Ch­ëng Kinh §¹o Nh©n! Häc ®­îc vâ c«ng To¹ Väng V« Ng· cña Vâ §ang ph¸i. ")
	AddNote("VÒ tíi ®iÖn Long Hæ Vâ §ang ph¸i, phôc mÖnh §¬n Tö Nam, hoµn thµnh nhiÖm vô NhËt hµnh nhÊt thiÖn. Trë thµnh Ch­ëng Kinh §¹o Nh©n. ")
end;
