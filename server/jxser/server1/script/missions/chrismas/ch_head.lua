if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\chrismas\ch_file_npc_head.lua]]);
	Include("\\script\\lib\\gb_taskfuncs.lua") --
	Include("\\script\\lib\\common.lua")
	--³£Öµ²¿·Ö
	DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>¤ng giµ Noel:<link>"	
	
	CH_MISSIONID = 28;
	CH_PREPAREMISSIONID = 29;
	CH_MAXPLAYERCOUNT = 10;	--Ã¿¸öÓÎÏ·×î¶à10¸öÈË£»
	CH_ALL_MAXPLAYERCOUNT = 120; --Ò»¹²×î¶à120ÈË£»
	
	CH_FRAME = 18;	--Ã¿Ãë18Ö¡
	CH_REFRASHTIME = 15 * CH_FRAME; -- Ã¿15ÃëÖÓË¢Ò»´Î¹Ö
	CH_VANISHTIME = 10 * CH_FRAME;	--Ê¥µ®Àñ°üÍ£Áô10ÃëÖÓ
	CH_RUNINTERVER = 30 * CH_FRAME; --30ÃëÒ»´Î£¬¿ÉÒÔ¹«¸æÓÎÏ·
	CH_MAXPLAYTIMES = 5; --Ã¿ÈË×î¶àÒ»ÌìÍæ5´Î
	
	CH_PREPARETIME = 54; --×¼±¸³¡¼ÆÊ±Æ÷
	CH_SMALLTIMERID = 55;	--Ë¢¹Ö¼ÆÊ±Æ÷
	CH_RUNTIMERID = 56;	--RunMissionÓÃµÄ¼ÆÊ±Æ÷£»
	CH_INTERVER = 5 * CH_FRAME;	--5ÃëÖÓ´¥·¢Ë¢¹ÖºÍÇå³þ¹Ö´¥·¢Æ÷
	CH_TOTALINTERVER = 60 * 60 * CH_FRAME; --1Ð¡Ê±Ö®ºó¹Ø±ÕMission
	
	--GLBÖµ
	GLB_CH_PHASE = 848;
	CHRISMAS_SHREWMOUSE = "Ho¹t ®éng Gi¸ng Sinh";
	--===============ºÍ¹ÖÏà¹Ø==================
	CH_NPCID = 1236;	--Ë¢³ö¹ÖµÄNCP index
	CH_MAPID = {582, 583};	--Ê¥µ®»î¶¯µØÍ¼Id
	
	CH_SMALLMAPCOUNT = 12;	--Ò»¹²ÓÐ12ÕÅÐ¡µØÍ¼
	CH_MOUSECOUNT_MIN = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×îÉÙË¢µØÊóÊýÄ¿
	CH_MOUSECOUNT_MAX = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×î¶àË¢µØÊóÊýÄ¿
	--=========================================
	
	--=======================================
	CHRIMAS_SALEID = 136; --ÉÌÈËÂô¶«Î÷µÄID
	
	--=========ÈÎÎñ±äÁ¿===============¶¼Ã»ÓÐ¶¨£¬ÐèÒª¶º¶º²éÕÒ
	TK_LEAVERMAPID = 2323;	--´æ´¢Ã÷ÔÂÕòµÄmapid
	TK_LEAVERPOSX = 2324;	--´æ´¢Àë¿ªÓÎÏ·µÄx×ø±êµã
	TK_LEAVERPOSY = 2325;	--´æ´¢Àë¿ªÓÎÏ·µÄy×ø±êµã
	
	TK_DAYKEY = 2326;	--¼ÇÂ¼ÊÇÄÄÒ»Ìì
	TK_PLAYTIMES = 2327; --¼ÇÂ¼Ò»ÌìÄÚÍæµÄ´ÎÊý
	TK_PLAYMAXTIMES = 2521;--×î¶à²Î¼Ó50³¡
	
	TK_COUNT_ONETIME = 2328;	--¼ÇÂ¼Ò»³¡µãÁË¶àÉÙ¸ö
	
	TK_RANK = 2329;		--¼ÇÂ¼Ò»³¡µÄÅÅÃû£»
	
	TK_GROUPID = 2330;	--¼ÇÂ¼Íæ¼ÒµÄGroupºÅ
	TK_EXP_BEISHU = 2331; --
	TK_EXP_TIME = 2332;
	--================================
	
	--=============ÓÃÀ´ÏÔÊ¾Õ½±¨µÄ==============
	CH_TOTALPOINT = 1;
	CH_GETITEM = 17;
	--=========================================
	
	--MS²¿·Ö£»
	MS_STATE = 1;
	MS_TIMERSTATE = 2; --ÓÃÀ´¼ÇÂ¼ÓÃÓÚ½»ÌæµÄ½øÐÐË¢¹ÖºÍÇå³ý¹Ö£º0£­Çå³ý¹Ö£»1£­Ë¢³ö¹Ö
	MS_NEWSVALUE = 3; --
	MS_BEGINGMAPID = 10; --¼ÇÂ¼¿ªÊ¼µÄµØÍ¼µÄID
	
	MS_PREPARENEWSVALUE = 5; --×¼±¸³¡¼ÆÊ±±äÁ¿
	
	MSS_MOUSENAME = 1; --Ê¥µ®Àñ°üµÄÃû×Ö
	
	
	--²¥ÈöÊ¥µ®Àñ°ü
	function putfairy()
		local nNPCCount;
		local PosTab;	--ÓÃÓÚ¼ÇÂ¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2])
		local scriptfile = [[\script\missions\chrismas\npcs\shrewmouse.lua]];
		
		local name = GetMissionS(MSS_MOUSENAME);
		for i = 1, CH_SMALLMAPCOUNT do
			nNPCCount = random(CH_MOUSECOUNT_MIN, CH_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\chrismas\\elf_%d.txt", i);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, CH_NPCID, name)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--Çå³ýÊ¥µ®Àñ°ü
	function clearfairy()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2]);
		ClearMapNpcWithName(CH_MAPID[2], "Bao quµ gi¸ng sinh");
		SubWorld = OldWorld;
	end;
	
	
	--¼ÓÈëµ½ÓÎÏ·ÖÐ
	function joingame()
		local nNowTime = tonumber(date("%y%m%d"));
		if (GetTask(TK_PLAYMAXTIMES) >= 50) then
			Talk(1, "", "<color=yellow>¤ng giµ Noen<color>: Mçi ng­êi chØ cã thÓ tham gia nhiÒu nhÊt 50 ®ît t×m quµ, ng­¬i kh«ng thÓ tham gia ®­îc n÷a!");
			return
		end;
		
		if (GetTask(TK_DAYKEY) ~= nNowTime) then
			SetTask(TK_DAYKEY, nNowTime);
			SetTask(TK_PLAYTIMES, 0);
		end;

		--½øÐÐ¼ÆÊý
		local nTimes = GetTask(TK_PLAYTIMES);
		if (GetTask(TK_PLAYTIMES) >= CH_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>¤ng giµ Noel<color>: 1 ngµy chØ thi ®Êu 5 trËn!");
			return
		end;
		
		
		if (gb_GetTask("Ho¹t ®éng Gi¸ng Sinh", 1) ~= 1) then
			local nNowTime = tonumber(GetLocalDate("%H%M"));
			local bOn = 0;
			if ((nNowTime >=1900 and nNowTime <=2300) or (nNowTime >=1200 and nNowTime <=1400)) then
				bOn = 1;
			end;
			if (bOn == 0) then
				Talk(1, "", "<color=yellow>¤ng giµ Noel<color>: Mçi ngµy tõ 12:00-4:00 vµ buæi tèi 19:00-23:00 triÓn khai ho¹t ®éng Gi¸ng Sinh,  hiÖn t¹i ch­a ®Õn thêi gian ho¹t ®éng hoÆc ho¹t ®éng ch­a b¾t ®Çu!");
				return
			else
				Talk(1, "", "<color=yellow>¤ng giµ Noel<color>: Trß ch¬i ®ang tiÕn hµnh, h·y chê l­ît sau ®i! Mçi trËn ®óng 15 phót, 30 phót, 45 phót b¾t ®Çu.");
				return
			end;
		end;

		local szFile = [[\settings\maps\chrismas\player.txt]];
		local nPosX, nPosY;
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(CH_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--ÓÎÏ·½áÊø
	function gameover()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2]);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(CH_MISSIONID, idx, 0);
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
		elseif (nBeishu ~= 2 and nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function setplayerreadystate()	--Íæ¼ÒÀë¿ªÓÎÏ·³¡Ê±ºò½øÐÐ×´Ì¬ÉèÖÃ
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
	
	function setplayerleaverstate()	--Íæ¼ÒÀë¿ªÓÎÏ·³¡Ê±ºò½øÐÐ×´Ì¬ÉèÖÃ
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
	
	function setplayerjoinstate()	--Íæ¼Ò½øÈëÓÎÏ·µÄÊ±ºò½øÐÐ×´Ì¬ÉèÖÃ
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(TK_PLAYTIMES, GetTask(TK_PLAYTIMES) + 1);
		SetTask(TK_PLAYMAXTIMES, GetTask(TK_PLAYMAXTIMES) + 1);
		--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,1);
		--ÉèÖÃÕ½¶·×´Ì¬
--		SetFightState(1);
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
			local nPlMsIdx = PIdx2MSDIdx(CH_MISSIONID, nPlIdx)	--Íæ¼ÒÊÇ·ñÔÚÖ¸¶¨MissionÖÐ
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
end;

function isXmasTime(bAward)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (bAward == 1) then
		if (nDate >= 061222 and nDate <= 070114) then
			return 1;
		end;
	elseif (nDate >= 061222 and nDate <= 070114) then
		return 1;
	end;
	return 0;
end;