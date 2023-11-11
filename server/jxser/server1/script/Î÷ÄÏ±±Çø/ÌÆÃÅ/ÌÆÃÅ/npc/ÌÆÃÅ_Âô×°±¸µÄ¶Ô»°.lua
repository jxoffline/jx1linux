--Î÷ÄÏ±±Çø ÌÆÃÅ Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("§Ö tö bæn m«n th©n ph¸p nhanh nhÑn, thİch hîp trang bŞ nh÷ng vò khİ nhá gän!", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","M«n chñ cã lÖnh: trang bŞ m«n ph¸i chØ b¸n cho tû muéi ®ång m«n!")
	end
end;

function yes()
Sale(55)
end;

function no()
end;
