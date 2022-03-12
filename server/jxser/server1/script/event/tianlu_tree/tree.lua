Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\event\\tianlu_tree\\awardlist.lua")

local NPC_PARAM_OWNER = 1
local NPC_PARAM_TIME = 2
local NPC_PARAM_STATE = 3

local tbPlayerList = {}
local NPC_STATE_SEEDLING = 1
local NPC_STATE_GROW = 2
local NPC_STATE_MATURE = 3
local NPC_STATE_DEATH = 4

local tbNpc = 
{
	szScript = "\\script\\event\\tianlu_tree\\tree.lua",
	[1]={nNpcId = 1965, szName = "C©y Thiªn Léc Non", nTime = 15},
	[2]={nNpcId = 1966, szName = "C©y Thiªn Léc Sinh Tr­ëng", nTime = 15},
	[3]={nNpcId = 1967, szName = "C©y Thiªn Léc Tr­ëng Thµnh", nTime = 15},
}

local Harvest = function(nNpcIndex, nOwner)

	local szPlayerName = GetName()
	local nNewOwner = GetNpcParam(nNpcIndex, %NPC_PARAM_OWNER)
	
	if %tbPlayerList[nOwner] ~= szPlayerName then
		return
	end
	--exp	
	local nTmpExp = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\double_mission_award.lua", "tbVnX2Award:X2Tianlu", 1000000)
	tbAwardTemplet:Give({szName = "§iÓm Kinh NghiÖm", nExp=nTmpExp}, 1, {"TRONGCAYTHIENLOC", "NhanPhanThuongHatGiongThienLoc"})	
	--Trao th­ëng thu ho¹ch
	tbAwardTemplet:Give(%tbAward_A, 1, {"TRONGCAYTHIENLOC", "NhanPhanThuongHatGiongThienLoc"})		
--	tbLog:PlayerActionLog("TRONGCAY_THIENLOC", "CayDaNhanThuong", %tbPlayerList[nOwner])
	WriteLog(format("%s\t%s\t[%s]CayBienMatDaNhanThuong", GetLocalDate("%Y-%m-%d %H:%M:%S"), "TRONGCAY_THIENLOC",szPlayerName))
--	local szNpcName = GetNpcName(nNpcIndex)
--	if szNpcName ~= "³¤³ÉµÄÌìÂ»Ê÷" then
--		return
--	end
	
	G_ACTIVITY:OnMessage("HarvestPlants", "tianlu_tree", nNpcIndex)
	EventSys:GetType("HarvestPlants"):OnPlayerEvent("tianlu_tree", PlayerIndex, nNpcIndex)
	%tbPlayerList[nOwner] = nil
	DelNpc(nNpcIndex)
end

local ChangTreeState = function(nPlantTime, nOwner, nTreeState, nMapIndex, nX, nY)
	local nNpcIndex = AddNpcEx(%tbNpc[nTreeState].nNpcId, 1, random(0,4), nMapIndex, nX, nY, 1, %tbNpc[nTreeState].szName,0)
	if nNpcIndex >= 0 then
		SetNpcTimer(nNpcIndex, 18)
		SetNpcScript(nNpcIndex, %tbNpc.szScript)
		SetNpcParam(nNpcIndex, %NPC_PARAM_OWNER, nNpcIndex)
		SetNpcParam(nNpcIndex, %NPC_PARAM_TIME, nPlantTime)
		SetNpcParam(nNpcIndex, %NPC_PARAM_STATE, nTreeState)		
		tbLog:PlayerActionLog("TRONGCAY_THIENLOC","TrongCayThanhCong",%tbNpc[nTreeState].szName, %tbPlayerList[nNpcIndex], nMapIndex..", "..nX..", "..nY..",Time ="..nPlantTime)	
		return nNpcIndex
	end
	tbLog:PlayerActionLog("TRONGCAY_THIENLOC", "TrongCayThatBai", %tbNpc[nTreeState].szName,%tbPlayerList[nNpcIndex],nMapIndex..", "..nX..", "..nY..",Time ="..nPlantTime)
	return
end

function CreateTree(nPlayerIndex)
	local szPlayerName = GetName(nPlayerIndex)
	local nX, nY, nMapIndex = CallPlayerFunction(nPlayerIndex, GetPos)
	local nTime = GetCurServerTime();
	
	local nNpcIndex = %ChangTreeState(nTime, nPlayerIndex, %NPC_STATE_SEEDLING, nMapIndex, nX, nY)
	if nNpcIndex then
		%tbPlayerList[nNpcIndex] = szPlayerName
	end
end

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local szPlayerName = GetName()
	local nOwner = GetNpcParam(nNpcIndex, %NPC_PARAM_OWNER)
	local szOwnerName = %tbPlayerList[nOwner]
	if (szOwnerName ~= szPlayerName) then --²»ÊÇµ±Ç°Íæ¼ÒµÄÊ÷ 
		Talk(1, "", "§©y kh«ng ph¶i lµ c©y cña ng­¬i.")
		return
	end
	local nNpcState = GetNpcParam(nNpcIndex, %NPC_PARAM_STATE)
	if nNpcState ~= 3 then
		Talk(1, "", "C©y Thiªn Léc cña ng­¬i vÉn ch­a lín.")
		return
	end
	
	if CalcFreeItemCellCount() < 4 then
		local szMsg = format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.", 4)
		Talk(1, "", szMsg)
		return
	end
	tbProgressBar:OpenByConfig(3, %Harvest, {nNpcIndex, nOwner});
end

function OnTimer(nNpcIndex, nTimeOut)
	local nNpcOwner = GetNpcParam(nNpcIndex, %NPC_PARAM_OWNER)

	local nLastState = GetNpcParam(nNpcIndex, %NPC_PARAM_STATE)
	local nCurState = 0
	
	local nCurrentTime = GetCurServerTime()
	local nPlantTime = GetNpcParam(nNpcIndex, %NPC_PARAM_TIME)
	local nTime = nCurrentTime - nPlantTime
	if (nTime > 60) then
		nCurState =	%NPC_STATE_DEATH
	elseif (nTime > 30) then
		nCurState = %NPC_STATE_MATURE
	elseif (nTime > 15) then
		nCurState = %NPC_STATE_GROW
	else
		nCurState = %NPC_STATE_SEEDLING
	end
	if (nCurState == 	%NPC_STATE_DEATH) then
		WriteLog(format("%s\t%s\t[%s]CayBienMatChuaNhanThuong", GetLocalDate("%Y-%m-%d %H:%M:%S"), "TRONGCAY_THIENLOC", %tbPlayerList[nNpcOwner]))
		%tbPlayerList[nNpcOwner] = nil
		DelNpc(nNpcIndex)
		return
	end
	if nLastState ~= nCurState then --Ê÷µÄ³É³¤×´Ì¬¸Ä±ä
		local nX, nY, nMapIndex = GetNpcPos(nNpcIndex)
		DelNpc(nNpcIndex)
		nNpcIndex = %ChangTreeState(nPlantTime, nNpcOwner, nCurState, nMapIndex, nX, nY)
		if nNpcIndex then			
			%tbPlayerList[nNpcIndex] = %tbPlayerList[nNpcOwner]
			%tbPlayerList[nNpcOwner] = nil
			return 
		end
	end
	SetNpcTimer(nNpcIndex, 18);
end