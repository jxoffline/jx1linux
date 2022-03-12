Include("\\script\\bonusvlmc\\head.lua");

function Is_VLMC() -- check account cã ph¶i lµ acc vlmc
	if(GetAccount() == VLMC_ID) then
		return 1
	else
		return 0
	end
end

function TimeActive() -- check den gio active su kien
		local nHour = tonumber(date("%H%M"))
		if (nHour >= nMinTimeActive and nHour <= nMaxTimeActive) then
			return 1
		else
			return 0
		end	
end

function ResetTaskGiveQuest()
	local taskTemp = GetTask(TSK_DailyGiveQuest)
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	if (taskTemp ~= nCurrDate) then
		SetTask(TSK_DailyGiveQuest, nCurrDate)
		SetTask(TSK_Active_TK, 0)
		SetTask(TSK_Active_x2EXP, 0)
		SetTask(TSK_GetBonusEXP, 0)
		SetTask(TSK_Get2ExpTK, 0)
		SetTask(VLMC_Task_IsQuest, 0)
		SetTask(VLMC_Task_IsFinishQuest, 0)
	end
end