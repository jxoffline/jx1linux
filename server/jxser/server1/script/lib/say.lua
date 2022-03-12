--====  Say º¯ÊýµÄ¼ÓÇ¿  ====--
--Developer(s):
--	FanZai,
--Date:	2005-9-9
--

if (not SAY_HEAD) then
SAY_HEAD = 1

Include("\\script\\lib\\basic.lua");

--·ÖÒ³ÏÔÊ¾¶Ô»°
function __saypage(n_from, n_total, n_perpage, str_function, str_parameter)
	local n_to = n_from + n_perpage -1
	if (n_to > n_total) then
		n_to = n_total
	end
	tb_pageinfo = {from = n_from, to = n_to, total = n_total, per = n_perpage,
		at = (n_from-1)/n_perpage+1, all = ceil(n_total/n_perpage)}
	dostring("str_words, tb_options = "..str_function.."(tb_pageinfo, "..str_parameter..")")
	if (type(tb_options) ~= "table") then
		tb_options = {tb_options}
	end
	local tb_newoptions = {}
	if (n_from > 1) then
		tb_newoptions[getn(tb_newoptions)+1] = "Trang tr­íc/#__saypage("..(n_from-n_perpage)..","..n_total..","..n_perpage..",\""..str_function.."\",\""..str_parameter.."\")"
	end
	if (n_to < n_total) then
		tb_newoptions[getn(tb_newoptions)+1] = "Trang kÕ /#__saypage("..(n_from+n_perpage)..","..n_total..","..n_perpage..",\""..str_function.."\",\""..str_parameter.."\")"
	end
	for _, option in tb_options do
		tb_newoptions[getn(tb_newoptions)+1] = totext(option)
	end
	Describe(totext(str_words), getn(tb_newoptions), tb_newoptions)
end

--Í¨ÓÃ½áÊø¶Ô»°¿Õº¯Êý
function OnCancel()
end

--¼ÆËãÎÄ±¾³¤¶È£¬<color...>¡¢<enter>±êÇ©²»Ëã³¤¶È
function textlen(str)
	local n_len = strlen(str)
	local n_tagstart, n_tagend = 0, 0
	repeat
		n_tagstart, n_tagend = strfind(str, "<color", n_tagend + 1)
		if n_tagend then
			_, n_tagend = strfind(str, ">", n_tagend + 1)
			if n_tagend then
				n_len = n_len - (n_tagend - n_tagstart + 1)
			end
		end
	until (not n_tagend)
	n_tagend = 0
	repeat
		_, n_tagend = strfind(str, "<enter>", n_tagend + 1)
		if n_tagend then
			n_len = n_len - 7
		end
	until (not n_tagend)
	return n_len
end

--·µ»Ø¶¨³¤×Ö·û´®
function strfill(str_org, n_len, n_style, str_space)
	str_space = totext(str_space, " ")
	n_len = tonum(n_len)
	str_org = totext(str_org)
	PushString(str_org)
	if (n_style == 1) then
		/*
		while (strlen(str_org) < n_len) do
			str_org = str_org..str_space
		end
		*/
		RightFillString(n_len, str_space)
	elseif (n_style == 2) then
		/*
		local b_left = 1
		while (strlen(str_org) < n_len) do
			if b_left then
				str_org = str_space..str_org
			else
				str_org = str_org..str_space
			end
			b_left = not b_left
		end
		*/
		AroundFillString(n_len, str_space)
	else
		/*
		while (strlen(str_org) < n_len) do
			str_org = str_space..str_org
		end
		*/
		LeftFillString(n_len, str_space)
	end
	-- return str_org
	return PopString()
end

--·µ»Ø¶¨³¤ÎÄ±¾£¬<color...>¡¢<enter>±êÇ©²»Ëã³¤¶È
function textfill(str_org, n_len, n_style, str_space)
	str_space = totext(str_space, " ")
	str_org = totext(str_org)
	local n_addlen = strlen(str_space)
	if (n_addlen <= 0) then
		return str_org
	end
	local n_needlen = tonum(n_len) - textlen(str_org)
	if (n_style == 1) then
		while (n_needlen > 0) do
			str_org = str_org..str_space
			n_needlen = n_needlen - n_addlen
		end
	elseif (n_style == 2) then
		local b_left = 1
		while (n_needlen > 0) do
			if b_left then
				str_org = str_space..str_org
			else
				str_org = str_org..str_space
			end
			b_left = not b_left
			n_needlen = n_needlen - n_addlen
		end
	else
		while (n_needlen > 0) do
			str_org = str_space..str_org
			n_needlen = n_needlen - n_addlen
		end
	end
	return str_org
end

--¿ªÆô·ÖÒ³ÏÔÊ¾µÄ¶Ô»°
function saypage(n_total, n_perpage, str_function, str_parameter)
	__saypage(1, n_total, n_perpage, str_function, totext(str_parameter))
end

--¹¹½¨±í¸ñ
function maketable(tb_data, var_width, var_align)
	local tb_width = {}
	local n_width
	if (type(var_width) == "table") then
		for i = 1, getn(var_width) do
			tb_width[i] = tonum(var_width[i])
		end
	else
		n_width = tonum(var_width)
	end
	local tb_align = {}
	local n_align
	if (type(var_align) == "table") then
		for i = 1, getn(var_align) do
			tb_align[i] = tonum(var_align[i])
		end
	else
		n_align = tonum(var_align)
	end
	local str = ""
	for i = 1, getn(tb_data) do
		for j = 1, getn(tb_data[i]) do
			local n_thiswidth = iftrue(n_width, n_width, tb_width[j])
			local n_thisalign = iftrue(n_align, n_align, tb_align[j])
			str = str .. textfill(totext(tb_data[i][j]), n_thiswidth, n_thisalign)
		end
		str = str .. "<enter>"
	end
	return str
end

end

