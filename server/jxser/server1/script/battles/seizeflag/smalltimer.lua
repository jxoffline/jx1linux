IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1_TIME) + 1;--¼ÆÊıÆ÷£¬Í³¼Æµ±Ç°¶¨Ê±Æ÷´¥·¢ÁË¶àÉÙ´ÎÁË
	SetMissionV(MS_TIMER1_TIME, t)
	
	--Storm ¼Ó½±Àø»ı·Ö
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu vùc S¬ cÊp "
	elseif (lsf_level == 2) then
		resultstr = "Khu vùc Trung cÊp "
	elseif (lsf_level == 3) then
		resultstr = "Khu vùc Cao cÊp "
	end
	
	if (t == RUNGAME_TIME) then --Èç¹ûµ½ÁËÕıÊ½¿ªÕ½Ê±¿Ì£¬ÔòÍ£Ö¹±¨Ãû£¬ÕıÊ½½øÈëÕ½¶·½×¶Î
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Tèng Kim- ph­¬ng thøc ®o¹t cê- ®· kÕt thóc b¸o danh! Chİnh thøc khai chiÕn!", 2);
		Msg2MSAll(MISSIONID, "Tèng Kim chİnh thøc khai chiÕn! C¸c chiÕn sÜ! X«ng lªn!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- ÈÕ³£ÈÎÎñË¢ĞÂ¶Ô»°NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>ChiÕn dŞch Tèng Kim ®o¹t kú, hiÖn tai ®ang trong giai ®o¹n b¸o danh, nh÷ng ng­êi muèn tham gia h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn TrÊn ®Ó ®Õn ChiÕn tr­êng, hoÆc sö dông Tèng Kim Chiªu Th­ ®Ó ®Õn ®iÓm b¸o danh. Thêi gian khai chiÕn cßn l¹i:"..RestMin.."phót. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 ="<#>C¸ch thêi gian khai chiÕn chØ cßn:"..RestMin.."phót"
		else
			str1 = resultstr.."<#>ChiÕn dŞch Tèng Kim ®o¹t kú, hiÖn tai ®ang trong giai ®o¹n b¸o danh, nh÷ng ng­êi muèn tham gia h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn TrÊn ®Ó ®Õn ChiÕn tr­êng, hoÆc sö dông Tèng Kim Chiªu Th­ ®Ó ®Õn ®iÓm b¸o danh. Thêi gian khai chiÕn cßn l¹i:"..RestMin.."phót"..RestSec.."gi©y. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 = "<#>C¸ch thêi gian khai chiÕn chØ cßn:"..RestMin.."phót"..RestSec.." gi©y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --ÕıÊ½¿ªÕ½µÄµÚÒ»´Î´¥·¢Ê±£¬²úÉúÕ½¶·NpcµÄÉú³É¹æÔòÊı¾İ
			sf_buildfightnpcdata()
		else
			--Ã¿Ò»·ÖÖÓ²úÉúÒ»ÅúNpc£¬²¢ÇÒÍ¨¸æµ±Ç°¶áÆìµÄÊıÁ¿
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ²úÉúÕ½¶·Npc				
			end
			
			bt_pop2signmap()	--½«ÔÚºóÓª£¨fight=0£©µÄÍæ¼ÒËÍ»Ø±¨Ãûµã
			
			if (mod(t, 3 ) == 0) then
				msstr = "C«ng c¸o: tû lÖ ®o¹t cê hiÖn giê lµ <color=yellow>"..BT_GetGameData(GAME_CAMP1)..":"..BT_GetGameData(GAME_CAMP2);
				Msg2MSAll(MISSIONID, msstr);
			end
		end

		if (gamemode == 1 and mod(t, 6) == 0) then
			sf_showflagpos()
		end
	end;


	--Ëæ»ú¶áÆìÄ£Ê½µÄ²úÉúÆì¹æÔò ¡£±ØĞëÔÚÕıÊ½Õ½¶·×´Ì¬²ÅÄÜ·ÅÆì
	if (gamemode == 2) then
		if (GetMissionV(MS_STATE) ~= 2) then
			return
		end;	
		if (mod(t - RUNGAME_TIME, 6) == 0)  then
			sf_createrandomflag()
		end
	end
end;

function sf_showflagpos()
	l_flagx1 , l_flagy1=  sf_getflagposinfo(1)
	l_flagx2,  l_flagy2 = sf_getflagposinfo(2)
	if (l_flagx1 ~= 0 or l_flagy1 ~= 0) then
		flagstr = "<color=0x00FFFF>Th«ng b¸o chiÕn dŞch: hiÖn t¹i so¸i kú bªn Tèng t¹i<color=yellow>"..l_flagx1..","..l_flagy1.."<color>Phô cËn"
		Msg2MSAll(MISSIONID, flagstr)
	end
	if (l_flagx2 ~= 0 or l_flagy2 ~= 0) then
		flagstr = "<color=0x9BFF9B>Th«ng b¸o chiÕn dŞch: hiÖn t¹i soias kú bªn Kim t¹i<color=yellow>"..l_flagx2..","..l_flagy2.."<color>Phô cËn"
		Msg2MSAll(MISSIONID, flagstr)
	end			
end
