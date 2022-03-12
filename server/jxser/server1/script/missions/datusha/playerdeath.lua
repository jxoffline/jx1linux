
Include("\\script\\missions\\datusha\\datusha.lua")
IncludeLib("TIMER")
function OnDeath(nNpcIndex)
	local pDungeon = DungeonList[MAP_ID]
	if not pDungeon then
		return
	end
	local nPlayerIndex = NpcIdx2PIdx(nNpcIndex);
	local szDeathManName = GetName()
	local nMapId, nX, nY = GetWorldPos()
	
	if nPlayerIndex > 0 then
		local szName = CallPlayerFunction(nPlayerIndex, GetName)
		local pAttackData = pDungeon.tbPlayer[szName]
		if pAttackData then
			DaTuShaClass.Scores[szName] = DaTuShaClass.Scores[szName] or 0
			DaTuShaClass.Scores[szName] = DaTuShaClass.Scores[szName] + 1
			pAttackData.nScores = pAttackData.nScores + 1
			pAttackData.nTotalScores = pAttackData.nTotalScores + 1
		end
		CallPlayerFunction(nPlayerIndex, Msg2Player, format("Ng­¬i ®· %s c«ng kÝch träng th­¬ng, nhËn ®­îc 1 ®iÓm.", szDeathManName))
		Msg2Player(format("Ng­¬i bÞ %s c«ng kÝch träng th­¬ng!", szName))
	end
	local pDeatherData = pDungeon.tbPlayer[szDeathManName]
	if pDeatherData then
		if pDeatherData.nLife <= 0 then
			NewWorld(unpack(pDeatherData.tbSignUpPos))
		else
			SetTempRevPos(nMapId, nX * 32, nY * 32)	
			pDeatherData.nLife = pDeatherData.nLife - 1
			
			local nTime = (10 + (5 - pDeatherData.nLife) * 5)
			Msg2Player(format("Ng­¬i cßn cã %d lÇn c¬ héi phôc sinh", pDeatherData.nLife))
			Msg2Player(format("%d gi©y sau sÏ ®i vµo tr¹ng th¸i chiÕn ®Êu.", nTime))
			TM_SetTimer( nTime  * 18,105,1,0);	-- ÏÂÏßÏûÊ§
		end
	end
end