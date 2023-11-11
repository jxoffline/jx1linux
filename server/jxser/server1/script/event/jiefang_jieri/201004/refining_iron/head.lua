-- 炼金活动 头文件
Include("\\script\\misc\\taskmanager.lua")

tbRefiningIron = 
{
	nStartDate = 20100426,	-- 开始日期（前包）
	nCloseDate = 20100607, 	-- 结束日期（后闭）
	
	tbCity = 
	{
		[11]  = 1,
		[37]  = 1,
		[1]	  = 1,
		[176] = 1,
		[162] = 1,
		[78]  = 1,
		[80]  = 1,
	},
	
	tbUpdataRate = 
	{
		[2] = 100,
		[3] = 100,
		[4] = 90 ,
		[5] = 90 ,
		[6] = 90 ,
		[7] = 85 ,
		[8] = 85 ,
		[9] = 80 ,
	},	
	
	nTaskGroupId = 7,		-- 任务变量组
	nCurrentVersion = 1,	-- 版本号
	
	-- ID号、限制
	tbTaskLimit = 
	{
		[2] = {1, 99},
		[3] = {1, 99},
		[4] = {1, 99},
		[5] = {1, 99},
		[6] = {2, 9	},
		[7] = {3, 9	},
		[8] = {4, 9	},
		[9] = {5, 9	},		
	},
}

tbRefiningIron.tbTaskGroup = TaskManager:Create(tbRefiningIron.nTaskGroupId, tbRefiningIron.nCurrentVersion);

tbRefiningIron.tbAward = 
{
	[2] = {
			{nExp_tl = 1500000},
		  },
			  
	[3] = {
			{nExp_tl = 3000000},
		  },

	[4] = {
			{nExp_tl = 6000000},
		  },
			  
	[5] = {
			{nExp_tl = 10000000},
			{tbProp={6,1, 2293, 2,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 3,},
		  },
			  
	[6] = {
			{nExp_tl = 20000000},
			{tbProp={6,1, 2293, 2,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 3,},	
			{tbProp={6,1, 1157, 1,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 1,},			
		  },
			  
	[7] = {
			{nExp_tl = 50000000},	
			{tbProp={6,1, 2293, 3,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 3,},
			{tbProp={6,1, 438, 1,0,0},  nExpiredTime=tbRefiningIron.nCloseDate, nCount = 1,},		
		  },
			  
	[8] = {
			{nExp_tl = 120000000},	
			{tbProp={6,1, 2293, 4,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 3,},
			{tbProp={6,1, 1181, 1,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 1,},	
		  },
			  
	[9] = {
			{nExp_tl = 300000000, tbProp={6,1, 2126, 1,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 1, nRate = 30,},	
			{nExp_tl = 300000000, tbProp={6,1, 2127, 1,0,0}, nExpiredTime=tbRefiningIron.nCloseDate, nCount = 1, nRate = 3, },	
			{nExp_tl = 300000000, tbProp={6,1, 1674, 1,0,0}, nExpiredTime=43200, nCount = 1, nRate = 27,},	
			{nExp_tl = 300000000, tbProp={6,1, 1675, 1,0,0}, nExpiredTime=43200, nCount = 1, nRate = 40,},	
		  },			  			  			  			  			  			  			  
};

function tbRefiningIron:IsCarryOn()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate < self.nStartDate or nDate >= self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

function tbRefiningIron:CheckCondition()
	
	local nCurMapID = SubWorldIdx2ID(SubWorld);
	if self.tbCity[nCurMapID] == nil then
		return 0;
	end
	
	return self:IsCarryOn();
end

