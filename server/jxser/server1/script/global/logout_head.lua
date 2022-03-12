TB_LOGOUT_FILEFUN = {
	{"\\script\\missions\\sevencity\\loginout.lua", "logout"},				-- 七城大战
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogout"},	-- 精力系统
	{"\\script\\global\\offlineaward.lua",			"logout"},				-- 线下领奖
}

-- 跨服事件处理函数，注意不能修改玩家数据因为修改的玩家数据不会被保存！！！
TB_EXCHANGE_FILEFUN = {
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogout"},	-- 精力系统
	{"\\script\\global\\offlineaward.lua",			"logout"},				-- 线下领奖
}

function IsLogoutFileFunction(script, func)
	for i = 1, getn(TB_LOGOUT_FILEFUN) do
		local tb = TB_LOGOUT_FILEFUN[i]
		if (tb[1] == script and tb[2] == func) then
			return 1
		end
	end
	return 0
end

function AddLogoutFileFunction(script, func)
	local tb = {}
	tinsert(tb, script)
	tinsert(tb, func)
	tinsert(TB_LOGOUT_FILEFUN, tb)
end

function IsExchangeFileFunction(script, func)
	for i = 1, getn(TB_EXCHANGE_FILEFUN) do
		local tb = TB_EXCHANGE_FILEFUN[i]
		if (tb[1] == script and tb[2] == func) then
			return 1
		end
	end
	return 0
end

function AddExchangeFileFunction(script, func)
	local tb = {}
	tinsert(tb, script)
	tinsert(tb, func)
	tinsert(TB_EXCHANGE_FILEFUN, tb)
end
