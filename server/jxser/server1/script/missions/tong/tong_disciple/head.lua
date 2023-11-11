if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\tong\tong_disciple\npcpoint.lua]]);
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include([[\script\missions\tong\tong_head.lua]]);
	
	--³£Öµ²¿·Ö
	DIS_MISSIONID = 38;
	DIS_PREPAREMISSIONID = 37;
	DIS_MAXPLAYERCOUNT = 10;	--Ã¿¸öÓÎÏ·×î¶à10¸öÈË£»
	DIS_ALL_MAXPLAYERCOUNT = 120; --Ò»¹²×î¶à120ÈË£»
	
	DIS_FRAME = 18;	--Ã¿Ãë18Ö¡
	DIS_REFRASHTIME = 15 * DIS_FRAME; -- Ã¿15ÃëÖÓË¢Ò»´Î¹Ö
	DIS_VANISHTIME = 10 * DIS_FRAME;	--Ê¥µ®¾«ÁéÍ£Áô10ÃëÖÓ
	DIS_RUNINTERVER = 30 * DIS_FRAME; --30ÃëÒ»´Î£¬¿ÉÒÔ¹«¸æÓÎÏ·
	DIS_MAXPLAYTIMES = 5; --Ã¿ÈË×î¶àÒ»ÌìÍæ3´Î
	
	DIS_PREPARETIME = 65; --×¼±¸³¡¼ÆÊ±Æ÷
	DIS_SMALLTIMERID = 66;	--Ë¢¹Ö¼ÆÊ±Æ÷
	DIS_RUNTIMERID = 67;	--RunMissionÓÃµÄ¼ÆÊ±Æ÷£»
	DIS_INTERVER = 5 * DIS_FRAME;	--5ÃëÖÓ´¥·¢Ë¢¹ÖºÍÇå³þ¹Ö´¥·¢Æ÷
	
	--GLBÖµ
	GLB_DIS_PHASE = 852;
	CHRISMAS_SHREWMOUSE = "TONG_SHREWMOUSE";
	--===============ºÍ¹ÖÏà¹Ø==================
	DIS_NPCID = 323;	--Ë¢³ö¹ÖµÄNCP index
	DIS_MAPID = {821, 822};	--Ê¥µ®»î¶¯µØÍ¼Id
	
	DIS_SMALLMAPCOUNT = 12;	--Ò»¹²ÓÐ12ÕÅÐ¡µØÍ¼
	DIS_MOUSECOUNT = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×îÉÙË¢µØÊóÊýÄ¿
	--=========================================
	
	--=========ÈÎÎñ±äÁ¿===============
--	TK_LEAVERMAPID = 2392;	--´æ´¢Àë¿ªÓÎÏ·µÄmapid
--	TK_LEAVERPOSX = 2393;	--´æ´¢Àë¿ªÓÎÏ·µÄx×ø±êµã
--	TK_LEAVERPOSY = 2394;	--´æ´¢Àë¿ªÓÎÏ·µÄy×ø±êµã
	
	DIS_TK_DAYKEY = 2395;	--¼ÇÂ¼ÊÇÄÄÒ»Ìì
	DIS_TK_PLAYTIMES = 2396; --¼ÇÂ¼Ò»ÌìÄÚÍæµÄ´ÎÊý
	
	DIS_COUNT_ONETIME = 2397;	--¼ÇÂ¼Ò»³¡µãÁË¶àÉÙ¸ö
	DIS_TK_RANK = 2398;		--¼ÇÂ¼Ò»³¡µÄÅÅÃû£»
--	
--	TK_GROUPID = 2399;	--¼ÇÂ¼Íæ¼ÒµÄGroupºÅ
--	TK_EXP_BEISHU = 2400; --
--	TK_EXP_TIME = 2401;
	--================================
	
	--MS²¿·Ö£»
	MS_STATE = 1;
	MS_TIMERSTATE = 2; --ÓÃÀ´¼ÇÂ¼ÓÃÓÚ½»ÌæµÄ½øÐÐË¢¹ÖºÍÇå³ý¹Ö£º0£­Çå³ý¹Ö£»1£­Ë¢³ö¹Ö
	MS_NEWSVALUE = 3; --
	MS_BEGINGMAPID = 10; --¼ÇÂ¼¿ªÊ¼µÄµØÍ¼µÄID

	MS_PREPARENEWSVALUE = 5; --×¼±¸³¡¼ÆÊ±±äÁ¿

	DIS_MOUSENAME = "§Ö tö"; --Ê¥µ®¾«ÁéµÄÃû×Ö


	--²¥ÈöÊ¥µ®¾«Áé
	function putfairy()
		local nNPCCount;
		local PosTab;	--ÓÃÓÚ¼ÇÂ¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(DIS_MAPID[2])
		local scriptfile = [[\script\missions\tong\tong_disciple\npcs\shrewmouse.lua]];
		
		for i = 1, DIS_SMALLMAPCOUNT do
			nNPCCount = DIS_MOUSECOUNT;
			local PosFile = format("\\settings\\maps\\chrismas\\elf_%d.txt", i);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, DIS_NPCID, DIS_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--Çå³ýÊ¥µ®¾«Áé
	function clearfairy()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
		ClearMapNpcWithName(DIS_MAPID[2], DIS_MOUSENAME);
		SubWorld = OldWorld;
	end;
	
	
	--¼ÓÈëµ½ÓÎÏ·ÖÐ
	function joindisciple(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(DIS_TK_DAYKEY) ~= nNowTime) then
			SetTask(DIS_TK_DAYKEY, nNowTime);
			SetTask(DIS_TK_PLAYTIMES, 0);
		end;
		
		--½øÐÐ¼ÆÊý
		local nTimes = GetTask(DIS_TK_PLAYTIMES);
		if (GetTask(DIS_TK_PLAYTIMES) >= DIS_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>: Mét ngµy chØ cã thÓ tham gia 5 ®ît ho¹t ®éng Chiªu mé ®Ö tö!");
			return
		end;
		
		local nPhase = gb_GetTask(CHRISMAS_SHREWMOUSE, 1);
		if (nPhase ~= 1) then
			if (nPhase == 3) then
				Talk(1, "", "Tæng qu¶n Ho¹t ®éng ph­êng:  H·y ®îi ®ît sau b¾t ®Çu. Thêi gian b¸o danh diÔn ra vµo 0h, 3h, 6h……21h, ë phót thø 15, 30 vµ 45.");
				return
			end;
			Talk(1, "", "Tæng qu¶n Ho¹t ®éng ph­êng:  Ho¹t ®éng chiªu mé ®Ö tö ®ang diÔn ra, h·y ®îi ®ît ho¹t ®éng sau. Thêi gian b¸o danh diÔn ra vµo 0h, 3h, 6h……21h, ë phót thø 15, 30 vµ 45.");
			return
		end

		--°ï»áµÄÅÐ¶Ï
		if (festival_tongjudge(1, nTongID, nWorkshopID) == 0) then
			return
		end;

		local szFile = [[\settings\maps\chrismas\player.txt]];
		ww, xx, yy = GetWorldPos()
		local nPosX, nPosY;
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(DIS_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--ÓÎÏ·½áÊø
	function gameover(nMapid, nMissionID)
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
			setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--¼ì²ì×Ô¼ºµÄ×´Ì¬
	function get_exptimes()
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
	
	function setplayerreadystate()	--Íæ¼Ò½øÈë×¼±¸³¡
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
	
	function setplayerleaverstate()	--Íæ¼ÒÀë¿ªÓÎÏ·³¡
		ForbitSkill(0);
		SetMoveSpeed(-1);
		
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
	
	function setplayerjoinstate()	--Íæ¼Ò½øÈëÓÎÏ·
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(DIS_TK_PLAYTIMES, GetTask(DIS_TK_PLAYTIMES) + 1);
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
			local nPlMsIdx = PIdx2MSDIdx(DIS_MISSIONID, nPlIdx)	--Íæ¼ÒÊÇ·ñÔÚÖ¸¶¨MissionÖÐ
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
end;
