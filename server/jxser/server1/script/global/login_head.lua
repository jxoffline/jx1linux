TB_LOGIN_FUN = {}	--用这个数组来记录所有要加载的Login函数

--添加一个Login（或延时同步）时要加载的函数
--传入参数：
--	fun		要增加的function
--	n_time	何时运行，0、Login时；1、第一次延时同步时；2、第二次延时同步时；……
function login_add(fun, n_time)
	if (not fun) then
		return
	end
	if (not n_time) then
		n_time = 0
	end
	local tb = TB_LOGIN_FUN[n_time]
	if (not tb) then
		TB_LOGIN_FUN[n_time] = {fun}
	else
		local count = getn(tb)
		for i = 1, count do
			if (tb[i] == fun) then
				return
			end
		end
		tb[count + 1] = fun
	end
end

TB_LOGIN_FILEFUN = {
	{"\\script\\missions\\sevencity\\loginout.lua", "login"},				-- 七城大战
	{"\\script\\global\\jingli.lua", 				"WorldEntranceLogin"},	-- 精力系统
}



function IsLoginFileFunction(script, func)
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local tb = TB_LOGIN_FILEFUN[i]
		if (tb[1] == script and tb[2] == func) then
			return 1
		end
	end
	return 0
end

function AddLoginFileFunction(script, func)
	local tb = {}
	tinsert(tb, script)
	tinsert(tb, func)
	tinsert(TB_LOGIN_FILEFUN, tb)
end
