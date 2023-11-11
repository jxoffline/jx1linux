-- ãê¾© Â·ÈËNPC ÎäÊ¿£¨ÉÙÁÖÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(218) == 0)) then		--ÈëÃÅÈÎÎñ½øĞĞÖĞ
		Say("ThiÕu L©m? Th©n ®ang ë trong l·nh ®Şa cña ®¹i Kim quèc nµy mµ vÉn cßn t©m trİ nghÜ ®Õn bän ThiÕu L©m x¶o quyÖt kia ­? ",2,"Kiªn tr× /enroll_S3_step2","TiÕp tôc suy nghÜ /enroll_S3_wrong")
	else
		Talk(1,"","ChØ cã ng­êi nµo cã ®­îc phÈm chÊt kiªn tr× bÊt biÕn th× míi cã thÓ thùc hiÖn lı t­ëng cña m×nh.")
	end
end;

function enroll_S3_step2()
	Talk(1,"enroll_S3_step3","H¶o tiÓu tö, cßn d¸m ­¬ng ng¹nh ­?")
	Msg2Player("§¸nh cho ng­¬i m«t trËn thËt ®au ®ín ")
end;

function enroll_S3_step3()
	Say("Ta cho ng­¬i thªm mét c¬ héi. Nãi! Ng­¬i cã ghĞt c¸i bän ThiÕu L©m ®ã kh«ng?",2,"VÉn cø kiªn tr× /enroll_S3_correct","TiÕp tôc suy nghÜ /enroll_S3_wrong")
end;

function enroll_S3_correct()
	Talk(1,"","Kh¸ l¾m! ChØ cã ng­êi nµo cã ®­îc phÈm chÊt kiªn tr× bÊt biÕn th× míi cã t­ c¸ch lµm nªn ®¹i sù. TÆng ng­oi mãn nµy. ")
	AddEventItem(218)
	Msg2Player("Nh©n ®­îc Kiªn Tinh Th¹ch ")
	AddNote("Chøng minh ®­îc sù kiªn quyÕt cña m×nh, nhËn ®­îc Kiªn Tinh Th¹ch ")
end;

function enroll_S3_wrong()
	Talk(1,"","C¸i tªn ngu ngèc nµy! §õng cã lµm « nhôc bèn ch÷ 'Kiªn nhÉn bÊt b¹t' ®ã nhĞ!")
end;
