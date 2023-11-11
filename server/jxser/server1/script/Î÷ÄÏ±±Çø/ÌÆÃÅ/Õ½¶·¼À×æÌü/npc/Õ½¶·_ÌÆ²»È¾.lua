-- Õ½¶·_ÌÆ²»È¾.lua
-- by: Dan_Deng(2004-04-12)

function OnDeath()
	Uworld123 = GetTask(123)
	if (Uworld123 == 40) then
		SetTask(123,50)
		SetFightState(0)
		Talk(1,"","T¹i sao ta l¹i cã thÓ thua cuéc?!")
		Msg2Player("B¹n ®· ®¸nh b¹i §­êng BÊt NhiÔm, cßn kh«ng mau an ñi h¾n mét tİ? ")
		NewWorld(36, 1592, 3193)		-- ËÍ»Ø¼À×æÌü
	end
end
