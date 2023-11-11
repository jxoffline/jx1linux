--description: ÌìÍõ°ï³öÊ¦ÈÎÎñ ÇàÂİµº±¦Ïä
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 60*256+20) and (HaveItem(101) == 1) then
		DelItem(101)
		Talk(2,"","R­¬ng b¸u trèng kh«ng, 'Thiªn V­¬ng Di Th­' ®· bŞ ng­êi Kim lÊy ®i ","Trªn ®Êt cã mét sè dÊu ch©n h­íng vÒ S¬n §éng Thanh La §¶o, xem ra bän s¸t thñ rêi khái ch­a bao l©u. ")
		SetTask(3, 60*256+40)
		AddNote("Më r­¬ng b¸u phİa B¾c hå, míi biÕt Thiªn V­¬ng Di Th­ ®· bŞ bän s¸t thñ ng­êi n­íc Kim lÊy ®i. ")
	elseif (UTask_tw == 60*256+40) then
		Talk(1,"","R­¬ng b¸u trèng kh«ng. ")
	else
		Talk(1,"","Kh«ng cã ch×a khãa, kh«ng më ®­îc r­¬ng.")
	end
end;
