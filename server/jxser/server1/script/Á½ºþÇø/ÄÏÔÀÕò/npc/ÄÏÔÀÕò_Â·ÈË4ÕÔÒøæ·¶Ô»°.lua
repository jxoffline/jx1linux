--Á½ºşÇø ÄÏÔÀÕò Â·ÈË4ÕÔÒøæ·¶Ô»°

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","Huhuhu,huhu…mÑ ¬i, mÑ mÊt råi, trong trÊn b©y giê cµng ngµy cµng nhiÒu ng­êi chÕt nh­ng kh«ng biÕt nguyªn do. ¤ng trêi ¬i! Tr¶ mÑ l¹i cho ta ®i, tr¶ mÑ cho ta.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end

i = random(0,1)

if (i == 0) then
Say("Ta muèn ®i häc kinh th­, nh­ng cha ta kh«ng cho, nãi con g¸i ®i häc kh«ng thÓ ra tiÕn cö c«ng danh, chØ lµ l·ng phİ tiÒn. ",0)
return
end;

if (i == 1) then
Say("Cha ta cø ®¸nh ta, nãi ta lµ kÎ tiªu tiÒn, ngay c¶ lóc cã mÑ ta còng ®¸nh. NÕu nh­ ta cã b¶n lÜnh nh­ huynh, cha ta sÏ kh«ng cßn ®¸nh ta n÷a",0)
end;

end;

