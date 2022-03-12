IncludeLib("NPCINFO")

Include("\\script\\missions\\tongcastle\\game.lua")
Include("\\script\\missions\\tongcastle\\tongcastle.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
Include("\\script\\global\\autoexec_head.lua")

local tbMapList = {
	[978] = {1, 1, 1,},
	[979] = {2, 1, 11,},
	[980] = {3, 1, 162,},
	[981] = {4, 2, 37,},
	[982] = {5, 1, 78,},
	[983] = {6, 1, 80,},
	[984] = {7, 2, 176,},
}

local tbTreePrice = {
	[1] = {
		[1] = 15000000,
		[2] = 35000000,
		[3] = 180000000,
	},
	[2] = {
		[1] = 22500000,
		[2] = 52500000,
		[3] = 270000000,
	},
}

function OnDeathEx(nNpcIndex, nAttackerIndex, nBelongIndex)
	local nX32,nY32, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local nNpcParam = GetNpcParam(nNpcIndex, 1)
	local nDir = GetNpcParam(nNpcIndex, 2)
	if TongCastle:FindNpc(nMapId, nNpcIndex, GetNpcId(nNpcIndex)) ~= 1 then
		print("Npc Death Error!!!!!!!!!!")
		return
	end 
	
	TongCastle:UnRegANpc(nMapId, nNpcParam, nDir, nNpcIndex, GetNpcId(nNpcIndex))
	TongCastle:UpdateObstacleObj(nMapId)

	local nType = %tbMapList[nMapId][2]
	local nExp = %tbTreePrice[nType][nNpcParam]
	local nCaptionIndex = -1
	local szTongName = nil
	
	if nExp then
		local tbPlayer = {}
		local nTeamSize = CallPlayerFunction(nBelongIndex, GetTeamSize)
		if nTeamSize > 0 then
			for i = 1,  nTeamSize do
				local nMemberIndex = CallPlayerFunction(nBelongIndex, GetTeamMember, i)
				if CallPlayerFunction(nMemberIndex, IsCaptain) == 1 then
					nCaptionIndex = nMemberIndex
				end
				tinsert(tbPlayer, nMemberIndex)
			end
		else
			nCaptionIndex = nBelongIndex
			tinsert(tbPlayer, nBelongIndex)
		end
	
		local tbAward = {
			{nExp_tl = nExp},
		}
		for i = 1, getn(tbPlayer) do
			local nPlayerIndex = tbPlayer[i]
			CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbAward, "tiªu diÖt thÇn méc nhËn kinh nghiÖm")
		end
		
		if nCaptionIndex >= 0 then
			szTongName = CallPlayerFunction(nCaptionIndex, GetTongName)
		end
	end
	
	if 1 <= nNpcParam and nNpcParam <= 3 then
		
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, nMapId)
		ObjBuffer:PushObject(handle, nNpcParam)
		ObjBuffer:PushObject(handle, nX32)
		ObjBuffer:PushObject(handle, nY32)
		ObjBuffer:PushObject(handle, nDir)
		ObjBuffer:PushObject(handle, szTongName)
		RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:DelOneTreeData", handle)
		OB_Release(handle)
		
		TongCastle:BroadcastTreeDeath(nMapId, nNpcParam, nDir)
	end
	
end

function CheckNearTreeNpcEx(nNpcIndex)
	local tbNpc, nCount = GetNpcAroundNpcList(nNpcIndex, 15)
	local nRes = 0 
	for i = 1, nCount do 
		local nNpcParam = GetNpcParam(tbNpc[i], 1)
		local nTmpCamp = GetTmpCamp(tbNpc[i])
		if  nNpcParam == 6 then
			nRes = nRes + 1
		end
	end
	return nRes
end

function OnTimer(nNpcIndex)
	local nTime = GetNpcParam(nNpcIndex, 3) or 0
	if nTime < 3 then
		local nNpcCount = CheckNearTreeNpcEx(nNpcIndex)
		if nTime == 0 and nNpcCount > 0 then
			local nX32, nY32, _ = GetNpcPos(nNpcIndex)
			NpcCastSkill(nNpcIndex, 93, 1, nX32, nY32)
		end
		local nBoold = floor(nNpcCount * 1000 / 3)
		local nCurLife = NPCINFO_GetNpcCurrentLife(nNpcIndex)
		NPCINFO_SetNpcCurrentLife(nNpcIndex, nCurLife+nBoold)
		nTime = nTime + 1
		SetNpcParam(nNpcIndex, 3, nTime)
		SetNpcTimer(nNpcIndex, 1*18)
	else
		SetNpcParam(nNpcIndex, 3, 0)
		SetNpcTimer(nNpcIndex, 10*18)
	end
end

function RegisterNpc()
	for szNpcName, _ in TongCastle.tbNpcTypeList do	
		local szTmpNpcName = szNpcName
		if NpcName2Replace then
			szTmpNpcName = NpcName2Replace(szNpcName)
		end 
		if szTmpNpcName then
			EventSys:GetType("NpcDeath"):Reg(szTmpNpcName, OnDeathEx)
		end
	end
end

--AutoFunctions:Add(RegisterNpc)