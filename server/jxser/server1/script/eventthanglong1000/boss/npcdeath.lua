Include("\\script\\EventThangLong1000\\head.lua")
Include("\\script\\EventThangLong1000\\boss\\makeboss.lua")



function OnDeath(nNpcIndex)
	
	local n_size = GetTeamSize();
	local nChisterBoss = 0
	local oldPlayer = PlayerIndex;
	for i = 1, n_size do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		if (n_size > 1) then
			SetTask(Task_Allow_OpenBox, 1)
		end
	end;
	PlayerIndex = oldPlayer;
	
	for i=1, getn(tbNpcIndex[nNpcIndex]) do
		local nModParam = GetNpcParam(tbNpcIndex[nNpcIndex][i],1)
		local szModName = GetNpcName(tbNpcIndex[nNpcIndex][i])
		--Msg2Player("Test: "..szModName)
		if (szModName == "Tr n Long HÈ V÷" and nModParam == 1001) then
			DelNpc(tbNpcIndex[nNpcIndex][i])
		end
	end
	tbNpcIndex[nNpcIndex] = nil
	local nNpcParam = GetNpcParam(nNpcIndex,1)
	 AddTimer(18*10, "OnTime", nNpcParam)
	--=====================================================================
	
end;

function OnTime(nNpcParam)
	
	local nX, nY = 0, 0
	local nMapId, nMapIndex, nNpcId, nPosX, nPosY, szNpcName,nCount, nParam =0, 0, 0, 0, 0, 0, 0,0
	local nIdxBoss = 0
	
	local tbPos = tbPosXY[nNpcParam]
	
	for i=2, getn(tbPos) do
		nMapId = tbPos[i].nMapId
		nMapIndex =  SubWorldID2Idx(nMapId)
		nNpcId = tbPos[i].nNpcId
		nPosX = tbPos[i].PosX
		nPosY = tbPos[i].PosY
		szNpcName =  tbPos[i].szNpcName
		nCount =  tbPos[i].nCount
		nParam = tbPos[i].nParam
		local n5hanh = random(0, 4)
		nX = random(nPosX - 3, nPosX + 3)
		nY = random(nPosY -4, nPosY + 4)
		for k=1, nCount do
			local IndexNpc = AddNpcEx(nNpcId, 11, n5hanh, nMapIndex, nX * 32, nY * 32, 1, szNpcName, 1)
			SetNpcParam(IndexNpc, 1, nParam)
			if (nParam ~= 1001 and nParam ~= 1000) then
				SetNpcDeathScript(IndexNpc, "\\script\\EventThangLong1000\\boss\\npcdeath.lua");
				nIdxBoss = IndexNpc
			end
			if (nParam == 1001 and IndexNpc ~= 0) then
				if (nIdxBoss ~= 0) then
					if (tbNpcIndex[nIdxBoss] == nil) then
						tbNpcIndex[nIdxBoss] = {}
					end
						tbNpcIndex[nIdxBoss][getn(tbNpcIndex[nIdxBoss])+1] = IndexNpc
				end
			end--
		end
	end
end