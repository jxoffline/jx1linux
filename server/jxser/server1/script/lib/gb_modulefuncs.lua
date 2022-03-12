--应用Relay的战队系统设计的，全服务器组,共享的功能开关状态读取。
--该功能的特点是：
--1、全服务器可以同时访问与修改
--2、即使重启后加载游戏后仍然有效
--缺陷是：如果同时多台服务器修改该值时可能会出现问题，所以请尽量使用Append的方式，即递增或递减模式。
--如果Relay当机或没响应时，会出现异常情况。
--所以本功能一般应用于对数值准确性不是很高或者可以接受有误差现象的功能。
--Designed By Romandou 2006.1.21
IncludeLib("LEAGUE")
RELAYTASK_GAMEMODULE = 502 --存放各种开关的战队ID
RELAYTASK_MODULETASK = 1 -- 存放游戏功能开关状态的任务变量ID
--一个功能的状态有三种，0（未开启UnUsed），1（开启Started），2（关闭 Stopped）
------------------------------------------------------------------------------------------------------------------------------------------------------
function gb_GetModule(szModuleName)
	local lid = LG_GetLeagueObj(RELAYTASK_GAMEMODULE, szModuleName) ;
	if (lid == 0 or lid == nil) then
		return 0
	end
	return LG_GetLeagueTask(lid, RELAYTASK_MODULETASK)
end

function gb_StopModule(szModuleName)
	OutputMsg("Game Module Is Stopped. -->"..szModuleName)
	gb_SetModule(szModuleName, 2)
end

function gb_StartModule(szModuleName)
	OutputMsg("Game Module Is Started. -->"..szModuleName)
	gb_SetModule(szModuleName, 1)
end

function OutputMsg(szMsg)
	WriteLog(szMsg)
	print(szMsg)
end

function gb_AutoStartModule(szModuleName)
	if (szModuleName == "") then
		return 
	end
	
	local nState = gb_GetModule(szModuleName)
	if (nState == 0) then
		gb_StartModule(szModuleName)
		OutputMsg("New Game Module Is Started. -->"..szModuleName)
	elseif(nState == 1) then
		OutputMsg("Game Module Is Started. -->"..szModuleName)
	else
		OutputMsg("Game Module Is Stopped. -->"..szModuleName)
	end
	
end

function _gb_SetModule(szModuleName, nTaskID, nValue)
	local lid = LG_GetLeagueObj(RELAYTASK_GAMEMODULE, szModuleName) ;
	if (lid == 0 or lid == nil) then
		lid = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()
		LG_SetLeagueInfo(lid, RELAYTASK_GAMEMODULE, szModuleName)
		LGM_SetMemberInfo(memberObj, szModuleName, 0, RELAYTASK_GAMEMODULE, szModuleName)
		LG_AddMemberToObj(lid, memberObj)
		LG_ApplyAddLeague(lid)
		LG_FreeLeagueObj(lid)
	end
	LG_ApplySetLeagueTask(RELAYTASK_GAMEMODULE, szModuleName, nTaskID, nValue)
end

function gb_SetModule(szModuleName,nValue)
	_gb_SetModule(szModuleName,RELAYTASK_MODULETASK, nValue)
end
