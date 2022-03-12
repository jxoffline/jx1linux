function main()
	if ( GetTask(1203) == 10 ) then
		SetPos(1414,3197);
		Msg2Player("Tr­íc tiªn ph¶i ®èi tho¹i tr­íc víi DÞch Quan trong khu vùc")
	elseif ( GetTask(1203) == 21 ) then
		SetPos(1414,3197);
		Msg2Player("H·y ®èi tho¹i víi DÞch Quan trong b¶n ®å tr­íc ®Ó tiÕp tôc nhiÖm vô.")
	elseif ( GetTask(1203) == 20 ) then
		SetPos(1414,3191);
		Msg2Player("Muèn ra khái b¶n ®å nµy h·y ®i t×m Tiªu TrÊn")
	elseif ( GetTask(1203) == 30 or GetTask(1203) == 25 or   GetTask(1203) == 0 ) then
		SetPos(1414,3197);
		Msg2Player("Xin lçi! HiÖn t¹i b¹n kh«ng thÓ vµo ¶i ®­îc.")
	end
end