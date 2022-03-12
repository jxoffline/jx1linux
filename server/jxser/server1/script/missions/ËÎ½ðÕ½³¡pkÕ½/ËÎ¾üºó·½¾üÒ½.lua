--ÖĞÔ­±±Çø ËÎ½ğÕ½³¡ ËÎ¾üÖØÉúµã¾üÒ½
--ÀîĞÀ 2004-10-14

function main(sel)
if (GetCurCamp() == 1) then
	SetFightState(0)
	Say("Tr¸ng sÜ nªn mua İt th­¬ng d­îc phßng th©n! ChiÕn tr­êng sinh tö khã l­êng!", 2, "Mua thuèc /yes", "Kh«ng mua/no")
else
	Talk(1,"","Ng­êi ®©u! Mau ®Õn b¾t gian tÕ!")
end;
end;

function yes()
Sale(53)
end;

function no()
end;