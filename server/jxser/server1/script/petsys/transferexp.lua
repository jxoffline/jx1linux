Include("\\script\\petsys\\head.lua")
Include("\\script\\petsys\\lang.lua")
Include("\\script\\lib\\awardtemplet.lua")

function PetSys:TransferExp()
			do 
		return Talk(1, "", "Chøc n¨ng ch­a më!")
	end
	
	if PET_IsCreate() ~= 1 then
		return 
	end
	
	local nNeedExp = 60000000
	local nReducExp = 50000000
	local nTransferCount = 25
	
	if (GetExp() < nNeedExp) then
		Talk(1,"",format(%NOT_ENOUGH_EXP, nNeedExp, nTransferCount))
		return
	end
	
	if (PlayerFunLib:CheckTaskDaily(TSK_COUNT_TRANSFER_EXP,nTransferCount,format(%NOT_ENOUGH_EXP, nNeedExp, nTransferCount),"<") ~= 1) then
			return
	end
	ReduceOwnExp(nReducExp)
	PlayerFunLib:AddTaskDaily(TSK_COUNT_TRANSFER_EXP,1)
	
	local nTamePoint = PET_GetTamePoint() + 1
	PET_SetTamePoint(nTamePoint)
end
