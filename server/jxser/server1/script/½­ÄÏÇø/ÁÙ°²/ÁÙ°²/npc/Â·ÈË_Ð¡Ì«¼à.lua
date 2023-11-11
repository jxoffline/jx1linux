-- ÁÙ°² Â·ÈËNPC Ð¡Ì«¼à£¨Ø¤°ï50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+40) then				--´ø×Å50¼¶ÈÎÎñ
		Talk(2,"L50_pay","Ng­¬i lµ ai?","Ta lµ ng­êi th©n thÝch cña Tµo ®¹i nh©n! Cã chót lÔ vËt ë cè h­¬ng muèn biÕu cho Tµo gia! Xin nhê ngµi th«ng b¸o gióp cho!")
	else
		Talk(1,"","§i ra! §i ra! §õng cã ®i tíi ®i lui tr­íc cöa Hoµng Cung")
	end
end;

function L50_pay()
	Say("Th©n thÝch! Th©n thÝch c¸i g×? §· ®Õn ®©y ®Ó biÕu xÐn mµ l¹i kh«ng biÕt tiÒn lÖ?",2,"Hèi lé 3000 l¹ng ng©n l­îng! /L50_pay_yes","Kh«ng cho! /L50_pay_no")
end;

function L50_pay_yes()
	if (GetCash() >= 3000) then
		Pay(3000)
		Talk(1,"after_pay","BiÕt råi! §©y cã 3000 l­îng, xin biÕu t«n huynh uèng r­îu!")
	else
		Talk(1,"","ThËt lµ keo kiÖt! Mau ®i ®i!")
	end
end;

function after_pay()
	NewWorld(177, 1569, 3169)
	Msg2Player("Hèi lé 3000 cho TiÓu Th¸i gi¸m, h¾n sÏ dÔ dµng ®Ó cho b¹n ®i vµo Ngù Hoa Viªn ")
	Talk(1,"","Nh­ vÇy còng t¹m ®­îc! Tµo c«ng c«ng ®ang ë trong ngù hoa viªn. Ng­¬i h·y vµo trong ®ã mµ t×m!")
end

function L50_pay_no()
end;
