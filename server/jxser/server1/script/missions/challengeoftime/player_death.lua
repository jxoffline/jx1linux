-- description	: Íæ¼ÒËÀÍö
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnDeath(index)
	-- ĞŞ¸ÄÍæ¼ÒÈËÊı
	local count = GetMSPlayerCount(MISSION_MATCH) - 1;
	if (count < 0) then
		count = 0;
	end
	SetMissionV(VARV_PLAYER_COUNT, count);

	if (GetMissionV(VARV_NPC_COUNT) ~= 0) then
		-- ÊÇ·ñ¶Ó³¤ÕóÍö
		local name = GetMissionS(VARS_TEAM_NAME);
		if (name == GetName()) then
			broadcast(name .. "§éi tr­ëng ®éi ngò tö vong!");
		end
		
		-- ÊÇ·ñÈ«¾ü¸²Ãğ
		if (count == 0) then
			broadcast(name .. "Toµn ®éi tö vong hÕt!");
		end
	end

	DelMSPlayer(MISSION_MATCH, 1);
	-- ÔÚmissionÄÚÍ¨¸æÍæ¼ÒËÀÍö
	Msg2MSAll(MISSION_MATCH, GetName() .. "Kh«ng may t¹i trËn tö vong!");	
	SetLogoutRV(0)	
	NewWorld(11,3207,4978)
	
end
