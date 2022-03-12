Include("\\script\\missions\\yuegedao\\yuegemigu\\yuegeroom.lua")
YueGeMiGuPlayer = {}

function YueGeMiGuPlayer:OnLeaveMap()
	SetPunish(1)	
	SetTmpCamp(0)
	DisabledStall(0)	--°ÚÌ¯
	SetFightState(0)
	SetDeathScript("")
	local szPlayerName = GetName()
	local tbWorld = DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua", "getglobal", "YueGeMiGuWorld")	
	tbWorld.nRoomCount = tbWorld.nRoomCount - 1
	local nRoomId = tbWorld.tbPlayer2RoomId[szPlayerName]
	if nRoomId ~= nil then
		if tbWorld.tbRoomSet[nRoomId] ~= nil then
			tbWorld.tbRoomSet[nRoomId]:Destroy()
			tbWorld.tbRoomSet[nRoomId] = nil
		end
	end
end

function YueGeMiGuPlayer:OnEnterMap()
	SetPunish(0)	
	SetLogoutRV(1)
	SetTmpCamp(1)
	DisabledStall(1)	--°ÚÌ¯
	SetFightState(1)
	SetDeathScript("\\script\\missions\\yuegedao\\yuegemigu\\playerdeath.lua")
end

function YueGeMiGuPlayer:OnDeath()
end
