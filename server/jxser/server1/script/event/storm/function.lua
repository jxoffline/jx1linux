--Storm »î¶¯¿ªÊ¼
--Include("\\script\\event\\storm\\function.lua")
--storm_ask2start(gameid)

--Storm ¼Ó»ı·Ö
--Include("\\script\\event\\storm\\function.lua")
--storm_addpoint(gameid, addpoint)

--Storm ¼Ó½±Àø»ı·Ö£¨ËÎ½ğ£©
--local add_time = 60 * FRAME2TIME / TIMER_1
--Include("\\script\\event\\storm\\function.lua")
--storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

--storm_gettime
--storm_gametime	ÖĞ¼ÓÈëÏà¹ØÓÎÏ·¼ÆÊ±

Include("\\script\\event\\storm\\head.lua")

--¼ì²éµ±Ç°ÊÇ·ñ¿ÉÒÔ¿ªÊ¼»î¶¯»ı·Ö
--·µ»Ø1±íÊ¾¿ÉÒÔ¿ªÊ¼£¬nilÎª²»¿ÉÒÔ
function storm_can_start(gameid, silent)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	storm_anotherday()
	
	local str = ""
	if (GetTask(STORM_TASKID_DAY) > STORM_END_DAY) then	--·ç±©»ı·ÖÏµÍ³ÒÑ¾­¹Ø±ÕÁË
		str = "Xin lçi! HÖ thèng tİch lòy Phong Ba ®· ®ãng l¹i."
	elseif (GetLevel() < 50) then	--50¼¶ÒÔÉÏ
		str = "Xin lçi! §¼ng cÊp b¹n qu¸ thÊp, kh«ng thÓ tham gia ho¹t ®éng tİch lòy."
	elseif (storm_valid_game(gameid)) then	--ÕıÔÚ»î¶¯ÖĞ
		str = "Tr­íc m¾t b¹n"..storm_gamename(gameid, "red").."®· tham gia ho¹t ®éng khiªu chiÕn Phong Ba. Mau ®i tİch lòy ®iÓm ®i!"
	elseif (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) >= TB_STORM_TRYTIMES[gameid] or	--¸Ã»î¶¯³¢ÊÔ´ÎÊı´ïµ½ÉÏÏŞ
		(GetTask(STORM_TASKID_GAMES) >= 3 and GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) == 0)) then	--»ò²Î¼Ó»î¶¯Êı´ïµ½ÉÏÏŞ£¨Èı¸ö£©ÇÒµ±Ç°»î¶¯Ã»ÓĞ²Î¼Ó¹ı
		str = "Xin lçi! H«m nay b¹n kh«ng thÓ tham gia"..storm_gamename(gameid, "red").."tİch lòy Phong Ba råi. Ngµy mai h·y ®Õn ®i!"
	elseif (gameid == 1) then
		local n_timer = tonumber(GetLocalDate("%H%M"))
		if (n_timer > 2245 or n_timer < 200) then	--ËÎ½ğ×îºóÒ»³¡
			str = "ng­¬i ®Õn trÔ qu¸, ngµy mai h·y ®Õn khiªu chiÕn ®i!"
		end
	end
	
	if (str ~= "") then
		if (not silent) then
			Say(str, 0)
		end
		return nil
	end
	
	return 1
end

--½«´Ë´Î±ÈÈüÄÉÈëµ½·ç±©»ı·Ö»î¶¯ÖĞµÄ¶Ô»°
function storm_ask2start(gameid, b_nonext)
--	if (storm_can_start(gameid, 1)) then
--		Say("¡¡¡¡·ç±©»î¶¯¿ª·ÅÈÕÆÚÎª9ÔÂ8ÈÕ-10ÔÂ2ÈÕ£¬°üÀ¨ËÎ½ğ´óÕ½¡¢Ò°ÛÅÈÎÎñÁ´¡¢É±ÊÖÊÔÁ¶ÈÎÎñ¡£Ã¿Ìì¸ù¾İÄãÔÚ¸÷¸öÏµÍ³ÖĞµÄ³É¼¨×ª»¯ÎªÄãµÄ·ç±©»ı·Ö£¨²Î¼ÓÌõ¼ş£º50¼¶¼°ÒÔÉÏÍæ¼Ò£©¡£<enter>"..
--		"¡¡¡¡Ã¿ÈÕ»ı·Ö½«ÔÚÃ¿ÈÕ<color=red>24£º00Çå¿Õ<color>£¬ÇëÔÚ24£º00Ç°ÁìÈ¡»ı·Ö½±Àø¡£<enter>"..
--		"¡¡¡¡Ã¿Ìì<color=red>23£º30<color>¿ªÊ¼µÄËÎ½ğ´óÕ½£¬³É¼¨²»¼ÆÈë·ç±©»ı·Ö¡£<enter>"..
--		"¡¡¡¡ÄãÏÖÔÚÒª¿ªÊ¼½ñÌìµÄ"..storm_gamename(1, "red").."Ö®·ç±©ÌôÕ½Âğ£¿", 2,
--		"ÎÒÒÑ¾­×¼±¸ºÃÁË/#storm_want2start("..gameid..","..tostring(b_nonext)..")",
--		"ÎÒ»¹ÊÇÏÂ´ÎÔÙ¿ªÊ¼°É/#storm_goon_start("..gameid..","..tostring(b_nonext)..")")
--		return 1
--	end
	if not b_nonext then
		storm_goon_start(gameid)	--¿ªÊ¼¾ßÌåµÄ»î¶¯
	end
	return nil
end

--½«´Ë´Î±ÈÈüÄÉÈëµ½·ç±©»ı·Ö»î¶¯ÖĞµÄ¶Ô»°
function storm_want2start(gameid, b_nonext)
	if (storm_can_start(gameid)) then
		local str = TB_STORM_HELP[gameid]..TB_STORM_DIALOG[gameid]
		if (gameid == 1) then	--ËÎ½ğ´óÕ½ĞèÒª¶îÍâµÄÏÔÊ¾¼¶±ğºÍµ±Ç°»ı·Ö
			local tb_levelstr = {
				"Trong chiÕn tr­êng Tèng Kim s¬ cÊp, mçi ng­êi mçi ngµy nhËn ®­îc tİch lòy Phong Ba cao nhÊt <color=yellow>80<color> ®iÓm.",
				"Trong chiÕn tr­êng Tèng Kim trung cÊp, mçi ng­êi mçi ngµy nhËn ®­îc tİch lòy Phong Ba cao nhÊt <color=yellow>90<color> ®iÓm.",
				"Trong chiÕn tr­êng Tèng Kim cao cÊp, mçi ng­êi mçi ngµy nhËn ®­îc tİch lòy Phong Ba cao nhÊt <color=yellow>100<color> ®iÓm."
			}
			local level = BT_GetGameData(GAME_LEVEL)
			local point = 0
			if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER)) then
				point = GetTask(751)
			end
			str = format(str,tb_levelstr[level],point)
		end
		Say(str, 2,"Ta muèn x¸c ®Şnh b¾t ®Çu/#storm_start("..gameid..",nil,"..tostring(b_nonext)..")","§îi mét l¸t ®i!/#storm_goon_start("..gameid..","..tostring(b_nonext)..")")
		return 1
	end
	return nil
end

--¿ªÊ¼Ä³Ò»»î¶¯µÄ¼Æ·Ö
--gameid£º	1~10	»î¶¯µÄID
--·µ»ØÖµ£º	1Æô¶¯³É¹¦	nilÆô¶¯Ê§°Ü
function storm_start(gameid, silent, b_nonext)
	if (not storm_can_start(gameid, silent)) then	--²»ÄÜ¿ªÊ¼¸Ã»î¶¯
		return nil
	end
	
	local nowtime = storm_gettime(gameid)
	if (nowtime == 0) then
		Say("HiÖn t¹i"..storm_gamename(gameid, "red").."ho¹t ®éng ch­a b¾t ®Çu, ®îi mét l¸t quay l¹i ®i!", 0)
	end
	
	local gamemode = 0
	--²¿·Ö»î¶¯ÌØÊâÒªÇó
	if (gameid == 1) then
		local ruleid = BT_GetGameData(GAME_RULEID)
		local sjmode = 0
		if (ruleid == 16) then	--ÔªË§Ä£Ê½
			sjmode = 3
		elseif (ruleid == 20) then	--É±Â¾Ä£Ê½
			sjmode = 4
		elseif (ruleid == 11) then
			local tempSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(BT_GetGameData(GAME_MAPID))
			sjmode = GetMissionV(2)	--1¡¢¹Ì¶¨¶áÆì£»2¡¢Ëæ¼´¶áÆì
			SubWorld = tempSubWorld;
		end
		local level = BT_GetGameData(GAME_LEVEL)
		if (sjmode == 0 or level == 0) then
			Say("Xin lçi! Ch­a x¸c ®Şnh ®­îc ph­¬ng thøc, kh«ng thÓ b¾t ®Çu khiªu chiÕn Phong Ba, xin liªn hÖ GM ®Ó gi¶i quyÕt!", 0)
			return nil
		end
		gamemode = sjmode*10+level
	elseif (gameid == 2) then
		gamemode = map_isadvanced[SubWorldIdx2ID(SubWorld)]
		if (gamemode == nil) then
			Say("Xin lçi! Ch­a x¸c ®Şnh ®­îc ®¼ng cÊp s¸t thñ, kh«ng thÓ b¾t ®Çu khiªu chiÕn Phong Ba, xin liªn hÖ GM ®Ó gi¶i quyÕt!", 0)
			return nil
		end
	elseif (gameid == 4) then
		TM_SetTimer(STORM_TIMER_YS*60*18, STORM_TIMERID_YS, 60/STORM_TIMER_YS, 2)
	end
	
	--»î¶¯ÖÖÀà¼ÆÊı
	local trycount = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT])
	if (trycount == 0) then	--½ñÌìµÚÒ»´Î½øĞĞÕâ¸ö»î¶¯£¬Ôö¼Ó»î¶¯¼ÆÊı
		SetTask(STORM_TASKID_GAMES, GetTask(STORM_TASKID_GAMES) + 1)
	end
	
	--³õÊ¼»¯±äÁ¿
	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START], nowtime)
	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT], trycount + 1)
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX], 0)
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR], 0)
	if (gameid ~= 2) then	--É±ÊÖÊÔÁ¶²»Çå³ıÔ­Ê¼³É¼¨
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA], 0)
	end
	
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE], gamemode)	--ÓÎÏ·µ±Ç°Ä£Ê½
	
	Msg2Player(storm_gamename(gameid).."khiªu chiÕn Phong Ba b¾t ®Çu råi.")
	debug_out(storm_gamename(gameid).."H×nh thøc chi tiÕt:"..gamemode)
	
	if (tonumber(GetLocalDate("%H")) == 23) then
		local str = "Chó ı: Tİch lòy Phong Ba h«m nay sÏ mÊt hiÖu dông vµo lóc 24h:00 (lÊy giê trªn Server lµm chuÈn) , xin kŞp thêi nhËn phÇn th­ëng cña m×nh!"
		Talk(1, "", str)
		Msg2Player(str)
	end
	
	if (gameid == 4) then
		storm_add_pointex(4, 40)
	end

	if not b_nonext then
		storm_goon_start(gameid)	--¿ªÊ¼¾ßÌåµÄ»î¶¯
	end
	return 1
end

--ÖØĞÂ¼ÆËãµ±ÈÕ×Ü»ı·Ö£¬Èç¹ûÓĞ±ä»¯£¬ÔòÍ¬Ê±¼ÇÂ¼ÈÕ¡¢ÖÜ¡¢ÔÂ»ı·Ö
--Èç¹ûgameid²»Îªnil£¬ÔòÎªÖ¸¶¨µÄ»î¶¯¸Ä±ä»ı·Ö
function storm_calc_today(gameid, newpoint)
	if (gameid ~= nil and TB_STORM_TASKID[gameid] ~= nil) then	--¸Ä±äÖ¸¶¨µÄ»î¶¯»ı·Ö
		local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
		if (gameid == 1) then	--ËÎ½ğ»ı·ÖÉÏÏŞ
			local level = mod(gamemode, 10)
			if (level == 1 and newpoint > 80) then	--³õ¼¶80·Ö
				newpoint = 80
			elseif (level == 2 and newpoint > 90) then	--ÖĞ¼¶90·Ö
				newpoint = 90
			end
		elseif (gameid == 2) then	--É±ÊÖ»ı·ÖÉÏÏŞ
			if (gamemode ~= 1 and newpoint > 90) then	--³õ¼¶90·Ö
				newpoint = 90
			end
		end
	
		--if (newpoint == GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR])) then	--»ı·ÖÎŞ±ä»¯£¬Ö±½Ó·µ»Ø
			--return
		--end
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR], newpoint)
		local pointmax = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])
		if (newpoint >= pointmax) then	--³¬¹ıµ±ÈÕ×î¸ß·Ö¼ÇÂ¼£¬¸Ä±ä×î¸ß·Ö
			pointmax = newpoint
		end
		local str = "Tr­íc m¾t b¹n"..storm_gamename(gameid).."tİch lòy Phong Ba ®æi lµ:"..storm_point2str(newpoint)
		if (TB_STORM_TRYTIMES[gameid] > 1) then	--¸Ã»î¶¯¿ÉÒÔ½øĞĞ¶à´Î
			str = str..", thµnh tİch tèt nhÊt trong ho¹t ®éng h«m nay cña b¹n lµ:"..storm_point2str(pointmax)
		end
		debug_out(str)
		--if (pointmax == GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])) then	--×î¸ß·ÖÃ»ÓĞ¸Ä±ä£¬Ö±½Ó·µ»Ø
			--return
		--end
		nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX], pointmax)
	end

	local todaypoint = 0
	--¼ÆËãËùÓĞ»î¶¯×Ü»ı·Ö
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			local point = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
			if (point > 0) then
				todaypoint = todaypoint + point
			end
		end
	end

	--¼ÇÂ¼µ±ÈÕ¡¢±¾ÖÜ¡¢±¾ÔÂ»ı·Ö
	local addpoint = todaypoint - GetTask(STORM_TASKID_DAY_POINT)	--±¾ÈÕ»ı·ÖÔö³¤
	if (addpoint ~= 0) then
		if (gameid ~= 1 or (floor(todaypoint/5) > floor((todaypoint-addpoint)/5))) then	--ËÎ½ğÒª×Ü·ÖÔö¼Ó³¬¹ı5·Ö£¬¸æÖª»ı·ÖÇé¿ö
			Msg2Player("Tİch lòy Phong Ba tr­íc m¾t cña b¹n lµ:"..storm_point2str(todaypoint))
		end
		
		nt_settask(STORM_TASKID_DAY_POINT, todaypoint)
		local weekpoint = GetTask(STORM_TASKID_WEEK_POINT) + addpoint
		nt_settask(STORM_TASKID_WEEK_POINT, weekpoint)
		local monthpoint = GetTask(STORM_TASKID_MONTH_POINT) + addpoint
		nt_settask(STORM_TASKID_MONTH_POINT, monthpoint)
		
		local playername = GetName()
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 0 and weekid <= 3) then 	--ÔİÊ±Ö»ÓĞ4ÖÜÅÅĞĞ
			Ladder_NewLadder(STORM_LADDERID_WEEK1 + weekid, playername, weekpoint, 1);
		end
		Ladder_NewLadder(STORM_LADDERID_MONTH, playername, monthpoint, 1);
		
		debug_out("Tİch lòy h«m nay:"..storm_point2str(todaypoint).."; tuÇn nµy:"..storm_point2str(weekpoint).."; th¸ng nµy:"..storm_point2str(monthpoint))	--temp
	end
end

--Ëã»ı·Öº¯Êı
function storm_calc_point(tb_point, pointorg)
	local newpoint = 0
	for i = 1, getn(tb_point) do
		if (pointorg >= tb_point[i][2]) then
			if (i <= 1) then
				newpoint = tb_point[i][1]
			else
				newpoint = tb_point[i][1] + floor((pointorg - tb_point[i][2])*(tb_point[i-1][1] - tb_point[i][1])/(tb_point[i-1][2] - tb_point[i][2]))
			end
			break
		end
	end
	return newpoint
end

--¼ÆËã²¢¼ÇÂ¼Ä³Ò»»î¶¯µÄµ±Ç°»ı·Ö£¨ÀÛ¼Ó£©
--gameid£º	1~10	»î¶¯µÄID
--addpoint£º»î¶¯Ôö¼Ó·Ö
--·µ»ØÖµ£º	1¼Æ·Ö³É¹¦	0¼Æ·ÖÊ§°Ü
function storm_addpoint(gameid, addpoint)
	--¼ì²éµ±Ç°»î¶¯ÊÇ·ñÓĞĞ§£¬ÇÒaddpoint´óÓÚ0
	if (not storm_valid_game(gameid) or addpoint <= 0) then
		return nil
	end
	
	--¸ù¾İ²»Í¬µÄgameid£¬Ñ¡Ôñ²»Í¬µÄ»ı·Ö±íÀ´¼ÆËã»ı·Ö
	local newpoint = 0
	local pointorg = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA]) + addpoint	--»î¶¯Ô­Ê¼·Ö
	local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
	if (gameid == 1) then
		local sjmode = floor(gamemode/10)
		local sjlevel = mod(gamemode,10)
		local tb_sjmode = {"§o¹t cê cè ®Şnh", "§o¹t cê ngÉu nhiªn", "D¹ng thøc nguyªn so¸i", "D¹ng thøc Cõu s¸t"}
		local tb_sjlevel = {" (S¬) ", " (Trung) ", " (Cao) "}
		debug_out("§iÓm tİch lòy ban ®Çu [<color=blue>ChiÕn tr­êng Tèng Kim-"..tb_sjmode[sjmode]..tb_sjlevel[sjlevel].."<color>] cña b¹n lµ:"..storm_point2str(pointorg))	--temp
		newpoint = storm_calc_point(TB_STORM_POINT[1][sjmode], pointorg)
	elseif (gameid == 2) then
		local pointorg = pointorg - addpoint
		debug_out("lÇn nµy"..storm_gamename(gameid).."cßn d­ thêi gian lµ:"..storm_point2str(addpoint)..", kû lôc cò:"..pointorg)
		if (addpoint > pointorg) then	--´Ë´ÎÊ£ÓàÊ±¼ä¸ü¶à
			pointorg = addpoint
		end
		newpoint = storm_calc_point(TB_STORM_POINT[gameid], addpoint)
	else
		debug_out("cña b¹n"..storm_gamename(gameid).."§iÓm tİch lòy ban ®Çu:"..storm_point2str(pointorg))	--temp
		newpoint = storm_calc_point(TB_STORM_POINT[gameid], pointorg)
	end
	
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA],pointorg)	--±£´æ»î¶¯Ô­Ê¼·Ö
	newpoint = newpoint + GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX])	--¼ÓÉÏ½±Àø»ı·Ö
	storm_calc_today(gameid, newpoint)	--¼Æ·Ö
	return 1
end

--¼ÆËã²¢¼ÇÂ¼Ä³Ò»»î¶¯µÄµ±Ç°»ı·Ö£¨¸üĞÂ£¬È¡ÀúÊ·×îºÃÖµ£©
--gameid£º	1~10	»î¶¯µÄID
--addpoint£º»î¶¯Ôö¼Ó·Ö
--·µ»ØÖµ£º	1¼Æ·Ö³É¹¦	0¼Æ·ÖÊ§°Ü
function storm_newpoint(gameid, newpoint)
	--¸ù¾İ²»Í¬µÄgameid£¬Ñ¡Ôñ²»Í¬µÄ»ı·Ö±íÀ´¼ÆËã»ı·Ö
	local newpoint = 0
	local oldpoint = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA])	--»î¶¯Ô­Ê¼·Ö
	local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
	debug_out("lÇn nµy"..storm_gamename(gameid).."®iÓm sè:"..storm_point2str(addpoint)..", ®iÓm ban ®Çu:"..pointorg)
	if (newpoint < oldpoint) then	--´Ë´ÎµÃ·Ö¸üµÍ
		newpoint = oldpoint
	else
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA], newpoint)	--±£´æ»î¶¯Ô­Ê¼·Ö
	end
	
	local stormpoint = storm_calc_point(TB_STORM_POINT[gameid], newpoint)	--Ëã»ı·Ö
	stormpoint = stormpoint + GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX])	--¼ÓÉÏ½±Àø»ı·Ö
	storm_calc_today(gameid, stormpoint)	--¼Æ·Ö
	
	return 1
end

--Ôö¼Ó½±Àø»ı·Ö
--gameid£º	1~10	»î¶¯µÄID
--addpoint£ºÔö¼ÓµÄ»ı·Ö
function storm_add_pointex(gameid, addpoint)
	--¼ì²éµ±Ç°»î¶¯ÊÇ·ñÓĞĞ§
	if (not storm_valid_game(gameid)) then
		return nil
	end
	
	local pointex = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX]) + addpoint
	
	if (pointex > 40) then	--×î¶à40½±Àø·Ö
		addpoint = addpoint - (pointex - 40)
		pointex = 40
	end
	
	if (addpoint <= 0) then	--²»ÊÇÕıµÄ£¬Ö±½Ó·µ»Ø
		return nil
	end
	
	Msg2Player("B¹n ®¹t ®­îc"..storm_gamename(gameid).."PhÇn th­ëng tham gia - tİch lòy Phong Ba"..storm_point2str(addpoint).."phót")

	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX], GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX]) + addpoint)	--¼ÇÂ¼¸½¼Ó·Ö

	storm_calc_today(gameid, GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR]) + addpoint)	--¼ÇÂ¼¸Ã»î¶¯»ı·Ö¡¢²¢¼ÆËã½ñÈÕ×Ü·ÖµÈ

	return 1
end

--ÔÚÊÊµ±µÄÊ±ºòÎªMissionÖĞËùÓĞ³ÉÔ±Ôö¼Ó½±Àø»ı·Ö
--gameid£º	1~10	»î¶¯µÄID
--msid£º	Mission ID
--time£º	µ±timeÊÇ10¡¢20¡¢30Ê±ÓĞĞ§
function storm_addm_mspointex(gameid, msid, time)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	local addpoint = 0
	if (time == 10) then
		addpoint = 10
	elseif (time == 20) then
		addpoint = 10
	elseif (time == 30) then
		addpoint = 20
	else
		return nil
	end
	
	local orgindex = PlayerIndex
	local idx = 0;
	for i = 1, 500 do 
		idx, PlayerIndex = GetNextPlayer(msid, idx, 0);
		if PlayerIndex> 0 then
			storm_add_pointex(1, addpoint)
		end
		if (idx == 0) then 
			break
		end;
	end
	PlayerIndex = orgindex
	
	return 1
end

function storm_clear(gameid)
	if (gameid == nil) then
		Msg2Player("Xãa hÕt c¸c tin tøc tİch lòy cña nh©n vËt nµy!")
		--ÇåÈÎÎñ±äÁ¿
		SetTask(1550,0);	--É±ÊÖ½øĞĞ´ÎÊı
		SetTask(1036,0);	--Ò°ÛÅÈ¡Ïû´ÎÊı
		for i = 1661, 16710 do
			SetTask(i,0);
		end
	else
		if (TB_STORM_TASKID[gameid] == nil) then
			Msg2Player("error gameid!")
			return nil
		end
		Msg2Player("Xãa hÕt nh©n vËt"..storm_gamename(gameid).."tin tøc tİch lòy!")
		if (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) > 0) then	--²ÎÓë¹ı£¬¼õ²ÎÓë»î¶¯Êı
			SetTask(STORM_TASKID_GAMES, GetTask(STORM_TASKID_GAMES) - 1)
		end
		--¼õ»ı·Ö
		local gamepoint = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])
		SetTask(STORM_TASKID_DAY_POINT, GetTask(STORM_TASKID_DAY_POINT) - gamepoint)
		SetTask(STORM_TASKID_WEEK_POINT, GetTask(STORM_TASKID_WEEK_POINT) - gamepoint)
		SetTask(STORM_TASKID_MONTH_POINT, GetTask(STORM_TASKID_MONTH_POINT) - gamepoint)
		--ÇåÈÎÎñ±äÁ¿
		if (gameid == 2) then
			SetTask(1550,0);	--É±ÊÖ½øĞĞ´ÎÊı
		elseif (gameid == 4) then
			SetTask(1036,0);	--Ò°ÛÅÈ¡Ïû´ÎÊı
		end
		for i = 1, getn(TB_STORM_TASKID[gameid]) do
			SetTask(TB_STORM_TASKID[gameid][i],0);
		end
	end
	--¸ÄÅÅĞĞ
	local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
	if (weekid >= 0 and weekid <= 3) then
		Ladder_NewLadder(10182+weekid, GetName(), GetTask(STORM_TASKID_WEEK_POINT), 0)
	end
	Ladder_NewLadder(10186, GetName(), GetTask(STORM_TASKID_MONTH_POINT), 0)

	--Í¬²½TaskValue
	SyncTaskValue(STORM_TASKID_DAY_POINT)
	SyncTaskValue(STORM_TASKID_DAY_LASTPOINT)
	SyncTaskValue(STORM_TASKID_WEEK_POINT)
	SyncTaskValue(STORM_TASKID_WEEK_LASTPOINT)
	SyncTaskValue(STORM_TASKID_MONTH_POINT)
	SyncTaskValue(STORM_TASKID_MONTH_LASTPOINT)
	SyncTaskValue(STORM_TASKID_DATE)
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i]) then
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_START])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
		end
	end
end

--¿ªÊ¼¾ßÌå»î¶¯µÄº¯Êı£¬ÕâÀïÔİ¶¨Ò»¸ö¿Õº¯Êı
function storm_goon_start(gameid)
end