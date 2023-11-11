--Îå¶¾½Ì Âô±øÆ÷µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("Bæn ph¸i vèn kh«ng dïng søc m¹nh ®Ó chiÕn th¾ng, bëi v× nh÷ng vò khİ nµy khi biÕt vËn dông th× tuyÖt x¶o v« song ", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Gi¸o chñ cã lÖnh: binh khİ cña m«n ph¸i kh«ng ®­îc b¸n cho ng­êi ngoµi")
	end
end;

function yes()
	Sale(78)
end;

function no()
end;
