--Á½ºşÇø ÄÏÔÀÕò ¿ÍÕ»ÀÏ°å¶Ô»°

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","Kh¸ch quan xin mêi vµo, ®õng sî, ®õng sî, tuy trong s·nh ®­êng cã mÊy c¸i quan tµi nh­ng chóng ta vÉn më cöa ®ãn kh¸c ®õng ®Ó ı ®Õn mÊy vô dŞch bÖnh Êy. C¸i g×? ta kh«ng sî míi l¹ ®ã, lì l¨n ra chÕt mét ®ãng th× sao ®©y. Hihihi, tiÓu ®iÕm ®©y an toµn mµ, ®­¬ng nhiªn trong thêi buæi lo¹n l¹c nµy tiÒn thuª phßng cã h¬i cao mét chót ®Êy.")		 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end
	
Say("Ng­êi còng lªn nói b¸i kiÕn §éc C« §¹i hiÖp sao? Nh­ng «ng Êy lµ thÇn t­îng cña ta. GÆp ®­îc «ng ta, phiÒn «ng Êy viÕt cho ta mét ch÷ ",0);

end;

