--description: ãê¾©¸®ÌúËşÈı²ã±¦Ïä ÌìÈÌ½Ì50¼¶ÈÎÎñ
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetTask(21)
	if (UTask_tr == 50*256+20) and (HaveItem(162) == 1) then
		DelItem(162)
		if (GetBit(UTask_trsub01,3) == 0) then
			UTask_trsub01 = SetBit(UTask_trsub01,3,1)
			SetTask(21, UTask_trsub01)
			AddNote("Më ®­îc c¬ quan thø ba ")
			Msg2Player("Më ®­îc B¶o r­¬ng ë tÇng thø ba. Më ®­îc c¬ quan thø ba ")
			if (UTask_trsub01 == 7) then 			-- bin: 100 + 010 + 001
				Talk(1,"","B¹n ®· ph¸ ®­îc c¬ quan tÇng 3, cøu ®­îc Phông HÊp Nh­.")
				Msg2Player("B¹n ®· ph¸ ®­îc c¬ quan tÇng 3, cøu ®­îc Phông HÊp Nh­.")
				SetTask(4, 50*256+50)
				AddNote("C¶ ba c¬ quan ®Òu ®· më, cøu ®­îc Phông HÊp Nh­ ")
			end
		else
			Talk(1,"","C¬ quan ®· më ra")
		end
	elseif (UTask_tr == 50*256+20) and (GetBit(UTask_trsub01,3) == 1) then
		Talk(1,"","C¬ quan ®· më ra")
	elseif (UTask_tr == 50*256+50) then
		Talk(1,"","C¬ quan ®· më ra")
	else	 
		Talk(1,"","Kh«ng cã ch×a khãa th× kh«ng thÓ më ®­îc c¬ quan nµy ")
	end
end;
