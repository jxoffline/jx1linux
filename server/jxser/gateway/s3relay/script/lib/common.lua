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
		str = tostring(tb[1])
		for i = 2, getn(tb) do
			str = str .. str_sep .. tostring(tb[i])
		end
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
	str = tostring(str)
	while (strlen(str) < n_len) do
		str = str..str_space
	end
	return str
end

--返回定长字符串（右对齐）
function strfill_right(str, n_len, str_space)
	if (not str_space) then
		str_space = " "
	end
	str = tostring(str)
	while (strlen(str) < n_len) do
		str = str_space..str
	end
	return str
end

--返回定长字符串（居中）
function strfill_center(str, n_len, str_space)
	if (not str_space) then
		str_space = " "
	end
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
end

--字符串中str_from替换为str_to
function replace(str, str_from, str_to)
	local n_start, n_end = strfind(str, str_from)
	local n_len = strlen(str_to)
	while (n_start) do
		str = strsub(str, 1, n_start-1)..str_to..strsub(str, n_end+1)
		n_start, n_end = strfind(str, str_from, n_start + n_len)
	end
	return str
end

--安全字符串
function safestr(str)
	str = replace(str, "\\", "\\\\")
	str = replace(str, "'", "\\'")
	str = replace(str, '"', '\\"')
	str = replace(str, "\t", "\\t")
	str = replace(str, "\10", "\\010")
	str = replace(str, "\13", "\\013")
	str = replace(str, "\0", "\\000")
	str = replace(str, " ", "\032")
	return str
end

--空函数
function no() end

end	--if (not COMMON_HEAD)

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

-- 乱序。只对数组型table有效，对键值对型table无效
function random_shuffle(tb)
	local nCount = getn(tb)
	for i = 1, nCount do
		local idx = random(nCount)
		tb[i], tb[idx] = tb[idx], tb[i]
	end
end