--ÖĞÔ­ÄÏÇø Îäµ±ÅÉ Âô±øÆ÷µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("§Ö tö bæn ph¸i së tr­êng lµ dïng kiÕm, xem xem cã b¶o kiÕm thİch hîp cho ng­¬i dïng kh«ng?.....", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh, binh khİ bæn gi¸o chØ cã thÓ b¸n cho ®Ö tö Vâ §ang.")
	end
end;

function yes()
Sale(63)
end;

function no()
end;
