--ÖĞÔ­ÄÏÇø\·üÅ£É½\ÖÜÔÆÈª¾ÓËù\Õ½¶·_À×¾ö.lua
--by xiaoyang (2004\4\20)

function OnDeath()
Uworld129 = GetTask(129)
	if (Uworld129 == 55) then
		SetTask(129,60)
		Talk(1,"",".....Kh«ng ngê ng­¬i l¹i lîi h¹i nh­ vËy! L«i QuyÕt ta ch¼ng qua chØ lµ mét ®Ö tö yÕu kĞm cña Thiªn NhÉn gi¸o. SÏ cã ng­êi b¸o thï cho ta! Vâ l©m Trung Nguyªn sÏ bŞ diÖt vong....")
		Msg2Player("§¸nh b¹i L«i QuyÕt, cøu ®­îc Chu V©n TuyÒn ®· bŞ th­¬ng. ")
		i = random(0,99)
		if (i < 33) then
			NewWorld(41, 1951, 2989)
		elseif (i < 67) then
			NewWorld(41, 1685, 3268)
		else
			NewWorld(41, 1788, 3085)
		end
   end
end
