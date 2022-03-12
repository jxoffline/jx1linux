Include("\\script\\lib\\log.lua")
function OnTimer( nNpcIndex, nTimeOut )
	local _, nCount = GetNpcAroundPlayerList(nNpcIndex, 64);
	local nId = GetNpcSettingIdx(nNpcIndex)
	tbLog:TabFormatLog("[BOSS]", nNpcIndex, nId, 64, nCount)
	local _, nCount2 = GetNpcAroundPlayerList(nNpcIndex, 32);
	tbLog:TabFormatLog("[BOSS]", nNpcIndex, nId, 32, nCount2)
	SetNpcTimer(nNpcIndex, 18*10);
end