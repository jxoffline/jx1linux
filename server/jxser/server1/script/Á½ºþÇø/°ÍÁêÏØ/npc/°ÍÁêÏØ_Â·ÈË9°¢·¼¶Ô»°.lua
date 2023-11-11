--Á½ºşÇø °ÍÁêÏØ Â·ÈË9°¢·¼¶Ô»°
--°ÍÁêÏØĞÂÊÖÈÎÎñ£º°¢·¼µÄ¼Ş×±
--suyu
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world20 = GetTask(48);
	if ((UTask_world20 == 0) and (GetLevel() >= 2)) then		-- ÈÎÎñÆô¶¯
		Say("Bè mÑ ®· s¾p xÕp h«n sù cho em,nh­ng nhµ em nghÌo qu¸, ®Õn mét mãn cña håi m«n cho ra d¸ng còng kh«ng cã! GÇn ®©y trong trÊn xuÊt hiÖn mét ng­êi th­¬ng nh©n tõ ph­¬ng xa ®Õn, anh/chŞ cã thÓ hái gióp em xem cã mãn nµo gi¸ rÎ mét chót kh«ng?", 2, "Gióp /yes", "Kh«ng gióp /no")
	elseif(UTask_world20 == 1) then
		if(HaveItem(181) == 1) then
			DelItem(181)
			SetTask(48, 3)			-- ÈÎÎñÔİÊ±¸ÄÎª²»¿ÉÖØ¸´Íê³É
			Talk(1,"","A! §«i b«ng tai nµy ®Ñp qu¸,cã lÏ ®· tèn cña anh/chŞ kh«ng İt tiÒn! §©y lµ ®«i giµy em tù lµm, tÆng cho anh/chŞ!")
			AddNote("§­a ®«i b«ng tai cho A ph­¬ng, hoµn thµnh nhiÖm vô. ")
			Msg2Player("§­a ®«i b«ng tai cho A ph­¬ng, hoµn thµnh nhiÖm vô. ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
			if(GetSex() == 0) then
				AddItem(0, 7, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("NhËn ®­îc mét chiÕc kh¨n ")
			else
				AddItem(0, 7, 8, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("NhËn ®­îc mét chiÕc tr©m ")
			end
			AddRepute(6)		-- ¼ÓÉùÍû6µã
			Msg2Player("Thanh thÕ giang hå cña b¹n ®­îc gia t¨ng 6 ®iÓm. ")
		else
			Talk(1,"","Ng­êi th­¬ng nh©n ®ã ë trong thŞ trÊn, lµm phiÒn anh/chŞ hái gióp víi. ")
		end
	else				-- ·ÇÈÎÎñ¶Ô»°
		if (random(0,1) == 0) then
			Talk(1,"","Con g¸i cña ng­ d©n, cuèi cïng còng g¶ vµo nhµ ng­ d©n, lµm vî cña ng­ d©n. ")
		else
			Talk(1,"","Bè mÑ ®· s¾p xÕp h«n sù cho em, nh­ng em kh«ng muèn lµm vî mét ng­ d©n, nh­ng kh«ng cßn c¸ch nµo kh¸c, lêi cña cha mÑ kh«ng thÓ c·i l¹i. ")
		end
	end
end;

function yes()
	Talk(1,"","Ng­êi th­¬ng nh©n ®ã ë trong thŞ trÊn, lµm phiÒn anh/chŞ hái gióp víi. ")
	SetTask(48, 1)
	Msg2Player("NhËn nhiÖm vô: A ph­¬ng nhê b¹n ®i xem thö, xem cã mãn trang søc nµo gi¸ rÎ lµm cña håi m«n ®­îc kh«ng ")
	AddNote("NhËn nhiÖm vô: A ph­¬ng nhê b¹n ®i xem thö, xem cã mãn trang søc nµo gi¸ rÎ lµm cña håi m«n ®­îc kh«ng ")
end;

function no()
end;
