
--任务变量命名和剑世一样
--TSK_ 任务变量前缀 TASK
--TSKG_ 任务变量组前缀 TASK GROUP
--为避免变量名冲突，使用文件路径号shendan0811_前缀 \shengdan_jieri\200811\

local nACT_VERSION = 20090116 --局部变量，不会命名冲突，外部文件不可读

--------------以下为幸运红包活动所需TASK变量ID
newyear0901_TSK_Version			= 1760;		-- 版本号
newyear0901_TSK_GetExp_Hongbao	= 1761;		-- 使用发财红包和旺盛红包获得的经验（单位为万）
newyear0901_TSK_GetExp_Wuguo	= 1762;		-- 使用新年5果获得的经验（单位为万）
newyear0901_TSK_GetExpUpLimit	= 1763;		-- 获得的经验上限（单位为万）
newyear0901_TSK_GetYanhuaDate	= 1764;		-- 今天是否已经领过新年烟花
newyear0901_TSK_GetExp_Yanhua	= 1765;		-- 使用新年烟花获得的经验（单位为万）
newyear0901_TSK_GetSpAwardDate	= 1766;		-- 是否已经领取过当日的特别奖励（新年演化活动）

function newyear0901_ResetTask()
	--只在活动结束前需要把变量重置，避免有新活动与之冲突
	--，为了保险定为2月1日，应该是活动一切事件包括道具使用等的最后最后的一天
	if tonumber(GetLocalDate("%Y%m%d")) <= 20090224 then
		if (GetTask(newyear0901_TSK_Version) ~= %nACT_VERSION) then
			SetTask(newyear0901_TSK_Version, %nACT_VERSION);
			SetTask(newyear0901_TSK_GetExpUpLimit, 150000);
			SetTask(newyear0901_TSK_GetExp_Hongbao, 0);
			SetTask(newyear0901_TSK_GetExp_Wuguo, 0);
			SetTask(newyear0901_TSK_GetExp_Yanhua, 0);
		end
	end
end
