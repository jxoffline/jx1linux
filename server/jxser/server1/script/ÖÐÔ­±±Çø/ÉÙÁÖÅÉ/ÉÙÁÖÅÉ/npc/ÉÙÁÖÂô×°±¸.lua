--ÉÙÁÖÅÉ Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("Ng­êi xuÊt gia kh«ng thÓ xa hoa, c¸c lo¹i ¸o mò nµy ®Òu do c¸c s­ huynh ®Ö tù lµm lÊy.", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh, trang bŞ cña bæn ph¸i chØ b¸n cho ®ång m«n")
	end
end;

function yes()
Sale(70)
end;

function no()
end;
