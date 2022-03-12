Include("\\script\\missions\\basemission\\lib.lua")

Include("\\script\\missions\\qianchonglou\\rule.lua")

NPC_PARAM_RANK = 1
NPC_PARAM_TRACK = 2
NPC_PARAM_POS = 3
NPC_PARAM_DEATH = 4
NPC_PARAM_OFFSET_X = 5
NPC_PARAM_OFFSET_Y = 6
TRACK_LIST = {}

TRACK_FILE_LIST = 
{
	"\\settings\\missions\\qianchonglou\\track_1.txt",
	"\\settings\\missions\\qianchonglou\\track_2.txt",
	"\\settings\\missions\\qianchonglou\\track_3.txt",
	"\\settings\\missions\\qianchonglou\\track_4.txt",
	"\\settings\\missions\\qianchonglou\\track_5.txt",
	"\\settings\\missions\\qianchonglou\\track_6.txt",
}

function load_all_track_file()
	TRACK_LIST = {}
	for i=1, getn(%TRACK_FILE_LIST) do
		TRACK_LIST[i] = {}
		load_track_file(TRACK_LIST[i], %TRACK_FILE_LIST[i])
	end
end

function load_track_file(tbTrack, szFile)
	
	if TabFile_Load(szFile, szFile) == 1 then
		local nRow = TabFile_GetRowCount(szFile)
		for i=2, nRow do
			local nX32 = tonumber(TabFile_GetCell(szFile, i, 1))
			local nY32 = tonumber(TabFile_GetCell(szFile, i, 2))
			tinsert(tbTrack, {nX32, nY32})
		end
	end
end

load_all_track_file()


local tbNpcList = 
{
	{szName = "Qu˚ CËc (1 Æi”m)", nNpcId = 1892, nRank = 1, nRate = 19},
	{szName = "M∆c C´ng(2 Æi”m)", nNpcId = 1893, nRank = 2, nRate = 19},
	{szName = "Thi™n Thu…n (4 Æi”m)", nNpcId = 1894, nRank = 3, nRate = 14},
	{szName = "Th≠Óng Hi“n (7 Æi”m)", nNpcId = 1895, nRank = 4, nRate = 10},
	{szName = "Phi Nhπc (10 Æi”m)", nNpcId = 1896, nRank = 5, nRate = 9},
	{szName = "Hinh TrÛc(20 Æi”m)", nNpcId = 1897, nRank = 6, nRate = 7},
	{szName = "ThÒy Kinh( 30 Æi”m)", nNpcId = 1898, nRank = 7, nRate = 5},
	{szName = "S¨n Loan (40 Æi”m)", nNpcId = 1899, nRank = 8, nRate = 5},
	
	{szName = "∂nh T´ng (50 Æi”m)", nNpcId = 1900, nRank = 9, nRate = 4},
	{szName = "Th≠¨ng Lan (60 Æi”m)", nNpcId = 1901, nRank = 10, nRate = 4},
	
	{szName = "Khi’u Khung (100 Æi”m)", nNpcId = 1902, nRank = 11, nRate = 4},
	
}

function get_random_rank_npc()	
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	for i=1,getn(%tbNpcList) do
		local pNpc = %tbNpcList[i]
		rstep=rstep+floor(pNpc.nRate*rtotal/100);
		if(rcur <= rstep) then
			return pNpc
		end
	end
end

--tbTemp = {}

--function clear_npc(nMapId)
--	tbTemp[nMapId] = 0
--end

function add_monster(nMapId)
	
	local nTrackId = random(1, getn(%TRACK_LIST))
	
	local pTrack =  %TRACK_LIST[nTrackId]
	
	if not pTrack then
		return
	end
	
	local pNpc = get_random_rank_npc()
	if not pNpc then
		return
	end
	
	local nOffsetX = random(-32*3,32*3)
	local nOffsetY = random(-32*3,32*3)
	
	
	local szScriptPath = "\\script\\missions\\qianchonglou\\npc\\monster.lua"
	
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		local nNpcIndex = AddNpcEx(pNpc.nNpcId, 95, random(0,4), nMapIndex, pTrack[1][1] + nOffsetX, pTrack[1][2] + nOffsetY, 1, pNpc.szName, 1)
		if nNpcIndex > 0 then
			SetNpcAI(nNpcIndex, 0)
			SetNpcActiveRegion(nNpcIndex, 1)
			SetNpcParam(nNpcIndex, %NPC_PARAM_RANK, pNpc.nRank)
			SetNpcParam(nNpcIndex, %NPC_PARAM_TRACK, nTrackId)
			SetNpcParam(nNpcIndex, %NPC_PARAM_POS, 1)
			SetNpcParam(nNpcIndex, %NPC_PARAM_OFFSET_X, nOffsetX)
			SetNpcParam(nNpcIndex, %NPC_PARAM_OFFSET_Y, nOffsetY)
			SetNpcScript(nNpcIndex, szScriptPath)
			SetNpcTimer(nNpcIndex, 18)
			--tbTemp[nMapId] = tbTemp[nMapId] + 1
		end
	end

end

function OnTimer(nNpcIndex, nTimeOut)
	if moster_walk(nNpcIndex) == 1 then
		SetNpcTimer(nNpcIndex, 18)
	end
end

function is_arrive_at(nNpcIndex, nX, nY)
	local MAX_DIS = 32*3
	local nX32, nY32 = GetNpcPos(nNpcIndex)
	
	if abs(nX - nX32) < MAX_DIS and abs(nY - nY32) < MAX_DIS then
		return 1
	end
end

function moster_walk(nNpcIndex)
	local nTrackId = GetNpcParam(nNpcIndex, %NPC_PARAM_TRACK)
	local nPosId = GetNpcParam(nNpcIndex, %NPC_PARAM_POS)
	local pTrack = %TRACK_LIST[nTrackId]
	if not pTrack then
		return
	end
	local tbPos =  %TRACK_LIST[nTrackId][nPosId]
	if not tbPos then
		return
	end
	if GetNpcParam(nNpcIndex, %NPC_PARAM_DEATH) == 1 then
		return
	end
	local nOffsetX = GetNpcParam(nNpcIndex, %NPC_PARAM_OFFSET_X)
	local nOffsetY = GetNpcParam(nNpcIndex, %NPC_PARAM_OFFSET_Y)
	
	if is_arrive_at(nNpcIndex, tbPos[1] + nOffsetX, tbPos[2] + nOffsetY) then
		nPosId = nPosId + 1
		SetNpcParam(nNpcIndex, %NPC_PARAM_POS, nPosId)
		tbPos =  %TRACK_LIST[nTrackId][nPosId]
	end
	local szName = GetNpcName(nNpcIndex)
	
	if nPosId > getn(pTrack) then
		SetNpcParam(nNpcIndex, %NPC_PARAM_DEATH, 1)
		local _,_, nMapIndex = GetNpcPos(nNpcIndex)
		local nMapId = SubWorldIdx2ID(nMapIndex)
		DelNpc(nNpcIndex)
		--tbTemp[nMapId] = tbTemp[nMapId] - 1
		add_monster(SubWorldIdx2ID(nMapIndex))
		return
	else
		NpcWalk(nNpcIndex, tbPos[1] /32 + nOffsetX/32, tbPos[2] /32 + nOffsetY/32)
		return 1	
	end
end


function moster_on_hit(nGunRank, nTargetNpcIndex, nLauncherNpcIndex)

	local nPlayerIndex = NpcIdx2PIdx(nLauncherNpcIndex)
	
	if nPlayerIndex <= 0 then
		return
	end
	
	if GetNpcParam(nNpcIndex, %NPC_PARAM_DEATH) == 1 then
		return
	end
	
	PlayerIndex = nPlayerIndex
	local nNpcRank = GetNpcParam(nTargetNpcIndex, %NPC_PARAM_RANK)
	local _,_, nMapIndex = GetNpcPos(nTargetNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	
	if nGunRank > 0 then
		if pDungeon:IsDefeatedNpc(nNpcRank, nGunRank) == 1 then
			pDungeon:AwardPoint(nNpcRank)
			pDungeon:AddExtraPower(nNpcRank)
			KillNpcWithIdx(nTargetNpcIndex, nLauncherNpcIndex)
			--tbTemp[nMapId] = tbTemp[nMapId] - 1
			add_monster(nMapId)
		end
	elseif nGunRank == 0 then
		pDungeon:AwardPoint(nNpcRank)
		KillNpcWithIdx(nTargetNpcIndex, nLauncherNpcIndex)
		--tbTemp[nMapId] = tbTemp[nMapId] - 1
		add_monster(nMapId)
	end
end