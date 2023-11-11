function OnDeath()
	Uworld130 = GetTask(130)
	if (Uworld130 == 30) then
		SetTask(130,33)
		Msg2Player("§¸nh b¹i ThiÖu Ngäc Phi ")
	elseif (Uworld130 == 36) then
		SetTask(130,40)
		AddNote("ChiÕn th¾ng Ng­, ThiÖu 2 ng­êi, quay vÒ Th¸n Tøc L·o Nh©n ")
		Talk(3,"Uworld130_good","T¹i h¹ kh«ng cã ı lµm tæn th­¬ng 2 vŞ, tõ giê vÒ sau ®õng lµm nh÷ng chuyÖn d¹i dét nh­ thÕ n÷a.","Ng­ Tè Ch©n:……","D¹! D¹! §¹i hiÖp an t©m, chóng ta sÏ kh«ng d¸m n÷a!")
	end
end

function Uworld130_good()
	Msg2Player("ChiÕn th¾ng Ng­, ThiÖu 2 ng­êi, quay vÒ Th¸n Tøc L·o Nh©n ")
	SetFightState(0)
	NewWorld(131,1530,3228)			-- ×Ô¶¯ËÍµ½Ì¾Ï¢ÀÏÈË´¦
end
