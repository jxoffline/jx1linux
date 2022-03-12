--Á½ºşÇø ÄÏÔÀÕò ¾ÆµêÀÏ°å¶Ô»°

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","VŞ kh¸ch quan nµy xin dõng b­íc, qu¸n nhá chóng ta kh«ng d¸m më cöa n÷a. GÇn ®©y thŞ trÊn nµy nhiÒu ng­êi chÕt mét c¸ch k× l¹, chç chóng ta ®©y còng chÕt mÊy ng­êi kh¸ch qua ®­êng. HiÖn t¹i quan phñ ®ang ®iÒu tra, tiÓu nh©n ®©y rÊt sî chèn quan tr­êng nªn kh«ng thÓ më cöa tiÕp ngµi ®­îc xin ngµi bá qua cho.")		 	
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end

Say("Sau khi §éc C« §¹i HiÖp cña Hoµnh S¬n lµm Vâ L©m Minh Chñ, nam Nh¹c TrÊn nhá cña chóng ta còng n¸o nhiÖt h¼n lªn; c¸c hiÖp kh¸ch kiÕm hiÖp ®Õn ®©y rÊt nhiÒu, lµm ¨n bu«n b¸n cña qu¸n r­îu nhá nµy còng ®¾t h¬n tr­íc",0);

end;

