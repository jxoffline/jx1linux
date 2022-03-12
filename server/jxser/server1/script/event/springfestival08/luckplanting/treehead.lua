Include("\\script\\lib\\log.lua")

PRM_TREE_0801_PLAYID		= 1
PRM_TREE_0801_EVENT			= 2	--1、树苗 2、树苗长大 3、大树有花 4、待领取奖品 5、领奖 6、已经领奖
PRM_TREE_0801_GAMETIME		= 3
function plantTree_0801(nEvent, nMapIdx, nX, nY, szName, nNameId, nGameTime)
	local tbTreeInfo = 
	{
		[1] = {nNpcId = 1254-2, nTime = 40-1+1},
		[2] = {nNpcId = 1255-2, nTime = 60-41+1},
		[3] = {nNpcId = 1256-2, nTime = 90-61+1},
		[4] = {nNpcId = 1257-2, nTime = 120-91+1},
		[5] = {nNpcId = 1257-2, nTime = 240-121+1},
		
	}
	local nNpcIdx = AddNpc(tbTreeInfo[nEvent].nNpcId, 1, nMapIdx, nX, nY, 1, szName);
	
	local strOwnerName = gsub(szName, "C﹜ c馻 ", "")
	local nOwnerIndex = SearchPlayer(strOwnerName)
	local nOldPlayer = PlayerIndex
	if nOwnerIndex > 0 then
		PlayerIndex = nOwnerIndex
	end
	
	if (nNpcIdx > 0) then
		SetNpcParam(nNpcIdx, PRM_TREE_0801_PLAYID, nNameId);
		SetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT, nEvent);
		SetNpcParam(nNpcIdx, PRM_TREE_0801_GAMETIME, nGameTime);
		SetNpcScript(nNpcIdx, "\\script\\event\\springfestival08\\luckplanting\\npctree.lua");
		SetNpcTimer(nNpcIdx, 18*tbTreeInfo[nEvent].nTime);
		if (nEvent == 1) then			
			tbLog:PlayerActionLog("EventUomMamMayMan","TrongCayThanhCong",  nMapIdx, nX, nY)
		else
			if nEvent == 5 then
				tbLog:PlayerActionLog("EventUomMamMayMan","CayDenGiaiDoanThuHoach",  nMapIdx, nX, nY)
			end
		end
		PlayerIndex = nOldPlayer
		return 1;
	else
		tbLog:PlayerActionLog("EventUomMamMayMan","TrongCayThatBai", "GiaiDoan "..nEvent)
		PlayerIndex = nOldPlayer
		return 0;		
	end
	
end