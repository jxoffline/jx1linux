--´äÑÌÃÅ Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("Muèn xem c¸c tû muéi tù tay dÖt v¶i kh«ng? Bªn ngoµi kh«ng mua ®­îc ®©u.", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","M«n chñ cã lÖnh, trang bŞ cña bæn m«n chØ b¸n cho Tû muéi ®ång m«n.")
	end
end;

function yes()
Sale(67)
end;

function no()
end;
