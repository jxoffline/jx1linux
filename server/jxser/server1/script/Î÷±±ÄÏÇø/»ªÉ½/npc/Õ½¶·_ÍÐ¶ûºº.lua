-- \script\Î÷±±ÄÏÇø\»ªÉ½\npc\Õ½¶·_½ğ¹ú½«ÁìÍĞ¶ûºº.lua
-- by xiaoyang (2004\4\15) ÉÙÁÖ90¼¶ÈÎÎñ

function OnDeath()
Uworld122 = GetTask(122)
	if (Uworld122 == 55) then				-- ×´Ì¬ÖĞ£¬´Ë´¦²»¼ì²éÁîÅÆ
		Talk(1,"","Ng­¬i l¹i ph¸ háng ®¹i sù cña Kim quèc! Kim chñ nhÊt ®Şnh kh«ng bu«ng tha ng­¬i!")
		SetTask(122,60)  -- ÉèÖÃÈÎÎñ±äÁ¿Îª60
		Msg2Player("GiÕt chÕt t­íng Th¸c NhÜ H¸n n­íc Kim, tiÕn th¼ng vµo doanh tr¹i cøu Th­êng B¸ch Lİ vµ Lı §Şch Phong. ")
		AddNote("GiÕt chÕt t­íng Th¸c NhÜ H¸n n­íc Kim, tiÕn th¼ng vµo doanh tr¹i cøu Th­êng B¸ch Lİ vµ Lı §Şch Phong. ")
	end
end
