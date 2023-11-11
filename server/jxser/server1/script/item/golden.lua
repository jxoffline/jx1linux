function main()
	return 1
end

--p1 time/1-2 
-- p2 gbl /1-2
-- p3 time /3-4
--p4 gbl /3-4
function GetDesc(nItem)
	
	nP1 = GetItemParam(nItem, 1);

	nP2 = GetItemParam(nItem,2);
	nP3 = GetItemParam(nItem,3);
	nP4 = GetItemParam(nItem,4);
	nP5 = GetItemParam(nItem,5);
	nGlbId = SetByte(nP1, 3, GetByte(nP3,1))
	nGlbId = SetByte(nGlbId, 4, GetByte(nP3,2))
	
	nTime = SetByte(nP2, 3, GetByte(nP4,1))
	nTime= SetByte(nTime, 4, GetByte(nP4,2))


	nEndMonth = mod( floor( nTime/ 100000000 ), 100 );
	nEndDay = mod( floor( nTime/ 1000000 ), 100 );

	if (nP5 ~= 1000) then
		str  = format("<color=Blue>%dth¸ng%dngµy vÐ sè Hoµng Kim\nM· sè:%d-%d", nEndMonth, nEndDay,nTime,nGlbId)
	else
		str = format("<color=Yellow> VÐ sè  ¸ vËn héi \n Sè thø tù: %d-%d, ngµy nhËn th­ëng tõ 22h30 ®Õn 24h00  ngµy 01-09 ®Õn 2-09" ,nTime,nGlbId);
		return str
	end

	return str.."\nThêi gian ®æi th­ëng: Thêi gian ho¹t ®éng ¸ vËn héi tõ 22:30 ~ 24:00";
	
end