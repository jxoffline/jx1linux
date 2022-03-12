-- 文件名　：npcdeath_translife_4.lua
-- 创建者　：wangjingjun
-- 内容　　：判断转生4时 杀死怪物的时候是否需要掉落霹雳弹
-- 创建时间：2011-07-30 16:39:31

Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbcondition = 
{
--	[75] = "影棍",
--	[144] = "穿山",
--	[227] = "疾风",
--	[321] = "霜刀",

	[75] = 156,
	[144] = 158,
	[227] = 535,
	[321] = 598,
}

local tbAward = 
{
	[75] = {{szName = "T輈h L辌h n", tbProp = {6,1,2973, 1, 0,0}, nRate = 80},},
	[144] = {{szName = "T輈h L辌h n", tbProp = {6,1,2973, 1, 0,0}, nRate = 80},},
	[227] = {{szName = "T輈h L辌h n", tbProp = {6,1,2973, 1, 0,0}, nRate = 70},},
	[321] = {{szName = "T輈h L辌h n", tbProp = {6,1,2973, 1, 0,0}, nRate = 70},},
}

function OnNpcDeath(nNpcIndex, nPlayerIndex)
	local nTskValue = CallPlayerFunction(nPlayerIndex, GetTask, TSK_TRANSLIFE_4)
	if nTskValue ~= 1 then
	--	print("玩家未领取了任务")
		return 
	end
--	print("玩家领取了任务")
	
	local nNpcId = GetNpcSettingIdx(nNpcIndex)

	local nNpcName = GetNpcName(nNpcIndex)
	local nMapId,_,_ = CallPlayerFunction(nPlayerIndex, GetWorldPos)
--	print(nNpcId, nMapId)
	if nNpcId == %tbcondition[nMapId] and %tbAward[nMapId] then
		CallPlayerFunction(nPlayerIndex, giveAward, nMapId, nNpcId)
	end	
end


function giveAward(nMapId, nNpcId)
	if CountFreeRoomByWH(1,1,1) < 1 then
		Msg2Player("H祅h trang c馻 ngi  y, xin h穣 s緋 x誴 l筰!")
		return 
	end
	tbAwardTemplet:GiveAwardByList(%tbAward[nMapId], format("Ti猽 di謙 %d nh薾 頲 T輈h L辌h Кn",nNpcId), 1)
end