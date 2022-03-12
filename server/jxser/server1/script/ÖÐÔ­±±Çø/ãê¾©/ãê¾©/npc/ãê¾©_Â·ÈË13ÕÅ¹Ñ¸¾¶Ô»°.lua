--description: ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË13ÕÅ¹Ñ¸¾¶Ô»° ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
--	UTask_tr = GetTask(4)		--Ã»±ØÒªÀí»á´óÈÎÎñ×´Ì¬
--	if (UTask_tr == 62) then
	UTask_trsub60 = GetByte(GetTask(28),1)
	if (UTask_trsub60 == 1) and (HaveItem(63) == 1) then
		Talk(2, "", " §©y lµ Ng©n tr©m cña Khóc Thî rÌn trong thµnh nhê ta ®­a cho c«, «ng ta cã t×nh ı víi c«, chØ lµ kh«ng ®ñ dòng c¶m ®Ó tá bµy, kh«ng biÕt c«.....", "ThËt ra, ta ®· cã c¶m t×nh víi huynh Êy, nh­ng lµ mét qu¶ phô, lµm sao më miÖng ®­îc chø? Tói H­¬ng Nang nµy tù tay ta lµm, phiÒn ng­¬i ®­a cho «ng ta, chİnh lµ tİn vËt nµy!")
		DelItem(63)
		AddEventItem(64)
		SetTask(28, SetByte(GetTask(28),1,2))
		AddNote("§o¸n ®óng tÊt c¶ nh÷ng c©u ®è cña t«n tó tµi, ®­îc tÆng cho c©y ®ao®o¶n thñy ")
		Msg2Player("NhËn ®­îc mét tói h­¬ng ")
	elseif (UTask_trsub60 == 2) and (HaveItem(64) == 0) then
		AddEventItem(64)
		Talk(1,"","Ng­¬i ®ã! T¹i sao tói h­¬ng kh«ng lÊy vµ ng­êi còng kh«ng thÊy?")
	elseif (UTask_trsub60 >= 2) then 
		Talk(1,"","§a t¹ ng­¬i ®· se duyªn gi÷a ta vµ l·o Khóc! NÕu kh«ng ta ch¾c ph¶i sèng c« ®¬n tíi chÕt! ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","N¨m tr­íc, chång ta bŞ bÖnh ®· chÕt, ta sèng c« ®éc mét m×nh ®Õn nay!")
		else
			Talk(1,"","Phİa B¾c thµnh cã Ph­¬ng l·o th¸i bŞ mÊt chång, sèng c« ®éc ®· 30 n¨m råi! ThËt lµ ®¸ng th­¬ng!")
		end
	end
end;
