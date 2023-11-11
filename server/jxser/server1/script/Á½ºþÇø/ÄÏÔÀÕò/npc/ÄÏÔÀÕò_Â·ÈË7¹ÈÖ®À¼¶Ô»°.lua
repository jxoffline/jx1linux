--Á½ºşÇø ÄÏÔÀÕò Â·ÈË¹ÈÖ®À¼¶Ô»°

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","HÕt råi, hÕt thËt råi, ®¸ng lı ra ta cã thÓ g¶ cho mét vŞ anh hïng hµo kiÖt võa míi vµo trÊn nµy ë. Kh«ng ngê anh ta bŞ c¨n bÖnh dŞch c­íp mÊt m¹ng, ®¸ng tiÕc qu¸ ®i. Hõ......ta kh«ng râ ®Çu ®u«i thÕ nµo n÷a ng­¬i thö ®i hái ng­êi kh¸c xem sao.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("§éc C« phu nh©n thËt cã phóc, t­íng c«ng lµ mét ®¹i anh hïng,thËt khiÕn ta ng­ìng mé ",0)
return
end;

if (i == 1) then
Say("Quan träng nhÊt cña mét ®êi con g¸i chİnh lµ kh«ng nªn g¶ nhÇm ng­êi. Sau nµy ta còng ph¶i lÊy mét §¹i hiÖp cã t×nh c¶m dŞu dµng",0)
end;

end;

