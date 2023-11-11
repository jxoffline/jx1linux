Include("\\script\\activitysys\\config\\1021\\extend.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local _GetGatherObj = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	if (IsNpcHide(nNpcIndex) == 1) then
		return 0;
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
		return 0;
	end
	
	PlayerFunLib:GetItem(ITEM_MATERIAL_4, 5, EVENT_LOG_TITLE, "NhanDuocLiTamThao")
	
	KillNpcWithIdx(nNpcIndex, PIdx2NpcIdx(PlayerIndex));
end

function main()
	local nNpcIndex = GetLastDiagNpc();
	
	if (pActivity:IsOpen() ~= 1) then
		return
	end
	if (PlayerFunLib:CheckTotalLevel(150,"default",">=") ~= 1) then
		return
	end
		
	local dwNpcId = GetNpcId(nNpcIndex);
	--开启进度条
	tbProgressBar:OpenByConfig(7, %_GetGatherObj, {nNpcIndex, dwNpcId})	
end

function OnTimer(nNpcIndex, nTimeOut) 
end

function OnDeath(nNpcIndex)
end