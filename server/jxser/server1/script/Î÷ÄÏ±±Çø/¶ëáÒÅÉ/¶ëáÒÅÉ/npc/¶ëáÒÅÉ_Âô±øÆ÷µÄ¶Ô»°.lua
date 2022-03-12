--Î÷ÄÏ±±Çø ¶ëáÒÅÉ Âô±øÆ÷µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("®Ö tö bæn ph¸i ®Òu lµ n÷ nhi mÒm yÕu, v× thÕ ®a sè c¸c lo¹i binh ®ao ®Òu nhÑ nhµng linh ho¹t", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh: binh khİ m«n ph¸i chØ b¸n cho tû muéi ®ång m«n!")
	end
end;

function yes()
Sale(51)
end;

function no()
end;
