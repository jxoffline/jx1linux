Include("\\script\\battles\\battlehead.lua");

tbForbidMap =
{
	--seven city
	926,
	927,
	928,
	929,
	930,
	931,
	932,
	
	336,	--Phong L¨ng ®é
	341,	--M¹c B¾c Th¶o Nguyªn
	337,	--BÕn thuyÒn 1
	338,	--BÕn thuyÒn 2
	339,	--BÕn thuyÒn 3
	319,	--L©m Du Quan
	333,	--Hoa S¬n ph¸i
	37,	--BiÖn Kinh
	44,	--ChiÕn tr­êng Tèng Kim
}

function ForbidMap()
	nSubWorldID = SubWorldIdx2ID();
	W,X,Y = GetWorldPos();

	local nMapId = W;
	
	for i = 1, getn(tbBATTLEMAP) do --map Tong Kim
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end	
	
	for i = 1, getn(tbForbidMap) do 
		if (nSubWorldID == tbForbidMap[i]) then
			Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dông vËt phÈm!");
			return 1
		end
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then --map Tong Kim
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dông vËt phÈm!");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then --Phong Lang Do
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dông vËt phÈm!");
		return 1
	end
	
	return 0
	
end