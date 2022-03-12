--Á½ºşÇø ÌìÍõ°ï ÂôÒ©µÄ°ïÖÚ¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("C¸c d­îc lŞªu nµy lµ sèng ë trªn ®¶o tù sinh tù lín, cÇm m¸u d­ìng khİ cùc kú h÷u hiÖu", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Bang chñ cã lÖnh: D­îc phÈm cña bæn bang chØ b¸n cho huynh ®Ö ®ång m«n")
	end
end;

function yes()
Sale(59);  			
end;

function no()
end;






