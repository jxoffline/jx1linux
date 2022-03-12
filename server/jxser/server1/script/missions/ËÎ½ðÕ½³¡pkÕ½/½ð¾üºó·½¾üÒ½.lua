--ÖĞÔ­±±Çø ËÎ½ğÕ½³¡ ½ğ¾üÖØÉúµã¾üÒ½
--ÀîĞÀ 2004-10-14

function main(sel)
if (GetCurCamp() == 2) then
	SetFightState(0)
	Say("T­íng qu©n cÇn mua g× kh«ng?", 2, "Mua thuèc /yes", "Kh«ng mua/no")
else
	Talk(1,"","Nh×n mÆt ng­¬i lÊm la lÊm lĞt! Muèn lõa g¹t ta b¸n thÇn d­îc cña ®¹i Kim quèc cho ng­¬i µ?")
end;
end;

function yes()
Sale(53)
end;

function no()
end;