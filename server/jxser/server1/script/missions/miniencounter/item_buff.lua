Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function IsPickable(nItemIndex, nPlayerIndex)
	return 1;
end

Item_2_Skill = {
	["6,1,3534"] = {1, 1298},
	["6,1,3535"] = {2, 1299},
	["6,1,3536"] = {3, 1300},
	["6,1,3537"] = {4, 1301},
	["6,1,3538"] = {5, 1302},--5
	["6,1,3539"] = {6, 1303},
	["6,1,3540"] = {7, 1304},
	["6,1,3541"] = {8, 1305},
	["6,1,3542"] = {9, 1306},
	["6,1,3543"] = {10, 1307},--10
	["6,1,3544"] = {11, 1310},
	["6,1,3545"] = {12, 1310},
	["6,1,3546"] = {13, 1311},
	["6,1,3547"] = {14, 1312},
}


function PickUp(nItemIndex, nPlayerIndex)
	local nG,nD,nP = GetItemProp(nItemIndex)
	local szGDP = format("%d,%d,%d", nG, nD, nP)
	local tbData = Item_2_Skill[szGDP]
	if not tbData then
		return 0
	end
	
	if IsMyItem(nItemIndex) == 1 then
		AddSkillState(tbData[2], random(1, 5), 1, 3 * 60 * 18, 1);

		local strMsg = format("Nh薾 頲 %s hi謚 鴑g", DungeonGlobalData.tbBuff[tbData[1]].szName);
		CallPlayerFunction(nPlayerIndex, Msg2Player, strMsg);

		-- 统计信息
		local nBuffNum = GetTask(DungeonGlobalData.TASK_GET_ENEMY_BUFF_NUM);
		if nBuffNum < 0 then
			nBuffNum = 0;
		end

		nBuffNum = nBuffNum + 1;
		SetTask(DungeonGlobalData.TASK_GET_ENEMY_BUFF_NUM, nBuffNum);

		local nPlayerMapId = GetWorldPos();
		local tbMap = EncounterMapManager:FindInMapList(nPlayerMapId);
		if tbMap then
			local tbPlayer = tbMap:GetPlayer(GetName());
			if tbPlayer then
				tbPlayer.nGetBattleBuffNum = nBuffNum;
			end
		end

		return 0;							   -- 删除物品
	end
end
