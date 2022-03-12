Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\chuangguang30.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	
	tbDailog.szTitleMsg = "<#><npc>Xin chóc mõng c¸c ch­ vÞ ®· v­ît qua ®­îc 29 cöa ¶i trong thêi gian 13 phót, Muèn tiÕp tôc V­ît ¶i chø!"
	
	tbDailog:AddOptEntry("TiÕp tôc V­ît ¶i", gotonewworld); 
	
	tbDailog:AddOptEntry("Rêi khái", leave); 	
	tbDailog:Show()
end


function leave()
	local world = GetMissionV(VARV_SIGNUP_WORLD);
	local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	DelMSPlayer(MISSION_MATCH,1);
	SetLogoutRV(0);
	NewWorld(world, pos_x, pos_y);
end


function gotonewworld()
	local ndate = tonumber(GetLocalDate("%H"))
	if ndate > 22 and ndate < 10 then
		Say("Trong thêi gian nµy kh«ng thÓ tiÕn hµnh tiÕp tôc V­ît ¶i", 0)
		leave()
		return 
	end
	local nMinute = tonumber(GetLocalDate("%M"))
	if nMinute >= 24 then
		Talk(1, "", "Xin l­îng thø, Ng­¬i ®· v­ît qu¸ thêi gian truyÒn tèng") 
		return
	end
	if GetMissionV(VARV_BOARD_TIMER) >= (CHUANGGUAN30_TIME_LIMIT + 60) then
		Say("Xin l­îng thø, Ng­¬i ®· v­ît qu¸ thêi gian truyÒn tèng!",0)
		return 
	end
	-- wangjingjun
	local nX,nY, nMapIndex = GetPos()
	SetTask(PLAYER_MAP_TASK, SubWorldIdx2ID(nMapIndex)) -- ½«Íæ¼ÒµÄµ±Ç°µØÍ¼µÄID±£´æÏÂÀ´
	-- ´Ó\\settings\\maps\\liandandong\\npc_3.txtÖÐÑ¡ÔñµÄÒ»¸öÎ»ÖÃ
	NewWorld(CHUANGGUAN30_MAP_ID, floor(51072/32), floor(102272/32))	-- ´«ËÍµ½ÐÂµÄµØÍ¼
end
