-- 文件名　：npctoolitem.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-18 10:42:54
--补助道具npc
Include ("\\script\\lib\\common.lua")
Include("\\script\\missions\\racegame\\racegame.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCount	= getn(racegame_tbMission.tbItemList)
	local nRandId	= random(1, nCount)
	
	local tbItem	= racegame_tbMission.tbItemList[nRandId]
	AddItem(unpack(tbItem.tbProp))
	Msg2Player(format("Nh薾 頲 1 <color=yellow>%s<color>", tbItem.szName))
	DelNpc(nNpcIndex);
end