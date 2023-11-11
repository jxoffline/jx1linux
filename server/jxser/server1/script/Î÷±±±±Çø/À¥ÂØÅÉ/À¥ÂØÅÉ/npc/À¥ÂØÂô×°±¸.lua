--À¥ÂØÅÉ Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("Nãi ®Õn Thiªn S­ §¹o Bµo,chÕ phÈm cña bæn ph¸i tÊt nhiªn lµ thiªn h¹ ®Ö nhÊt,c¶ Vâ §ang còng ph¶i b¾t ch­íc chÕ t¸c cña bæn ph¸i ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh: trang bŞ chØ ®­îc b¸n cho ®ång m«n.")
	end
end;

function yes()
Sale(76)
end;

function no()
end;
