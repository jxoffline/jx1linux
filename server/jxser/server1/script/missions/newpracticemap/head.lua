tbNewPracticeMap = {};

tbNewPracticeMap.bDeBug			= 0;					-- DeBug模式
tbNewPracticeMap.interval		= 18 * 60;				-- Timer间隔 (1分钟)
tbNewPracticeMap.timerId		= 114;					-- TimerID
tbNewPracticeMap.TimeLeft_A		= 2662;					-- 任务变量:A型地图剩余时间
tbNewPracticeMap.TimeLeft_B		= 2663;					-- 任务变量:B型地图剩余时间
tbNewPracticeMap.MapId_A		= {917,918,919,920};	-- A型地图ID
tbNewPracticeMap.MapId_B		= {921,922,923,924};	-- B型地图ID
tbNewPracticeMap.WarningTime	= 3;					-- 提示时间 (剩余时间小于3分钟进行提示)

function tbNewPracticeMap:checkMapId()	
	
	local nSubWorldID = SubWorldIdx2ID();
	
	for i = 1, getn(self.MapId_A) do
		if(nSubWorldID == self.MapId_A[i]) then 
			return 1;
		end
	end
	
	for i = 1, getn(self.MapId_B) do
		if(nSubWorldID == self.MapId_B[i]) then 
			return 2; 
		end
	end	
	
	return 0;	
end