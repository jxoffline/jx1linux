--Î÷±±ÄÏÇø ÓÀÀÖÕò Ò©µêÀÏ°å¶Ô»°
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
		Say("Hµnh tÈu giang hå, chuÈn bŞ tr­íc İt th­¬ng d­îc phßng th©n sÏ kh«ng thõa ®©u!", 3, "Giao dŞch/yes","Ta ®Õn nhËn nhiÖm vô S¬ nhËp/yboss", "Kh«ng giao dŞch/no");
end;


function yes()
Sale(85);  		--µ¯³ö½»Ò×¿ò
end;


function no()
end;


