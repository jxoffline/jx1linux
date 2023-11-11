--应用Relay的战队系统设计的，全服务器组，共享的新的任务变量功能。
--该任务变量的特点是：
--1、全服务器可以同时访问与修改
--2、即使重启后加载游戏后仍然有效
--缺陷是：如果同时多台服务器修改该值时可能会出现问题，所以请尽量使用Append的方式，即递增或递减模式。
--如果Relay当机或没响应时，会出现异常情况。
--所以本功能一般应用于对数值准确性不是很高或者可以接受有误差现象的功能。
--Designed By Romandou 2005.11.14

IncludeLib("LEAGUE")
RELAYTASK_LEAGUEID = 500

function gb_GetTask(szModuleName, nTaskID)
	local lid = LG_GetLeagueObj(RELAYTASK_LEAGUEID, szModuleName) ;
	if (lid == 0 or lid == nil) then
		return 0
	end
	return LG_GetLeagueTask(lid,nTaskID)
end

function gb_SetTask(szModuleName, nTaskID, nValue)
	local lid = LG_GetLeagueObj(RELAYTASK_LEAGUEID, szModuleName) ;
	if (lid == 0 or lid == nil) then
		print("lid = nil")
		lid = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()
		LG_SetLeagueInfo(lid, RELAYTASK_LEAGUEID, szModuleName)
		LGM_SetMemberInfo(memberObj, szModuleName, 0, RELAYTASK_LEAGUEID, szModuleName)
		LG_AddMemberToObj(lid, memberObj)
		LG_ApplyAddLeague(lid,"\\script\\lib\\gb_taskfuncs.lua", "OnCreateModule")
		LG_FreeLeagueObj(lid)
	end
	
	LG_ApplySetLeagueTask(RELAYTASK_LEAGUEID, szModuleName, nTaskID, nValue)
end

function OnCreateModule(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		WriteLog("gb_Task Build Fail: "..szLeagueName.."szMember"..szMemberName)
		print("gb_Task Build Fail: "..szLeagueName.."szMember"..szMemberName)
	end
	print("gb_Task Build Success: "..szLeagueName.."szMember"..szMemberName)
end

function gb_AppendTask(szModuleName, nTaskID, nAppendValue)
	local lid = LG_GetLeagueObj(RELAYTASK_LEAGUEID, szModuleName) ;
	if (lid == 0 or lid == nil) then
		print("append nil")
		lid = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()
		LG_SetLeagueInfo(lid , RELAYTASK_LEAGUEID, szModuleName)
		LGM_SetMemberInfo(memberObj, szModuleName, 0, RELAYTASK_LEAGUEID, szModuleName)
		LG_AddMemberToObj(lid , memberObj)
		LG_ApplyAddLeague(lid ,"\\script\\lib\\gb_taskfuncs.lua", "OnCreateModule")
		LG_FreeLeagueObj(lid)
	end
	LG_ApplyAppendLeagueTask(RELAYTASK_LEAGUEID, szModuleName, nTaskID, nAppendValue)
end
