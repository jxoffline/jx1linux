
-- 40 级以前技能洗点函数
-- 2005 年 03 月 03 日佩雷斯修改过洗所有的技能点


function ClearMagicPoint()
	i = HaveMagic(210)		-- 轻功另外操作
	j = HaveMagic(400)		-- “劫富济贫”另外操作
	n = RollbackSkill()		-- 清除技能并返回所有技能点（包括轻功等特殊技能）
	x = 0
	if (i ~= -1) then x = x + i end					-- 这两句判断是排除从未学过轻功的人返回-1从而导致点数计算错误情况
	if (j ~= -1) then x = x + j end
	rollback_point = n - x							-- 把技能点当做空闲点数返还，但先扣除轻功等
	if (rollback_point + GetMagicPoint() < 0) then	-- 如果洗成了负数，则当作0（为以后多次洗点保留）
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end			-- 如果学过轻功则加回原有等级
	if (j ~= -1) then AddMagic(400,j) end			-- 如果学过“劫富济贫”同样处理
end;