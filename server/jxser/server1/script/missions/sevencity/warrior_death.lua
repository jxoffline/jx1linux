Include("\\script\\missions\\sevencity\\war.lua")

-- Íæ¼ÒËÀÍö½Å±¾
function OnDeath(npcindex)
	local killer_index = NpcIdx2PIdx(npcindex)
	if (killer_index <= 0) then
		BattleWorld:Log(format("[ERROR SEVENCITY]warrior(%s) killed by npc(%s)(%d)",
			GetName(),
			GetNpcName(npcindex),
			npcindex))
		return
	end
	local killer = Player:New(killer_index)
	local killed = Player:New(PlayerIndex)
	local mapid, _, _ = killed:GetWorldPos()
	local field = BattleWorld:FindField(mapid)
	if (field ~= nil) then
		field:KillWarrior(killer, killed)
		field:Logout(killed, 1)
		print(format("[SEVENCITY]field(%d): %s kill %s!",
			mapid,
			killer:GetName(),
			killed:GetName()))
	else
		BattleWorld:Log(format("[ERROR SEVENCITY]WarriorDeath: field(%d) not found", mapid))
	end
end
