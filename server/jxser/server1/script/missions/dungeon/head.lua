Include("\\script\\missions\\dungeon\\dungeon.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")
Include("\\script\\maps\\newworldscript_default.lua")
Include("\\script\\global\\offlinelive.lua")

--function InitMission()
--	local tbDungeon = tbDungeonInfo:GetDungeon(SubWorldIdx2ID(SubWorld));
--	if (tbDungeon ~= nil) then
--		tbDungeon:Init();
--	end
--end;

--function EndMission()
--	local tbDungeon = tbDungeonInfo:GetDungeon(SubWorldIdx2ID(SubWorld));
--	if (tbDungeon ~= nil) then
--		tbDungeon:Close();
--	end
--end;

--function RunMission()
--	local tbDungeon = tbDungeonInfo:GetDungeon(SubWorldIdx2ID(SubWorld));
--	if (tbDungeon ~= nil) then
--		tbDungeon:Run();
--	end
--end

--function OnLeave(nPlayerIndex)
--	local tbDungeon = tbDungeonInfo:GetDungeon(SubWorldIdx2ID(SubWorld));
--	local strName = doFunByPlayer(nPlayerIndex, GetName);
--	if (tbDungeon ~= nil) then
--		local bInDungeon = 0;
--		for i=1,getn(tbDungeon.tbMember) do
--			if(strName == tbDungeon.tbMember[i].strName and 
--				tbDungeon.tbMember[i].bInDungeon == 1)then
--				bInDungeon = 1;
--			end
--		end
		
--		if (bInDungeon == 1) then
--			doFunByPlayer(nPlayerIndex, tbDungeon.LeaveGame, tbDungeon);
--		end
--	else
--		local nTemplet = SubWorldIdx2MapCopy(SubWorld);
--		for i,v in tbDungeonManager.tbDungeonTempletList do
--			if (i ~= "n" and v.nMapTemplet == nTemplet) then
--				WriteLog(format("[%s] [%s] stuck in [%s] dungeon(templet:%0.f).", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, v.strDungeon, nTemplet));
--				doFunByPlayer(nPlayerIndex, v.LeaveGame, v);
--			end
--		end
--	end
--end

function OnNewWorld(szParam)
	local tbDungeon = tbDungeonInfo:GetDungeon(SubWorldIdx2ID(SubWorld));
	local strName = GetName();

	if (tbDungeon ~= nil) then
		if (tbDungeon:CheckPlayerCanJoin() ~= 1) then

			tbDungeon:OnLeave();
		else
			for i=1,getn(tbDungeon.tbMember) do
				if(strName == tbDungeon.tbMember[i].strName and 
					tbDungeon.tbMember[i].bInDungeon == 0)then
					tbDungeon:OnPlayerJoin();
					break;
				end
			end
		end
		--if tbDungeon:GetMissionState(SubWorldIdx2ID(SubWorld)) == 0 then
			--WriteLog(format("[%s] [%s] stuck in [%s] dungeon(templet:%0.f).", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, tbDungeon.strDungeon, tbDungeon.nMapTemplet));
			--tbDungeon:OnPlayerJoin();
		--end
	else
		local nTemplet = SubWorldIdx2MapCopy(SubWorld);
		for i,v in tbDungeonManager.tbDungeonTempletList do
			if (i ~= "n" and v.nMapTemplet == nTemplet) then
				WriteLog(format("[%s] [%s] stuck in [%s] dungeon(templet:%0.f).", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, v.strDungeon, nTemplet));
				v:OnLeave();
			end
		end
	end
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)	
	local tbDungeon = tbDungeonInfo:GetDungeon(SubWorldIdx2ID(SubWorld));
	local strName = GetName();

	if (tbDungeon ~= nil) then
--		if tbDungeon:GetMissionState(SubWorldIdx2ID(SubWorld)) == 0 then
			--local bInDungeon = 0;
			local strName = GetName();
			for i=1,getn(tbDungeon.tbMember) do
				if(strName == tbDungeon.tbMember[i].strName and 
					tbDungeon.tbMember[i].bInDungeon == 1)then
					tbDungeon.tbMember[i].bInDungeon = 0;
					tbDungeon:OnLeaveSetState();
					break;
				end
			end
			
			--if (bInDungeon == 1) then
				--WriteLog(format("[%s] [%s] stuck in [%s] dungeon(templet:%0.f).", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, tbDungeon.strDungeon, tbDungeon.nMapTemplet));
			--	tbDungeon:OnLeave();
			--end
--		end
	else
		local nTemplet = SubWorldIdx2MapCopy(SubWorld);
		for i,v in tbDungeonManager.tbDungeonTempletList do
			if (i ~= "n" and v.nMapTemplet == nTemplet) then
				WriteLog(format("[%s] [%s] stuck in [%s] dungeon(templet:%0.f).", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, v.strDungeon, nTemplet));
				v:OnLeaveSetState();
			end
		end
	end
	
	OnLeaveWorldDefault(szParam)
end

function OnTimer()
--	local tbDungeon = tbDungeonInfo:GetDungeon(SubWorldIdx2ID(SubWorld));
--	if (tbDungeon ~= nil) then
--		tbDungeon:Timer();
--	end
end;