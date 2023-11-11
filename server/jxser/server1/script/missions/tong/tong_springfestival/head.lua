if (1) then -- not __FESTIVAL_HEAD__) then
	__FESTIVAL_HEAD__ = 1;
	
	IncludeLib("BATTLE");
	Include("\\script\\missions\\tong\\tong_springfestival\\npcpoint.lua");
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include("\\script\\missions\\tong\\tong_head.lua");
	
	--³£Öµ²¿·Ö
	SF_PREPAREMISSIONID = 39;
	SF_MISSIONID = 40;
	
	SF_FRAME = 18;	--Ã¿Ãë18Ö¡
	SF_REFRASHTIME = 15 * SF_FRAME; -- Ã¿15ÃëÖÓË¢Ò»´Î¹Ö
	SF_VANISHTIME = 10 * SF_FRAME;	--Ê¥µ®¾«ÁéÍ£Áô10ÃëÖÓ
	SF_RUNINTERVER = 30 * SF_FRAME; --30ÃëÒ»´Î£¬¿ÉÒÔ¹«¸æÓÎÏ·
	SF_MAXPLAYTIMES = 5; --Ã¿ÈË×î¶àÒ»ÌìÍæ5´Î
	SF_LEVELLIMIT = 50; --Íæ¼Ò²Î¼ÓÐèÒªµÄ×îÐ¡¼¶±ð
	
	SF_PREPARETIME = 68; --×¼±¸³¡¼ÆÊ±Æ÷
	SF_FAIRY_SMALLTIMERID = 69;	--Ë¢¹Ö¼ÆÊ±Æ÷
	SF_REPORT_SMALLTIMERID = 70;	--RunMissionÓÃµÄ¼ÆÊ±Æ÷£»
	SF_INTERVER = 5 * SF_FRAME;	--5ÃëÖÓ´¥·¢Ë¢¹ÖºÍÇå³þ¹Ö´¥·¢Æ÷
	
	--GLBÖµ
	GLB_SF_PHASE = 853; --´º½Ú»î¶¯µÄÊ±¼ä
	--===============ºÍ¹ÖÏà¹Ø==================
	SF_NPCID = 361;	--Ë¢³ö¹ÖµÄNCP index
	SF_MAPID = {823, 824};	--Ê¥µ®»î¶¯µØÍ¼Id
	
	SF_SMALLMAPCOUNT = 19;	--Ò»¹²ÓÐ12ÕÅÐ¡µØÍ¼
	SF_MOUSECOUNT_MIN = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×îÉÙË¢µØÊóÊýÄ¿
	SF_MOUSECOUNT_MAX = 10;	--Ò»¸öÐ¡µØÍ¼Ò»´Î×î¶àË¢µØÊóÊýÄ¿
	SF_MAXPLAYERCOUNT = 10;	--Ã¿¸öÓÎÏ·×î¶à10¸öÈË£»
	SF_NIANSHOU_XUANYUN = 10;   --ÄêÊÞÃ¿±»¹¥»÷10´Î¾Í±»Ñ£ÔÎ
	SF_ALL_MAXPLAYERCOUNT = 100; --Ò»¹²×î¶à120ÈË£»
	--=========================================
	
	--=========ÈÎÎñ±äÁ¿===============
--	TK_LEAVERMAPID = 2402;	--´æ´¢Ã÷ÔÂÕòµÄmapid
--	TK_LEAVERPOSX = 2403;	--´æ´¢Àë¿ªÓÎÏ·µÄx×ø±êµã
--	TK_LEAVERPOSY = 2404;	--´æ´¢Àë¿ªÓÎÏ·µÄy×ø±êµã
	
	SF_TK_DAYKEY = 2405;	--¼ÇÂ¼ÊÇÄÄÒ»Ìì
	SF_TK_PLAYTIMES = 2406; --¼ÇÂ¼Ò»ÌìÄÚÍæµÄ´ÎÊý

	SF_COUNT_ONETIME = 2407;	--¼ÇÂ¼Ò»³¡µãÁË¶àÉÙ¸ö	
	SF_TK_RANK = 2408;		--¼ÇÂ¼Ò»³¡µÄÅÅÃû£»

--	TK_GROUPID = 2409;	--¼ÇÂ¼Íæ¼ÒµÄGroupºÅ
--	TK_EXP_BEISHU = 2410; -- »ñµÃ¾­ÑéµÄ±¶Êý
--	TK_EXP_TIME = 2411;  -- »ñµÃË«±¶µÄÊ±¼ä
--	
	TK_ATTACKED_TIMES = 2412;    --¼ÇÂ¼ÄêÊÞ±»¹¥»÷µÄ´ÎÊý
	TK_ATTACKED_INTERVER = 2413;     --ÆÕÍ¨Íæ¼ÒÊ¹ÓÃµÀ¾ß¼ä¸ô
	
	--================================
	
	--MS²¿·Ö£»
	MS_SF_STATE = 1;
	MS_SF_TIMERSTATE = 2; --ÓÃÀ´¼ÇÂ¼ÓÃÓÚ½»ÌæµÄ½øÐÐË¢¹ÖºÍÇå³ý¹Ö£º0£­Çå³ý¹Ö£»1£­Ë¢³ö¹Ö
	MS_SF_NEWSVALUE = 3; --
	MS_SF_BEGINGMAPID = 10; --¼ÇÂ¼¿ªÊ¼µÄµØÍ¼µÄID
	MS_SF_PREPARENEWSVALUE = 5; --×¼±¸³¡¼ÆÊ±±äÁ¿
	MS_SF_GAMECOUNT = 6;    --  ¼ÇÂ¼Ò»³¡¿ªÊ¼µÄÓÎÏ·µÄ¸öÊý
	--³£Á¿²¿·Ö£»
	FESTIVAL_SHREWMOUSE = "TONG_SPFESTIVAL";
	SF_ANIMALNAME = "Qu¸i thó ";
	SF_MOUSENAME = "®øa trÎ mÊt tÝch"; --Ê¥µ®¾«ÁéµÄÃû×Ö
	SF_GIFTNAME = "LÔ vËt ®Ó l¹i";       --ÀñÎïNPCµÄÃû×Ö
	SF_SIGNNPCNAME = "<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>: ";    --±¨ÃûÊ¥µ®ÀÏÈËµÄÃû×Ö
	SF_MAPPOINTFLORDER = "springfestival2006";
	FESTIVAL_OK = 1;    --ÉèÖÃ×´Ì¬¿Ï¶¨±íÊ¾
	FESTIVAL_NO = 0;    --ÉèÖÃ×´Ì¬·ñ¶¨±íÊ¾
	FESTIVAL_ENTERSPEED = 16; --½øÐÐÓÎÏ·µÄÍæ¼ÒµÄËÙ¶È
	FESTIVAL_LEAVERSPEED = -1; --Àë¿ªÓÎÏ·µÄÍæ¼ÒµÄËÙ¶È
	
	--²¥ÈöÊ¥µ®¾«Áé
	function festival_putfairy()
		local nNPCCount;
		local PosTab;	--ÓÃÓÚ¼ÇÂ¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2])
		local scriptfile = "\\script\\missions\\tong\\tong_springfestival\\npcs\\festival_shrewmouse.lua";
		
		local nBeginID = GetMissionV(MS_SF_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(MS_SF_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > SF_SMALLMAPCOUNT) then
		        j = mod(i, SF_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
			nNPCCount = random(SF_MOUSECOUNT_MIN, SF_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\%s\\elf_%d.txt", SF_MAPPOINTFLORDER, j);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, SF_NPCID, SF_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--Çå³ýÊ¥µ®¾«Áé
	function festival_clearfairy(szNPCName)
	    if ("string" ~= type(szNPCName)) then
	        return
	    end;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2]);
		ClearMapNpcWithName(SF_MAPID[2], szNPCName);     --½«ËùÓÐµÄÄêÊÞÇå³ý
		SubWorld = OldWorld;
	end;
	
	--¼ÓÈëµ½ÓÎÏ·ÖÐ
	function joinspringfestival(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(SF_TK_DAYKEY) ~= nNowTime) then
			SetTask(SF_TK_DAYKEY, nNowTime);
			SetTask(SF_TK_PLAYTIMES, 0);
		end;
		
		--½øÐÐ¼ÆÊý
		local nTimes = GetTask(SF_TK_PLAYTIMES);
		if (nTimes >= SF_MAXPLAYTIMES) then
			Talk(1, "", SF_SIGNNPCNAME.."H«m nay ng­¬i ®· ®Õn 5 lÇn råi, hay lµ nghÜ mÖt chót ®i!");
			return
		end;
		
		if (GetLevel() < SF_LEVELLIMIT) then
			Talk(1, "", SF_SIGNNPCNAME.."§¼ng cÊp cña ng­¬i qu¸ thÊp, ta kh«ng muèn ng­¬i gÆp nguy hiÓm, chê ®Õn cÊp 50 råi quay l¹i.");
			return
		end;
		
		local nPhase = gb_GetTask(FESTIVAL_SHREWMOUSE, 1);
		if (nPhase ~= 1) then
			if (nPhase == 3) then
				Talk(1, "", "Tæng qu¶n Ho¹t ®éng ph­êng: H·y ®ît ®îi ho¹t ®éng sau. B¾t ®Çu vµo 1h, 4h, 7h……22h, vµo phót thø 15, 30, 45 b¾t ®Çu cho b¸o danh.");
				return
			end;
			Talk(1, "", "Tæng qu¶n Ho¹t ®éng ph­êng: Ho¹t ®éng ®¸nh niªn thó ®ang diÔn ra, h·y ®îi ®ît sau vËy. Mçi ®ît b¾t ®Çu lóc 1h, 4h, 7h……22h, vµo phót thø 15, 30, 45 b¾t ®Çu cho b¸o danh.");
			return
		end
		
		--½øÐÐ°ï»áÏà¹ØµÄÅÐ¶Ï
		if (festival_tongjudge(2, nTongID, nWorkshopID) == 0) then
			return
		end;

		local ww, xx, yy = GetWorldPos();
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		local szFile = format("\\settings\\maps\\%s\\player.txt", SF_MAPPOINTFLORDER);
		local nPosX, nPosY;
		nPosX, nPosY = getadatabetween(szFile, 2, 15);
		NewWorld(SF_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--ÓÎÏ·½áÊø
	function festival_gameover(nMapID, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapID);
		
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
			festival_setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--¼ì²ì×Ô¼ºµÄ×´Ì¬
	function festival_get_exptimes()
		local exp_time = GetTask(TK_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 or nBeishu ~= 4) then
			return 1
		else
			Msg2Player(nBeishu.." lÇn");
			return nBeishu;
		end
	end
	
	function festival_setplayertoprepare()	--Íæ¼Ò½øÈë×¼±¸³¡
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200, 1);
		--ÉèÖÃÕ½¶·×´Ì¬
		SetFightState(FESTIVAL_NO);
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
		SetLogoutRV(FESTIVAL_OK);
		--ÎÞËÀÍö³Í·£
		SetPunish(FESTIVAL_NO);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(FESTIVAL_NO);
		
		--½ûÖ¹¹â»·
		ForbitAura(FESTIVAL_OK)
		--ÉèÖÃ³ðÉ±
		ForbidEnmity(FESTIVAL_OK)
		--´ò¿ªPK¿ª¹Ø 

		--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
		SetPKFlag(FESTIVAL_NO)
		--½ûÖ¹½»Ò×;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		DisabledUseTownP(FESTIVAL_OK);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	end;
	
	function festival_setplayerleaverstate()	--Íæ¼ÒÀë¿ªÓÎÏ·Ê±ºò
		ForbitSkill(FESTIVAL_NO);
		SetMoveSpeed(FESTIVAL_LEAVERSPEED);
		
		RestoreOwnFeature();    --½«ËùÓÐÈË±ä³ÉÔ­À´Ñù×Ó
		local i;
		for i = 1035, 1048 do
            ConsumeItem( -1, 1000, 6, 1, i, 1 );
        end;
		
		--½ûÖ¹¹â»·
		ForbitAura(FESTIVAL_NO)
		--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,0);
		--ÉèÖÃÕ½¶·×´Ì¬
		SetFightState(FESTIVAL_NO);
		--ÎÞËÀÍö³Í·£
		SetPunish(FESTIVAL_OK);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(FESTIVAL_NO);
		--´ò¿ªPK¿ª¹Ø 
		
		--ÉèÖÃ³ðÉ±
		ForbidEnmity( FESTIVAL_NO )
		--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
		SetPKFlag(FESTIVAL_NO)
		--½ûÖ¹½»Ò×;
		DisabledStall(FESTIVAL_NO);
		ForbitTrade(FESTIVAL_NO);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(FESTIVAL_NO);
		DisabledUseTownP(FESTIVAL_NO);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	end;
	
	function festival_setplayertogame()	--Íæ¼Ò½øÈëÓÎÏ·
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		
		--ÉèÖÃÓë°ï»áÓÐ¹ØµÄ±äÁ¿£¬²»ÔÊÐíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,1);
		
		SetTask(SF_TK_PLAYTIMES, GetTask(SF_TK_PLAYTIMES) + 1);
		--ÉèÖÃÕ½¶·×´Ì¬
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
		SetLogoutRV(FESTIVAL_OK);
		
		--½ûÖ¹¹â»·
		ForbitAura(FESTIVAL_OK)
		SetFightState(FESTIVAL_OK);
		--ÎÞËÀÍö³Í·£
		SetPunish(FESTIVAL_NO);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(FESTIVAL_NO);
		--´ò¿ªPK¿ª¹Ø 

		--ÉèÖÃ³ðÉ±
		ForbidEnmity( FESTIVAL_OK )
		--¿ªÊ¼Ó¦¸Ã¶¼²»ÄÜPK
		SetPKFlag(FESTIVAL_OK)
		--½ûÖ¹½»Ò×;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		SetCurCamp(1);	--ÉèÖÃÁÙÊ±ÕóÓª
		DisabledUseTownP(FESTIVAL_OK);	--½ûÖ¹Ê¹ÓÃ»Ø³Ì£»
	end;

	--Éú³ÉÒ»¸öÏà¶ÔÓÚµ±Ç°Íæ¼ÒµÄÑ¡Ïî
	function make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--¼ì²é¸ÃÍæ¼ÒÊÇ·ñÈÔÔÚÓÎÏ·ÖÐ£¬³É¹¦·µ»ØPlayerIndex·ñÔò·µ»Ønil
	function festival_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--Íæ¼ÒÊÇ·ñÔÚµ±Ç°·þÎñÆ÷
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(SF_MISSIONID, nPlIdx)	--Íæ¼ÒÊÇ·ñÔÚÖ¸¶¨MissionÖÐ
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	--¼ì²éµÀ¾ßÊÇ·ñ¿ÉÒÔ±»Ê¹ÓÃ
	function itemuseplacecheck(nType)   --nType :1¡ª¡ª¹«¹²µÀ¾ß£»2¡ª¡ªÄêÊÞ×¨ÓÃµÀ¾ß£»3¡ª¡ªÆÕÍ¨Íæ¼Ò×¨ÒµµÀ¾ß
    
	    if (GetTask(TK_GROUPID) <= SF_SMALLMAPCOUNT and 2 == nType) then
    	    Talk(1, "", "ChØ cã ng­êi ch¬i Qu¸i thó míi cã thÓ sö dông MÆt n¹ nµy");
	        return 0;
	    end;
	    
	    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT and 3 == nType) then
    	    Talk(1, "", "ChØ cã ng­êi ch¬i b×nh th­êng míi sö dông ®­îc vËt phÈm nµy.");
	        return 0;
	    end;
	    
	    return 1
	end;
	--ÕÒµ½¶ÔÁ¢ÕóÓª£¬ÄêÊÞ¡ª¡ª>Íæ¼Ò£¬Íæ¼Ò¡ª¡ª>ÄêÊÞ
	function festival_getgroupid(nGroupId)
	    if (nGroupId < 1) then
	        return nil
	    end;
	    
	    if (nGroupId > SF_SMALLMAPCOUNT) then
	        return nGroupId - SF_SMALLMAPCOUNT;
	    else
	        return nGroupId + SF_SMALLMAPCOUNT;
	    end;
	end;
	
	function festival_go_other_place()  --Ëæ»ú´«µ½ÆðÊ¼µã
	    local nBeginMapID = GetMissionV(MS_SF_BEGINGMAPID);
    	local nGroupId = GetTask(TK_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, SF_SMALLMAPCOUNT) + 1;
    	local szFile = format("\\settings\\maps\\%s\\elf_%d.txt", SF_MAPPOINTFLORDER, nMapId);
    	local PosX, PosY = getadata(szFile);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_go_back(nBeginMapID)  --Ëæ»ú´«µ½ÆðÊ¼µã
    	local nGroupId = GetTask(TK_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, SF_SMALLMAPCOUNT) + 1;
    	local szFile = format("\\settings\\maps\\%s\\player.txt", SF_MAPPOINTFLORDER);
		local PosX, PosY = getadatabetween(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_checkinterver()
	    local gametime = GetGameTime();
	    if (GetTask(TK_ATTACKED_INTERVER) > gametime) then
	        return 0;
	    else
	        SetTask(TK_ATTACKED_INTERVER, gametime + 2);
	        return 1;
	    end;
	end;
end;
