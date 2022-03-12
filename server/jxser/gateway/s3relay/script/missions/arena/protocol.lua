Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\arena\\player.lua")
Include("\\script\\missions\\arena\\map.lua")


function apply_search_opponents(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nGroup = ObjBuffer:PopObject(ParamHandle)
	local bFind = tbPlayerManage:SearchOpponents(szName, nGroup)
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, bFind)
end

function set_last_state(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local tbLastState = ObjBuffer:PopObject(ParamHandle)
	tbPlayerManage:SetLastState(szName, tbLastState)
end

function player_logout(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	tbPlayerManage:OnLogout(szName)
end

function player_enter_map(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	tbPlayerManage:OnEnterMap(szName, nMapId)
	tbMapManage:OnPlayerEnter(nMapId)
	
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, nMapId)
	ObjBuffer:PushObject(ResultHandle, tbPlayerManage:GetLastState(szName))
end

function player_leave_map(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	tbPlayerManage:OnLeaveMap(szName)
	tbMapManage:OnPlayerLeave(nMapId)
end

function begin_battle(ParamHandle, ResultHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local szNameA = ObjBuffer:PopObject(ParamHandle)
	local szNameB = ObjBuffer:PopObject(ParamHandle)
	tbMapManage:Release(nMapId)
	tbPlayerManage:Release(szNameA)
	tbPlayerManage:Release(szNameB)
end

function reg_map(ParamHandle, ResultHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	tbMapManage:RegMap(nMapId)
	tbPlayerManage:Proc()
end

function player_cancel(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	tbPlayerManage:Release(szName)
end