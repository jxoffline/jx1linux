if (not __FESTIVAL_HEAD__) then
	__FESTIVAL_HEAD__ = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\springfestival\festival_file_npc_head.lua]]);
	Include("\\script\\lib\\gb_taskfuncs.lua") --
	Include("\\script\\lib\\common.lua")
	--³£Öµ²¿·Ö
	--DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>Ê¥µ®ÀÏÈË£º<link>"	
	
	FE_PREPAREMISSIONID = 30;
	FE_MISSIONID = 31;
	
	FE_FRAME = 18;	--Ã¿Ãë18Ö¡
	FE_REFRASHTIME = 15 * FE_FRAME; -- Ã¿15ÃëÖÓË¢Ò»´Î¹Ö
	FE_VANISHTIME = 10 * FE_FRAME;	--Ê¥µ®¾«ÁéÍ£Áô10ÃëÖÓ
	FE_RUNINTERVER = 30 * FE_FRAME; --30ÃëÒ»´Î£¬¿ÉÒÔ¹«¸æÓÎÏ·
	FE_MAXPLAYTIMES = 5; --Ã¿ÈË×î¶àÒ»ÌìÍæ5´Î
	FE_LEVELLIMIT = 50; --Íæ¼Ò²Î¼ÓĞèÒªµÄ×îĞ¡¼¶±ğ
	
	FE_PREPARETIME = 57; --×¼±¸³¡¼ÆÊ±Æ÷
	FE_FAIRY_SMALLTIMERID = 58;	--Ë¢¹Ö¼ÆÊ±Æ÷
	FE_REPORT_SMALLTIMERID = 59;	--RunMissionÓÃµÄ¼ÆÊ±Æ÷£»
	FE_INTERVER = 5 * FE_FRAME;	--5ÃëÖÓ´¥·¢Ë¢¹ÖºÍÇå³ş¹Ö´¥·¢Æ÷
	
	--GLBÖµ
	GLB_FE_PHASE = 849; --´º½Ú»î¶¯µÄÊ±¼ä
	--===============ºÍ¹ÖÏà¹Ø==================
	FE_NPCID = 361;	--Ë¢³ö¹ÖµÄNCP index
	FE_MAPID = {584, 585};	--Ê¥µ®»î¶¯µØÍ¼Id
	
	FE_SMALLMAPCOUNT = 19;	--Ò»¹²ÓĞ12ÕÅĞ¡µØÍ¼
	FE_MOUSECOUNT_MIN = 10;	--Ò»¸öĞ¡µØÍ¼Ò»´Î×îÉÙË¢µØÊóÊıÄ¿
	FE_MOUSECOUNT_MAX = 10;	--Ò»¸öĞ¡µØÍ¼Ò»´Î×î¶àË¢µØÊóÊıÄ¿
	FE_MAXPLAYERCOUNT = 10;	--Ã¿¸öÓÎÏ·×î¶à10¸öÈË£»
	FE_NIANSHOU_XUANYUN = 10;   --ÄêÊŞÃ¿±»¹¥»÷10´Î¾Í±»Ñ£ÔÎ
	FE_ALL_MAXPLAYERCOUNT = 100; --Ò»¹²×î¶à120ÈË£»
	--=========================================
	
	--=========ÈÎÎñ±äÁ¿===============
	TK_FE_LEAVERMAPID = 1123;	--´æ´¢Ã÷ÔÂÕòµÄmapid
	TK_FE_LEAVERPOSX = 1124;	--´æ´¢Àë¿ªÓÎÏ·µÄx×ø±êµã
	TK_FE_LEAVERPOSY = 1125;	--´æ´¢Àë¿ªÓÎÏ·µÄy×ø±êµã
	
	TK_FE_DAYKEY = 1126;	--¼ÇÂ¼ÊÇÄÄÒ»Ìì
	TK_FE_PLAYTIMES = 1127; --¼ÇÂ¼Ò»ÌìÄÚÍæµÄ´ÎÊı
	
	TK_FE_COUNT_ONETIME = 1128;	--¼ÇÂ¼Ò»³¡µãÁË¶àÉÙ¸ö
	
	TK_FE_RANK = 1129;		--¼ÇÂ¼Ò»³¡µÄÅÅÃû£»
	
	TK_FE_GROUPID = 1130;	--¼ÇÂ¼Íæ¼ÒµÄGroupºÅ
	TK_FE_EXP_BEISHU = 1131; -- »ñµÃ¾­ÑéµÄ±¶Êı
	TK_FE_EXP_TIME = 1132;  -- »ñµÃË«±¶µÄÊ±¼ä
	
	TK_FE_ATTACKED_TIMES = 1133;    --¼ÇÂ¼ÄêÊŞ±»¹¥»÷µÄ´ÎÊı
	TK_FE_ATTACKED_INTERVER = 1134;     --ÆÕÍ¨Íæ¼ÒÊ¹ÓÃµÀ¾ß¼ä¸ô
	
	--================================
	
	--MS²¿·Ö£»
	MS_FE_STATE = 1;
	MS_FE_TIMERSTATE = 2; --ÓÃÀ´¼ÇÂ¼ÓÃÓÚ½»ÌæµÄ½øĞĞË¢¹ÖºÍÇå³ı¹Ö£º0£­Çå³ı¹Ö£»1£­Ë¢³ö¹Ö
	MS_FE_NEWSVALUE = 3; --
	MS_FE_BEGINGMAPID = 10; --¼ÇÂ¼¿ªÊ¼µÄµØÍ¼µÄID
	MS_FE_PREPARENEWSVALUE = 5; --×¼±¸³¡¼ÆÊ±±äÁ¿
	MS_FE_GAMECOUNT = 6;    --  ¼ÇÂ¼Ò»³¡¿ªÊ¼µÄÓÎÏ·µÄ¸öÊı
	--³£Á¿²¿·Ö£»
	FESTIVAL_SHREWMOUSE = "Ho¹t ®éng ngµy Xu©n";
	FE_ANIMALNAME = "Qu¸i thó ";
	FE_MOUSENAME = "®øa trÎ mÊt tİch"; --Ê¥µ®¾«ÁéµÄÃû×Ö
	FE_GIFTNAME = "LÔ vËt ®Ó l¹i";       --ÀñÎïNPCµÄÃû×Ö
	FE_SIGNNPCNAME = "<color=yellow>Nha m«n sai dŞch<color>:";    --±¨ÃûÊ¥µ®ÀÏÈËµÄÃû×Ö
	FE_MAPPOINTFLORDER = "springfestival2006";
	FE_NIGHT_BEGINTIME = 1900;
	FE_NIGHT_ENDTIME = 2300;
	FE_NOON_BEGINTIME = 1200;
	FE_NOON_ENDTIME = 1400;
	FE_DARK_BEGINTIME = 100;
	FE_DARK_ENDTIME = 300;
	FESTIVAL_OK = 1;    --ÉèÖÃ×´Ì¬¿Ï¶¨±íÊ¾
	FESTIVAL_NO = 0;    --ÉèÖÃ×´Ì¬·ñ¶¨±íÊ¾
	FESTIVAL_ENTERSPEED = 16; --½øĞĞÓÎÏ·µÄÍæ¼ÒµÄËÙ¶È
	FESTIVAL_LEAVERSPEED = -1; --Àë¿ªÓÎÏ·µÄÍæ¼ÒµÄËÙ¶È
	
	--²¥ÈöÊ¥µ®¾«Áé
	function festival_putfairy()
		local nNPCCount;
		local PosTab;	--ÓÃÓÚ¼ÇÂ¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(FE_MAPID[2])
		local scriptfile = [[\script\missions\springfestival\npcs\festival_shrewmouse.lua]];
		
		local nBeginID = GetMissionV(MS_FE_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(MS_FE_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > FE_SMALLMAPCOUNT) then
		        j = mod(i, FE_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
			nNPCCount = random(FE_MOUSECOUNT_MIN, FE_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\"..FE_MAPPOINTFLORDER.."\\elf_%d.txt", j);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, FE_NPCID, FE_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--Çå³ıÊ¥µ®¾«Áé
	function festival_clearfairy(szNPCName)
	    if ("string" ~= type(szNPCName)) then
	        return
	    end;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(FE_MAPID[2]);
		ClearMapNpcWithName(FE_MAPID[2], szNPCName);     --½«ËùÓĞµÄÄêÊŞÇå³ı
		SubWorld = OldWorld;
	end;
	
	
	--¼ÓÈëµ½ÓÎÏ·ÖĞ
	function festival_joingame()
		local nNowTime = tonumber(date("%y%m%d"));
		if (GetTask(TK_FE_DAYKEY) ~= nNowTime) then
			SetTask(TK_FE_DAYKEY, nNowTime);
			SetTask(TK_FE_PLAYTIMES, 0);
		end;

		--½øĞĞ¼ÆÊı
		local nTimes = GetTask(TK_FE_PLAYTIMES);
		if (nTimes >= FE_MAXPLAYTIMES) then
			Talk(1, "", FE_SIGNNPCNAME.."H«m nay ng­¬i ®· ®Õn 5 lÇn råi, hay lµ nghÜ mÖt chót ®i!");
			return
		end;
		
		if (GetLevel() < FE_LEVELLIMIT) then
			Talk(1, "", FE_SIGNNPCNAME.."§¼ng cÊp cña ng­¬i qu¸ thÊp, ta kh«ng muèn ng­¬i gÆp nguy hiÓm, chê ®Õn cÊp 50 råi quay l¹i.");
			return
		end;
		
		
		if (gb_GetTask(FESTIVAL_SHREWMOUSE, 1) ~= 1) then
			local nNowTime = tonumber(GetLocalDate("%H%M"));
			local bOn = 0;
			if ((nNowTime >= FE_NIGHT_BEGINTIME and nNowTime <= FE_NIGHT_ENDTIME) or 
              (nNowTime >= FE_NOON_BEGINTIME and nNowTime <= FE_NOON_ENDTIME) or 
              (nNowTime >= FE_DARK_BEGINTIME and nNowTime <= FE_DARK_ENDTIME)) then
				    bOn = 1;
			end;
			if (bOn == 0) then
				Talk(1, "", FE_SIGNNPCNAME.."Chóng ta ®ang chuÈn bŞ kÕ ho¹ch ®èi phã Qu¸i thó, ho¹t ®éng sÏ diÔn ra vµo buæi tr­a 12:00 ®Õn 14:00, buæi tèi tõ 19:00 ®Õn 23:00, ban ®ªm tõ 1:00 ®Õn 3:00, ®Õn lóc ®ã h·y quay l¹i!");
				return
			else
				Talk(1, "", FE_SIGNNPCNAME.."Ng­¬i còng muèn ®i ®¸nh Qu¸i thó µ? Nh­ng ng­êi dÉn ®­êng ®· ®i råi, vµo lóc 0 phót, 15 phót, 30 phót, 45phót sÏ quay l¹i.");
				return
			end;
		end;
		
		local ww, xx, yy = GetWorldPos();
		SetTask(TK_FE_LEAVERMAPID, ww);
		SetTask(TK_FE_LEAVERPOSX, xx);
		SetTask(TK_FE_LEAVERPOSY, yy);
		local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\player.txt]];
		local nPosX, nPosY;
		nPosX, nPosY = getadatabetween(szFile, 2, 15);
		NewWorld(FE_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
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
			NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--¼ì²ì×Ô¼ºµÄ×´Ì¬
	function festival_get_exptimes()
		local exp_time = GetTask(TK_FE_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_FE_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 and nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function festival_setplayertoprepare()	--Íæ¼Ò½øÈë×¼±¸³¡Ê±ºò½øĞĞ×´Ì¬ÉèÖÃ
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);

		--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200, 1);
		--ÉèÖÃÕ½¶·×´Ì¬
		SetFightState(FESTIVAL_NO);
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
		SetLogoutRV(FESTIVAL_OK);
		--ÎŞËÀÍö³Í·£
		SetPunish(FESTIVAL_NO);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(FESTIVAL_NO);
		
		--½ûÖ¹¹â»·
		ForbitAura(FESTIVAL_OK)
		--ÉèÖÃ³ğÉ±
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
	
	function festival_setplayerleaverstate()	--Íæ¼ÒÀë¿ªÓÎÏ·Ê±ºò½øĞĞ×´Ì¬ÉèÖÃ
		ForbitSkill(FESTIVAL_NO);
		SetMoveSpeed(FESTIVAL_LEAVERSPEED);
		
		RestoreOwnFeature();    --½«ËùÓĞÈË±ä³ÉÔ­À´Ñù×Ó
		local i;
		for i = 1035, 1048 do
            ConsumeItem( -1, 1000, 6, 1, i, 1 );
        end;
		
		--½ûÖ¹¹â»·
		ForbitAura(FESTIVAL_NO)
		--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,0);
		--ÉèÖÃÕ½¶·×´Ì¬
		SetFightState(FESTIVAL_NO);
		--ÎŞËÀÍö³Í·£
		SetPunish(FESTIVAL_OK);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(FESTIVAL_NO);
		--´ò¿ªPK¿ª¹Ø 
		
		--ÉèÖÃ³ğÉ±
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
	
	function festival_setplayertogame()	--Íæ¼Ò½øÈëÓÎÏ·µÄÊ±ºò½øĞĞ×´Ì¬ÉèÖÃ
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
		SetTaskTemp(200,1);
		
		SetTask(TK_FE_PLAYTIMES, GetTask(TK_FE_PLAYTIMES) + 1);
		--ÉèÖÃÕ½¶·×´Ì¬
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
		SetLogoutRV(FESTIVAL_OK);
		
		--½ûÖ¹¹â»·
		ForbitAura(FESTIVAL_OK)
		SetFightState(FESTIVAL_OK);
		--ÎŞËÀÍö³Í·£
		SetPunish(FESTIVAL_NO);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(FESTIVAL_NO);
		--´ò¿ªPK¿ª¹Ø 

		--ÉèÖÃ³ğÉ±
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
	function festival_make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--¼ì²é¸ÃÍæ¼ÒÊÇ·ñÈÔÔÚÓÎÏ·ÖĞ£¬³É¹¦·µ»ØPlayerIndex·ñÔò·µ»Ønil
	function festival_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--Íæ¼ÒÊÇ·ñÔÚµ±Ç°·şÎñÆ÷
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(FE_MISSIONID, nPlIdx)	--Íæ¼ÒÊÇ·ñÔÚÖ¸¶¨MissionÖĞ
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	--¼ì²éµÀ¾ßÊÇ·ñ¿ÉÒÔ±»Ê¹ÓÃ
	function itemuseplacecheck(nType)   --nType :1¡ª¡ª¹«¹²µÀ¾ß£»2¡ª¡ªÄêÊŞ×¨ÓÃµÀ¾ß£»3¡ª¡ªÆÕÍ¨Íæ¼Ò×¨ÒµµÀ¾ß
	    local ww, xx, yy = GetWorldPos();
	    if (FE_MAPID[2] ~= ww) then
    	    Talk(1, "", "VËt phÈm nµy chØ dïng trong ho¹t ®éng ngµy Xu©n.");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) <= FE_SMALLMAPCOUNT and 2 == nType) then
    	    Talk(1, "", "ChØ cã ng­êi ch¬i Qu¸i thó míi cã thÓ sö dông MÆt n¹ nµy");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT and 3 == nType) then
    	    Talk(1, "", "ChØ cã ng­êi ch¬i b×nh th­êng míi sö dông ®­îc vËt phÈm nµy.");
	        return 0;
	    end;
	    
	    return 1
	end;
	--ÕÒµ½¶ÔÁ¢ÕóÓª£¬ÄêÊŞ¡ª¡ª>Íæ¼Ò£¬Íæ¼Ò¡ª¡ª>ÄêÊŞ
	function festival_getgroupid(nGroupId)
	    if (nGroupId < 1) then
	        return nil
	    end;
	    
	    if (nGroupId > FE_SMALLMAPCOUNT) then
	        return nGroupId - FE_SMALLMAPCOUNT;
	    else
	        return nGroupId + FE_SMALLMAPCOUNT;
	    end;
	end;
	
	function festival_go_other_place()  --Ëæ»ú´«µ½ÆğÊ¼µã
	    local nBeginMapID = GetMissionV(MS_FE_BEGINGMAPID);
    	local nGroupId = GetTask(TK_FE_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, FE_SMALLMAPCOUNT) + 1;
    	local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\elf_]]..nMapId..[[.txt]];
    	local PosX, PosY = getadata(szFile);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_go_back(nBeginMapID)  --Ëæ»ú´«µ½ÆğÊ¼µã
    	local nGroupId = GetTask(TK_FE_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, FE_SMALLMAPCOUNT) + 1;
    	local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\player.txt]];
		local PosX, PosY = getadatabetween(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_checkinterver()
	    local gametime = GetGameTime();
	    if (GetTask(TK_FE_ATTACKED_INTERVER) > gametime) then
	        return 0;
	    else
	        SetTask(TK_FE_ATTACKED_INTERVER, gametime + 2);
	        return 1;
	    end;
	end;
end;
