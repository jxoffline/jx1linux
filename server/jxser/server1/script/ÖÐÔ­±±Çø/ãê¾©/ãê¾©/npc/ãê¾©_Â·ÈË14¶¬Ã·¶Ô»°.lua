--description: ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË14¶¬Ã·¶Ô»° ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 0) then
			DelItem(130)			--´¦ÀíÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ßµÄÇé¿ö	
			Say("ThÊy TiÓu H¶i nhµ t«i kh«ng? Kh«ng biÕt nã l¹i ch¹y ®i ®©u ch¬i råi, ng­¬i cã thÓ gióp ta t×m nã ®­îc kh«ng?", 2, "§­îc!/L60_sub3_yes", "Ta cßn cã viÖc kh¸c. /L60_sub3_no")
		elseif (UTask_trsub60 == 2) then
			Talk(1,"","T×m thÊy TiÓu H¶i nhµ t«i ch­a?")
		elseif (UTask_trsub60 == 4) then
			Talk(2, "", "TiÓu H¶i ®ang ch¬i ë qu·ng tr­êng, l¸t n÷a sÏ vÒ!", "C¸m ¬n ng­¬i! TiÓu H¶i nhµ ta sau nµy lín lªn chØ cÇn ®­îc ph©n n÷a nh­ ng­¬i lµ tèt råi! Ta tÆng còng kh«ng cã g× quı gi¸, chØ cã mét thanh kiÕm nµy vèn lµ vËt phßng th©n. ThÊy ng­¬i còng lµ mét ng­êi tËp vâ, xin tÆng thanh ®o¶n kiÕm nµy cho ng")
			AddEventItem(130)
			Msg2Player("NhËn ®­îc thanh kiÕm Khø Tµ ")
			SetTask(28, SetByte(GetTask(28),3,10))
			AddNote("VÒ ®Õn nhµ cña §«ng Mai, nhËn ®­îc thanh kiÕm Khø Tµ ")
		elseif (UTask_trsub60 == 10) and (HaveItem(130) == 0) then
			AddEventItem(130)
			Msg2Player("NhËn ®­îc thanh kiÕm Khø Tµ ")
			Talk(1,"","Thanh kiÕm nµy mÆc dï kh«ng quı gi¸ g×, nh­ng lµ mét chót thµnh ı cña ta, ng­¬i ®õng tõ chèi n÷a.")
		else
			Talk(1,"","Cha TiÓu H¶i kh«ng cã ë nhµ, ®øa con nµy l¹i kh«ng biÕt nghe lêi! ")
		end
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","ThÊy TiÓu H¶i nhµ t«i ®©u kh«ng? Kh«ng biÕt nã ch¹y ®i ®©u ch¬i råi!")
		elseif (i == 1) then
			Talk(1,"","Cha TiÓu H¶i kh«ng cã ë nhµ, mäi chuyÖn ®Òu do t«i qu¸n xuyÕn, vËy mµ nã l¹i kh«ng nghe lêi! ")
		else
			Talk(1,"","ThÕ côc hiÖn giê kh«ng tèt! muèn sèng qua ngµy thËt khã!")
		end;
	end
end;

function L60_sub3_yes()
	Talk(1,"","PhiÒn ng­¬i qu¸! ")
	SetTask(28, SetByte(GetTask(28),3,2))
	AddNote("T×m gÆp §«ng Mai t¹i mét khu d©n c­ phİa §«ng B¾c BiÖn Kinh, gióp Nµng ta t×m TiÓu H¶i ")
	Msg2Player("§«ng Mai nhê ng­¬i gióp c« Êy ®i t×m TiÓu H¶i vÒ ")
end;

function L60_sub3_no()
	Talk(1,"","Chao «i! §øa con nµy thËt khiÕn ng­êi ta ph¶i lo l¾ng! ")
end;
