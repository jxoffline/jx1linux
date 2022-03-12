-- ÁúÈª´å Ö°ÄÜNPC Ò©µêÀÏ°å£¨Îå¶¾10¼¶ÈÎÎñ£©
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	UTask_wu = GetTask(10)
	if ((UTask_wu == 10*256+10) and (HaveItem("10 bao tÝn th¹ch") == 0)) then 		--ÈÎÎñÖÐ
		Say("Chç t«i ®©y d­îc liÖu g× còng cã, cã bÖnh th× khái bÖnh, kh«ng bÖnh kháe ng­êi, b¸n thuèc ®óng gi¸ kh«ng lõa g¹t, ngµi mua mét Ýt chø?", 3, "Cã b¸nTÝn th¹ch kh«ng vËy?/L10_buy", "Giao dÞch/yes", "Kh«ng giao dÞch/no")
	else
		Say("Chç t«i ®©y d­îc liÖu g× còng cã, cã bÖnh th× khái bÖnh, kh«ng bÖnh kháe ng­êi, b¸n thuèc ®óng gi¸ kh«ng lõa g¹t, ngµi mua mét Ýt chø?", 3, "Giao dÞch/yes","Ta ®Õn nhËn nhiÖm vô S¬ nhËp/yboss", "Kh«ng giao dÞch/no")
	end
end;

function L10_buy()
	Talk(1,"L10_buy_sele","§ã ®Òu lµ ®éc d­îc c¶! Ng­¬i mua mét lóc nhiÒu nh­ vËy ®Ó lµm g×?")
end;

function L10_buy_sele()
	Say("Nh­ng mµ nÕu ng­¬i cã thÓ tr¶ thªm ta chót ®Ønh th×……heyhey, 1000 l­îng th«i!",2,"Mua/L10_buy_yes","Sao gièng c­íp qu¸ vËy!/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(220)
		AddNote("Mua ®­îc 10 bao TÝn th¹ch.")
		Msg2Player("Mua ®­îc 10 bao TÝn th¹ch.")
	end
end;

function L10_buy_no()
	Talk(1,"","Muèn mua th× b¸n! Hõm!...ai mµ biÕt ®­îc mi mua nhiÒu nh­ vËy ®Ó lµm g× ")
end;

function yes()
	Sale(30);  			--µ¯³ö½»Ò×¿ò
end;

function no()
end;
