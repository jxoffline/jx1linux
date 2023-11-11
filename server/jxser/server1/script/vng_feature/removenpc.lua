
Include("\\script\\global\\autoexec_head.lua")

TBNPC_LIST_2_REMOVE = {
	{"V« danh T¨ng", 55},
}
function OnServerStart_CLearNpc()
	for i = 1, getn(TBNPC_LIST_2_REMOVE) do
		local n_mapidx = SubWorldID2Idx(TBNPC_LIST_2_REMOVE[i][2]);	
		if (n_mapidx >= 0) then
			ClearMapNpcWithName(TBNPC_LIST_2_REMOVE[i][2], TBNPC_LIST_2_REMOVE[i][1])
		end
	end
end


AutoFunctions:Add(OnServerStart_CLearNpc)