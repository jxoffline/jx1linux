--ÖĞÔ­ÄÏÇø Îäµ±ÅÉ Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("§¹o bµo ®Ñp ai mµ kh«ng thİch? Lùa mét c¸i ®i?", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh, c¸c trang bŞ cña bæn gi¸o chØ cã thÓ b¸n cho ®Ö tö Vâ §ang.")
	end
end;

function yes()
Sale(64)
end;

function no()
end;
