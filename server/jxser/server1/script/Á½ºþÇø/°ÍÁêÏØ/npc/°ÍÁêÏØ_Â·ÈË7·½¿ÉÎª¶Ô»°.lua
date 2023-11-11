--Á½ºşÇø °ÍÁêÏØ Â·ÈË7·½¿ÉÎª¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(200) == 1 then
		allbrother_0801_FindNpcTaskDialog(200)
		return 0;
	end

i = random(0,2)

if (i == 0) then
Say("Ba L¨ng huyÖn cña chóng ta lµ mét vïng ®Êt nhá, nh­ng cuéc sèng cña mäi ng­êi rÊt an b×nh. ",0)
return
end;

if (i == 1) then
Say("Thiªn V­¬ng Bang chİnh lµ cøu c¸nh cña chóng ta, nÕu kh«ng cã hä thÕ thiªn hµnh ®¹o, chóng ta h¼n ®· bŞ bän tham quan nhòng nhiÔu råi!",0)
return
end;

if (i == 2) then
Say("Trong m¾t cña b¸ch tİnh, Thiªn V­¬ng Bang ®Òu lµ nh÷ng vŞ anh hïng h¶o h¸n! Thanh thiÕu niªn trong huyÖn ®Òu mong muèn gia nhËp Thiªn V­¬ng bang!",0)
end;

end;

