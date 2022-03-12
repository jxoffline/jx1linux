Include("\\script\\missions\\miniencounter\\publicdef.lua");
EncounterPlayer = {};

function EncounterPlayer:new(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tb = {};
	tb.szRoleName = szRoleName;
	tb.nSignTime  = 0;
	tb.nLockTime  = 0;								-- 加入黑名单时服务器时间

	for k, v in self do
		tb[k] = v;
	end

	return tb;
end



function EncounterPlayer:CheckPlayerState()
	if DungeonGlobalData:IsInValidWaitMap(self.szRoleName) then
		return 1;
	end
	return nil;
end

