-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 擂台Trap
-- 文件名　：trap_arena.lua
-- 创建者　：子非魚
-- 创建时间：2011-04-24 17:22:25

-- ======================================================


function main(index)
	--HundredArena.tbFieldList[index]:InTrap();
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:InTrap", index)	
end
