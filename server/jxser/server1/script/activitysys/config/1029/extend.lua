Include("\\script\\activitysys\\config\\1029\\variables.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

pActivity.nPak = curpack()

function pActivity:ServerStart()
	local tbPos = {
		{37, 213*8*32, 195*16*32},
		{78, 198*8*32, 201*16*32},
		{11, 392*8*32, 316*16*32},
	}
	for _, pos in tbPos do
		local nMapIndex = SubWorldID2Idx(pos[1])
		if nMapIndex >= 0 then
			local nNpcIndex = AddNpcEx(1448, 1, 0, nMapIndex, pos[2], pos[3], 1, "Th»ng Cuéi ")
			if nNpcIndex and nNpcIndex > 0 then
				SetNpcScript(nNpcIndex, "\\script\\activitysys\\npcdailog.lua")
			end
		end
	end
end

function pActivity:RefreshYuTu(hParam)
	if OB_IsEmpty(hParam) == 1 then
		return
	end
	local tbYuTu = self.tbYuTu
	local pos = ObjBuffer:PopObject(hParam)
	local nMapIndex = SubWorldID2Idx(pos[1])
	if nMapIndex < 0 then
		return
	end
	local nNpcIndex = AddNpcEx(tbYuTu.nId, 1, 0, nMapIndex, pos[2]*32, pos[3]*32, 0, tbYuTu.szName)
	if nNpcIndex and nNpcIndex > 0 then
		SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\2\\yutu.lua")
		SetNpcParam(nNpcIndex, tbYuTu.Param_Finish, 0)
		SetNpcTimer(nNpcIndex, tbYuTu.nTime)
	end
end

function pActivity:RefreshYuTuNow()
	local handle = OB_Create()
	RemoteExecute("\\script\\activitysys\\2\\extend.lua", "RefreshYuTu:Refresh", handle)
	OB_Release(handle)
end