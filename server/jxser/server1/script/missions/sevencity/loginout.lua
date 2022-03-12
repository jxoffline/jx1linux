Include("\\script\\missions\\sevencity\\war.lua")

function login(playerindex, exchange)
	local player = Player:New(playerindex)
	local mapid, _, _ = player:GetWorldPos()
	local field = BattleWorld:FindField(mapid)
	if (field) then
		field:Enter(player)
	end
end

function logout(playerindex)
	local player = Player:New(playerindex)
	local mapid, _, _ = player:GetWorldPos()
	local field = BattleWorld:FindField(mapid)
	if (field) then
		field:Leave(player)
	end
end
