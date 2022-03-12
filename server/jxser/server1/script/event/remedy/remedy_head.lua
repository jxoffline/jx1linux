
-- ====================== 文件信息 ======================

-- 剑侠情缘online 补偿类活动的头文件
-- Edited by peres
-- 2006/03/17 PM 15:42

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 面向对象类的支持
Include ("\\script\\lib\\mem.lua");

CRemedy = {

	_nServer     = 0,  -- 补偿的指定区服，如果为 0 则所有区服通用
	_nStartDate  = 0,  -- 补偿开始的日期
	_nEndDate    = 0,  -- 补偿结束的日期
	_nTaskID     = 0,  -- 所占用的任务变量
	_nTimes		 = 0,  -- 每人所能领取的最多次数
	_nLevel      = 0,  -- 领取的等级限制，0 为任意等级
	_szRemedyName = "", -- 补偿活动的名称
	
	-- 构造函数，区服，开始日期，结束日期，所占用的任务变量，补偿活动的名字（可为空）
	__new = function(self, arg)
		self._nServer = arg[1];
		self._nStartDate = arg[2];
		self._nEndDate = arg[3];
		self._nTaskID = arg[4];
		self._nLevel = arg[5];
		self._szRemedyName = arg[6];
	end,
	
	checkPay = function(self)
		
		local bServer, bDate, bTask, bLevel = 0,0,0,0;  -- 需要满足这四个条件才能通过
		
		local nNowServer = GetGateWayClientID();
		
		local nNowDate   = tonumber(GetLocalDate("%y%m%d"));
		
		-- 分别获取开始和结束的年/月/日
		local nStartYear   = tonumber(strsub(tostring(self._nStartDate),1,1));
		local nStartMonth  = tonumber(strsub(tostring(self._nStartDate),2,3));
		local nStartDay    = tonumber(strsub(tostring(self._nStartDate),4,5));
		
		local nEndYear     = tonumber(strsub(tostring(self._nEndDate),1,1));
		local nEndMonth    = tonumber(strsub(tostring(self._nEndDate),2,3));
		local nEndDay      = tonumber(strsub(tostring(self._nEndDate),4,5));
		
		local nNowTimes  = GetTask(self._nTaskID);
		
		local aryErrorMsg = {"<enter>"};
		
			-- 检测区服名是否相同
			if self._nServer~=0 then
				if self._nServer==nNowServer then 
					bServer = 1; 
				else
					bServer = 0;
					tinsert(aryErrorMsg, "本次补偿活动不属于本区服。<enter>");
				end;
			else
				bServer = 1;
			end;
			
			-- 检测日期是否在范围内
			if nNowDate>=self._nStartDate and nNowDate<=self._nEndDate then
				bDate = 1;
			else
				bDate = 0;
				tinsert(aryErrorMsg, "已经超出领取的日期范围，领取的日期自：<color=yellow>"..nStartYear.."年"..nStartMonth.."月"..nStartDay.."日<color>开始到：<color=yellow>"..
									 nEndYear.."年"..nEndMonth.."月"..nEndDay.."日<color>截止。<enter>");
			end;
			
			if GetLevel()>=self._nLevel then
				bLevel = 1;
			else
				bLevel = 0;
				tinsert(aryErrorMsg, "没有达到领取补偿的等级，人物等级必须大于 <color=yellow>"..self._nLevel.." 级<color><enter>。");
			end;
			
			-- 检测领取的次数是否已经达到
			if nNowTimes<1 then
				bTask = 1;
			else
				bTask = 0;
				tinsert(aryErrorMsg, "已经达到每人可以领取的次数限制。<enter>");
			end;
			
			-- 全部条件都符合才通过，如果不通过，则返回失败的字符数组
			if bServer==1 and bDate==1 and bTask==1 and bLevel==1 then
				return 1;
			else
				return aryErrorMsg;
			end;
	end,
	
	-- 赔偿给玩家的主函数
	payForPlayer = function(self)
		
		local nResult = self:checkPay();
		
		if nResult==1 then
			-- 先写数据再发补偿，以免出现刷的情况
			self:writeData();
			self:payProcess();
			return 1;
		else
			return nResult;
		end;
	end,
	
	-- 赔偿给玩家主过程，可继承
	payProcess = function(self)
		return 1;
	end,
	
	-- 写入数据的过程，可继承
	writeData = function(self)
		SetTask(self._nTaskID, GetTask(self._nTaskID) + 1);
		
		if self._szRemedyName~=nil then
			WriteLog("["..self._szRemedyName.."]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]：".."执行了一次领取操作。");
		end;
		
		return 1;
	end,
}
