
function AddOnTime(tb, nNpcIndex)
	DynamicExecute("\\script\\activitysys\\config\\28\\boss_muke.lua","AddTimer", 15*60*18, "BossMuKeOnTime", nNpcIndex)
	--AddTimer(15*60*18, "BossMuKeOnTime", nNpcIndex)
end

function BossMuKeOnTime(nNpcIndex)
	DelNpc(nNpcIndex)
	return 0, nNpcIndex
end