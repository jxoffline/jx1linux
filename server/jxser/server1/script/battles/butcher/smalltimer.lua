IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\butcher\\head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- ½â·Å»î¶¯Ö®Ç§ÇïÓ¢ÁÒ
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\battles\\songjingtetan_position.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")


tbIndex = {}	-- Ñ¡ÖĞµÄ×ø±êµÄIndex
tbPoint = {}	-- µ±Ç°±»Ñ¡ÔñµÄ×ø±ê¼¯ºÏ
tbNpc = 
{
	[1] = 
	{
		nNpcId = 1685,  --npc Id
		nLevel = 95,		-- µÈ¼¶
		--nSeries = 1,		-- ÎåĞĞ
		bNoRevive = 1,			-- ²»ÖØÉú
		szName = "§Æc Th¸m",		-- Ãû×Ö
		nIsboss = 1,
		nCurCamp = 1,	--ÕóÓª 1ËÎ 2½ğ
	},
	[2] = 
	{
		nNpcId = 1686,  --npc Id
		nLevel = 95,		-- µÈ¼¶
	--	nSeries = 1,		-- ÎåĞĞ
		bNoRevive = 1,			-- ²»ÖØÉú
		szName = "§Æc Th¸m",		-- Ãû×Ö
		nIsboss = 1,
		nCurCamp = 2,	--ÕóÓª 1ËÎ 2½ğ
	}
} 

function SelectPosition(nRandomCount)
	for i=1,4 do
		tbIndex[i] = random(1,nRandomCount)
		local bFlag = 1
		for j=1,i-1 do
			if tbIndex[j] == tbIndex[i] then
				bFlag = 0
				break
			end
		end
		if bFlag == 0 then
			i = i - 1
		end
	end
end

function AddTeTan(nNowTimeCount)
	if tbAppearTime[nNowTimeCount - RUNGAME_TIME] == 1 then
		local nrandomCount = 0
		-- ÅĞ¶¨µ±Ç°µØÍ¼µÄId
		local nNowMapId = BT_GetGameData(GAME_MAPID)
		if nNowMapId == 380 then
			tbPoint = tbPoint_map380
			nrandomCount = 10
		elseif nNowMapId == 383 then
			tbPoint = tbPoint_map383
			nrandomCount = 20
		else
			return
		end
		s_area = BT_GetGameData(GAME_CAMP1AREA) 	-- GAME_CAMP1AREA ËÎ GAME_CAMP1AREA ½ğ
		j_area = BT_GetGameData(GAME_CAMP2AREA)
		
		Msg2MSAll(MISSIONID, "§Æc Th¸m míi ®· tiÕn vµo chiÕn tr­êng råi, mäi ng­êi nhanh chãng hµnh ®éng!");
		
		SelectPosition(nrandomCount)
		local tbPosition_s = tbPoint[s_area]
		local tbPosition_j = tbPoint[j_area]
		
		for i=1,4 do
			local nIndex = tbIndex[i]
			tbNpc.szName = "§Æc Th¸m"
			basemission_CallNpc(tbNpc[1], nNowMapId, tbPosition_s[nIndex].x * 32, tbPosition_s[nIndex].y * 32)
			local msg = format("T¨ng thªm Tèng Kim §Æc Th¸m: X = %d Y = %d",tbPosition_s[nIndex].x,tbPosition_s[nIndex].y)
			WriteLog(msg)
			tbNpc.szName = "§Æc Th¸m"
			basemission_CallNpc(tbNpc[2], nNowMapId, tbPosition_j[nIndex].x * 32, tbPosition_j[nIndex].y * 32)
			local msg = format("T¨ng thªm Kim §Æc Th¸m : X = %d Y = %d",tbPosition_j[nIndex].x,tbPosition_j[nIndex].y)
			WriteLog(msg)
		end
	end
end

-- 20sµ÷ÓÃÒ»´Î
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
		AddGlobalCountNews(resultstr.."Thêi gian b¸o danh Phong V©n LuËn KiÕm ®· hÕt! ChiÕn ®Êu chİnh thøc khai chiÕn!", 2);
		Msg2MSAll(MISSIONID, "Phong V©n LuËn KiÕm chİnh thøc khai chiÕn! C¸c chiÕn sÜ! X«ng lªn!");
		WriteLog("butcher battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- ÈÕ³£ÈÎÎñË¢ĞÂ¶Ô»°NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Phong V©n LuËn KiÕm ®ang trong giai ®o¹n b¸o danh. C¸c hiÖp kh¸ch muèn tham gia h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh! (hoÆc dïng Phong V©n Chiªu th­) .Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.." phót. §iÒu kiÖn tham gia: CÊp kh«ng İt h¬n 40, phİ b¸o danh 1 Phong V©n Chiªu Binh LÖnh. Sau khi khai chiÕn nÕu nh­ vÉn ch­a ®Õn giíi h¹n cao nhÊt th× vÉn cã thÓ b¸o danh vµo tiÕp";
			str2 = "<#>C¸ch thêi gian khai chiÕn chØ cßn:"..RestMin.."phót"
		else
			str1 = resultstr.."<#>Phong V©n LuËn KiÕm ®ang trong giai ®o¹n b¸o danh. C¸c hiÖp kh¸ch muèn tham gia h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh! (hoÆc dïng Phong V©n Chiªu th­) .Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.."phót"..RestSec.." gi©y. §iÒu kiÖn tham gia: CÊp kh«ng İt h¬n 40, phİ b¸o danh 1 Phong V©n Chiªu Binh LÖnh. Sau khi khai chiÕn nÕu nh­ vÉn ch­a ®Õn giíi h¹n cao nhÊt th× vÉn cã thÓ b¸o danh vµo tiÕp";
			str2 = "<#>C¸ch thêi gian khai chiÕn chØ cßn:"..RestMin.."phót"..RestSec.." gi©y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t >= RUNGAME_TIME) then
		AddTeTan(t)  -- Ôö¼ÓËÎ½ğÌØÌ½

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
		if (t > RUNGAME_TIME) then
			--Ã¿Ò»·ÖÖÓÍ¨¸æµ±Ç°Ë«·½»ı·Ö£¬ºÍnpc
			if (mod(t, 3) == 0 ) then
				msstr = "C«ng c¸o: hiÖn giê tæng tİch lòy cña 2 phe lµ "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
				Msg2MSAll(MISSIONID, msstr)
			end
		
			but_pop2home( 1 )
			but_pop2home( 2 )
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end

end



