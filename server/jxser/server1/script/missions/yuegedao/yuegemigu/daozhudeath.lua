Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua")
Include("\\script\\lib\\player.lua")

function OnTimer(nNpcIndex, nTimeOut) 
	local nRoomId = GetNpcParam(nNpcIndex, 1)
	local tbRoom = YueGeMiGuWorld.tbRoomSet[nRoomId]
	tbRoom:ChangeNpc(nNpcIndex, 0)
end

function OnDeath(nNpcIndex)
	local nState = GetNpcParam(nNpcIndex, 2)
	--Msg2Player("Boss state khi boss chÕt lµ <color=yellow>"..nState)
	local szPlayerName = GetName()
	local nRoomId = YueGeMiGuWorld.tbPlayer2RoomId[szPlayerName]
	local tbRoom = YueGeMiGuWorld.tbRoomSet[nRoomId]
	tbRoom:ChangeNpc(nNpcIndex, 1)
end
