--ÖĞÔ­±±Çø ÌìÈÌ½Ì ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("Y thuËt cña §¹i Kim chóng ta kh«ng thua kĞm g× nhµ Tèng, danh y, h¶o d­îc ®Òu kh«ng thiÕu… ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Gi¸o chñ cã lÖnh, thuèc cña bæn gi¸o chØ b¸n cho c¸c ®Ö tö trung thµnh.")
	end
end;

function yes()
Sale(62)
end;

function no()
end;
