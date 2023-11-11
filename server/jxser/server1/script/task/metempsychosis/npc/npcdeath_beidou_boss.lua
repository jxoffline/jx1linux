Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

g_tbCreateNpcParam = 
{
	szName = "B綾 u L穙 Nh﹏", 
	nLevel = 1,
	nNpcId = 2200,
	nTime =  5 * 60 ,		-- 存在时间 5分钟
	szScriptPath = "\\script\\task\\metempsychosis\\npc\\npc_beidou.lua",
	nSeries = nil, 
	tbNpcParam = 
	{
		
	},
}

function OnDeathImmediately(nNpcIndex)
	return 0
end

function OnTimer(nNpcIndex, nTimeOut)
	DelNpc(nNpcIndex)
	SetNpcParam(nNpcIndex, 2, 1)--标志npc移除
end
