Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")

tbVNGWD2011_AddNpc = {}
tbVNGWD2011_AddNpc.nNpcID = 224
tbVNGWD2011_AddNpc.strName = "¤ng L·o Lµm V­ên"
tbVNGWD2011_AddNpc.strScript = "\\script\\vng_event\\20110225_8_thang_3\\npc\\gardener.lua"
tbVNGWD2011_AddNpc.tbPos = 
	{
		{520,1564,3255},
		{521,1564,3255},
		{522,1564,3255},
		{523,1564,3255},
		{524,1564,3255},
		{525,1564,3255},
		{526,1564,3255},
	};
function tbVNGWD2011_AddNpc:AddNpc()
	if tbVNG_WomenDay2011:IsActive() ~= 1 then
		return
	end
	for i = 1, getn(self.tbPos) do
		local tbPos = self.tbPos[i]
		local nMapId = SubWorldID2Idx(tbPos[1])
		local nNpcIdx = AddNpc(self.nNpcID, 1, nMapId, tbPos[2]*32, tbPos[3]*32, 1, self.strName)
		SetNpcScript(nNpcIdx, self.strScript)
	end
end