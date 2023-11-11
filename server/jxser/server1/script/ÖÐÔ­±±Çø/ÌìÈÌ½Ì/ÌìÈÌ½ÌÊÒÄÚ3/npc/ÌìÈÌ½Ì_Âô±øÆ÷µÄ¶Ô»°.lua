--ÖĞÔ­±±Çø ÌìÈÌ½Ì Âô±øÆ÷µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("Lo¹i vò khİ nµy ®Òu do thî rÌn giái nhÊt Kim quèc lµm ra, ®Òu lµ hµng tèt.", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no");
	else
		Talk(1,"","Gi¸o chñ cã lÖnh, vò khİ cña bæn gi¸o chØ b¸n cho c¸c ®Ö tö trung thµnh.")
	end
end;

function yes()
Sale(60)
end;

function no()
end;
