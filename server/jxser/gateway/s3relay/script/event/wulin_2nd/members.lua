Include("\\script\\event\\wulin_2nd\\head.lua")

function wulin_register(szParam)
	--拆分传入参数
	OutputMsg(szParam)
	local aryParam = split(szParam, " ")
	local rolename = aryParam[1]		--角色名
	local roleaccount = aryParam[2]	--帐号
	local rolelevel = tonumber(aryParam[3])		--等级
	local rolefaction = tonumber(aryParam[4])	--门派
	local n_gtype = tonumber(aryParam[5])	--入围组别
	
	local n_lid = LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename)
	if (not FALSE(n_lid)) then
		return	--这个名字已经注册过了！！为什么还能执行到？
	end
	wulin_creatNewmember(WULIN_LGTYPE_REGISTER, rolename, roleaccount)

		LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_FACTION, rolefaction)
		LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_LEVEL, rolelevel)
		gb_AppendTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT, 1)
	--报名成功，记录在案
	local logfilename = WULIN_FILE_MEMBERS_REGISTER
	WriteStringToFile(logfilename, rolename.."\t"..roleaccount.."\t"..tostring(rolelevel).."\t"..tostring(rolefaction).."\t"..tostring(n_gtype).."\n")

	--给予提示
	local szMsg = "<color=gold>武林大会官员<color>：您的姓名已确认。恭喜您成为第二届武林大会选手。"
	GlobalExecute(format("dw wulin_gm_say([[%s]], [[%s]])", rolename, szMsg))	--！！！用descript界面
end
