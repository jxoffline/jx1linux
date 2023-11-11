Include("\\script\\lib\\objbuffer_head.lua") -- to open protocol in client
Include("\\script\\script_protocol\\protocol_def_gs.lua") -- to call ScriptProtocol:SendData

Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
IncludeLib("TIMER")
tbPlayer = {}
TimeDelMsg = 27
-------------------------------
function AddPlayer(nIndex)
	if not tbPlayer[nIndex] then
		tbPlayer[nIndex] = {
			nTimer = 0,
			szMsg = {},
		}
	end
end

function DelPlayer(nIndex)
	if tbPlayer[nIndex] then
		DelTimer(tbPlayer[nIndex].nTimer)
		tbPlayer[nIndex] = nil
	end
end
 ------------------------------
 function add_msgkiller(nIndex, text)
	local num = getn(tbPlayer[nIndex].szMsg)
	local szMsg = tbPlayer[nIndex].szMsg 
	if num == 0 then
		tinsert(szMsg, 0 , "")
		tinsert(szMsg, 1 , "")
		tinsert(szMsg, 2 , "")
		tinsert(szMsg, 3 , text)
	elseif num == 1 then
		tinsert(szMsg, num, "" )
		tinsert(szMsg, num + 1, "")
		tinsert(szMsg, num + 2, text)
	elseif num == 2 then
		tinsert(szMsg, num, "" )
		tinsert(szMsg, num + 1, text)
	elseif num == 3 then
		tinsert(szMsg, num , text)
	else
		tinsert(szMsg, num , text)
		tremove(szMsg , 0)
	end
	Send_Msg(nIndex)
 end
 
function Get_Msg(nIndex)
	local szMsg = ""
	local nMsg =  getn(tbPlayer[nIndex].szMsg)
	if nMsg ~= nil then
		for i = 1 , nMsg do
			szMsg = ""..szMsg.." "..tbPlayer[nIndex].szMsg[i - 1].."\n"
		end
	end
	return szMsg
end
function Auto_Del_Msg(nIndex)
	local nTimer = tbPlayer[nIndex].nTimer
	local nMsg = getn(tbPlayer[nIndex].szMsg)
	if nMsg ~= 0 then
		tremove(tbPlayer[nIndex].szMsg, 0)
		Send_Msg(nIndex)
		return TimeDelMsg, nIndex
	else
		DelTimer(tbPlayer[nIndex].nTimer)
		tbPlayer[nIndex].nTimer = 0
		return 0, nIndex
	end
end
function Send_Msg(nIndex)
	a = PlayerIndex
	PlayerIndex = nIndex
	local player_name = GetName()
	if player_name ~= nil then
	local nTimer = tbPlayer[nIndex].nTimer
		if nTimer == 0 then
			tbPlayer[nIndex].nTimer = AddTimer(TimeDelMsg, "Auto_Del_Msg", PlayerIndex)
		end
		local nMsg = getn(tbPlayer[nIndex].szMsg)
		local szMsg = Get_Msg(PlayerIndex)
		local nHandle = OB_Create()
		if nMsg ~= 0 then
			ObjBuffer:PushByType(nHandle, OBJTYPE_STRING, szMsg)
			ScriptProtocol:SendData("emSCRIPT_PROTOCOL_OPEN_MSGKILLPLAYER", nHandle)
			OB_Release(nHandle)
		else
			ObjBuffer:PushByType(nHandle, OBJTYPE_STRING, szMsg)
			ScriptProtocol:SendData("emSCRIPT_PROTOCOL_OPEN_MSGKILLPLAYER", nHandle)
			OB_Release(nHandle)
		end
	end
	PlayerIndex = a
end

--/script/msgkiller/msgkiller.lua
--   /script/msgkiller/lib.lua