-- Ê¯¹ÄÕò Ö°ÄÜ Ò©µêÀÏ°å
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
		Say("Th¹ch Cæ TrÊn tæ truyÒn, b¶o ®¶m trŞ b¸ bÖnh, Kh¸ch quan muèn mua g×?", 3, "Giao dŞch/yes","Ta ®Õn nhËn nhiÖm vô S¬ nhËp/yboss", "Kh«ng giao dŞch/no")
end;

function yes()
	Sale(27);  			--µ¯³ö½»Ò×¿ò
end;

function no()
end;
