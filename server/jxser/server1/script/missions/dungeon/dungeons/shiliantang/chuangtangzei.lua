Include("\\script\\missions\\dungeon\\dungeons\\shiliantang\\shiliantang.lua")
Include("\\script\\lib\\baseclass.lua")

function main()

end

function OnDeath( nNpcIndex )
	local nDungeonId = GetNpcParam(nNpcIndex, 2);
	local tbD = tbDungeonInfo:GetDungeon(nDungeonId);
	if (tbD ~= nil and tbD.MonsterDead ~= nil) then
		tbD:MonsterDead(nNpcIndex)
	end
end

function OnTimer(nNpcIndex, nTimeOut)
	local nDungeonId = GetNpcParam(nNpcIndex, 2);
	local tbD = tbDungeonInfo:GetDungeon(nDungeonId);
	local nRetInterval = 0;
	if (tbD ~= nil and tbD.OnMonsterTimer ~= nil) then
		nRetInterval = tbD:OnMonsterTimer(tbD.CHECK_POS_INTERVAL, nNpcIndex)
	end
	
	SetNpcTimer(nNpcIndex, nRetInterval)
end