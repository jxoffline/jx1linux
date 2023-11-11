Include("\\script\\activitysys\\config\\19\\valentinehead.lua")
Include("\\script\\missions\\basemission\\lib.lua")

function main()
	
	ValentineResetTask()
	
	if IsInValentine() ~= 1 then
		return 
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1
	end

	if CheckPlantConditionQingRen() ~= 1 then
		return 1
	end
	
	local _, nX, nY = GetWorldPos()
	local szPlayerName = GetName()
	local tbNpc = {
		szName = format("%s[%s]",  ACTIVITY_TREE_NAME_QINGREN[1],szPlayerName ), 
		nLevel = 95,
		nMapId = SubWorldIdx2ID(SubWorld),
		nPosX = nX*32,
		nPosY = nY*32,
		nNpcId = ACTIVITY_NPC_ID[1],
		nIsBoss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\19\\qingrentree.lua",
		pCallBack = AddQingRenTree,
		szTmpPlayerName = szPlayerName,
		}
	tbNpc.tbNpcParam[TREE_GROWSTEP] = 1
	tbNpc.tbNpcParam[TREE_OWNER] = 1
	tbNpc.tbNpcParam[TREE_PICKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKTIME] = GetCurServerTime()

	basemission_CallNpc(tbNpc)
		
	Msg2Player("Trång 1 H¹t Gièng C©y T×nh Nh©n")
	
	local tbPos = cutround_in8(nX, nY, 8)
	for i = 1, getn(tbPos) do
		CastSkill(675, 1, tbPos[i][1] * 32, tbPos[i][2] * 32)
	end
	
end

function cutround_in8(x, y, npart)
	local tb = {}
	local angle = 0
	for i = 1, npart do
		local x1, y1 = floor(x + tonumber(format("%2.2f",cos(angle)*3))), floor(y + tonumber(format("%2.2f",sin(angle)*3)))
		angle = angle + floor(360/npart)
		tb[i] = {x1, y1}
	end
	return tb;
end

