Include("\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\head.lua")

Include("\\script\\missions\\basemission\\lib.lua")
local pNpcCallBack = function (self, nNpcIndex)
	SetNpcAuraSkill(nNpcIndex, 964, random(1,7))
	
end
function tbZhongQiu200909:AddTree(nNpcId, nMapId, nX, nY)
	
	self.tbNpcPos[nNpcId] = {nMapId, nX, nY}
	
	if SubWorldID2Idx(nMapId) < 0 then
		return 
	end
	local tbNpc = {nNpcId = 1496, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\rongshunpc.lua", nTime = 10*60, tbNpcParam = {50}}
	local tbNpc1 = {nNpcId = 1497, nLevel = 90, nIsboss = 1, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\huweinpc.lua", nTime = 5 * 60, pCallBack = %pNpcCallBack}
	local tbNpc2 = {nNpcId = 1498, nLevel = 90, nIsboss = 1, szScriptPath = "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\huweinpc.lua", nTime = 5 * 60, pCallBack = %pNpcCallBack}
	
	 basemission_CallNpc(tbNpc, nMapId, nX, nY)
	 basemission_CallNpc(tbNpc1, nMapId, nX + 2*32, nY + 2*32)
	 basemission_CallNpc(tbNpc2, nMapId, nX - 2*32, nY - 2*32)
end

function tbZhongQiu200909:DelTreePos()
	
	self.tbNpcPos = {}
end