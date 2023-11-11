--====Task Value====--
TASK_AWARD_WEEK	= 3011
nStartDate = 	20130624
nEndDate = 20130929

function IsActive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nDate < nStartDate or nDate > nEndDate) then
		return 0
	end
	return 1
end

function CheckCondition()	
	local nTranLife = ST_GetTransLifeCount()	
	if (nTranLife >= 4  and GetLevel() >= 191) or nTranLife > 4  then
		return 1
	end
	return 0
end

function CheckTaskWeekly()	
	local CurWeek = tonumber(GetLocalDate("%Y%W")) 
	CurValue = GetTask(TASK_AWARD_WEEK)
	if (CurWeek <= CurValue ) then
		return 0
	end	
	return 1
end




