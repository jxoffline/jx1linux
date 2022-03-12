--Á½ºşÇø ÄÏÔÀÕò Â·ÈË6ÕÔ°ÙÄê¶Ô»°

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","ta…ta…sè ta sao khæ thÕ, c¸i dŞch bÖnh Êy ®· c­íp mÊt ng­êi vî cña ta råi. Tõ nay vÒ sau ai nèi dâi t«ng ®­êng cho hä TriÖu ®©y.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end

Say("Ta thËt xui xÎo, ®Õn b©y giê còng ch­a cã con trai, ch¼ng lÏ TriÖu Gia ta thËt ®øt ®o¹n h­¬ng ho¶ råi sao?",0)

end;

