--ÉÙÁÖÅÉ ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("Tuy nãi vâ c«ng bæn ph¸i t¨ng c­êng søc kháe, nh­ng còng cã lóc l©m bÖnh, nªn còng cÇn c¸c lo¹i thuèc men.", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh, thuèc cña bæn ph¸i chØ b¸n cho ®ång m«n")
	end
end;

function yes()
Sale(71)
end;

function no()
end;
