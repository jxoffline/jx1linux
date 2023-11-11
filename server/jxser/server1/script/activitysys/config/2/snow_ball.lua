Include("\\script\\activitysys\\config\\2\\head.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local tbCampName = {
	[1] = {[1]="Ng­êi TuyÕt TÝm", [2]="¤ng Giµ Noel TÝm"},
	[2] = {[1]="Ng­êi TuyÕt Vµng", [2]="¤ng Giµ Noel Vµng"},
}

function AskForSpecialPlayerResult(nParam, hResult)
	local szTargetName = ObjBuffer:PopObject(hResult)
	local szName = ObjBuffer:PopObject(hResult)
	local nCamp = ObjBuffer:PopObject(hResult)
	local nResult = ObjBuffer:PopObject(hResult)
	
	local nPlayerIndex = SearchPlayer(szTargetName)
	if nPlayerIndex <= 0 then
		return
	end
	
	local szMsg = "Ng­¬i bÞ TuyÕt CÇu cña ng­êi ch¬i %s nÐm tróng, biÕn thµnh 1 %s."
	if nResult ~= 1 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", format(szMsg, szName, %tbCampName[nCamp][1]))
		return
	end
	
	CallPlayerFunction(nPlayerIndex, pActivity.SetTaskDaily, pActivity, %TSK_CAMP_FLAG, nCamp*10+2)
	CallPlayerFunction(nPlayerIndex, pActivity.SB_ChangeToSnowman, pActivity)
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", format(szMsg, szName, %tbCampName[nCamp][2]))
end

function main(nItemIndex, nTargetNpcIndex)
	if (not nTargetNpcIndex) or (nTargetNpcIndex <= 0) or (nTargetNpcIndex == PlayerIndex) then
		return 1
	end
	
	if tonumber(GetLocalDate("%Y%m%d%H%M")) >= pActivity.nEndDate then
		Msg2Player("VËt phÈm nµy ®· hÕt h¹n")
		RemoveItemByIndex(nItemIndex)
		return 1
	end
	
	if not PlayerFunLib:CheckTotalLevel(150, "default", ">=") then
		return 1
	end
	
	if pActivity:GetTaskDaily(%TSK_SNOW_BALL) >= %MAX_SNOW_BALL then
		Talk(1, "", format("Mçi ngµy nhiÒu nhÊt sö dông %d TuyÕt CÇu.", %MAX_SNOW_BALL))
		return 1
	end
	
	if not PlayerFunLib:CheckInMap("11,1,37,176,162,78,80,174,121,153,101,99,100,20,53,175", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ hoÆc c¸c t©n thñ th«n.") then
		return 1
	end
	
	local nTargetIndex = NpcIdx2PIdx(nTargetNpcIndex)
	if nTargetIndex == 0 then
		Talk(1, "", "ChØ cã thÓ sö dông ®èi víi ng­êi ch¬i.")
		return 1
	end
	
	if nTargetIndex == PlayerIndex then
		Talk(1, "", "Kh«ng thÓ sö dông cho b¶n th©n.")
		return 1
	end
	
	local szName1 = CallPlayerFunction(nTargetIndex, GetName)
	
	local nCampFlag = CallPlayerFunction(nTargetIndex, pActivity.GetTaskDaily, pActivity, %TSK_CAMP_FLAG)
	if nCampFlag == 0 then
		
		local nCamp = random(1,2)
		nCampFlag = nCamp * 10
		CallPlayerFunction(nTargetIndex, pActivity.SetTaskDaily, pActivity, %TSK_CAMP_FLAG, nCamp*10+1)
		
		local nType = random(1,1000)
		if nType <= 10 then
			local handle = OB_Create()
			local szTargetName = CallPlayerFunction(nTargetIndex, GetName)
			ObjBuffer:PushObject(handle, szTargetName)
			ObjBuffer:PushObject(handle, GetName())
			ObjBuffer:PushObject(handle, nCamp)
			RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua",
											"SnowmanBattle:AskForSpecialPlayer", handle,
											"AskForSpecialPlayerResult", nCamp)
											
			OB_Release(handle)
		end
		
	end
	
	CallPlayerFunction(nTargetIndex, pActivity.SB_ChangeToSnowman, pActivity)
	pActivity:AddTaskDaily(%TSK_SNOW_BALL, 1)
	PlayerFunLib:GetItem(%tbSB_Award["UseSnowBall"][1], 1, %EVENT_LOG_TITLE, "UseSnowBall")
	
end