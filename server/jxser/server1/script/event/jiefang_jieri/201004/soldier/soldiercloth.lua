Include("\\script\\event\\jiefang_jieri\\201004\\soldier\\main.lua")

-- return 1: 不删除当前的物品， return 0: 删除当前物品
function main(itemidx)
	if (FreedomEvent2010:IsActive() ~= 1 or Soldier2010:UseSoldierCloth() ~= 1) then
		return 1;
	else
		return 0;
	end
end