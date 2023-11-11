--´äÑÌÃÅ ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("Trang bŞ cµng nhiÒu d­îc liÖu quı th× cµng cã İch", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","M«n chñ cã lÖnh, D­îc liÖu cña bæn m«n chØ dµnh cho tû muéi ®ång m«n.")
	end
end;

function yes()
Sale(68)
end;

function no()
end;
