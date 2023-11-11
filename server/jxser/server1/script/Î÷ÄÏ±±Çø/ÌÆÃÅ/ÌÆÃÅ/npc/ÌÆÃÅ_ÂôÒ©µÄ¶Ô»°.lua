--Î÷ÄÏ±±Çø ÌÆÃÅ ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say(" thuËt cña TuyÖt Xu©n TÈu bæn m«n cã thÓ nãi lµ ®éc bé thiªn h¹. TuyÖt Xu©n TÈu ®iÒu chÕ nh÷ng d­îc hoµn nµy.", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","M«n chñ cã lÖnh, d­îc phÈm cña bæn m«n kh«ng thÓ b¸n cho ng­êi ngoµi!")
	end
end;

function yes()
Sale(56)
end;

function no()
end;
