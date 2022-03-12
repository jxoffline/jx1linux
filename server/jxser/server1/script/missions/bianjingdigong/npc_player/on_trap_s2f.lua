--======================================================================
--Author:   Tan Qingyu
--Date:     2012-4-5 17:39:42
--Describe: 汴京地宫 非战斗状态到战斗状态
--======================================================================

function main()
	if GetFightState() == 0 then
		SetProtectTime(18*3) --三秒保护时间
		AddSkillState(963, 1, 0, 18*3)
		SetFightState(1)
	end
end
