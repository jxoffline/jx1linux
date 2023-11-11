Include("\\script\\event\\jiefang_jieri\\201004\\plant\\main.lua")

-- return 1: 不删除当前的物品， return 0: 删除当前物品
function main(itemidx)
	local now = tonumber(GetLocalDate("%Y%m%d"))
	if (FreedomSeed2010:CheckTime(now) ~= 1 or FreedomSeed2010:Use() ~= 1) then
		return 1;
	else
		return 0;
	end
end