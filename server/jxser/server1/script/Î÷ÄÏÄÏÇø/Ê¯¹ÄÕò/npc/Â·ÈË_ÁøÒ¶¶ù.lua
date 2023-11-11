--Ê¯¹ÄÕò Â·ÈË ÁøÒ¶¶ù ĞÂÊÖÈÎÎñËÍ·¹
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world22 = GetTask(22)
	if (UTask_world22 == 0) then		-- ÈÎÎñÆô¶¯
		if (GetSex() == 0) then
			Say("Ca ca, cha cña muéi ®ang d¹y vâ nghÖ ë ngoµi th«n, huynh cã thÓ gióp mang c¬m cho «ng Êy kh«ng? ",2,"Gióp c« Êy mang c¬m. /W22_get_yes","Kh«ng r¶nh, ®ang bËn. /W22_get_no")
		else
			Say("Tû tû, cha cña muéi ®ang d¹y vâ nghÖ ë ngoµi th«n. Tû cã thÓ gióp mang c¬m cho «ng Êy kh«ng? ",2,"Gióp c« Êy mang c¬m. /W22_get_yes","Kh«ng r¶nh, ®ang bËn. /W22_get_no")
		end
	elseif (UTask_world22 == 5) then
		if (HaveItem(233) == 0) then		-- µÀ¾ß¶ªÁË
			AddEventItem(233)
			if (GetSex() == 0) then
				Talk(1,"","Ca ca, huynh ®õng quªn mang c¬m ®i nha. ")
			else
				Talk(1,"","Tû tû, tû ®õng quªn mang c¬m ®i nha. ")
			end
		else
			if (GetSex() == 0) then
				Talk(1,"","Ca ca cã thÓ nhanh mét tİ ®­îc kh«ng, c¬m ®· nguéi l¹nh c¶ råi. ")
			else
				Talk(1,"","Tû tû cã thÓ nhanh mét tİ ®­îc kh«ng, c¬m ®· nguéi l¹nh c¶ råi. ")
			end
		end
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","MÑ ta ®· ®i theo g· ®µn «ng kh¸c, ta ®­îc «ng ta nu«i d­ìng, khinh c«ng «ng rÊt giái, «ng cø lu«n luyÖn c«ng víi ng­êi ngoµi th«n. ")
	end
end;

function W22_get_yes()
	SetTask(22,5)
	AddEventItem(233)
	AddNote("NhËn nhiÖm vô: Gióp LiÔu DiÖp Nhi mang c¬m ra cho vâ s­ ë ngoµi th«n. ")
	Msg2Player("NhËn nhiÖm vô: Gióp LiÔu DiÖp Nhi mang c¬m ra cho vâ s­ ë ngoµi th«n. ")
end

function W22_get_no()
end
