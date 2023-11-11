--Ø¤°ï Âô±øÆ÷µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("§¶ cÈu Bæng cña bæn bang ®· vang danh thiªn h¹. TÊt c¶ c¸c lo¹i binh khİ c«n, roi, d©y… ë d©y ®Òu cã ®Çy ®ñ c¶ ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Bang chñ cã lÖnh: Binh khİ cña bæn m«n kh«ng ®­îc b¸n cho ng­êi ngoµi")
	end
end;

function yes()
	Sale(72)
end;

function no()
end;
