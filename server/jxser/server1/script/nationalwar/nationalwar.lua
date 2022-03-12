Include("\\script\\nationalwar\\head.lua")
Include("\\script\\battles\\battlehead.lua")
IncludeLib("BATTLE")

-- 普天同庆
function OnCongratulation()
	-- 天子不能朝贺自己
	if (NW_IsEmperor() == 1) then
		return
	end
	-- 参与的玩家必需在120级以上(转生的玩家等级不限制)
	if (GetLevel() <= 120 and ST_IsTransLife() ~= 1) then
		return
	end

	-- 次数限制：一周三次
	local task_count = GetBitTask(TASKNO_NW_CONGRATULATION, 0, 8)
	local task_dtime = GetBitTask(TASKNO_NW_CONGRATULATION, 8, 24)
	local curr_dtime = GetCurServerTime() / SECONDS_ONEDAY
	if (task_dtime == 0 or curr_dtime - task_dtime >= 7) then
		SetBitTask(TASKNO_NW_CONGRATULATION, 8, 24, curr_dtime)
		SetBitTask(TASKNO_NW_CONGRATULATION, 0, 8, 1)
	elseif (task_count < 3) then
		SetBitTask(TASKNO_NW_CONGRATULATION, 0, 8, task_count + 1)
	else
		return
	end
	
	-- 加经验
	AddOwnExp(200000)
	NW_AwardEmperor(10000)
	
	-- 烟花效果
	local _, x, y = GetWorldPos()
	CastSkill(687, 1, x * 32, y * 32)
end

function Append(tb, item)
	tb[getn(tb) + 1] = item
end

-- 职位变化
function OnPositionChange(pos, flag)
	local tb_add = {}
	local tb_del = {}
	if (pos == NWPOSITION_EMPEROR) then
		if (flag == 1) then
			-- 删除国主光环/技能
			Append(tb_del, SKILLID_STATE_KING)
			Append(tb_del, SKILLID_SKILL_KING)
			-- 增加天子光环/技能
			Append(tb_add, SKILLID_STATE_EMPEROR)
			Append(tb_add, SKILLID_SKILL_EMPEROR)
		else
			-- 删除天子光环
			Append(tb_del, SKILLID_STATE_EMPEROR)
			Append(tb_del, SKILLID_SKILL_EMPEROR)
			if (NW_GetDuty() == NWPOSITION_KING) then
				-- 增加国主光环/技能
				Append(tb_add, SKILLID_STATE_KING)
				Append(tb_add, SKILLID_SKILL_KING)
			end
		end
	elseif (pos == NWPOSITION_KING) then
		if (flag == 1) then
			-- 增加国主光环/技能
			Append(tb_add, SKILLID_STATE_KING)
			Append(tb_add, SKILLID_SKILL_KING)
		else
			-- 删除国主光环/技能
			Append(tb_del, SKILLID_STATE_KING)
			Append(tb_del, SKILLID_SKILL_KING)
		end
	elseif (pos == NWPOSITION_MINISTER) then
		if (flag == 1) then
			-- 增加大丞相光环/技能
			Append(tb_add, SKILLID_STATE_MINISTER)
			Append(tb_add, SKILLID_SKILL_MINISTER)
		else
			-- 删除大丞相光环/技能
			Append(tb_del, SKILLID_STATE_MINISTER)
			Append(tb_del, SKILLID_SKILL_MINISTER)
		end
	elseif (pos == NWPOSITION_MARSHAL) then
		if (flag == 1) then
			-- 增加兵马大元帅光环
			Append(tb_add, SKILLID_STATE_MARSHAL)
			-- 兵马大元帅技能只能在国战宋金地图使用
			if (BT_GetGameData(GAME_BATTLEID) == 2) then
				Append(tb_add, SKILLID_SKILL_MARSHAL)
			end
		else
			-- 删除兵马大元帅光环/技能
			Append(tb_del, SKILLID_STATE_MARSHAL)
			Append(tb_del, SKILLID_SKILL_MARSHAL)
		end
	elseif (pos == NWPOSITION_PIONEER) then
		if (flag == 1) then
			-- 增加先锋官光环/技能
			Append(tb_add, SKILLID_STATE_PIONEER)
			-- 先锋官技能只能在国战宋金地图使用
			if (BT_GetGameData(GAME_BATTLEID) == 2) then
				Append(tb_add, SKILLID_SKILL_PIONEER)
			end
		else
			-- 删除先锋官光环/技能
			Append(tb_del, SKILLID_STATE_PIONEER)
			Append(tb_del, SKILLID_SKILL_PIONEER)
		end
	else
		return
	end
	-- 免职：先删除技能状态，防止连续累加技能级别超过最大值
	for i = 1, getn(tb_del) do
		RemoveSkillState(tb_del[i])
	end
	-- 任命
	for i = 1, getn(tb_add) do
		AddSkillState(tb_add[i], 1, 0, 99999999)
	end
end

-- 玩家进入/离开国战宋金地图事件
function nationalwar_mapevent(flag)
	if (BT_GetGameData(GAME_BATTLEID) ~= 2) then
		return
	end
	local la_tong, _ = GetCityOwner(CITYIDX_LINAN)		-- 临安占城帮会
	local bj_tong, _ = GetCityOwner(CITYIDX_BIANJING)	-- 汴京占城帮会
	local my_tong = GetTong()
	if (my_tong == la_tong or my_tong == bj_tong) then
		local pos = NW_GetDuty()
		local skill = 0
		if (pos == NWPOSITION_MARSHAL) then
			-- 兵马大元帅技能
			skill = SKILLID_SKILL_MARSHAL
		elseif (pos == NWPOSITION_PIONEER) then
			-- 先锋官技能
			skill = SKILLID_SKILL_PIONEER
		else
			return
		end
		if (flag == 1) then
			-- 进入地图
			AddSkillState(skill, 1, 0, 99999999)
		else
			-- 离开地图
			RemoveSkillState(skill)
		end
	end
end
