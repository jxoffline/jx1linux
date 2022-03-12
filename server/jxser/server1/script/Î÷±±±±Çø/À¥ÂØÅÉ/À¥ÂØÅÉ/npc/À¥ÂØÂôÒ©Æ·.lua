--À¥ÂØÅÉ ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("Tiªn §¬n Th¸nh d­îc, §¹o Gia chİnh thèng tiªn ®¬n ®Òu ®· ë ®©y c¶. ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh: D­îc phÈm chØ ®­îc b¸n cho ®ång m«n.")
	end
end;

function yes()
Sale(77)
end;

function no()
end;
