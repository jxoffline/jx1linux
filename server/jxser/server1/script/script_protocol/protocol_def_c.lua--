if MODEL_GAMECLIENT ~= 1 then
	return
end
Include("\\script\\protocol.lua")
function ScriptProtocol:SendData(szEnum, nHandle)
	if (type(self[szEnum]) == "number") then
		SendScriptDataToServer(self[szEnum], nHandle)
	end
end
