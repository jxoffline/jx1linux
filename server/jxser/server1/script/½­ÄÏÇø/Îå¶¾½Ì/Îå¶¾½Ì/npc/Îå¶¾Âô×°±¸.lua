--Îå¶¾½Ì Âô×°±¸µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("Chóng ta ®õng qu¸ quan träng vÒ nh÷ng thø nµy. Trang bŞ tèi th­îng nhÊt chİnh lµ sù øng phã linh ho¹t.", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Gi¸o chñ cã lÖnh: trang bŞ cña m«n ph¸i kh«ng ®­îc b¸n cho ng­êi ngoµi")
	end
end;

function yes()
	Sale(79)
end;

function no()
end;
