

Include("\\script\\gb_taskfuncs.lua")

function shengdan0811_tbXiaoDaoZeiAct_SetBossDeathFlag()
	gb_SetTask("shengdan0811_ThiefBoss", 1, 2)
	gb_SetTask("shengdan0811_ThiefBoss", 2, GetSysCurrentTime())
	OutputMsg("shengdan boss deaht time is "..GetSysCurrentTime())
end