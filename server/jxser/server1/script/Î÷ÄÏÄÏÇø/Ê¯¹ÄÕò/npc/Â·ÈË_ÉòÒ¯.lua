--Ê¯¹ÄÕò Â·ÈË ÉòÒ¯ ÐÂÊÖÈÎÎñ»¹Ç®
-- By: Dan_Deng(2003-09-04)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(197) == 1 then
		allbrother_0801_FindNpcTaskDialog(197)
		return 0;
	end
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 3) then		-- ÈÎÎñÆô¶¯
		if (GetSex() == 0) then
			Say("Sao h¶? Muèn ta xãa nî cho A Toµn µ? ChuyÖn ®ã kh«ng khã, nh­ng ng­¬i ph¶i mang tiÒn ®Õn, 300 l­îng kh«ng thiÕu mét xu. ",2,"Gióp hä tr¶ tiÒn /W23_pay_yes","MÆc kÖ hä /W23_pay_no")
		else
			Say("Sao h¶? Muèn ta xãa nî cho A Toµn µ? ChuyÖn ®ã kh«ng khã, nh­ng ng­¬i ph¶i mang tiÒn ®Õn, 300 l­îng kh«ng thiÕu mét xu. ",2,"Gióp hä tr¶ tiÒn /W23_pay_yes","MÆc kÖ hä /W23_pay_no")
		end
	elseif (UTask_world23 >= 6) then
		Talk(1,"","§­îc råi! V× ng­¬i ®· thay hä tr¶ tiÒn, ta sÏ ®Ó ng­¬i khái bÞ mÊt mÆt, kh«ng ®i t×m hä tÝnh sæ n÷a.")
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","TiÒn tiÒn tiÒn! Thêi buæi nµy c¸i g× còng lµ tiÒn. Cã tiÒn lµ l·o tö, kh«ng tiÒn lµ con rïa rôt ®Çu. ")
	end
end;

function W23_pay_yes()
	if (GetCash() >= 300) then
		Talk(2,"","§õng xem th­êng ng­êi kh¸c! §©y lµ 300 l­îng cÇm lÊy! "," Ha ha! Cã tiÒn tù nhiªn dÔ nãi chuyÖn.")
		SetTask(23,6)
		Pay(300)
		AddNote("A M· vµ A Toµn ®· tr¶ hÕt nî råi, mau ®i b¸o c¸i tin tèt lµnh nµy cho hä ®i. ")
		Msg2Player("A M· vµ A Toµn ®· tr¶ hÕt nî råi, mau ®i b¸o c¸i tin tèt lµnh nµy cho hä ®i. ")
	else
		Talk(1,""," §îi ta ®i lÊy 300 l­îng ®·! ")
	end
end

function W23_pay_no()
end
