IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\jianta\\head.lua")
Include("\\script\\battles\\jianta\\mission.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--¼ÆÊıÆ÷£¬Í³¼Æµ±Ç°¶¨Ê±Æ÷´¥·¢ÁË¶àÉÙ´ÎÁË
	SetMissionV(MS_TIMER1, t)
	
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
		AddGlobalCountNews(resultstr.."Thêi gian b¸o danh Tèng Kim h×nh thøc Th¸p tiÔn ®· ®Õn, trËn chiÕn chİnh thøc b¾t ®Çu!", 2);
		Msg2MSAll(MISSIONID, "Tèng Kim chİnh thøc khai chiÕn! C¸c chiÕn sÜ! X«ng lªn!");
		WriteLog("jianta battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>TrËn ®¸nh Tèng Kim h×nh thøc Th¸p tiÔn v« cïng c¨ng th¼ng, tr­íc m¾t ®ang ë giai ®o¹n b¸o danh, nh÷ng ai muèn tham chiÕn xin h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®¨ng kı b¸o danh; HoÆc sö dông Tèng Kim chiªu th­ ®Ó nhanh chãng ®Õn ®iÓm b¸o danh, thêi gian b¸o danh cßn:"..RestMin.."phót. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 = "<#> Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"
		else
			str1 = resultstr.."<#>TrËn ®¸nh Tèng Kim h×nh thøc Th¸p tiÔn v« cïng c¨ng th¼ng, tr­íc m¾t ®ang ë giai ®o¹n b¸o danh, nh÷ng ai muèn tham chiÕn xin h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®¨ng kı b¸o danh; HoÆc sö dông Tèng Kim chiªu th­ ®Ó nhanh chãng ®Õn ®iÓm b¸o danh, thêi gian b¸o danh cßn:"..RestMin.."phót"..RestSec.."gi©y. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 = "<#> Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"..RestSec.." gi©y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t >= RUNGAME_TIME) then

		--Èç¹û³¡ÉÏÄ³Ò»ÕóÓªÈËÊıµÍÓÚ×îĞ¡ÊıÁ¿£¬Ôò±ÈÈü½áÊø£¬ÈË¶àµÄÕóÓªÖ±½Ó»ñÊ¤
		local group1count = GetMSPlayerCount(MISSIONID, 1)
		local group2count = GetMSPlayerCount(MISSIONID, 2)
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit()) then
			if (group1count > group2count) then
				SetMissionV(MS_MOSTDEATH, 1)
				CloseMission(MISSIONID)
			elseif (group1count < group2count) then
				SetMissionV(MS_MOSTDEATH, 2)
				CloseMission(MISSIONID)
			else
				SetMissionV(MS_MOSTDEATH, 0) 
				CloseMission(MISSIONID)
			end
			return
		end

		
		local tb_jianta_count = {0, 0};	-- ÊôÓÚËÎ/½ğ·½µÄ¼ıËşÊı
		for i = 1, 5 do
			local n_camp	= GetMissionV(MS_TOWER_1 + i - 1);
			if (1 == n_camp or 2 == n_camp) then
				tb_jianta_count[n_camp] = tb_jianta_count[n_camp] + 1;
			end
		end
		local tb_player_actor	= {};
		local idx 	= 0;
		local pidx 	= 0;
		for i = 1, 500 do
			idx, pidx	= GetNextPlayer(MISSIONID, idx, 0)
			if (pidx > 0) then
				tb_player_actor[getn(tb_player_actor) + 1]	= pidx;
			end
			if (idx <= 0) then
				break;
			end
		end
		
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID));	
		local oldPlayeridx	= PlayerIndex;
		
		for i = 1, 5 do
			local jiantaxy 		= GetIniFileData(mapfile, "Jianta_All", format("jianta_%d", i));
			local xj, yj		= bt_str2xydata(jiantaxy);	-- »ñµÃµÚi¸ö¼ıËşµÄ×ø±ê
			for j = 1, getn(tb_player_actor) do
				PlayerIndex = tb_player_actor[j];
				local mapid, xp, yp = GetWorldPos();
				if ((xp - xj) * (xp - xj) + (yp - yj) * (yp - yj) <= 20 * 20 and (GetMissionV(MS_TOWER_1 + i - 1) == GetCurCamp()) ) then
					bt_addtotalpoint(5 * tb_jianta_count[GetCurCamp()]);
				end
				BT_SortLadder();
				BT_BroadSelf();
			end
		end
		
		PlayerIndex = oldPlayeridx;
		
		mar_addmissionpoint(250 * tb_jianta_count[1], 1);
		mar_addmissionpoint(250 * tb_jianta_count[2], 2);
		--Ã¿Ò»·ÖÖÓÍ¨¸æµ±Ç°Ë«·½»ı·Ö£¬ºÍnpc
		if (mod(t, 3) == 0 ) then
			msstr = "C«ng c¸o: hiÖn giê tæng tİch lòy cña 2 phe Tèng - Kim lµ "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end

end



