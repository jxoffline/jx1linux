-- ãê¾© Â·ÈËNPC ĞÁÆú¼²£¨ÉÙÁÖÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(122) == 0)) then		--ÈëÃÅÈÎÎñ½øĞĞÖĞ
		Say("§êi ng­êi kh«ng ai kh«ng cã hiÓm nguy! Qua råi sÏ rÌn luyªn thªm b¶n tİnh kiªn c­êng",2,"Ta Cho r»ng: §ã lµ: C¸i g× m×nh kh«n muèn th× ®õng lµm cho ng­êi kh¸c /enroll_S2_A","Trªn ®­êng thÊy chuyÖn bÊt b×nh kh«ng thÓ lµm ng¬. §ã míi lµ hiÖp nghÜa /enroll_S2_B")
	else
		Talk(1,"","H·y cè g¾ng nç lùc nhĞ! V× n­íc v× d©n! V× b¸ t¸nh thiªn h¹.")
	end
end;

function enroll_S2_A()
	Say("§êi ng­êi kh«ng ai kh«ng cã hiÓm nguy! Qua råi sÏ rÌn luyªn thªm b¶n tİnh kiªn c­êng",3,"H·y cè g¾ng næ lùc nhĞ. V× n­íc v× d©n. V× thiªn h¹ b¸ t¸nh /enroll_S2_wrongA","§Ó ta suy nghÜ, t×m mét c¸ch gi¶i quyÕt tèt nhÊt /enroll_S2_correct","Cho dï ®­îc lîi cho m×nh th× còng ®õng lµm cho ng­êi kh¸c bŞ tæn th­¬ng /enroll_S2_wrongA")
end;

function enroll_S2_B()
	Say("ë ®©y cã 500 l­îng b¹c, xin nhËn lÊy!",3,"§a t¹ /enroll_S2_wrongB","Ta cã thÓ gióp cho ng­¬i ®­îc g× ®©y? /enroll_S2_wrongB","ThËt sù kh«ng d¸m lµm phiÒn /enroll_S2_correct")
end;

function enroll_S2_correct()
	Talk(1,"","Xem nh­ ta vµ ng­¬i cã duyªn! TÆng ng­¬i Qu¶ng Ho¾c H­¬ng nµy ®Ó lµm quµ tao ngé!")
	AddEventItem(122)
	Msg2Player("NhËn ®­îc Qu¶ng Ho¾c H­¬ng ")
	AddNote("Tr¶ lêi ®­îc c©u hái cña T©n Khİ TËt, nhËn ®­îc Qu¶ng Ho¾c H­¬ng ")
end;

function enroll_S2_wrongA()
	Talk(1,"","§êi ng­êi kh«ng ai kh«ng cã hiÓm nguy! Qua råi sÏ rÌn luyªn thªm b¶n tİnh kiªn c­êng")
end;

function enroll_S2_wrongB()
	Talk(1,"","Ng­êi thÊy tiÒn lµ s¸ng m¾t th× lµm sao cã thÓ ph¸t huy chİnh khİ? Ng­¬i thËt khiÕn ta thÊt väng!")
end;
