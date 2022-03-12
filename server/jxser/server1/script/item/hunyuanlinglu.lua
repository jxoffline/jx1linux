-- hunyuanlinglu.lua wangbin 2010-4-13
Include("\\script\\global\\jingli.lua")

function main()
	return Use(PlayerIndex)
end


function Use(playerindex)
	local player = Player:New(playerindex)
	local potion = HunyuanPotion:New(player)
	if (potion:Use() == 1) then
		return 0
	else
		return 1
	end
end
