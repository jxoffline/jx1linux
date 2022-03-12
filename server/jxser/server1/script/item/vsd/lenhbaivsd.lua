Include("\\script\\maps\\checkmap.lua");
function main(nItemIndex)
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>LÖnh bµi Vi S¬n §¶o chØ cã thÓ sö dông t¹i khu vùc phi chiÕn ®Êu cña thµnh thŞ, t©n thñ th«n vµ t©y s¬n th«n<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: kh«ng cho sö dông lÖnh bµi VSD trong v­ît ¶i 30
	if pMapID == 957 then
		Msg2Player("<color=yellow>Cuén truyÒn tèng M¹c B¾c chØ cã thÓ sö dông t¹i khu vùc phi chiÕn ®Êu cña thµnh thŞ, t©n thñ th«n vµ t©y s¬n th«n<color>");
		return 1;
	end
	NewWorld(342, 1417, 2801)
	SetFightState(0);
	return 0
end


