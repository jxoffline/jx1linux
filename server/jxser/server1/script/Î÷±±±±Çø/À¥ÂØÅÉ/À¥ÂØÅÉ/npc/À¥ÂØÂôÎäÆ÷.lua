--À¥ÂØÅÉ Âô±øÆ÷µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("§Ö tö cña bæn ph¸i chó träng tu luyÖn ®¹o ph¸p bïa chó, ®èi víi binh ®ao, vâ c«ng th× kh«ng ®­îc tinh th«ng l¾m", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh: binh khİ chØ ®­îc b¸n cho ®ång m«n.")
	end
end;

function yes()
	Sale(75)
end;

function no()
end;
