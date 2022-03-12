-- Ä®±±´«ËÍ¾í
-- ÊÇÓÃºó´«ËÍµ½Ä®±±²İÔ­·ÇÕ½¶·ÇøÓò
-- Edit: ×Ó·ÇÓã
-- Date: 2007-06-06 19:47
Include("\\script\\maps\\checkmap.lua");

function main()
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>Cuén truyÒn tèng M¹c B¾c chØ cã thÓ sö dông t¹i khu vùc phi chiÕn ®Êu cña thµnh thŞ, t©n thñ th«n vµ t©y s¬n th«n<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: kh«ng cho sö dông m¹c b¾c truyÒn tèng trong v­ît ¶i 30
	if pMapID == 957 then
		Msg2Player("<color=yellow>Cuén truyÒn tèng M¹c B¾c chØ cã thÓ sö dông t¹i khu vùc phi chiÕn ®Êu cña thµnh thŞ, t©n thñ th«n vµ t©y s¬n th«n<color>");
		return 1;
	end
	local tbPos = {
		{1265,2493},
		{1281,2502},
		{1291,2546},
		{1289,2482},
	};
	local nrand = random(getn(tbPos));
	NewWorld(341, tbPos[nrand][1], tbPos[nrand][2]);
	SetFightState(0);
	SetRevPos(175,1)	--Éè¶¨ËÀÍöÖØÉúµãÎªÎ÷É½´å
	return 0;
end;