--description: ÌÆÃÅÌÆº× 10¼¶ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/10
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-13)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø£¨È¡ÏûÓë´Ë½Å±¾Ïà¹Ø²¿·İ£©

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld51 = GetTask(51)
	if (Uworld51 == 40) then		-- Ï´ÇåÔ©ÇüÈÎÎñ½øĞĞÖĞ
		Talk(6,"Uworld51_50","ChuyÖn ng­¬i muèn gióp NhÊt TrÇn ta ®· biÕt råi.","T¹i sao §­êng Cõu m«n chñ l¹i cã thµnh kiÕn víi NhÊt TrÇn c«ng tö vËy? Tèt xÊu g× còng lµ con ruét cña m×nh?","NhÊt TrÇn nhiÒu lÇn muèn thay ®æi gia quy, lµm cho M«n chñ kh«ng vui, l¹i thªm BÊt NhiÔm muèn tranh quyÒn, hay nãi xÊu NhÊt TrÇn tr­íc mÆt M«n chñ.","ThËt ra chuyÖn Cao t¨ng ThiÕu L©m gÆp n¹n lÇn nµy theo ta nghÜ cã liªn quan víi Kim quèc. Kim quèc lu«n xem ph¸i ThiÕu L©m lµ c¸i gai trong m¾t. MÊy ngµy tr­íc ta nhËn ®­îc th«ng b¸o nãi Thiªn NhÉn gi¸o bİ mËt th©u tãm c¸c bİ cÊp tuyÖt häc m«n ph¸i ë Trung Nguyªn.","Cã chuyÖn nµy µ? VËy Thiªn NhÉn gi¸o lµ ®èi t­îng bŞ nghi ngê nhiÒu nhÊt?","§óng vËy! Ta ph¶i ë ®©y, viÖc dß la tin tøc giao cho ng­¬i.")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if (UTask_tm == 10*256+80) and (HaveItem(36) == 1) then		--10¼¶ÈÎÎñÍê³É
			L10_prise()
		elseif (UTask_tm == 10*256) and (GetLevel() >= 10) then				--10¼¶ÈÎÎñÆô¶¯
--			DelItem(36)							--·ÀÖ¹ÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ß
			Say("Tèi qua khi §Ö tö Bæn täa ®Õn <color=Red>Thµnh §« Phñ<color> hµnh sù, ®· kÎ trém lÊy mÊt ¸m khİ ®éc m«n <color=Red>Ma Vò ch©m<color>, chuyÖn nµy khiÕn Ch­ëng m«n næi trËn l«i ®×nh, ai gióp Bæn toa lÊy l¹i Ma Vò ch©m sÏ ®­îc träng th­ëng! ", 2, "T×m gióp /L10_get_yes", "Ta kh«ng quan t©m!/L10_get_no")
		elseif (UTask_tm > 10*256) and (UTask_tm < 20*256) then					--ÒÑ¾­½Óµ½10¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","<color=Red>Ma Vò ch©m<color> bŞ mÊt ë <color=Red>Thµnh §« Phñ<color>, ng­¬i cã thÓ vµo thµnh ©m thÇm ®iÒu tra. §óng råi! Ng­¬i vÉn ch­a thÊy qua <color=Red>Ma Vò ch©m<color> ph¶i kh«ng? Toµn th©n nã cã mµu ®en, gièng nh­ c©y kim cña con muçi.")
		elseif (UTask_tm >= 20*256) then					--ÒÑ¾­Íê³É10¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","Ng­¬i qu¶ lµ cã b¶n lÜnh, cã thÓ gióp §­êng M«n t×m l¹i Ma Vò ch©m, chØ cÇn ng­¬i cè g¾ng t­¬ng lai nhÊt ®Şnh sÏ réng më.")
		else
			Talk(1,"","Hai vŞ céng tö Bæn m«n bÊt hßa, mÆc dï kh«ng nãi ra nh­ng viÖc nµy kh«ng xö lı tèt nhÊt ®Şnh sÏ cã hËu ho¹n. Kh«ng biÕt M«n chñ cã dù tİnh g×?")
		end
	else								--ÆÕÍ¨¶Ô»°
		Talk(1,"","¸m khİ Bæn m«n vang danh giang hå, luËn vÒ vâ c«ng còng kh«ng thua kĞm ph¸i kh¸c.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>Ma Vò ch©m<color> bŞ mÊt ë <color=Red>Thµnh §« Phñ<color>, ng­¬i cã thÓ vµo thµnh ©m thÇm ®iÒu tra. §óng råi! Ng­¬i vÉn ch­a thÊy qua <color=Red>Ma Vò ch©m<color> ph¶i kh«ng? Toµn th©n nã cã mµu ®en, gièng nh­ c©y kim cña con muçi.")
	SetTask(2, 10*256+20)
	AddNote("GÆp §­êng H¹c ë Vâ C«ng phßng, nhËn nhiÖm vô <color=Red>®i Thµnh §« t×m Ma Vò Ch©m.<color> ")
	Msg2Player("NhËn nhiÖm vô Ma Vò Ch©m, ®i Thµnh §« t×m Ma Vò Ch©m. ")
end;

function refuse()
	Talk(1,"","¸m khİ Bæn m«n bŞ mÊt, lµm sao nãi kh«ng liªn quan ®Õn ng­¬i?")
end;

function L10_prise()
	Talk(1,"","Ng­¬i qu¶ nhiªn cã b¶n lÜnh, cã thÓ gióp Bæn m«n t×m l¹i Ma Vò ch©m. §­îc! Bæn täa sÏ d¹y ng­¬i vµi chiªu, nh×n kü ®©y! ")
	DelItem(36)
	SetRank(26)
	SetTask(2, 20*256)
--	AddMagic(43)
--	AddMagic(347)
	add_tm(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("Trë vÒ Vâ C«ng phßng, giao Ma Vò Ch©m cho §­êng H¹c, hoµn thµnh nhiÖm vô, th¨ng lµm Tr¸ng ®inh. ")
	Msg2Player("Giao Ma Vò Ch©m t×m ®­îc cho §­êng H¹c, hoµn thµnh nhiÖm vô Ma Vò Ch©m, th¨ng lµ §­êng M«n Tr¸ng ®inh. Häc ®­îc §­êng M«n ¸m khİ, §Şa DiÖm Háa. ")
end;

----------------------- ÊÀ½çÈÎÎñ --------------------------
function Uworld51_50()
	SetTask(51,50)
	Msg2Player("§­êng H¹c suy ®o¸n lµ viÖc nµy cã liªn quan víi Thiªn NhÉn Gi¸o, nhê b¹n ®i dß la tin tøc. ")
end
