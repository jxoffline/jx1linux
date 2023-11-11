-- À¥ÂØ µÜ×Ó Ñ¾»· 10¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 10*256+10) then		--10¼¶ÈÎÎñ½øĞĞÖĞ
			if (HaveItem(112)==1) and (HaveItem(113)==1) and (HaveItem(114)==1) and (HaveItem(115)==1) and (HaveItem(116)==1) then
				L10_prise()
			else
				Talk(1,"","Thuèc ®· ®­îc h¸i ®ñ ch­a?")
			end
		elseif ((UTask_kl == 10*256) and (GetLevel() >= 10)) then		--10¼¶ÈÎÎñ
			Say("TiÓu th­ cña chóng ta tõ bĞ ®· mang nhiÒu bÖnh, mçi ngµy ®Òu ph¶i uèng 1 chĞn linh chi b¸ch th¶o mü vi sinh. Lo¹i d­îc th¶o nµy ngµy h«m qua ®· hÕt, l¹i ®óng vµo lóc ngay tªn d­îc ®ång chuyªn phô tr¸ch h¸i thuèc ng· bÖnh, b©y giê ph¶i lµm sao ®©y?",2,"Gióp ®i h¸i thuèc /L10_get_yes","Lùc bÊt tßng t©m /L10_get_no")
		else
			Talk(1,"","ThÓ chÊt cña tiÓu th­ vÉn yÕu ®uèi nh­ vËy, ph¶i lµm sao ®©y?")
		end
	else
		Talk(1,"","Trong C«n L«n ph¸i, n¬i s¹ch sÏ nhÊt chİnhh lµ phßng cña tiÓu th­ chóng ta!")
	end
end;

function L10_get_yes()
	Talk(3,"L10_get_talk","Xin c« n­¬ng ®õng lo l¾ng,ta sÏ ®i h¸i thuèc vÒ ®©y!","ThËt kh«ng? NÕu thÕ th× qu¸ tèt råi!","Kh«ng biÕt cÇn nh÷ng lo¹i d­îc liÖu nµo?")
end

function L10_get_talk()
	Talk(1,"","CÇn cã: Tö Môc Tóc, §Şa CÈm Th¶o, ThiÕn Th¶o, Hæ NhÜ th¶o vµ Linh Chi. Linh Chi lµ khã t×m nhÊt! §i vÒ h­íng §«ng B¾c cña Long M«n trÊn lµ D­îc V­¬ng Cèc. Trong ®ã cã thÓ t×m ®­îc!")
	SetTask(9,10*256+10)
	AddNote("§Õn D­îc V­¬ng Cèc t¹i phİa ®«ng b¾c cña Long M«n trÊn ®Ó h¸i 5 lo¹i d­îc liÖu Tö Môc Tóc, §Şa CÈm Th¶o, ThiÕn Th¶o, Hæ NhÜ Th¶o vµ Linh Chi. ")
	Msg2Player("§Õn D­îc V­¬ng Cèc t¹i phİa ®«ng b¾c cña Long M«n trÊn ®Ó h¸i 5 lo¹i d­îc liÖu Tö Môc Tóc, §Şa CÈm Th¶o, ThiÕn Th¶o, Hæ NhÜ Th¶o vµ Linh Chi. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","Ng­¬i thËt giái! Ta sÏ nãi tiÓu th­ ®Ò b¹t ng­¬i")
	DelItem(112)
	DelItem(113)
	DelItem(114)
	DelItem(115)
	DelItem(116)
	SetTask(9,20*256)
	SetRank(20)
--	AddMagic(167)
--	AddMagic(168)
--	AddMagic(392)
--	AddMagic(171)
	add_kl(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! §· trë thµnh C«n L«n ph¸i Phông KiÕm ®Ö tö! Häc ®­îc C«n L«n §ao ph¸p, C«n L«n kiÕm ph¸p, Thİch Ph­îc Chó, bïa thanh Phong. ")
	AddNote("H¸i thuèc vÒ, gÆp TiÓu Hµn phôc mÖnh, hoµn thµnh nhiÖm vô h¸i thuèc, th¨ng cÊp thµnh Phông kiÕm ®Ö tö. ")
end;
