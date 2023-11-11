--福缘系统
--2004.8.5

TASKID_FY = 151;								--任务变量ID of 玩家福缘值
TASKID_FY_START_ONLINE_TIME = 152;				--任务变量ID of 玩家最后一次开始积攒福缘时的在线时间（秒），-1表示福缘积攒已被暂停
TASKID_FY_ADDITIONAL_TIME = 153;				--任务变量ID of 玩家福缘被暂停前可换福缘的在线时间（秒）
TASKID_GAIN_LAST_DATE = 154;					--任务变量ID of 玩家最后一次领取福缘日期
TASKID_GAIN_TIMES_IN_DAY = 155;					--任务变量ID of 玩家最后一次领取福缘当天领取福缘的次数

TIME_UNIT = 3600;								--基本时间单位（1小时）
TIME_PER_FUYUAN = TIME_UNIT;					--1点福缘换取所需时间 （1小时）
TIME_FUYUAN_THRESHOLD1 = 2 * TIME_UNIT;			--福缘换取所需基准时间 （2小时）
TIME_FUYUAN_THRESHOLD2 = 4 * TIME_UNIT;			--福缘衰减开始时间 （4小时）
FUYUAN_EXTRA = 2;								--奖励的福缘点
TIMES_IN_DAY_EXTRA = 2;							--获取奖励所需一天领取福缘的次数

FUYUAN_MAX_GAIN = 100;							--一次最多可换取多少点福缘


--启动福缘积攒
function FuYuan_Start()
	--未充卡
	if( IsCharged() ~= 1 ) then
		return 0;
	end
	SetTask( TASKID_FY_START_ONLINE_TIME, GetGameTime() );
	SetTask( TASKID_FY_ADDITIONAL_TIME, 0 );
	SetTask( TASKID_GAIN_LAST_DATE, date("%Y%m%d") );
	SetTask( TASKID_GAIN_TIMES_IN_DAY, 0 );	
end

--暂停福缘积攒
function FuYuan_Pause()
	if( IsFuYuanAvailable() ~= 1 ) then
		return 0;
	end
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	local nFYAdditionalTime = GetTask( TASKID_FY_ADDITIONAL_TIME );
	if( IsFuYuanPaused() ~= 1 ) then
		if (nFYAdditionalTime < 0) then
			nFYAdditionalTime = 0
		end		
		local nFYDiffer = GetGameTime() - nFYStartOnlineTime;
		if (nFYDiffer < 0) then
			nFYDiffer = 0
		end				
		local nFYTotalTime = nFYDiffer + nFYAdditionalTime;		
		SetTask( TASKID_FY_ADDITIONAL_TIME, nFYTotalTime );
		SetTask( TASKID_FY_START_ONLINE_TIME, -1 );
	end
end

--继续福缘积攒
function FuYuan_Resume()
	if( IsFuYuanAvailable() ~= 1 or IsFuYuanPaused() ~= 1 ) then
		return 0;
	end
	SetTask( TASKID_FY_START_ONLINE_TIME, GetGameTime() );
end

--在线时间换取福缘 ( 返回值 1:正常领取, 0:在线时间不够领取福缘, -1:未充卡或福缘积攒尚未启动 )
function FuYuan_Gain()
	if( IsFuYuanAvailable() ~= 1 ) then
		return -1;
	end
	
	local nFuYuanGained = 0;			--获取的福缘点;
	local nFYStartOnlineTime;
	local nFYTotalTime, nFYValidTime = FuYuan_GetDepositTime();
	local nCurrentOnlineTime = GetGameTime();
	local nFYGainLastDate = GetTask( TASKID_GAIN_LAST_DATE );
	local nFYGainTimesInDay = GetTask( TASKID_GAIN_TIMES_IN_DAY )
	
	--在线时间不够领取福缘
	if( nFYValidTime < TIME_FUYUAN_THRESHOLD1 ) then
		return 0;
	end
		
	nFuYuanGained = floor( nFYValidTime / TIME_PER_FUYUAN );
	nFYGainTimesInDay = nFYGainTimesInDay + 1;
	nFYStartOnlineTime = nCurrentOnlineTime - mod( nFYValidTime, TIME_UNIT );
	
	--一天内领取足够次福缘,额外再奖励福缘
	if( tonumber(date("%Y%m%d")) == nFYGainLastDate ) then
		if( nFYGainTimesInDay == TIMES_IN_DAY_EXTRA ) then
			nFuYuanGained = nFuYuanGained + FUYUAN_EXTRA;
		end
	else
		nFYGainLastDate = date("%Y%m%d");
		nFYGainTimesInDay = 1;
	end
	
	if( nFuYuanGained >= FUYUAN_MAX_GAIN ) then
		FuYuan_Add( FUYUAN_MAX_GAIN );
		WriteLog( "["..date("%Y-%m-%d %X").."] "..GetAccount().."("..GetName()..") get over "..FUYUAN_MAX_GAIN.." FUYUAN. (Current OnlineTime: "..GetGameTime().." sec)" );
	else
		FuYuan_Add( nFuYuanGained );
	end
	SetTask( TASKID_FY_START_ONLINE_TIME, nFYStartOnlineTime );
	SetTask( TASKID_FY_ADDITIONAL_TIME, 0 );
	SetTask( TASKID_GAIN_LAST_DATE, nFYGainLastDate );
	SetTask( TASKID_GAIN_TIMES_IN_DAY, nFYGainTimesInDay );
	return 1;
end

--获得玩家当前可换取福缘的累积在线时间（秒） （2个返回值，分别为换取福缘的所有时间和有效时间）
function FuYuan_GetDepositTime()
	if( IsFuYuanAvailable() ~= 1 ) then
		return 0, 0;
	end
	local nCurrentOnlineTime = GetGameTime();
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	local nFYAdditionalTime = GetTask( TASKID_FY_ADDITIONAL_TIME );
	local nFYTotalTime;
	local nFYValidTime;
	--福缘积攒已被暂停
	if( IsFuYuanPaused() == 1 ) then
		if( GetTeamSize() > 1 ) then
			return 0, 0;		--组队状态下不能继续福缘积攒，防止出现本人在挂机，队友代领福缘的异常出现时将本人暂停状态破坏
		else
			nFYStartOnlineTime = nCurrentOnlineTime;	--只能换取暂停之前积攒的在线时间
			FuYuan_Resume();	--继续福缘积攒,防止福缘Pause而未Resume就领取福缘的异常情况下导致的福缘积攒死锁
		end
	end
		
	if (nFYAdditionalTime < 0) then
		nFYAdditionalTime = 0;
		SetTask(TASKID_FY_ADDITIONAL_TIME, 0);
	end
	
	if ((nCurrentOnlineTime - nFYStartOnlineTime) < 0) then
		SetTask(TASKID_FY_START_ONLINE_TIME, nCurrentOnlineTime);				
		nFYStartOnlineTime = nCurrentOnlineTime;
	end
	
	nFYTotalTime = ( nCurrentOnlineTime - nFYStartOnlineTime ) + nFYAdditionalTime;	
			
	if( nFYTotalTime <= TIME_FUYUAN_THRESHOLD2 ) then
		nFYValidTime = nFYTotalTime;
	else
		local nHour = floor( nFYTotalTime / TIME_UNIT );
		nFYValidTime = ( nHour - floor( ( nFYTotalTime - TIME_FUYUAN_THRESHOLD2 ) / ( 2 * TIME_UNIT ) ) ) * TIME_UNIT + mod( nFYTotalTime, TIME_PER_FUYUAN );
	end
	return nFYTotalTime, nFYValidTime;
end

--获得玩家的福缘值
function FuYuan_Get()
	return GetTask( TASKID_FY );
end

--设置玩家的福缘值
function FuYuan_Set( value )
	if( IsFuYuanAvailable() ~= 1 ) then
		return 0;
	end
	SetTask( TASKID_FY, value );
	SyncTaskValue( TASKID_FY );
	return 1;
end

--增加玩家的福缘值
function FuYuan_Add( value )
	local nResult = FuYuan_Set( FuYuan_Get() + value );
	if(  nResult == 1 ) then
		Msg2Player( "<#> B筺 nh薾 頲 "..value.."<#> 甶觤 ph骳 duy猲" );
	end
	return nResult;
end

--减少玩家的福缘值
function FuYuan_Reduce( value )
	local nResult = FuYuan_Set( FuYuan_Get() - value );
	if(  nResult == 1 ) then
		Msg2Player( "<#> B筺  t鑞"..value.."<#> 甶觤 ph骳 duy猲" );
	end
	return nResult;
end

--判断玩家是否充过卡
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end

--判断玩家是否已经启动福缘积攒
function IsFuYuanStarted()
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	if( nFYStartOnlineTime == 0 ) then
		return 0;
	else
		return 1;
	end
end

--判断玩家可否进行福缘操作
function IsFuYuanAvailable()
	--未充卡或未启动福缘积攒
	if( IsCharged() ~= 1 or IsFuYuanStarted() ~= 1 ) then
		return 0;
	else
		return 1;
	end
end

--判断玩家福缘积攒是否已被暂停
function IsFuYuanPaused()
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	if( nFYStartOnlineTime < 0 ) then
		return 1;
	else
		return 0;
	end
end
