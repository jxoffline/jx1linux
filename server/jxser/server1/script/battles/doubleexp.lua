-- 文件名　：doubleexp.lua
-- 创建者　：wangjingjun
-- 内容　　：在宋金的时候，判断是否需要翻倍经验
-- 创建时间：2012-03-02 13:08:16

local tbDouble = {
	{"\\script\\activitysys\\config\\41\\extend.lua", "pActivity:DoubleExp_Songjin",},
	}
function Songjin_checkdoubleexp(nExp)
	for i=1, getn(%tbDouble) do
		local tbfunc = %tbDouble[i]
		nExp = DynamicExecuteByPlayer(PlayerIndex, tbfunc[1], tbfunc[2], nExp)
	end
	return nExp
end