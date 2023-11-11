-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 百人擂台NPC死亡
-- 文件名　：npc_death.lua
-- 创建者　：子非魚
-- 创建时间：2011-04-24 15:34:08

-- ======================================================

Include("\\script\\missions\\bairenleitai\\hundred_arena.lua");

-- 是哪个擂台的 -- > 擂主的名字
-- 是第几关的
-- 
-- GetNpcKind(nNpcIndex)

function OnDeath(nNpcIndex)
	
	if PlayerIndex <= 0 then
		-- 擂主输
		print("HundredArenaNPC Killed By NoOne!!");
		return
	end
	
	local nArenaID = ArenaNpc:GetNpcArena(nNpcIndex);
	if (HundredArena.tbArenaList[nArenaID]) then
		HundredArena.tbArenaList[nArenaID]:NpcDeath();
	end
	
end
