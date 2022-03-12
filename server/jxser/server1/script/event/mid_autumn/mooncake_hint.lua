-- mooncake_hint.lua 
-- 提示领取月饼脚本
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")
IncludeLib("TIMER")

function OnTimer()
	local varv = GetTask(VARV_MOONCAKE)
	local stat = mod(varv, 1000)
	if (tbl_notice[stat] ~= nil) then
		Msg2Player(tbl_notice[stat])
	end
end
