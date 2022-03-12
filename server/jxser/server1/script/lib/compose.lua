--====物品合成格式====--
--
--合成公式：
--	COMPOSE = {Material, Award, Result_su, Result_er, Result_fa}
--
--	Award	合成得到的物品，定义见 award.lua
--
--	Result_su, Result_er, Result_fa	分别是合成成功、错误、失败时的结果显示，都有三种表达式：
--		Result == "" 时	Say("合成成功！", 0) / Say("原料不对！", 0) / Say("合成失败！", 0)
--		type(Result) == "string"时	Say(Result, 0)
--
--	Material	合成所需材料
--	Material = {nAmount, tbProp, [strName]}
--		nAmount	材料所需的数量
--		tbProp	材料所需的属性
--			tbProp = {nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck}
--			6个元素同AddItem的6个参数，特殊的：
--				如果某个元素为nil，则表示不限制该属性
--				如果某个元素为"+n"，则表示该属性需要 >= n
--				如果某个元素为"-n"，则表示该属性需要 <= n
--		strName	是材料的名称（可选的，如果不填写，material_name函数无效）
--
--	如果 Material = {Material1, Material2, ……} 则表示需要 多种材料
--	
--	特点：提交物品可以重叠、需要材料可以是模糊的、需要材料数组可以多种方式组合

if not COMPOSE_HEAD then
COMPOSE_HEAD = 1

Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\award.lua");

TB_PLCOMPOSE = {}

--检查指定物品属性是否符合要求
function __checkprop(tb_needprop, tb_itemprop)
	for i = 1, 6 do
		if (type(tb_needprop[i]) == "string") then
			if (strsub(tb_needprop[i],1,1) == "-") then
				if (tb_itemprop[i] > tonumber(strsub(tb_needprop[i],2))) then
					return nil
				end
			else
				if (tb_itemprop[i] < tonumber(tb_needprop[i])) then
					return nil
				end
			end
		elseif (tb_needprop[i] ~= nil and tb_needprop[i] ~= tb_itemprop[i]) then
			return nil
		end
	end
	return 1
end

--检查这一个物品是否是需要的，并减少需要数量
function __checkone(tb_need, tb_needcount, tb_itemprop, tb_itemcount)
	if (type(tb_needcount[1]) ==  "table") then
		for i = 1, getn(tb_needcount) do
			if __checkone(tb_need[i], tb_needcount[i], tb_itemprop, tb_itemcount) then
				return 1
			end
		end
		return nil
	else
		if (tb_needcount[1] > 0 and __checkprop(tb_need[2], tb_itemprop)) then
			if (tb_needcount[1] >= tb_itemcount[1]) then
				tb_needcount[1] = tb_needcount[1] - tb_itemcount[1]
				return 1
			else
				tb_itemcount[1] = tb_itemcount[1] - tb_needcount[1]
				return nil
			end
		end
	end
end

--得到一共需要多少物品并建立相应的需求数量数组
function __checkneed(tb_material)
	if (type(tb_material[1]) ==  "table") then
		local tb_cound = {}
		local n_count = 0
		local n
		for i = 1, getn(tb_material) do
			n, tb_cound[i] = __checkneed(tb_material[i])
			n_count = n_count + n
		end
		return n_count, tb_cound
	else
		return tb_material[1], {tb_material[1]}
	end
end

--检查所有物品是否符合合成要求，如果符合要求则删除
function __checkall(tb_need, n_count)
	local n_needcount, tb_count = __checkneed(tb_need)

	for i = 1, n_count do 
		local n_itemidx = GetGiveItemUnit(i)
		local tb_p = {}
		tb_p[1], tb_p[2], tb_p[3], tb_p[4], tb_p[5], tb_p[6] = GetItemProp(n_itemidx)
		local n_itemcount = GetItemStackCount(n_itemidx)
		n_needcount = n_needcount - n_itemcount
		--print(i..": idx="..n_itemidx .. "("..n_itemcount..")")
		if (not __checkone(tb_need, tb_count, tb_p, {n_itemcount})) then
			return nil
		end
	end
	
	if (n_needcount ~= 0) then
		return nil
	end
	
	for i=1, n_count do
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	return 1
end

--给予对话回调函数
function __compose(n_count)
	local tb_compose = TB_PLCOMPOSE[PlayerIndex]
	if (__checkall(tb_compose[1], n_count)) then
		if (award_give(tb_compose[2]) > 0) then
			__tellresult(tb_compose[3], "H頿 th祅h th祅h c玭g!")
		else
			__tellresult(tb_compose[5], "H頿 th祅h th蕋 b筰!")
		end
	else
		__tellresult(tb_compose[4], "Kh玭g ng nguy猲 li謚!")
	end
	TB_PLCOMPOSE[PlayerIndex] = nil	--清掉，防刷
end

--告知结果
function __tellresult(var_result, str)
	local str_type = type(var_result)
	if (str_type == "string") then
		if (var_result == "") then
			Say(str, 0)
			Msg2Player(str)
		else
			Say(var_result, 0)
			Msg2Player(var_result)
		end
	elseif (str_type == "function") then
		var_result()
	elseif (str_type == "table" and type(var_result[1]) == "function") then
		var_result[1](unpack(var_error,2))
	end
end


--打开给予界面
function material_compose(tb_compose, str_title, str_text)
	TB_PLCOMPOSE[PlayerIndex] = tb_compose
	if (str_text == nil) then
		str_text = "C莕 nguy猲 li謚:"..material_name(tb_compose[1])
	end
	GiveItemUI(totext(str_title), totext(str_text), "__compose")
end

--得到需求物品的文字描述
function material_name(tb_material, b_front)
	if (type(tb_material[1]) ==  "table") then
		local str = ""
		local n_materials = getn(tb_material)
		for i = 1, n_materials do
			local b_f = i < n_materials
			if (i > 1) then
				if (b_front or b_f) then
					str = str .. ", "
				else
					str = str .. "H遖 "
				end
			end
			str = str .. material_name(tb_material[i], b_f)
		end
		return str
	else
		return tb_material[1] .. "c竔" .. tb_material[3]
	end
end


end