Include("\\script\\nationalwar\\head.lua")
Include("\\script\\global\\login_head.lua")

-- 玩家登录函数
function nationalwar_login()
	-- 发送首都占城帮会信息
	SyncCitySummary(CITYIDX_BIANJING, CITYIDX_LINAN)
	if (NW_IsEmperor() == 1) then
		-- 天子光环、技能
		AddSkillState(SKILLID_STATE_EMPEROR, 1, 0, 99999999)
		AddSkillState(SKILLID_SKILL_EMPEROR, 1, 0, 99999999)
	else
		local la_tong, _ = GetCityOwner(CITYIDX_LINAN)		-- 临安占城帮会
		local bj_tong, _ = GetCityOwner(CITYIDX_BIANJING)	-- 汴京占城帮会
		local my_tong = GetTong()
		if (my_tong == la_tong or my_tong == bj_tong) then
			local pos = NW_GetDuty()
			if (pos == NWPOSITION_NONE) then
				return
			elseif (pos == NWPOSITION_KING) then
				-- 国主光环、技能
				AddSkillState(SKILLID_STATE_KING, 1, 0, 99999999)
				AddSkillState(SKILLID_SKILL_KING, 1, 0, 99999999)
			elseif (pos == NWPOSITION_MINISTER) then
				-- 大丞相光环、技能
				AddSkillState(SKILLID_STATE_MINISTER, 1, 0, 99999999)
				AddSkillState(SKILLID_SKILL_MINISTER, 1, 0, 99999999)
			elseif (pos == NWPOSITION_MARSHAL) then
				-- 兵马大元帅光环
				AddSkillState(SKILLID_STATE_MARSHAL, 1, 0, 99999999)
			elseif (pos == NWPOSITION_PIONEER) then
				-- 先锋官光环
				AddSkillState(SKILLID_STATE_PIONEER, 1, 0, 99999999)
			end
		end
	end
end

login_add(nationalwar_login, 1)
