-- description	: Íæ¼ÒËÀÍö
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\dragonboat\\include.lua")

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
	
	-- ´«ËÍ»Ø±¨ÃûµØµã
	-- local world = GetMissionV(VARV_SIGNUP_WORLD);
	-- local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	-- local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	-- NewWorld(world, pos_x, pos_y);
	-- -- DEBUG
	-- print(format("%sÔÚÁúÖÛ±ÈÈüÖĞËÀÍö£¬±»Ìß»Ø(%d,%d,%d)Î»ÖÃ", GetName(), world, pos_x, pos_y));
end
