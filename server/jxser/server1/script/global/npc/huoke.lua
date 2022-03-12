IncludeLib("NPCINFO");


Include("\\script\\missions\\basemission\\lib.lua");
local PARAM_CAST_RETURN_DMG_TIME = 1

local PARAM_CLEAR_DEBUFF_TIME = 2

local PARAM_CAST_SKILL_TIME = 3

local SKillCD = 180
local nMap = 341


local tbBossPos = 
{
	{nMap, 1435, 2762},
	{nMap, 1507, 2436},
	{nMap, 1272, 2842},
	{nMap, 1427, 3042},
	{nMap, 1433, 3158},
	
}

function CallHuoKeInit()
	do return end
	if SubWorldID2Idx(%nMap) <= 0 then
		return 
	end
	
	local nYear = tonumber(GetLocalDate("%Y"))
	local nMonth = tonumber(GetLocalDate("%m"))
	local nDay = tonumber(GetLocalDate("%d"))
	
	local nTime = Tm2Time(nYear, nMonth, nDay, 22, 00)
	
	local nNextTime = nTime - GetCurServerTime() 
	
	
	if nNextTime == 0 then
		return CallHuoKeBoss()
	elseif nNextTime < 0 then
		nNextTime = nNextTime + 24 * 60 * 60
	end
	
	
	
	AddTimer(nNextTime * 18,  "CallHuoKeTime", 0)
	
	print(format("Sau chõng nµy gi©y h·y tim Ho¾c Kh¾c %s",  FormatTime2String("%Y-%m-%d %H:%M:%S", GetCurServerTime() + nNextTime)))
end

function CallHuoKeTime(nId, nParam)
	if SubWorldID2Idx(%nMap) > 0 then
		CallHuoKeBoss()
	end
	return 0,0
end


function CallHuoKeBoss(nMapId, nPosX, nPosY)
	
	
	local tbNpc = {szName = "Ho¾c Kh¾c", nIsboss = 1, nNpcId = 1584, nLevel = 119, nTime = 10, szScriptPath = "\\script\\global\\npc\\huoke.lua"}
	
	
	if nMapId == nil or nPosX == nil or nPosY == nil then
		local nIdx = random(1, getn(%tbBossPos))
		nMapId = %tbBossPos[nIdx][1]
		nPosX = %tbBossPos[nIdx][2]
		nPosY = %tbBossPos[nIdx][3]	
	end
	AddGlobalNews(format("Ho¾c Kh¾c xuÊt hiÖn t¹i M¹c B¾c Th¶o Nguyªn (%d, %d)", nPosX/8, nPosY/16))
	
	basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)
end

function TestCall()
	local nPosX, nPosY, nMapIndex = GetPos()
	
	CallHuoKeBoss(SubWorldIdx2ID(nMapIndex), nPosX/32, nPosY/32)
end


function main()
	
	
end




local nLifePercent = 75

function OnTimer(nNpcIndex, nTimeOut)
	local nMaxLife = NPCINFO_GetNpcCurrentMaxLife(nNpcIndex);
	local nCurLife = NPCINFO_GetNpcCurrentLife(nNpcIndex);
	
	
	
	local nCurServerTime = GetCurServerTime()
	if %nLifePercent then
		if nCurLife  <=  %nLifePercent * nMaxLife / 100 then
			
			if GetNpcParam(nNpcIndex, %PARAM_CAST_RETURN_DMG_TIME) + %SKillCD <= nCurServerTime then
				AddNpcSkillState(nNpcIndex, 983, 30, 1, 18 * 30)
				SetNpcParam(nNpcIndex, %PARAM_CAST_RETURN_DMG_TIME, nCurServerTime)
			end
		end
	end
	if GetNpcParam(nNpcIndex, %PARAM_CLEAR_DEBUFF_TIME) + 5 <= nCurServerTime then
		NpcCastSkill(nNpcIndex, 738, 50, nNpcIndex, -1)
		SetNpcParam(nNpcIndex, %PARAM_CLEAR_DEBUFF_TIME, nCurServerTime)
	end
	
	
	
	SetNpcTimer(nNpcIndex, 10);
end


function OnDeath()
	
	CallHuoKeInit()
end