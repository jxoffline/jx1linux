-- Ñ§¡°½Ù¸»¼ÃÆ¶¡±¼¼ÄÜµÄÆòØ¤
-- By: Dan_Deng(2003-08-22)
-- ¸øÇ®ÊýµÚÒ»´Î100£¬µÚ¶þ´Î200£¬µÚÈý´Î400...ÒÀ´ËÀàÍÆ£¬¹À¼Æ8´Î(12800)Ö®ºó»¹Ã»Ñ§µ½µÄ¾ÍÃ»Ê²Ã´ÒâÒåÁË£¬Ö»ÄÜÔ¹Ì«Ãü¿à¡£

function main(sel)
	UTask_world16 = GetTask(16)
	if (UTask_world16 == 255) then			-- ÈÎÎñÒÑÍê³É
		Talk(1,"","ë hiÒn gÆp lµnh!")
	else
		i = (2 ^ UTask_world16) * 100
		Say("Chóc ngµi m¹nh kháe, xin th­¬ng xãt kÎ ¨n mµy nghÌo hÌn nµy! ",2,"Cho ng­¬i "..i.."ng©n l­îng./W53_pay","Nh÷ng kÎ ¨n no l­êi biÕng, nhÊt ®Þnh kh«ng ñng hé /W53_no")
	end
end;

function W53_pay()
	UTask_world16 = GetTask(16)
	i = (2 ^ UTask_world16) * 100
	if (GetCash() >= i) then
		Pay(i)
		if (random(0,99) < 20) then			-- 20%»úÂÊÑ§µ½¡°½Ù¸»¼ÃÆ¶¡±¼¼ÄÜ
			Talk(3,"W53_prise","§a t¹ lßng tèt, cã muèn häc mét vµi trß ch¬i vui kh«ng? ","Trß g× vui? ","§óng lµ nh­ thÕ. VËy. ")
		else
			SetTask(16,UTask_world16 + 1)
		end
	else
		Talk(1,"","B©y giê ta kh«ng cã tiÒn lÎ!")
	end
end;

function W53_no()
	Talk(1,"","Ng­êi kh«ng cã tÊm lßng! Bå T¸t sÏ kh«ng phï hîp.")
end;

function W53_prise()
	AddNote("Bè thÝ cho ng­êi ¨n mµy, häc ®­îc kü n¨ng 'KiÕp Phó TÕ BÇn' ")
	Msg2Player("Bè thÝ cho ng­êi ¨n mµy, häc ®­îc kü n¨ng 'KiÕp Phó TÕ BÇn' ")
	if (HaveMagic(400) == -1) then		-- ±ØÐëÃ»ÓÐ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
		AddMagic(400,1)
	end
	SetTask(16,255)
end;
