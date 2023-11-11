
--任务变量命名和剑世一样
--TSK_ 任务变量前缀 TASK
--TSKG_ 任务变量组前缀 TASK GROUP
--为避免变量名冲突，使用文件路径号shendan0811_前缀 \shengdan_jieri\200811\

local nACT_VERSION = 20081205 --局部变量，不会命名冲突，外部文件不可读

shengdan0811_TSK_Version		= 1909;
shengdan0811_TSK_BingJing		= 1863;
shengdan0811_TSK_GetExp			= 1864;
shengdan0811_TSK_YuPei			= 1866;

------------↓ 以下为新boss，小盗贼活动所需变量id
shengdan0811_TSK_GetNewBossAwardState = 1911  --得到(新boss的）奖励情况
shengdan0811_TSK_UseCakeState = 1912  --使用雪花蛋糕的情况
shengdan0811_TSK_UseCakeExp = 1913 --使用雪花蛋糕的状态
-------------↑ 以上为新boss，小盗贼活动所需变量id


function shengdan0811_ResetTask()
	--只在活动结束前需要把变量重置，避免有新活动与之冲突
	--，为了保险定为2月1日，应该是活动一切事件包括道具使用等的最后最后的一天
	if tonumber(GetLocalDate("%Y%m%d")) <= 20090201 then
		if (GetTask(shengdan0811_TSK_Version) ~= %nACT_VERSION) then
			SetTask(shengdan0811_TSK_Version, %nACT_VERSION);
			SetTask(shengdan0811_TSK_BingJing, 150000);
			SetTask(shengdan0811_TSK_GetExp, 0);
			SetTask(shengdan0811_TSK_YuPei, 0);
			
			SetTask(shengdan0811_TSK_GetNewBossAwardState, 0);
			SetTask(shengdan0811_TSK_UseCakeState, 0);
			SetTask(shengdan0811_TSK_UseCakeExp, 0);
		end
	end
end
