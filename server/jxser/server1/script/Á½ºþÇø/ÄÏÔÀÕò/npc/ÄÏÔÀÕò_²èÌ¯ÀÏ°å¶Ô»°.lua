--Á½ºşÇø ÄÏÔÀÕò ²èÌ¯ÀÏ°å¶Ô»°

function main(sel)
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 else
		 	Talk(1,"","Ng­¬i ®Õn dß la tin tøc c¸i chÕt cña ThŞ Lang µh? Hµi, gÇn ®©y d­íi ch©n nói Hoµnh S¬n cã nhiÒu ng­êi chÕt l¾m. VŞ bé kho¸i Høa NhŞ Gia hay ®Õn qu¸n ta ¨n uèng còng chÕt mét c¸ch k× l¹, quan phñ ®Õn giê ch­a t×m ra thñ ph¹m n÷a, lµm ng­êi ta sî qu¸, kh«ng biÕt cã manh mèi míi ch­a? ta còng kh«ng râ n÷a, ng­¬i ®i hái thö ng­êi kh¸c xem sao.")
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end;
		 
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Kh¸ch quan! §· ®Õn Hoµnh s¬n nhÊt ®Şnh ph¶i thö trµ V©n Vô ë chç chóng ta ®Êy. ")
	elseif (i == 1) then
		Talk(1,""," 'Danh s¬n danh thñy xuÊt danh trµ', trµ V©n Vô lµ ®Æc s¶n cña Hoµnh s¬n chóng ta tõ l©u ®· thµnh danh, sím ®· ®­îc liÖt vµo danh s¸ch cèng phÈm ®êi §­êng. ")
	else
		Talk(1,"","Mïi vŞ trµ V©n Vô rÊt nång, h­¬ng khİ ngµo ng¹t, tinh khiÕt mµ kh«ng nh¹t, nång mµ kh«ng ch¸t, pha lªn 1 Êm trµ, kh«ng chØ cã thÓ ®­îc gi¶i kh¸t mµ cßn cã thÓ gi¶i ®éc")
	end
end
