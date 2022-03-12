--====  常用基础函数  ====--
if (not COMMON_HEAD) then
COMMON_HEAD = 1

--真则返回v1,否则返回v2
--等效于VB的IIf(b, v1, v2)，类似于C的 (b? v1: v2)
function iif(b, v1, v2)
	if b then
		return v1
	else
		return v2
	end
end

--将数组拆开，返回数组里面的每一项（一般不需要填写n）
function unpack(tb, n)
	if (not n) then
		n = 1
	end
	if (n >= getn(tb)) then
		return tb[n]
	end
	return tb[n], unpack(tb,n+1)
end

--将所有参数合并成一个数组
function pack(...)
	return arg
end

--将数组连接成一个字符串
function join(tb, str_sep)
	if (not str_sep) then
		str_sep = ","
	end
	local str = ""
	if (getn(tb) > 0) then
		/*
		str = tostring(tb[1])
		for i = 2, getn(tb) do
			str = str .. str_sep .. tostring(tb[i])
		end
		*/
		PushString(tb[1])
		for i = 2, getn(tb) do
			AppendString(str_sep)
			AppendString(tb[i])
		end
		str = PopString()
	end
	return str
end

--安全的转换为数字，不能转换时返回n_default或0，不会返回nil
function tonum(var, n_default)
	local n = tonumber(var)
	if (not n) then
		n = iif(n_default, n_default, 0)
	end
	return n
end

--将字符串拆分成数组形势
function split(str, str_sep)
	if (not str_sep) then
		str_sep = ","
	end
	local tb = {}
	local n_seplen = strlen(str_sep)
	local n_start = 1
	local n_at = strfind(str, str_sep, n_start)
	while n_at do
		tb[getn(tb)+1] = strsub(str, n_start, n_at - 1)
		n_start = n_at + n_seplen
		n_at = strfind(str, str_sep, n_start)
	end
	tb[getn(tb)+1] = strsub(str, n_start)
	return tb
end

--返回定长字符串（左对齐）
function strfill_left(str, n_len, str_space)
	if (not str_space) then
		str_space = " "
	end
	/*
	str = tostring(str)
	while (strlen(str) < n_len) do
		str = str..str_space
	end
	return str
	*/
	PushString(str)
	RightFillString(n_len, str_space)
	return PopString()
end

--返回定长字符串（右对齐）
function strfill_right(str, n_len, str_space)
	if (not str_space) then
		str_space = " "
	end
	/*
	str = tostring(str)
	while (strlen(str) < n_len) do
		str = str_space..str
	end
	*/
	PushString(str)
	LeftFillString(n_len, str_space)
	return PopString()
end

--返回定长字符串（居中）
function strfill_center(str, n_len, str_space)
	if (not str_space) then
		str_space = " "
	end
	/*
	str = tostring(str)
	local b_left = 1
	while (strlen(str) < n_len) do
		if b_left then
			str = str_space..str
		else
			str = str..str_space
		end
		b_left = not b_left
	end
	return str
	*/
	PushString(str)
	AroundFillString(n_len, str_space)
	return PopString()
end

--字符串中str_from替换为str_to
function replace(str, str_from, str_to)
	/*
	local n_start, n_end = strfind(str, str_from)
	local n_len = strlen(str_to)
	while (n_start) do
		str = strsub(str, 1, n_start-1)..str_to..strsub(str, n_end+1)
		n_start, n_end = strfind(str, str_from, n_start + n_len)
	end
	return str
	*/
	PushString(str)
	ReplaceString(str_from, str_to)
	return PopString()
end

--安全字符串（解析用）
function safestr(str)
	/*
	str = replace(str, "\\", "\\\\")
	str = replace(str, "'", "\\'")
	str = replace(str, '"', '\\"')
	str = replace(str, "\t", "\\t")
	str = replace(str, "\10", "\\010")
	str = replace(str, "\13", "\\013")
	str = replace(str, "\0", "\\000")
	str = replace(str, " ", "\032")
	return str
	*/
	PushString(str)
	ReplaceString("\\", "\\\\")
	ReplaceString("'", "\\'")
	ReplaceString('"', '\\"')
	ReplaceString("\t", "\\t")
	ReplaceString("\10", "\\010")
	ReplaceString("\13", "\\013")
	ReplaceString("\0", "\\000")
	ReplaceString(" ", "\032")
	return PopString()
end

--安全字符串（显示用）
function safeshow(str)
	/*
	str = replace(str, "/", "\\")
	str = replace(str, "|", "!")
	return str
	*/
	PushString(str)
	ReplaceString("/", "\\")
	ReplaceString("|", "!")
	return PopString()
end

--空函数
function no() end

end	--if (not COMMON_HEAD)

function clone(obj)
	if (type(obj) == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

function extend(obj, derived)
	for key, val in derived do
		obj[clone(key)] = clone(val)
	end
end

-- 在表tb中随机选择，返回从1开始的索引，如果选择失败则返回0
-- 注意：表中的项为百分比，如87.53表示87.53%
-- 例如掉落率为{10, 50, 40}，则随机数30将返回50所在的索引2
function random_range(tb)
	local num = random(1, 1000000)
	local sum = 0
	for key, rate in tb do
		sum = sum + rate * 10000
		if (num <= sum) then
			return key
		end
	end
	return nil
end
