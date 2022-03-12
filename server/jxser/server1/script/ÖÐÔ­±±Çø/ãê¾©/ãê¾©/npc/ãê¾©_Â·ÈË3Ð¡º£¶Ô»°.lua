--description: ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË3Ğ¡º£¶Ô»° ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 2) then 
			Talk(2, "", "TiÓu H¶i ngoan! Mau vÒ nhµ ®i, mÑ ng­¬i ®ang lo l¾ng cho ng­êi ®Êy! ", "µ! Ng­êi nãi víi mÑ ta, ta ch¬i thªm mét chót n÷a råi vÒ! Nãi bµ Êy ®õng cã lo l¾ng!")
			SetTask(28, SetByte(GetTask(28),3,4))
			AddNote("T×m ®­îc TiÓu H¶i trong Qu·ng tr­êng trong thµnh. Khuyªn cËu ta ®i vÒ nhµ ")
			Msg2Player("T×m ®­îc TiÓu H¶i trong Qu·ng tr­êng trong thµnh. Khuyªn cËu ta ®i vÒ nhµ ")
		elseif (UTask_trsub60 >= 4) then 
			Talk(1,"","Ta ch¬i thªm chót n÷a, råi sÏ vÒ nhanh th«i!")
		end
	else
		Talk(1,""," Ch¸u thİch ¨n nhÊt lµ kÑo hå l« b¸n ë tiÖm cña §­êng l·o, nh­ng mµ mÑ ta kh«ng cho ta mua. B¶o r»ng nÕu ¨n nhiÒu sÏ bŞ ®au bông.")
	end
end;
