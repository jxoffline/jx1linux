Include("\\script\\missions\\zhaojingling\\head.lua")

PreparePlayer = {}

function PreparePlayer:OnEnterMap()
	CallPlayerFunction(PlayerIndex, setentermapstate)
	local tbGame = DynamicExecute("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua", "getglobal", "PrepareGame")
	if tbGame.nPlayerCount >= ALLPLAYERCOUNT then
		local nMapId = GetTask(TSK_LEAVERMAPID)
		local nX = GetTask(TSK_LEAVERPOSX)
		local nY = GetTask(TSK_LEAVERPOSY)
		Msg2Player("Nh©n sè trËn nµy ®· ®Çy, trËn sau h·y ®Õn nhÐ")
		NewWorld(nMapId, nX, nY)
		return
	end	
	tbGame.tbPlayer = tbGame.tbPlayer or {}
	local szName = GetName()
	tbGame.tbPlayer[szName] = 1
	tbGame.nPlayerCount = tbGame.nPlayerCount + 1
end

function PreparePlayer:OnLeaveMap()
	CallPlayerFunction(PlayerIndex, setleavemapstate)
	local tbGame = DynamicExecute("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua", "getglobal", "PrepareGame")
	local szName = GetName()
	if tbGame.tbPlayer ~= nil and tbGame.tbPlayer[szName] ~= nil then
		tbGame.tbPlayer[szName] = nil
		tbGame.nPlayerCount = tbGame.nPlayerCount - 1
	end
end

function PreparePlayer:OnDeath()
	
end

