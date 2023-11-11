--Á½ºşÇø ÌìÍõ°ï Âô×°±¸µÄ°ïÖÚ¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("C¸c huynh ®Ö bæn bang c¶ ngµy ch¹y ®«ng ch¹y t©y kh«ng thÓ kh«ng cã mét bé trang bŞ tèt", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Bang chñ cã lÖnh: trang bŞ cña bæn bang chØ b¸n cho huynh ®Ö ®ång m«n")
	end
end;

function yes()
Sale(58);  			
end;

function no()
end;






