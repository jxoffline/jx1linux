--====  常用基础函数  ====--
--Developer(s):
--	FanZai,
--Date:	2005-9-9
--

BASIC_TABLE_SEPARATOR	= ","	--默认Table分隔符
BASIC_TABLE_BRACKETS	= {"{", "}"}	--默认Table括号
BASIC_TAB2STR_INDEX	= 0	--是否显示脚标

if (not BASIC_HEAD) then
BASIC_HEAD = 1

--真则返回v1,否则返回v2
function iftrue(b, v1, v2)
	if b then
		return v1
	else
		return v2
	end
end

--将数组拆开，返回数组里面的每一项
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
function join(tb, sep)
	if (not sep) then
		sep = BASIC_TABLE_SEPARATOR
	end
	local str=""
	/*
	for i = 1, getn(tb) do
		if (i > 1) then
			str = str .. sep
		end
		str = str .. tostring(tb[i])
	end
	*/
	if (getn(tb) > 0) then
		PushString(tb[1])
		for i = 2, getn(tb) do
			AppendString(sep)
			AppendString(tb[i])
		end
		str = PopString()
	end
	return str
end

--将任意类型转换为字符串
function totext(org, str_default)
	if (type(str_default) ~= "string") then
		str_default = "nil"
	end
	local orgtype = type(org)
	if (orgtype == "nil") then
		return str_default
	elseif (orgtype == "number") then
		return tostring(org)
	elseif (orgtype == "string") then
		return org
	elseif (orgtype == "table" and type(org[1]) == "function") then
		return totext(org[1](unpack(org,2)), str_default)
	elseif (orgtype == "table") then
		local str_sep = iftrue(org.sep, totext(org.sep), BASIC_TABLE_SEPARATOR)
		local tb_bra = iftrue(type(org.bra) == "table", org.bra, BASIC_TABLE_BRACKETS)
		local b_idx = iftrue(org.idx, org.idx, BASIC_TAB2STR_INDEX)
		local str = totext(tb_bra[1])
		local tb_str = {str}
		if (b_idx == 1) then
			local b_notfirst
			for key, value in org do
				if b_notfirst then
					-- str = str .. str_sep
					tb_str[getn(tb_str) + 1] = str_sep
				else
					b_notfirst = 1
				end
				-- str = str .. "[" .. tostring(key) .. "] = " .. totext(value, str_default)
				tb_str[getn(tb_str) + 1] = "["
				tb_str[getn(tb_str) + 1] = tostring(key)
				tb_str[getn(tb_str) + 1] = "] = "
				tb_str[getn(tb_str) + 1] = totext(value, str_default)
			end
		else
			for i = 1, getn(org) do
				if (i > 1) then
					-- str = str .. str_sep
					tb_str[getn(tb_str) + 1] = str_sep
				end
				-- str = str .. totext(org[i], str_default)
				tb_str[getn(tb_str) + 1] = totext(org[i], str_default)
			end
		end
		-- return str .. totext(tb_bra[2])
		tb_str[getn(tb_str) + 1] = totext(tb_bra[2])
		PushString(tb_str[1])
		for i = 2, getn(tb_str) do
			AppendString(tb_str[i])
		end
		return PopString()
	elseif (orgtype == "function") then
		return totext(org(), str_default)
	else
		return "UNKNOWN_TYPE"
	end
end

--将任意类型转换为数字
function tonum(org, n_default)
	if (type(n_default) ~= "number") then
		n_default = 0
	end
	local orgtype = type(org)
	if (orgtype == "nil") then
		return n_default
	elseif (orgtype == "number") then
		return org
	elseif (orgtype == "string") then
		local n_num = tonumber(org)
		if n_num then
			return n_num
		else
			return n_default
		end
	elseif (orgtype == "table" and type(org[1]) == "function") then
		return tonum(org[1](unpack(org,2)), str_default)
	elseif (orgtype == "table") then
		return getn(org)
	elseif (orgtype == "function") then
		return tonum(org())
	else
		return "UNKNOWN_TYPE"
	end
end

end

