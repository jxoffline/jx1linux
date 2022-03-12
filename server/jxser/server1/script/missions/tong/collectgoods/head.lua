if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\tong\collectgoods\npcpoint.lua]]);
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include([[\script\missions\tong\tong_head.lua]]);
	
	--³£Öµ²¿·Ö
	COLLG_PREPAREMISSIONID = 44;
	COLLG_MISSIONID = 45;
	COLLG_MAXPLAYERCOUNT = 10;	--Ã¿¸öÓÎÏ·×î¶à10¸öÈË£»
	COLLG_ALL_MAXPLAYERCOUNT = 120; --Ò»¹²×î¶à120ÈË£»
	
	COLLG_FRAME = 18;	--Ã¿Ãë18Ö¡
	COLLG_REFRASHTIME = 15 * COLLG_FRAME; -- Ã¿15ÃëÖÓË¢Ò»´Î¹Ö
	COLLG_VANISHTIME = 10 * COLLG_FRAME;	--Ê¥µ®¾«ÁéÍ£Áô10ÃëÖÓ
	COLLG_RUNINTERVER = 30 * COLLG_FRAME; --30ÃëÒ»´Î£¬¿ÉÒÔ¹«¸æÓÎÏ·
	COLLG_BOMBINTERVER = 30 * COLLG_FRAME; --30Ãë±¬Õ¨Ò»´Î£¬
	COLLG_MAXPLAYTIMES = 5; --Ã¿ÈË×î¶àÒ»ÌìÍæ8´Î
	
	COLLG_PREPARETIME = 75; --×¼±¸³¡¼ÆÊ±Æ÷
	COLLG_SMALLTIMERID = 76;	--Ë¢¹Ö¼ÆÊ±Æ÷
	COLLG_RUNTIMERID = 77;	--RunMissionÓÃµÄ¼ÆÊ±Æ÷£»

	COLLG_INTERVER = 5 * COLLG_FRAME;	--5ÃëÖÓ´¥·¢Ë¢¹ÖºÍÇå³þ¹Ö´¥·¢Æ÷
	--ÎïÆ·µÄindexÖµ£»
	COLLG_GOODSIDX = 1086;
	--GLBÖµ
	GLB_COLLG_PHASE = 918;
	--===============ºÍ¹ÖÏà¹Ø==================
	COLLG_NPCID = 1121;	--Ë¢³ö¹ÖµÄNCP index
	COLLG_MAPID = {827, 828};	--Ê¥µ®»î¶¯µØÍ¼Id
	
	COLLG_SMALLMAPCOUNT = 23;	--Ò»¹²ÓÐ12ÕÅÐ¡µØÍ¼
	COLLG_MOUSECOUNT = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×îÉÙË¢µØÊóÊýÄ¿
	--=========================================
	
	--=========ÈÎÎñ±äÁ¿===============
--	TK_LEAVERMAPID = 2423;	--´æ´¢Àë¿ªÓÎÏ·µÄmapid
--	TK_LEAVERPOSX = 2424;	--´æ´¢Àë¿ªÓÎÏ·µÄx×ø±êµã
--	TK_LEAVERPOSY = 2425;	--´æ´¢Àë¿ªÓÎÏ·µÄy×ø±êµã
	
	COLLG_TK_DAYKEY = 2402;		--¼ÇÂ¼ÊÇÄÄÒ»Ìì
	COLLG_TK_PLAYTIMES = 2403; 	--¼ÇÂ¼Ò»ÌìÄÚÍæµÄ´ÎÊý
	
	COLLG_COUNT_ONETIME = 2404;	--¼ÇÂ¼Ò»³¡µãÁË¶àÉÙ¸ö
	COLLG_TK_RANK = 2408;			--¼ÇÂ¼Ò»³¡µÄÅÅÃû£»
--	
--	TK_GROUPID = 2430;	--¼ÇÂ¼Íæ¼ÒµÄGroupºÅ
--	TK_EXP_TIME = 2432;
	
	COLLG_TK_BOMB_MARK = 2409;	--¼ÇÂ¼ÊÇ±»µÚ¼¸¸öÕ¨µ¯Õ¨ÖÐ
	--================================
	
	--MS²¿·Ö£»
	COLLG_MS_STATE = 1;
	COLLG_MS_TIMERSTATE = 2; --ÓÃÀ´¼ÇÂ¼ÓÃÓÚ½»ÌæµÄ½øÐÐË¢¹ÖºÍÇå³ý¹Ö£º0£­Çå³ý¹Ö£»1£­Ë¢³ö¹Ö
	COLLG_MS_NEWSVALUE = 3; --
	COLLG_MS_BEGINGMAPID = 10; --¼ÇÂ¼¿ªÊ¼µÄµØÍ¼µÄID

	COLLG_MS_PREPARENEWSVALUE = 5; --×¼±¸³¡¼ÆÊ±±äÁ¿
	COLLG_MS_GAMECOUNT = 11;	--¼ÇÂ¼ÓÐ¶àÉÙ¸ö³¡µØ
	COLLG_NAME = "Thu thËp vËt phÈm bang héi";
	
	COLLG_SKILLIDBOMB = 736;
	COLLG_SKILLLVLBOMB = 10;
	
	function collg_settobomber()
		SetTask(COLLG_TK_BOMB_MARK, -1);
	    AddTempMagic(COLLG_SKILLIDBOMB, COLLG_SKILLLVLBOMB);
	    SetImmedSkill(0, COLLG_SKILLIDBOMB)
	    SetAForbitSkill(COLLG_SKILLIDBOMB,0)
    	AddSkillState(705, 10, 0, 20000 * 18);
	end;
	
	function collg_settonormal()
		SetTask(COLLG_TK_BOMB_MARK, 0);
		SetAForbitSkill(COLLG_SKILLIDBOMB, 1);
		AddTempMagic(COLLG_SKILLIDBOMB, -1 * COLLG_SKILLLVLBOMB);
		SetImmedSkill(0, 1);
	    AddSkillState(705, 10, 0, 0);
	end;
	
	--²¥ÈöÊ¥µ®¾«Áé
	function collg_putfairy()
		local nNPCCount;
		local PosTab;	--ÓÃÓÚ¼ÇÂ¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		
		local nBeginID = GetMissionV(COLLG_MS_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(COLLG_MS_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > COLLG_SMALLMAPCOUNT) then
		        j = mod(i, COLLG_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
		    
		    if (j >= 20 and j <= 23) then
				j = j + 4;
			end;
			local PosFile = format("\\settings\\maps\\dragonboatfestival_06\\elf_%d.txt", j);
			PosTab = getndata(PosFile, COLLG_MOUSECOUNT)

			tabaddgoods(PosTab);
		end;
		SubWorld = OldWorld;
	end;
	
	
	--Çå³ýÊ¥µ®¾«Áé
	function collg_clearfairy()
		ClearMapObj(COLLG_MAPID[2]);
	end;
	
	--ÅÐ¶ÏÍæ¼ÒÊÇ·ñ³ä¹ý¿¨
	function collg_IsCharged()
		if( GetExtPoint( 0 ) >= 1 ) then
			return 1;
		else
			return 0;
		end;
	end;
	--¼ÓÈëµ½ÓÎÏ·ÖÐ
	function collg_joindisciple(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(COLLG_TK_DAYKEY) ~= nNowTime) then
			SetTask(COLLG_TK_DAYKEY, nNowTime);
			SetTask(COLLG_TK_PLAYTIMES, 0);
		end;
		
		--½øÐÐ¼ÆÊý
		local nTimes = GetTask(COLLG_TK_PLAYTIMES);
		if (GetTask(COLLG_TK_PLAYTIMES) >= COLLG_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>: Mét ngµy chØ cã thÓ tham gia 5 ®ît ho¹t ®éng thu thËp vËt phÈm!");
			return
		end;
		
		local nPhase = gb_GetTask(COLLG_NAME, 1);
		if (nPhase ~= 1) then
			if (nPhase == 2) then
				Talk(1, "", "ThËt ng¹i qu¸, ng­êi dÉn ®­êng võa ®­a mét sè hiÖp kh¸ch ®i råi, mét lóc sau míi quay vÒ, h·y ®îi ®ît sau vËy.");
				Msg2Player("Ho¹t ®éng ®ang diÔn ra, h·y chê ®îi ®ît ho¹t ®éng sau.");
				return
			end;
			Talk(1, "", "HiÖn t¹i ta cã nhiÒu viÖc quan träng ph¶i lµm, trong thêi gian 0h 00 ®Õn 1h 00, 12h00 ®Õn 14h00, 19h 00 ®Õn 22h00 h·y quay l¹i t×m ta.");
			Msg2Player("Ho¹t ®éng vÉn ch­a b¾t ®Çu.");
			return
		end
		
		--°ï»áµÄÅÐ¶Ï
		if (festival_tongjudge(3, nTongID, nWorkshopID) == 0) then
			return
		end;

		local szFile = [[\settings\maps\dragonboatfestival_06\player.txt]];
		ww, xx, yy = GetWorldPos()
		local nPosX, nPosY;
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(COLLG_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--ÓÎÏ·½áÊø
	function collg_gameover(nMapid, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapid);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(nMissionID, idx, 0);
			if (pidx > 0) then
				tabPlayer[i] = pidx;
			end;
			
			if (0 == idx) then
				break;
			end;
			
		end;
		
		local nLoop = getn(tabPlayer);
		for i = 1, nLoop do
			PlayerIndex = tabPlayer[i];
			collg_setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--¼ì²ì×Ô¼ºµÄ×´Ì¬
	function collg_get_exptimes()
		local exp_time = GetTask(TK_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 or nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function collg_setplayerreadystate()	--Íæ¼Ò½øÈë×¼±¸³¡
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,1);
		--ÉèÖÃÕ½¶·×´Ì¬
		SetFightState(0);
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
		SetLogoutRV(1);
		--ÎÞËÀÍö³Í·£
		SetPunish(0);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(0);
		
		--½ûÖ¹¹â»·
		ForbitAura(1)
		--ÉèÖÃ³ðÉ±
		ForbidEnmity( 1 )
		--´ò¿ªPK¿ª¹Ø 

		--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
		SetPKFlag(0)
		--½ûÖ¹½»Ò×;
		DisabledStall(1);
		ForbitTrade(0);
		
		ForbidChangePK(1);
		DisabledUseTownP(1);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	end;
	
	function collg_setplayerleaverstate()	--Íæ¼ÒÀë¿ªÓÎÏ·³¡
		ForbitSkill(0);
		SetMoveSpeed(-1);
		
	    SetAForbitSkill(COLLG_SKILLIDBOMB, 1);
		--È¥³ýÕ¨µ¯ÈË±ê¼Ç
		collg_settonormal();
		--½ûÖ¹¹â»·
		ForbitAura(0)
		--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,0);
		--ÉèÖÃÕ½¶·×´Ì¬
		SetFightState(0);
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
		--SetLogoutRV(0);
		--ÎÞËÀÍö³Í·£
		SetPunish(1);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(0);
		--´ò¿ªPK¿ª¹Ø 
		
		--ÉèÖÃ³ðÉ±
		ForbidEnmity( 0 )
		--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
		SetPKFlag(0)
		--½ûÖ¹½»Ò×;
		DisabledStall(0);
		ForbitTrade(0);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(0);
		DisabledUseTownP(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	end;
	
	function collg_setplayerjoinstate()	--Íæ¼Ò½øÈëÓÎÏ·
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(COLLG_TK_PLAYTIMES, GetTask(COLLG_TK_PLAYTIMES) + 1);
		SetTask(TK_TIME_ALL, GetTask(TK_TIME_ALL) + 1);
		SetTask(COLLG_TK_BOMB_MARK, 0);
		--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,1);
		--ÉèÖÃÕ½¶·×´Ì¬
		SetFightState(1);
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
		SetLogoutRV(1);
		
		--½ûÖ¹¹â»·
		ForbitAura(1)
		SetFightState(1);
		--ÎÞËÀÍö³Í·£
		SetPunish(0);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(0);
		--´ò¿ªPK¿ª¹Ø 

		--ÉèÖÃ³ðÉ±
		ForbidEnmity( 1 )
		--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
		SetPKFlag(1)
		--½ûÖ¹½»Ò×;
		DisabledStall(1);
		ForbitTrade(0);
		
		ForbidChangePK(1);
		SetCurCamp(4);	--ÉèÖÃÁÙÊ±ÕóÓª
		DisabledUseTownP(1);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	end;

	--Éú³ÉÒ»¸öÏà¶ÔÓÚµ±Ç°Íæ¼ÒµÄÑ¡Ïî
	function ch_make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--¼ì²é¸ÃÍæ¼ÒÊÇ·ñÈÔÔÚÓÎÏ·ÖÐ£¬³É¹¦·µ»ØPlayerIndex·ñÔò·µ»Ønil
	function ch_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--Íæ¼ÒÊÇ·ñÔÚµ±Ç°·þÎñÆ÷
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(COLLG_MISSIONID, nPlIdx)	--Íæ¼ÒÊÇ·ñÔÚÖ¸¶¨MissionÖÐ
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	function OnCancel()
	end;
end;
