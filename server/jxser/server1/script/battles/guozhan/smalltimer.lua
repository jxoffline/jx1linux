IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\guozhan\\head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- ½â·Å»î¶¯Ö®Ç§ÇïÓ¢ÁÒ

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
		AddGlobalCountNews(resultstr.."Thêi gian b¸o danh Tèng Kim (ph­¬ng thøc b¶o vÖ Nguyªn So¸i) ®· kÕt thóc. ChiÕn ®Êu chİnh thøc b¾t ®Çu", 2);
		Msg2MSAll(MISSIONID, "Tèng Kim chİnh thøc khai chiÕn! C¸c chiÕn sÜ! X«ng lªn!");
		WriteLog("marshal battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#> ChiÕn dŞch Tèng Kim (Ph­¬ng thøc B¶o vÖ Nguyªn so¸i) ®ang trong giai ®o¹n b¸o danh. C¸c hiÖp kh¸c muèn tham gia h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh. (hoÆc sö dông Tèng Kim Chiªu Th­) .Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 = "<#> Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"
		else
			str1 = resultstr.."<#> ChiÕn dŞch Tèng Kim (Ph­¬ng thøc B¶o vÖ Nguyªn so¸i) ®ang trong giai ®o¹n b¸o danh. C¸c hiÖp kh¸c muèn tham gia h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh. (hoÆc sö dông Tèng Kim Chiªu Th­) .Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"..RestSec.."gi©y. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!";
			str2 = "<#> Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"..RestSec.." gi©y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t >= RUNGAME_TIME) then

		if (t == RUNGAME_TIME) then --ÕıÊ½¿ªÕ½µÄµÚÒ»´Î´¥·¢Ê±£¬²úÉúÕ½¶·NpcµÄÉú³É¹æÔòÊı¾İ
			sf_buildfightnpcdata()
		else
			--µ½¿ªÕ½ºó°ëĞ¡Ê±¿´Ë«·½×Ü»ı·Ö£¬»ı·ÖĞ¡µÄÒ»·½²úÉúÔªË§
			if (t == BOSS_TIME) then
				if (GetMissionV(MS_TOTALPOINT_S) < GetMissionV(MS_TOTALPOINT_J)) then
					marshal_down(1)
					SetMissionV(MS_MARSHAL, 1)
				elseif(GetMissionV(MS_TOTALPOINT_S) > GetMissionV(MS_TOTALPOINT_J)) then
					marshal_down(2)
					SetMissionV(MS_MARSHAL, 2)
				elseif(GetMissionV(MS_TOTALPOINT_S) == GetMissionV(MS_TOTALPOINT_J)) then
					marshal_down(2)
					marshal_down(1)
					SetMissionV(MS_MARSHAL, 3)
				end
			end

			if (t == VANISHGAME_TIME) then	--µ½×îºó20·ÖÖÓÊ±½«ÁíÒ»·½µÄÔªË§²úÉú
				mar = GetMissionV(MS_MARSHAL)
				if (mar == 1) then
					marshal_down(2)
				elseif (mar == 2) then
					marshal_down(1)
				end
			end
			
			bt_pop2signmap()	--½«ÔÚºóÓª£¨fight=0£©µÄÍæ¼ÒËÍ»Ø±¨Ãûµã
			
			--Ã¿Ò»·ÖÖÓÍ¨¸æµ±Ç°Ë«·½»ı·Ö£¬ºÍnpc
			if (mod(t, 3) == 0 ) then
				sf_callfightnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ²úÉúÕ½¶·Npc				
				msstr = "C«ng c¸o: hiÖn giê tæng tİch lòy cña 2 phe Tèng - Kim lµ "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
				Msg2MSAll(MISSIONID, msstr)
			end
			

		end
	end
end

function sf_callfightnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
	
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
end

function marshal_down(camp)
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	if (camp == 1) then
		enterpos = GetIniFileData(mapfile, "Area_"..s_area, "generalpos");
		x,y = bt_str2xydata(enterpos)	
		npcidx_s = AddNpc(GetMissionV(MS_TRANK1_S + 6 - 1), GetMissionV(MS_RANK1LVL_S + 6 - 1), SubWorld, x*32, y*32, 1, "Nguyªn So¸i phe Tèng", 1)
		SetNpcCurCamp(npcidx_s, 1)
		SetNpcDeathScript(npcidx_s, tabFILE_NPCDEATH[6])
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>Tèng Kim chiÕn b¸o: Nguyªn So¸i phe Tèng ®· xuÊt hiÖn")
	else
		enterpos = GetIniFileData(mapfile, "Area_"..j_area, "generalpos");
		x,y = bt_str2xydata(enterpos)	
		npcidx_j = AddNpc(GetMissionV(MS_TRANK1_J + 6 - 1), GetMissionV(MS_RANK1LVL_J + 6 - 1), SubWorld, x*32, y*32, 1, "Nguyªn So¸i phe Kim", 1)
		SetNpcCurCamp(npcidx_j, 2)
		SetNpcDeathScript(npcidx_j, tabFILE_NPCDEATH[6])
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>Tèng Kim chiÕn b¸o: Nguyªn So¸i phe Kim ®· xuÊt hiÖn")
	end		
end