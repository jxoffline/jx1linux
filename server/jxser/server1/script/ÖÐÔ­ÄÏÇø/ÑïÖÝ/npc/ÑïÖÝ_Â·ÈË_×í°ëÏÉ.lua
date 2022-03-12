-- ÑïÖİ Â·ÈËNPC ×í°ëÏÉ£¨Ø¤°ï10¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+20) then		--10¼¶ÈÎÎñÖĞ
		SetTask(8,10*256+30)
		Talk(5,"L10_question_1","H¶o töu ®©y! Nuèt råi vÉn cßn tiÕc ®©y!...","Huynh lµ Tóy B¸n Tiªn? §©y ch¼ng ph¶i lµ HuÖ TuyÒn töu sao?","Kh«ng sai! Ta chİnh lµ Tóy B¸n Tiªn, ®©y lµ mü töu HuÖ TuyÒn töu!","T¹i h¹ lµ ®Ö tö C¸i Bang, ng­ìng mét t«n huynh ®· l©u! Kh«ng biÕt cã thÓ nh­êng cho t¹i h¹ HuÖ TuyÒn Töu ®­îc kh«ng?","NÕu ng­¬i tr¶ lêi ®óng c¸c c©u ®è cña ta, th× b×nh r­îu nµy xin tÆng cho ng­¬i!")
	elseif (UTask_gb == 10*256+30) then		--ÖØĞÂ³¢ÊÔ
		Talk(1,"L10_question_1","Cßn ch­a phôc? VËy ta sÏ thö tiÕp!")
	elseif ((UTask_gb == 10*256+40) and (HaveItem(76) == 0)) then		--Èç¹ûÍæ¼Ò°Ñ¾ÆÅª¶ªÁË
		Talk(3,"","C¸i g×! Ng­¬i lµm mÊt b×nh r­îu råi µ!","¤i! Mü töu cña ta!","Tèt l¾m! Xem ra ng­¬i còng cã chót kiÕn thøc vÒ r­îu! TÆng ng­¬i ®©y!")
		AddEventItem(76)
		Msg2Player("Cã r­îu HuÖ tuyÒn ")
	else
		Talk(1,"","C¹n víi ta 1 ly nµo! zd«!")
	end
end;

function L10_question_1()
	Say("C©u thø nhÊt: ch÷ 'HuÖ TuyÒn' trong huÖ TuyÒn töu lµ chØ c¸i g×?",4,"Tªn ng­êi /L10_wrong","Tªn ®Şa danh /L10_wrong","N­íc suèi /L10_question_2","Tªn hå /L10_wrong")
end;

function L10_question_2()
	Say("C©u thø 2: 'Cö ®Çu kİch minh nguyÖt, ®èi ¶nh thµnh kû nh©n' lµ c¸i g×?",4,"NhiÒu ng­êi /L10_wrong","3 ng­êi /L10_question_3","2 ng­êi /L10_wrong","1 ng­êi /L10_wrong")
end;

function L10_question_3()
	Say("C©u thø 3: d­íi ®©y ch÷ nµo lµ chØ tªn r­îu:",4,"Ngäc DŞch /L10_wrong","Quúnh nh­ìng /L10_wrong","Lôc nghÜ /L10_wrong","PhØ thóy /L10_correct")
end;

function L10_wrong()
	Talk(1,"","sai råi! Xem ra ng­¬i kh«ng cã duyªn víi b×nh r­îu nµy råi!")
end;

function L10_correct()
	Talk(1,"","Tèt l¾m! Xem ra ng­¬i còng cã chót kiÕn thøc vÒ r­îu! TÆng ng­¬i ®©y!")
	AddEventItem(76)
	SetTask(8,10*256+40)
	AddNote("Cã r­îu HuÖ tuyÒn ")
	Msg2Player("Cã r­îu HuÖ tuyÒn ")
end;
