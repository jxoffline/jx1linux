function main()
	if ( GetTask(1201) == 10 ) then
		SetPos(1563,3118);
		Msg2Player("Tr­íc tiªn ph¶i ®èi tho¹i tr­íc víi DÞch Quan trong khu vùc")
	elseif ( GetTask(1201) == 20 ) then
		SetPos(1559,3113);
	elseif ( GetTask(1201) == 30 or GetTask(1201) == 25 or GetTask(1201) == 0 ) then
		SetPos(1563,3118);
		Msg2Player("Xin lçi! HiÖn t¹i b¹n kh«ng thÓ vµo ¶i ®­îc.")
	end
end;