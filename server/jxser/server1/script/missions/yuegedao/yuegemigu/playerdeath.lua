Include("\\script\\lib\\player.lua")

function OnDeath(Launcher)
	local TSK_LV150_SKILL = 2885
	local TARGET_150SKILL_TASKSTATE = 12
	local BOSS_STATE = 3
	local szPlayerName = GetName()
	local tbWorld = DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua", "getglobal", "YueGeMiGuWorld")
	local nRoomId = tbWorld.tbPlayer2RoomId[szPlayerName]
	local nNpcIndex = tbWorld.tbRoomSet[nRoomId].nNpcId
	local nState = GetNpcParam(nNpcIndex, 2)
	local nTaskValue = GetTask(TSK_LV150_SKILL)
	nTaskValue = mod(floor(nTaskValue/100), 100)
	--Msg2Player("Boss state khi ng­êi chÕt lµ <color=yellow>"..nState)
	if nState == BOSS_STATE and nTaskValue == TARGET_150SKILL_TASKSTATE then
		tbWorld.tbRoomSet[nRoomId]:_TaskStepAdd()
	end
end