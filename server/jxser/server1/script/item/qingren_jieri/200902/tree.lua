Include("\\script\\event\\qingren_jieri\\200902\\event.lua");

function main()
	
	valentine2009_resetEdition();
	
	local nNpcIdx = GetLastDiagNpc();
	local nWater = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_HAS_WATER);
	local nStep  = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_STEP);
	
	-- 浇水
	if nStep == VALENTINE2009_NPC_STEP_WATER_START and nWater == 0 and valentine2009_isTheGilr(nNpcIdx) == 1 then
		valentine2009_WaterTree(nNpcIdx);
		return
	end
	
	-- 领奖
	if nStep == VALENTINE2009_NPC_STEP_D  then
		valentine2009_AcceptAward(nNpcIdx);
		return
	end
	
end

-- 定时器
function OnTimer(nNpcIdx, nTimeOut)
	
	if nTimeOut == nil or nTimeOut > 0 then
		DelNpc(nNpcIdx)
		return 0;
	end
	
	local nStep  = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_STEP);
	
	-- 形态A --> 形态B
	if nStep == VALENTINE2009_NPC_STEP_A then
		local nNewNpcIdx = valentine2009_Trans(nNpcIdx, 2);
		SetNpcTimer(nNewNpcIdx, VALENTINE2009_TIME_WATER_START - VALENTINE2009_TIME_GROW_B);
		return 
	end
	
	-- 形态B --> 开始浇水
	if nStep == VALENTINE2009_NPC_STEP_B then
		SetNpcParam(nNpcIdx, VALENTINE2009_NPC_STEP, nStep + 1);
		SetNpcTimer(nNpcIdx, VALENTINE2009_TIME_WATER_END - VALENTINE2009_TIME_WATER_START);
		AddNpcSkillState(nNpcIdx, 662,1, 1, VALENTINE2009_TIME_WATER_END - VALENTINE2009_TIME_WATER_START);	--出现任务感叹号
		return 
	end
	
	-- 开始浇水 --> 结束浇水
	if nStep == VALENTINE2009_NPC_STEP_WATER_START then
		
		AddNpcSkillState(nNpcIdx, 662,1, 1, 0);	--结束任务感叹号
		
		if GetNpcParam(nNpcIdx, VALENTINE2009_NPC_HAS_WATER) ~= 1 then
			DelNpc(nNpcIdx)
			return 0;
		end
		
		SetNpcParam(nNpcIdx, VALENTINE2009_NPC_STEP, nStep + 1);
		SetNpcTimer(nNpcIdx, VALENTINE2009_TIME_GROW_C - VALENTINE2009_TIME_WATER_END);
		return 
	end
	
	-- 结束浇水 --> 形态C
	if nStep == VALENTINE2009_NPC_STEP_WATER_END then
		local nNewNpcIdx = valentine2009_Trans(nNpcIdx, 3);
		SetNpcTimer(nNewNpcIdx, VALENTINE2009_TIME_GROW_D - VALENTINE2009_TIME_GROW_C);
		return 
	end
	
	-- 形态C --> 形态D
	if nStep == VALENTINE2009_NPC_STEP_C then
		local nNewNpcIdx = valentine2009_Trans(nNpcIdx, 4);
		SetNpcTimer(nNewNpcIdx, VALENTINE2009_TIME_DISAPPEAR - VALENTINE2009_TIME_GROW_D);
		AddNpcSkillState(nNewNpcIdx, 662,1, 1, VALENTINE2009_TIME_DISAPPEAR - VALENTINE2009_TIME_GROW_D);	--出现任务感叹号
		return 
	end
	
	-- 形态D --> 死亡
	if nStep == VALENTINE2009_NPC_STEP_D then
		AddNpcSkillState(nNpcIdx, 662,1, 1, 0);	--结束任务感叹号
		DelNpc(nNpcIdx)
		return 
	end
	
end

-- 变身
function valentine2009_Trans(nNpcIdx, nForm)
	
	local nx, ny = GetNpcPos  (nNpcIdx);
	local szname = GetNpcName (nNpcIdx);
	local nboy	 = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY);
	local nboy2  = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY2);
	local ngirl	 = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL);
	local ngirl2	 = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL2);
	local nWater = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_HAS_WATER);
	local nStep  = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_STEP) + 1;
	
	DelNpc(nNpcIdx);
	local nNewNpcIdx = AddNpc(VALENTINE2009_NPC_ID[nForm], 1, SubWorld, nx, ny, 1, szname);
	
	SetNpcParam (nNewNpcIdx, VALENTINE2009_NPC_NAME_BOY,  nboy);
	SetNpcParam (nNewNpcIdx, VALENTINE2009_NPC_NAME_BOY2,  nboy2);
	SetNpcParam (nNewNpcIdx, VALENTINE2009_NPC_NAME_GIRL, ngirl);
	SetNpcParam (nNewNpcIdx, VALENTINE2009_NPC_NAME_GIRL2, ngirl2);
	SetNpcParam (nNewNpcIdx, VALENTINE2009_NPC_HAS_WATER, nWater);
	SetNpcParam (nNewNpcIdx, VALENTINE2009_NPC_STEP,      nStep);
	SetNpcScript(nNewNpcIdx, "\\script\\item\\qingren_jieri\\200902\\tree.lua");
	
	return nNewNpcIdx;
	
end

-- 是否是原来的那个男孩
function valentine2009_isTheBoy(nNpcIdx)
	
	local nboy = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY) * 100000 + GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY2);
	
--	if (nboy < 0) then
--		nboy = nboy + 4294967296;	-- id+2^32
--	end;
	nboy = tonumber(format("%u", nboy));
	
	if nboy == String2Id(GetName()) then
		return 1;
	else
		return 0;
	end
	
end

-- 是否是原来的那个女孩
function valentine2009_isTheGilr(nNpcIdx)
	
	local ngirl = GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL) * 100000 + GetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL2);
	
--	if (ngirl < 0) then
--		ngirl = ngirl + 4294967296;	-- id+2^32
--	end;
	ngirl = tonumber(format("%u", ngirl));
	
	if ngirl == String2Id(GetName()) then
		return 1;
	else
		return 0;
	end
	
end

-- 浇水任务
function valentine2009_WaterTree(nNpcIdx)
	
	-- 身上没有水
	local nCount = CalcItemCount(3,VALENTINE2009_ITEM_TIANXIAN[1], VALENTINE2009_ITEM_TIANXIAN[2], VALENTINE2009_ITEM_TIANXIAN[3], -1);
	if nCount <= 0  then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_NOWATER);
		return 
	end	
	
	-- 等级不符合要求
	if GetLevel() < VALENTINE2009_LEVEL_LIMIT then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_LEVEL);
		return
	end
	
	-- 没有付费过
	if IsCharged() ~= 1 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_PAY);
		return 
	end
	
	-- 超过当日使用总数
	local nUseNum = GetTask(VALENTINE2009_USE_NUM);
	if (nUseNum >= VALENTINE2009_MAX_USE_NUM) then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_MAXUSE);
		return 
	end
	
	-- 不在活动日期(扣除水)
	if valentine2009_isCarryon() ~= 1 then
		ConsumeItem(3, 1, VALENTINE2009_ITEM_TIANXIAN[1], VALENTINE2009_ITEM_TIANXIAN[2], VALENTINE2009_ITEM_TIANXIAN[3], -1); 
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_ARID);
		return 
	end
	
	-- 给水（扣除水）
	bPay = ConsumeItem(3, 1, VALENTINE2009_ITEM_TIANXIAN[1], VALENTINE2009_ITEM_TIANXIAN[2], VALENTINE2009_ITEM_TIANXIAN[3], -1); 
	
	if bPay ~= 1 then
		return 
	end
	
	SetTask(VALENTINE2009_USE_NUM, nUseNum + 1);
	SetNpcParam(nNpcIdx, VALENTINE2009_NPC_HAS_WATER, 1); -- 已经浇过水
	AddNpcSkillState(nNpcIdx, 662,1, 1, 0);	--结束任务感叹号
	Msg2Player(VALENTINE2009_TALK_WATER);
end

-- 领奖
function valentine2009_AcceptAward(nNpcIdx)
	
	if valentine2009_isTheBoy(nNpcIdx) == 1 then
		SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY, 0);
		SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY2, 0);
	elseif valentine2009_isTheGilr(nNpcIdx) == 1 then
		SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL, 0);
		SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL2, 0);
	else
		return
	end
	
	local nHasExp = GetTask(VALENTINE2009_EXPERIENCE);
	if  nHasExp >= VALENTINE2009_AWARD_EXP_LIMIT then
		return
	else
		SetTask(VALENTINE2009_EXPERIENCE, nHasExp + VALENTINE2009_AWARD_EXP);
	end
	
	local tb_Draw_Goods = 
	{
		{
			{szName = VALENTINE2009_TALK_GOODS[3], tbProp=VALENTINE2009_ITEM_ROSE, nCount = VALENTINE2009_AWARD_ROSENUM, nExpiredTime = VALENTINE2009_ITEM_END},
		},
		
		{
			{nExp = VALENTINE2009_AWARD_EXP},
		}
	}
	
	tbAwardTemplet:GiveAwardByList(tb_Draw_Goods, "2009 valentine give reward");
	
end
