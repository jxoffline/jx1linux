--Ø¤°ï ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("TÊt c¶ c¸c d­îc phÈm æ ®©y ®Òu do huynh ®Ö c¸i bang tù bµo chÕ c¶ ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Bang chñ cã lÖnh: D­îc phÈm cña bæn m«n kh«ng ®­îc b¸n cho ng­êi ngoµi")
	end
end;

function yes()
	Sale(74)
end;

function no()
end;
