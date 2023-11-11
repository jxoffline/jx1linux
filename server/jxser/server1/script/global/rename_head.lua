TONGNAMERES_SUCCESS = 0			-- 成功
TONGNAMERES_FAILURE = 1			-- 失败
TONGNAMERES_INVALID = 2			-- 帮会名非法
TONGNAMERES_FREE	= 3			-- 帮会名可以使用
TONGNAMERES_USED	= 4			-- 帮会名已经被使用
TONGNAMERES_APPLY	= 5			-- 帮会名已经申请

TASKVALUE_BLEND 	= 2320		-- 并服任务变量号

function cancel()
end

-- 检查是否可以修改角色名
function check_renamerole()
	if (GetBit(GetTask(TASKVALUE_BLEND), 1) == 1) then
		return 1;
	end
	return 0;
end

-- 检查是否可以修改帮会名
function check_renametong()
	local value = GetTask(TASKVALUE_BLEND)
	if (GetBit(value, 2) == 1) then
		return 1;
	end
	return 0;
end

--  检查是否可以领取原城主补偿
function check_castellan_remedy()
	local value = GetTask(TASKVALUE_BLEND)
	if (GetBit(value, 3) == 1) then
		return 1;
	end
	return 0;
end
