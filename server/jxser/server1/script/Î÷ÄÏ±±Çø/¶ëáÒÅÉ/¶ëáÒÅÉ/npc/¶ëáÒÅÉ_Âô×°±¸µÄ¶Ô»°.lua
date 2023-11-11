--Î÷ÄÏ±±Çø ¶ëáÒÅÉ Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("QuÇn ¸o giµy nãn nµy lµ do c¸c tû muéi cña bæn m«n lµm ra. RÊt thİch hîp cho tû muéi Nga Mi ph¸i", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh: trang bŞ m«n ph¸i chØ b¸n cho tû muéi ®ång m«n!")
	end
end;

function yes()
Sale(52)
end;

function no()
end;
