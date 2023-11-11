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

	if CheckPlantConditionXiangSi() ~= 1 then
		return 1
	end
	
	local nMapId, nX, nY = GetWorldPos()
	local szPlayerName = GetName()
	local tbNpc = {
		szName = format("%s[%s]",  ACTIVITY_TREE_NAME_XIANGSI[1] , szPlayerName), 
		nLevel = 95,
		nMapId = nMapId,
		nPosX = nX*32,
		nPosY = nY*32,
		nNpcId = ACTIVITY_NPC_ID[1],
		nIsBoss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\19\\tree.lua",
		pCallBack = AddMeiGuiOrXiangSiTree,
		szTmpPlayerName = szPlayerName,
		}
	tbNpc.tbNpcParam[TREE_GROWSTEP] = 1
	tbNpc.tbNpcParam[TREE_OWNER] = 1
	tbNpc.tbNpcParam[TREE_PICKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKTIME] = GetCurServerTime()
	tbNpc.tbNpcParam[TREE_TASKRANDTIME] = random(1, 30)
	tbNpc.tbNpcParam[TREE_TASKSTARTTIME] = GetCurServerTime()
	tbNpc.tbNpcParam[TREE_TASKNAME] = -1
	tbNpc.tbNpcParam[TREE_TASKSCORE] = 0
	tbNpc.tbNpcParam[TREE_TYPE] = XIANGSI
	basemission_CallNpc(tbNpc)
	Msg2Player("Trång 1 §Ëu T­¬ng T­")
	
end

