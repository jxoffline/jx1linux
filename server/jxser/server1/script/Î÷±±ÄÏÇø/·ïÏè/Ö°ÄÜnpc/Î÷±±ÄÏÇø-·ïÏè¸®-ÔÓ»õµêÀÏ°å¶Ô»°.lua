Include("\\script\\global\\global_zahuodian.lua");
Include("\\script\\dailogsys\\dailogsay.lua")

function main(sel)
if (GetTask(169) == 41)  then
	Say("Bæn tiÖm tuy nhá nh­ng thø g× còng cã. Kh¸ch quan muèn mua g×? ", 4,"Xin hái «ng chñ ë ®©y cã b¸n dông cô ®¸nh cê kh«ng/nv4xHS" ,"Mua thiÖp chóc TÕt/BuyChristmasCard","Giao dŞch/yes", "Kh«ng giao dŞch/no");
	else 
	Say("Bæn tiÖm tuy nhá nh­ng thø g× còng cã. Kh¸ch quan muèn mua g×? ", 3, "Mua thiÖp chóc TÕt/BuyChristmasCard","Giao dŞch/yes", "Kh«ng giao dŞch/no");
	end
end;

function nv4xHS()
Talk(1,"","TiÖm t¹p hãa: C¸c vŞ ®¹i hiÖp, ë ®©y cã ®ñ lo¹i hµng hãa, ®Òu lµ nh÷ng vËt phÈm cÇn thiÕt cho qu¸ tr×nh b«n tÈu, nh­ng nh÷ng mãn ®å ch¬i cao cÊp nh­ dông cô ®¸nh cê th× ta kh«ng cã. ë Ph­îng T­êng cã mét vŞ L­u Viªn Ngo¹i nçi tiÕng lµ thİch nghÖ thuËt")	 			
AddNote("TiÖm t¹p hãa nhê ®¹i hiÖp hái th¨m L­u Viªn Ngo¹i.") 
Msg2Player("TiÖm t¹p hãa nhê ®¹i hiÖp hái th¨m L­u Viªn Ngo¹i t¹i <color=yellow>Ph­îng T­êng 199/207.") 
SetTask(169,42)		
end;

function yes()
Sale(20); 		
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;

