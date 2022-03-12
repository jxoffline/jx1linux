-- ¶ıº£ Â·ÈËNPC ´¬¼Ò£¨´äÑÌÃÅ30¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if ((UTask_cy == 30*256+40) and (HaveItem(2) == 0)) then		--30¼¶ÈÎÎñ½øĞĞÖĞ
		Talk(5,"L30_pay","H«m nay thËt lµ béi thu, ®¸nh b¾t ®­îc nhiÒu t«m c¸ qu¸! ","Ng­êi cã c¸ Ng©n TuyÕt kh«ng?","C¸ Ng©n TuyÕt? H«m nay ta b¾t ®­îc mÊy con.","Ng­êi cã thÓ b¸n cho ta mét İt ®­îc kh«ng?","Ng­¬i cÇn th× ta sÏ b¸n cho mét İt, nhiªu ®©y tİnh cho ng­¬i 1000 l­îng th«i.")
	else
		Talk(1,"","ThuyÒn Gia: §Ëp n­íc §¹i Lı uèn quanh, anh em ng¨n s«ng c¸ch nói, nói s«ng mu«n trïng xa c¸ch, muèn gÆp còng kh«ng thÓ gÆp ®­îc.")
--		Talk(1,"","´¬¼Ò£º³öº£²¶ÓãÄÇ¸ö°Ñ´¬º½°¡£¬·áÊÕ¹éÀ´ÄÇ¸ö°Ñ¼Ò·µ°¡£¡")
	end
end;

function L30_pay()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(2)
		AddNote("Mua ®­îc c¸ Ng©n TuyÕt ")
		Msg2Player("Mua ®­îc c¸ Ng©n TuyÕt cña thuyÒn gia ë NhÜ H¶i ")
	else
		Talk(1,"","Kh«ng cã tiÒn? VËy sao ®­îc chø?")
	end
end;
