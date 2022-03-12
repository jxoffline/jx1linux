Include("\\script\\missions\\sevencity\\war.lua")

-- ÁúÖùËÀÍö½Å±¾
function OnDeath(killed_index)
	local player = Player:New(PlayerIndex)
	local mapid, _, _ = player:GetWorldPos()
	local field = BattleWorld:FindField(mapid)
	if (field ~= nil) then
		field:KillMonster(player)
	else
		BattleWorld:Log(format("[ERROR SEVENCITY]MonsterDeath: field(%d) not found", mapid))
	end
end
