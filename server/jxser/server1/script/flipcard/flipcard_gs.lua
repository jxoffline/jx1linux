Include("\\script\\flipcard\\flipcard_head.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\lib\\objbuffer_head.lua")

if MODEL_GAMESERVER ~= 1 then
	return
end

tbFlipCard.tbData = {}
--function f(nIndex)
--Msg2Player(nIndex)
--end
--
--
--tbFlipCard:OpenUI(f, {})
function tbFlipCard:OpenUI(pFun, tbParam)
	
	local szName = GetName()
	tbFlipCard.tbData[szName] = {pFun = pFun, tbParam = tbParam, nPak = curpack()}
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, self.OPT_OPEN_UI)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, 0)
	ObjBuffer:PushByType(handle, OBJTYPE_TABLE, {})
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_FLIP_CARD", handle)
	OB_Release(handle)
end

function tbFlipCard:SetItem(nIndex, tbData)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, self.OPT_SET_CELL)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nIndex)
	ObjBuffer:PushByType(handle, OBJTYPE_TABLE, tbData)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_FLIP_CARD", handle)
	OB_Release(handle)
end

function tbFlipCard:OnFlip(nIndex)
	local szName = GetName()
	local pData = tbFlipCard.tbData[szName]
	if not pData.pFun then
		return
	end
	local pFun = pData.pFun
	local tbParam = pData.tbParam
	
	local tbNewParam = {}
	if tbParam then
		for i=1, getn(tbParam) do
			tbNewParam[i] = tbParam[i]
		end
	end
	tinsert(tbNewParam, nIndex)
	local nPlayerIndex = PlayerIndex
	local nPak = usepack(pData.nPak)
	CallPlayerFunction(nPlayerIndex, pFun, unpack(tbNewParam))
	usepack(nPak)
end
