Include("\\script\\event\\qingren_jieri\\200902\\head.lua");

-- 是否处于活动时间
function valentine2009_isCarryon()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (VALENTINE2009_START <= nDate and nDate <= VALENTINE2009_END) then
		return 1;
	else
		return 0;
	end
end

-- 重设版本变量
function valentine2009_resetEdition()
	
	if tonumber(GetTask(VALENTINE2009_EDITION)) ~= VALENTINE2009_START then
		SetTask(VALENTINE2009_EDITION, VALENTINE2009_START);
		SetTask(VALENTINE2009_DATE, 0);
		SetTask(VALENTINE2009_DRAW_NUM, 0);
		SetTask(VALENTINE2009_USE_NUM, 0);
		SetTask(VALENTINE2009_EXPERIENCE, 0);
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if tonumber(GetTask(VALENTINE2009_DATE)) ~= nDate then
		SetTask(VALENTINE2009_DATE, nDate);
		SetTask(VALENTINE2009_DRAW_NUM, 0);
		SetTask(VALENTINE2009_USE_NUM, 0);
	end
	
end

-- 取消
function valentine2009_OnCancel()
	
end

-- 给出错误信息
function valentine2009_giveErrorMsg(szMsg)
	Say(szMsg, 1, VALENTINE2009_TALK_ERROR_ANSWER.."/valentine2009_OnCancel");
end
	
-- 主函数
function valentine2009_main(nItemIndex, szDescLink)
	
	valentine2009_resetEdition();
	szDescLink = szDescLink or "<npc>"
	nItemIndex = nItemIndex or -1
	
	local btns =
	{
		"<dec>"..szDescLink..VALENTINE2009_TALK_MAIN[1],	
		VALENTINE2009_TALK_MAIN[2]..format("/#valentine2009_OnDraw(0,%d)", nItemIndex),
		VALENTINE2009_TALK_MAIN[3]..format("/#valentine2009_OnDraw(1,%d)", nItemIndex),
		VALENTINE2009_TALK_MAIN[4].."/valentine2009_OnCancel",
	}
	CreateTaskSay(btns);
end

-- 领取
function valentine2009_OnDraw(nSex, nItemIndex)
	
	-- 性别不符合
	if GetSex()~= nSex then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_SEX);
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
	
	-- 超过当日领取总数
	local nDrawNum = GetTask(VALENTINE2009_DRAW_NUM);
	if (nDrawNum >= VALENTINE2009_MAX_DRAW_NUM) then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_MAXNUM);
		return
	end
	
	-- 不在活动日期
	if valentine2009_isCarryon() ~= 1 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_DATE);
		return
	end

	-- 不在活动时间
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	if (nTime < VALENTINE2009_START_TIME or VALENTINE2009_END_TIME < nTime) then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_TIME);
		return
	end
	
	-- 发放
	local tb_Draw_Goods = nil
	nItemIndex = nItemIndex or -1
	
	if nSex == 0 then	-- 男生 领取情人种子
		tb_Draw_Goods = 
		{
			{
			{szName=VALENTINE2009_TALK_GOODS[1], tbProp=VALENTINE2009_ITEM_ZHONGZI, nExpiredTime = VALENTINE2009_ITEM_END},
			}
		}
	elseif nSex == 1 then	-- 女生 领取天仙水
		tb_Draw_Goods = 
		{
			{
			{szName=VALENTINE2009_TALK_GOODS[2], tbProp=VALENTINE2009_ITEM_TIANXIAN, nExpiredTime = VALENTINE2009_ITEM_END},
			}
		}
	end
	
	if nItemIndex > 0 and tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 
		end
	end
	
	tbAwardTemplet:GiveAwardByList(tb_Draw_Goods, "2009 valentine give reward");
	SetTask(VALENTINE2009_DRAW_NUM, nDrawNum + 1);
	
	if nItemIndex > 0 and  tbItemJingnianshijian then
		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	end
	
end
