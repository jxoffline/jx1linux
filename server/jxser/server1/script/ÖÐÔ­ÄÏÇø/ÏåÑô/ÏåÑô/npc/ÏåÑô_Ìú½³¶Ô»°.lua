--description: ÖĞÔ­ÄÏÇø ÏåÑô¸® Ìú½³¶Ô»° Îäµ±ÅÉ³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-08)
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>T¹i ®©y chuyªn lµm binh khİ cho qu©n ®éi nªn rÊt bËn rén. CÇn lo¹i vò khİ nµo th× chän tù nhiªn nhĞ."

function main(sel)
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "Nay chiÕn sù mÆt trËn khÈn cÊp, quan binh qu©n giíi l¹i kh«ng ®ñ, «ng cã thÓ mau chãng rÌn mét l« binh khİ cho chiÕn tr­êng kh«ng?", "Kh«ng giÊu g× ng­¬i, lóc nµy ta ngµy ®ªm lµm viÖc. Nh­ng v× sè l­îng qu¸ lín, nªn sè kho¸ng th¹ch trong kho ®· kh«ng ®ñ dïng!<color=Red>Tõ ThiÕt Kho¸ng, L­îng Ng©n Kho¸ng vµ Xİch §ång kho¸ng<color>®Òu ®· dïng hÕt. Ng­¬i cã thÓ ®Õn <color=Red>phİa T©y Nam<color> gióp ta t×m kho¸ng th¹ch kh«ng?")
			SetTask(17, SetByte(GetTask(17),2,5))
			AddNote("Thî rÌn (193,201) cho biÕt: muèn chÕ t¹o binh khİ cÇn cã 3 lo¹i kho¸ng th¹ch lµ: Xİch §ång Kho¸ng, Tõ ThiÕt Kho¸ng, L­îng Ng©n Kho¸ng, cã thÓ t×m thÊy chóng ë bªn ngoµi  rõng h­íng T©y Nam  cña T­¬ng D­¬ng.")
		elseif (UTask_wd60sub == 5) then 
			if ( HaveItem(138) == 1 and HaveItem(118) == 1 and HaveItem(121) == 1) then
				Talk(2, "", "Ta ®· t×m ®­îc kho¸ng th¹ch, hy väng nh÷ng kho¸ng th¹ch nµy cã thÓ t¹o ra nh÷ng binh khİ tèt nhÊt, gióp c¸c binh sÜ chèng Kim binh", "Mäi ng­êi chİ cao nh­ nói, nhÊt ®Şnh sÏ ®uæi ®­îc lò ngo¹i x©m!")
				DelItem(138)
				DelItem(118)
				DelItem(121)
				SetTask(17, SetByte(GetTask(17),2,8))
				AddNote("T×m ®ñ 3 lo¹i kho¸ng th¹ch giao cho thî rÌn gi¶i quyÕt ®­îc vÊn ®Ò kh«ng ®ñ binh khİ chèng Kim.")
				Msg2Player("T×m ®ñ 3 lo¹i kho¸ng th¹ch giao cho thî rÌn gi¶i quyÕt ®­îc vÊn ®Ò kh«ng ®ñ binh khİ chèng Kim.")
			else
				tiejiang_city("Kh«ng cã kho¸ng th¹ch th× ta kh«ng cã c¸ch nµo t¹o vò khİ ®­îc! Ng­¬i cã thÓ ®Õn <color=Red>khu rõng phİa nam ngoµi thµnh<color> lÊy mét İt <color=Red> Tõ ThiÕt Th¹ch, L­îng Ng©n Kho¸ng vµ Xİch §ång Kho¸ng<color>?")
			end
		else
			tiejiang_city()
		end		
	else
		tiejiang_city()
	end
end;

function yes()
	Sale(10);  			--µ¯³ö½»Ò×¿ò
end;

