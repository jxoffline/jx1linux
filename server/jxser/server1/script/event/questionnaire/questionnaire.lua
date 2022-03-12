Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\trip\\define.lua")

local pTaskGroup = TaskManager:Create(3, 5)
local TSKI_STATE = 1
local URL = "http://khuyenmai.zing.vn/vo-lam/khao-sat-thang-6-2013/khao-sat-3170/xem.%s.html"
local nStartDate = 20130621
local nEndDate = 20130710

function onlogin(bExchangeIn)
	if bExchangeIn == 1 then
		return
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if %nStartDate > nDate or nDate > %nEndDate then
		return
	end
	if %pTaskGroup:GetTask(%TSKI_STATE) >= 3 then
		return
	end
	
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_STRING, format(%URL, GetAccount()))
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_OPEN_URL", handle)
	OB_Release(handle)
end

function add_questionnaire_count(nCount)
	%pTaskGroup:AddTask(%TSKI_STATE, nCount)
end

function reg_event()
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_SERVER then
		EventSys:GetType("OnLogin"):Reg(0, %onlogin)
	end
end

AutoFunctions:Add(reg_event)

