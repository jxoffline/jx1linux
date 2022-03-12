--description: Îäµ±ÅÉ³öÊ¦ÈÎÎñ Îäµ±É½±¦Ïä2
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B¶o r­¬ng: GÇn ®©y <color=Red>binh khİ<color> cña Tèng qu©n kh«ng ®ñ, <color=Red>th­¬ng vong<color> trÇm träng, h·y ®Õn <color=Red>T­¬ng D­¬ng<color> t×m <color=Red>thî rÌn <color> gióp ®ì.")
			Msg2Player("GÇn ®©y khİ giíi chèng Kim kh«ng ®ñ, <color=Red>binh sÜ th­¬ng vong trÇm träng<color>, cÇn ®Õn thµnh T­¬ng D­¬ng nhê Thî rÌn gióp ®ì gi¶i quyÕt. ")
			SetTask(17, SetByte(GetTask(17),2,2))
			AddNote("L¸ bïa trªn b¶o r­¬ng ë Th¸i Tö nham viÕt: §Õn thµnh T­¬ng D­¬ng t×m Thî rÌn t×m c¸ch gi¶i quyÕt vÊn ®Ò søc m¹nh chèng qu©n Kim kh«ng ®ñ. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","B¶o r­¬ng: Do thiÕu <color=Red>khİ giíi<color>, Tèng qu©n th­¬ng tæn trÇm träng… ")
			Msg2Player("Do søc m¹nh kh«ng ®ñ, t¹o nªn th­¬ng vong kh«ng tr¸nh khái khi chèng qu©n Kim... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(70)
			Say("Cã binh khİ kŞp thêi, søc chiÕn ®Êu cña quan binh tiÒn tuyÕn t¨ng m¹nh! Më B¶o r­¬ng, lÊy ®­îc 1 quyÓn <color=Red>'Th­îng Thanh Ch©n Kinh'<color>.", 0)
			Msg2Player("CÇn ph¶i bæ sung binh khİ gÊp, søc m¹nh chiÕn ®Êu cña quan binh nhµ Kim rÊt m¹nh. Më B¶o r­¬ng, cã ®­îc bé Th­îng Thanh Ch©n Kinh. ")
			SetTask(17, SetByte(GetTask(17),2,10))
			AddNote("Më B¶o r­¬ng, cã ®­îc bé Th­îng Thanh Ch©n Kinh. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(70) == 0) then
				AddEventItem(70)
			else
				Talk(1,"","B¶o r­¬ng ®· rçng")
			end
		end
	else
		Talk(1,"","Ch­a nhËn nhiÖm vô! B¹n kh«ng thÓ më B¶o r­¬ng nµy!")
	end
end;
