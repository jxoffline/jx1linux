function main()
	if ( GetTask(1202) == 10 ) then
		SetPos(1337,3154);
		Msg2Player("Tr­íc tiªn ph¶i ®èi tho¹i tr­íc víi DÞch Quan trong khu vùc")
	elseif ( GetTask(1202) == 20 ) then
		SetPos(1340,3148);
	elseif ( GetTask(1202) == 30 or GetTask(1202) == 25 or   GetTask(1202) == 0 ) then
		SetPos(1337,3154);
		Msg2Player("Xin lçi! HiÖn t¹i b¹n kh«ng thÓ vµo ¶i ®­îc.")
	end
end;