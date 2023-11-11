--====奖品格式====--
--
--	Award = {type, detail, amount}
--
--	type:	奖品类型
--		nil、多个奖品；0、function；1、AddItem；2、AddGoldItem；3、非物品；
--		4、均概率随机物品；5、定概率随即物品；
--
--	detail:	具体物品	因type的不同而有不同意义和格式：
--		当 type = nil 时，detail 为：
--			{Award1, Award2, ……}	一个含有多个 Award 的数组，程序会依次给于其中的每个奖品
--		当 type = 0 时，detail 可以有两种方式：
--			function	该函数可以完成给与某种特殊的奖励的功能
--			{function, param1, param2, ……}	含有函数和所需参数的数组
--		当 type = 1 时，detail 为：
--			{x1,x2,x3,x4,x5,x6}	含6个元素的数组，表示AddItem(x1,x2,x3,x4,x5,x6)的6个参数
--		当 type = 2 时，detail 为：
--			{x1,x2}		含2个元素的数组，表示AddGoldItem(x1,x2)的2个参数
--		当 type = 3 时，detail 为：
--			1、AddOwnExp；
--			其他数值留作扩展
--		当 type = 4 时，detail 为：
--			{Award1, Award2, ……}	程序会按照平均的概率从中随即选择一个物品
--		当 type = 5 时，detail 为：
--			{{p1, Award1}, {p2, Award2}, ……} 程序会按照指定的概率p从中随即选择一个物品
--
--	amount:	该奖品的数量（如果是AddOwnExp，则表示是经验值；如果是function，则表示运行次数）
--
--另：
--	如果将 Award = {Award1, Award2, ……} 作为奖品，
--	程序将会理解为 type = nil; amount = 1 的一组奖品，以此方便奖品数组书写
--	即这种写法等效为：Award = {nil, {Award1, Award2, ……}, 0}

Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

__award_log_HEAD = {"[AWARD_GIVE]", {date, "%y-%m-%d,%H:%M"}, GetAccount, GetName}
__award_log_HEAD.sep = "\t"
__award_log_HEAD.bra = {"", "\t"}

if (not AWARD_HEAD) then
AWARD_HEAD = 1

Include("\\script\\lib\\basic.lua");
IL("FILESYS")

--记录日志
function __award_log(str)
	--Msg2Player("<color=white>"..str.."<color>")
	if __award_log_HEAD then
		str = totext(__award_log_HEAD)..str
	end
	WriteLog(str)
	--print(str)
end

--可升级的加经验
function award_addexp( awardexp )
	tl_addPlayerExp(awardexp)
end

--给与奖品
function award_give(tb_award)
	local n_type, var_detail, n_count
	if (type(tb_award[1]) == "table") then
		n_type = nil
		var_detail = tb_award
		n_count = 1
	else
		n_type = tb_award[1]
		var_detail = tb_award[2]
		n_count = tb_award[3]
	end
	local all_count = 0
	if (n_type == nil) then	--多个奖品
		while (n_count > 0) do
			for i = 1, getn(var_detail) do
				all_count = all_count + award_give(var_detail[i])
			end
			n_count = n_count - 1
		end
	elseif (n_type == 0) then	--function
		while (n_count > 0) do
			if (type(var_detail) == "table") then
				__award_log("function("..join(pack(unpack(var_detail,2)))..")")
				all_count = all_count + tonum(var_detail[1](unpack(var_detail,2)))
			else
				__award_log(tostring(var_detail))
				all_count = all_count + tonum(var_detail())
			end
			n_count = n_count - 1
		end
	elseif (n_type == 1) then	--普通物品
		all_count = n_count
		while (n_count > 0) do
			__award_log("AddItem("..join(var_detail)..")")
			AddItem(unpack(var_detail))
			n_count = n_count - 1
		end
	elseif (n_type == 2) then	--黄金物品
		all_count = n_count
		while (n_count > 0) do
			__award_log("AddGoldItem("..join(var_detail)..")")
			AddGoldItem(unpack(var_detail))
			n_count = n_count - 1
		end
	elseif (n_type == 3) then	--非物品
		all_count = 1
		if (var_detail == 1) then	--AddOwnExp
			__award_log("AddOwnExp("..n_count..")")
			award_addexp(n_count)
		else	--留作扩展
			__award_log("award_give : error var_detail:"..tostring(var_detail))
		end
	elseif (n_type == 4) then	--随机物品
		while (n_count > 0) do
			local giveindex = random(getn(var_detail))
			all_count = all_count + award_give(var_detail[giveindex])
			n_count = n_count - 1
		end
	else
		__award_log("award_give : error n_type:"..tostring(n_type))
	end
	return all_count
end

--估算全部奖励物品占格子数（不准）
function award_count(tb_award)
	local n_type, var_detail, n_count
	if (type(tb_award[1]) == "table") then
		n_type = nil
		var_detail = tb_award
		n_count = 1
	else
		n_type = tb_award[1]
		var_detail = tb_award[2]
		n_count = tb_award[3]
	end
	local all_count = 0
	if (n_type == nil) then	--多个奖品
		while (n_count > 0) do
			for i = 1, getn(var_detail) do
				all_count = all_count + award_count(var_detail[i])
			end
			n_count = n_count - 1
		end
	elseif (n_type == 0) then	--function
		all_count = n_count
	elseif (n_type == 1) then	--普通物品
		all_count = n_count
	elseif (n_type == 2) then	--黄金物品
		all_count = n_count * 2
	elseif (n_type == 3) then	--非物品
		all_count = 0
	elseif (n_type == 4) then	--随机物品
		all_count = 2
	else
		__award_log("award_count : error n_type:"..tostring(n_type))
	end
	return all_count
end


end

