--ÖĞÔ­±±Çø ÌìÈÌ½Ì Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("§©y ®Òu lµ do Cung n÷ trong cung lµm ra, ng­¬i xem, thñ c«ng rÊt tinh x¶o...", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Gi¸o chñ cã lÖnh, trang bŞ cña bæn gi¸o chØ b¸n cho c¸c ®Ö tö.")
	end
end;

function yes()
Sale(61)
end;

function no()
end;
