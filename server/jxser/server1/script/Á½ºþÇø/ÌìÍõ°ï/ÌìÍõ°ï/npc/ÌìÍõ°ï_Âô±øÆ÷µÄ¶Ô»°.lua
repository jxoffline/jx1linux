--Á½ºşÇø ÌìÍõ°ï Âô±øÆ÷µÄ°ïÖÚ¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("Xem binh khİ Thiªn V­¬ng bang do chóng ta tù chÕ t¹o ®©y!", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Bang chñ cã lÖnh: binh khİ cña bæn bang chØ b¸n cho huynh ®Ö ®ång m«n")
	end
end;

function yes()
Sale(57);  			
end;

function no()
end;






