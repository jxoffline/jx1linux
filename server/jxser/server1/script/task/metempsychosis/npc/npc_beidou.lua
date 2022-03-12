Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")
Include("\\script\\task\\metempsychosis\\translife_7.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\npc\\npcdeath_beidou_boss.lua")


tbFeatureNpc = {}

function tbFeatureNpc:Dialog(nNpcIndex)
	local nBelongPlayerUID = GetNpcParam(nNpcIndex, 1)
	local nCurPlayerUUID = GetUUID()
	
	if nBelongPlayerUID ~= mod(nCurPlayerUUID, g_nNpcParamFactor)  then
		Say(TL7_CONFIG.tbLang[17], 0 );
		return
	end
	
	TransLife7:OnReplyTask()
end

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	local nRemoveFlag = GetNpcParam(nNpcIndex, 2)
	if nRemoveFlag == 1 then
		return 
	end
	return tbFeatureNpc:Dialog(nNpcIndex)
end

function OnTimer(nNpcIndex, nTimeout)
	DelNpc(nNpcIndex)
	SetNpcParam(nNpcIndex, 2, 1)
end
