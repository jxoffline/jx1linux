
Include("\\script\\missions\\qianchonglou\\npc\\monster.lua")

function OnMagicAttrib(nCallState, nTargetNpcIndex, nLauncherNpcIndex)
	if nCallState < 0 then
		return
	end
	moster_on_hit(0, nTargetNpcIndex, nLauncherNpcIndex)
end