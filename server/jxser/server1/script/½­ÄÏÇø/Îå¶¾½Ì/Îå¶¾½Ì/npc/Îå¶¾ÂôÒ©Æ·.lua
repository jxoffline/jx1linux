--Îå¶¾½Ì ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("C«ng phu cña bæn ph¸i mÆc dï lµ lÊy ®éc lµm chñ. Nh­ng mµ h¶o d­îc 'diÖu thñ håi xu©n' còng kh«ng thiÕu. Cã muèn xem thö kh«ng", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Gi¸o chñ cã lÖnh: thuèc cña b¶n ph¸i kh«ng ®­îc b¸n cho ng­êi ngoµi")
	end
end;

function yes()
Sale(80)
end;

function no()
end;
