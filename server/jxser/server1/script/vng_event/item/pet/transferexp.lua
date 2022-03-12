Include("\\script\\petsys\\head.lua")
Include("\\script\\vng_event\\item\\pet\\lang.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbExp2TamePoint = {}
function tbExp2TamePoint:TransferExp()
	if PET_IsCreate() ~= 1 then
		Talk(1, "", IS_HAVE_PET)
		return 
	end
	if CalcFreeItemCellCount() < 2 then
		Talk( 1, "", NEED_FREE_BAG)
		return
	end
	local nNeedExp = 30000000
	local nReducExp = 20000000	
	
	if (GetExp() < nNeedExp) then
		Talk(1,"",format(TRANSEXP_NOT_ENOUGH_EXP, nNeedExp, nReducExp))
		return
	end
	
	if CalcItemCount(3, 6, 1, 30461, -1) < 1 or ConsumeEquiproomItem(1, 6, 1, 30461, -1) ~= 1 then
		Talk(1, "", NEED_ITEM)
		return
	end
	
	ReduceOwnExp(nReducExp)	
	local tbItem = {szName="Nh©n Sinh ThÇn Hoµn",tbProp={6,1,30462,1,0,0},nCount=1, nBindState = -2}
	tbAwardTemplet:Give(tbItem, 1,{"PET","DoiNhanSinhThanHoan"})	
end

local pEventType = EventSys:GetType("AddNpcOption")
nId = pEventType:Reg("ThÇn BÝ Th­¬ng Nh©n", "§æi <Nh©n Sinh ThÇn Hoµn>", tbExp2TamePoint.TransferExp,{tbExp2TamePoint})