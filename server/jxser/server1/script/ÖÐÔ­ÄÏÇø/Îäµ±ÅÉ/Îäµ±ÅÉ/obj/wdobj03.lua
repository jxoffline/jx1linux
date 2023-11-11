--description: Îäµ±ÅÉ³öÊ¦ÈÎÎñ Îäµ±É½±¦Ïä3
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B¶o r­¬ng: <color=Red>Thñ t­íng<color> trong <color=Red>Nha m«n T­¬ng D­¬ng<color> c¶ ngµy chØ biÕt uèng r­îu, øc hiÕp b¸ t¸nh, l·o b¸ t¸nh o¸n giËn, <color=Red>b¹o chİnh<color> lÇn nµy, lµm sao diÖt ®­îc?")
			Msg2Player("L¸ bïa trªn b¶o r­¬ng ë Th¸i Tö nham viÕt: §i c¶nh c¸o chñ t­íng T­¬ng D­¬ng, gióp d©n trõ ¸c. ")
			SetTask(17, SetByte(GetTask(17),3,2))
			AddNote("L¸ bïa trªn b¶o r­¬ng ë Th¸i Tö nham viÕt: §i c¶nh c¸o chñ t­íng T­¬ng D­¬ng, gióp d©n trõ ¸c. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 5) then
			Talk(1,"","B¸ t¸nh T­¬ng D­¬ng vÉn sèng ®­îc d­íi <color=Red>chİnh s¸ch tµn b¹o<color> cña <color=Red>Thñ t­íng<color>.....")
			Msg2Player("Nh©n d©n ë thµnh T­¬ng D­¬ng vÉn trong c¶nh dÇu s«i löa báng... ")
		elseif (UTask_wd60sub == 5) then
			AddEventItem(71)
			Talk(1,"","Xãa bá <color=Red>chİnh s¸ch tµn b¹o<color> cña T­¬ng D­¬ng, më B¶o r­¬ng, lÊy ®­îc 1 quyÓn <color=Red>'Th¸i Thanh Ch©n Kinh'<color>.")
			Msg2Player("DiÖt xong b¹o quyÒn ë thµnh T­¬ng D­¬ng, cã ®­îc 1 bé Th¸i Thanh Ch©n Kinh. ")
			SetTask(17, SetByte(GetTask(17),3,10))
			AddNote("Më B¶o r­¬ng cã ®­îc bé Th¸i Thanh Ch©n Kinh ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(71) == 0) then
				AddEventItem(71)
			else
				Talk(1,"","B¶o r­¬ng ®· rçng")
			end
		end
	else
		Talk(1,"","Ch­a nhËn nhiÖm vô! B¹n kh«ng thÓ më B¶o r­¬ng nµy!")
	end
end;
