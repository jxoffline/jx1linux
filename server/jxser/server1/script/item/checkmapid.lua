-- ¼ì²éÊÇ·ñÔÚËÎ½ğµØÍ¼
-- LiuKuo
-- 2004.12.22
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
tbCD_MAP = {516, 517, 580, 581}	--·é»ğÁ¬³ÇÊØ³ÇµØÍ¼

function main(nItemIdx)

--	W,X,Y = GetWorldPos();
	nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				Msg2Player("§¹o cô nµy kh«ng thÓ sö dông t¹i chiÕn tr­êng quèc chiÕn Tèng Kim");
				return 1;
			end
			
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	
	for i = 1, getn(tbCD_MAP) do
		if (nMapId == tbCD_MAP[i]) then
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	Msg2Player("VËt phÈm nµy chØ cã thÓ sö dông ë ChiÕn tr­êng Tèng Kim");
	return 1;
end