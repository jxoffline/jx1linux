Include("\\script\\activitysys\\config\\32\\gatherdailytask.lua")
Include("\\script\\activitysys\\config\\32\\daily.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local _GetGatherObj = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	if (IsNpcHide(nNpcIndex) == 1) then
		return 0;
	end
	
	local tbTask = tbGatherDailyTask:GetTaskData(GetNpcParam(nNpcIndex, 1));
	if not tbTask then
		return 0;
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
		return 0;
	end
	
	tbAwardTemplet:GiveAwardByList({szName=tbTask.szGatherName,tbProp={tbTask.tbItem[1], tbTask.tbItem[2],tbTask.tbItem[3],1,0,0}, nBindState=-2, nExpiredTime=60}, format("NhiÖm vô thu thËp hµng ngµy%s",tbTask.szGatherName));
	
	KillNpcWithIdx(nNpcIndex, PIdx2NpcIdx(PlayerIndex));
end

function main()
	if (pActivity:IsOpen() ~= 1) then
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local nTskId = GetNpcParam(nNpcIndex, 1);
	
	local tbTask = tbGatherDailyTask:GetTaskData(nTskId);
	if not tbTask then
		return
	end
	
	if (tbGatherDailyTask:CheckCanGather(tbTask.tbItem[1], tbTask.tbItem[2], tbTask.tbItem[3]) ~= 1) then
		return
	end
	
	
	local dwNpcId = GetNpcId(nNpcIndex);
	--¿ªÆô½ø¶ÈÌõ
	tbProgressBar:OpenByConfig(1, %_GetGatherObj, {nNpcIndex, dwNpcId})	
end

function OnTimer(nNpcIndex, nTimeOut) 
end

function OnDeath(nNpcIndex)
end