--coding by romandou 2004-12-22
--Õ½ÒÛµÄ±¨ÃûµãNpc¶Ô»°½Å±¾

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

Include("\\script\\battles\\vngbattlesign.lua")


function main()
dofile("script/battles/battlejoin.lua");	
	local nWorld, _, _ = GetWorldPos()
	--if nWorld ~= 162 then
		--Talk(1, "", "Chøc n¨ng ®· ®ãng.")
		--return
	--end
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	bt_setnormaltask2type()
	if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
		Say("§¹i qu©n cña ta vÉn ch­a xuÊt ph¸t! H·y t¹m thêi nghØ ng¬i ®îi tin nhĞ!",0)
		SubWorld = nOldSubWorld
		return
	end

-------------------------------------------------------------------	
--ÅĞ¶ÏÍæ¼ÒµÈ¼¶Óë±¨ÃûµãµÈ¼¶ÊÇ·ñÏàÊÊºÏ
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --Íæ¼ÒµÈ¼¶
	local bt_level = 0;	-- µ±Ç°µØÍ¼ËùÊôµÄÕ½ÒÛµÈ¼¶
	
	if (pl_level < 40 ) then
		Say("ChiÕn tr­êng chØ dµnh cho ng­êi tõ cÊp 40 trë lªn, ng­¬i ch­a ®ñ ®iÒu kiÖn. Cè g¾ng tËp luyÖn thªm ®i!",2, "§­îc!/bt_oncancel", "Ta muèn t×m hiÓu th«ng tin chiÕn dŞch./bt_onbattleinfo");--£¿£¿¡°ÄãµÄµÈ¼¶Ğ¡ÓÚ40¼¶»òÕßÃ»ÓĞ´ø×ãÒøÁ½¡£¡±
		SubWorld = nOldSubWorld
		return 
	elseif (pl_level < 80) then
		bt_level = 1
	elseif (pl_level < 120) then
		bt_level = 2
	else
		bt_level = 3
	end;
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("B¸o danh Tèng Kim, ID cã vÊn ®Ò, xin bé phËn vËn hµnh kiÓm tra gÊp!");
		 	SubWorld = nOldSubWorld
		 	return 	
		 end
		 Say("Khu vùc nµy lµ "..szGAME_GAMELEVEL[maplevel]..", §¼ng cÊp cña ng­¬i hiÖn giê chØ cã thÓ "..szGAME_GAMELEVEL[bt_level].."®Ó b¸o danh!", 0)--£¿£¿Ã»ÓĞ·ÖµÈ¼¶µÄÌáÊ¾ĞÅÏ¢		 
		 SubWorld = nOldSubWorld
		 return
	end

-------------------------------------------------------------------	
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ tiÕn hµnh Tèng Kim ®¹i chiÕn!", 0 )
		SubWorld = nOldSubWorld
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("Xin lçi! §¹i chiÕn vÉn ch­a b¾t ®Çu! LÇn sau quay l¹i nhĞ!", 0 )
		SubWorld = tempSubWorld;		
		return
	elseif (state == 3) then
		Say("Xin lçi! §¹i chiÕn ®· kÕt thóc! LÇn sau quay l¹i nhĞ!", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("Xin lçi! §¹i chiÕn ®· kÕt thóc! LÇn sau quay l¹i nhĞ!", 0)
		SubWorld = nOldSubWorld
		return 
	end

	if (bt_ncamp == 1) then
		Say("ChiÕn dŞch ["..battlename.."]ChiÕn dŞch ®· b¾t ®Çu, mäi ng­êi h·y v× tö d©n ®¹i tèng, tôc ng÷ cã c©u: Thiªn h¹ h­ng vong, thÊt phu h÷u tr¸ch. Nay ng­êi kim x©m ph¹m bê câi chóng ta, ®©y lµ lóc b¸o hiÕu ®Êt n­íc, chØ cÇn cÊp 40 trë lªn vµ cÇn 1Tèng Kim Chiªu Binh LÖnh Bµi th× cã thÓ ®Òn ®¸p quèc gia råi, nµo ng­êi anh em cßn chÇn chõ g× n÷a!", 2, "Ta tham gia! (§iÓm tİch lòy trë vÒ 0) /bt_joinsong", "§Ó ta suy nghÜ l¹i!/bt_oncancel");
	else
		Say("ChiÕn dŞch ["..battlename.."]ChiÕn dŞch ®· b¾t ®Çu, hìi c¸c vŞ dòng sÜ Kim quèc, thêi kh¾c nhÊt thèng thiªn h¹ vµ dÑp bän Tèng quèc nam man c¶n ®­êng cña chóng ta ®· ®Õn. Nay Kim quèc rÊt cÇn sù trî lùc cña c¸c ng­¬i, chØ cÇn cÊp 40 trë lªn vµ nép 1 Tèng Kim Chiªu Binh LÖnh Bµi lµ cã thÓ ®Òn ®¸p quèc gia råi, nµo ng­êi anh em cßn chÇn chõ g× n÷a!", 2, "Ta tham gia! (§iÓm tİch lòy trë vÒ 0) /bt_joinjin", "§Ó ta suy nghÜ l¹i!/bt_oncancel");
	end
	SubWorld = nOldSubWorld
	return	
end;
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
--if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
	if (bt_ncamp == 1) then
		Say("Nh×n ng­¬i m¾t la mµy loĞt, nhÊt ®Şnh lµ Kim quèc gian tÕ! Ng­êi ®©u! B¾t lÊy h¾n!",0)
		Msg2Player("Ng­¬i ®· ®Çu qu©n cho Kim quèc, h·y ®Õn gÆp Mé binh quan xin nhËp chiÕn tr­êng!")
	else
		Say("Tªn Nam man kia, c¶ gan th©m nhËp vµo l·nh ®Şa ®¹i Kim, râ rµng lµ tù t×m c¸i chÕt!",0)
		Msg2Player("Ng­¬i ®· ®Çu qu©n cho Kim quèc, h·y ®Õn gÆp Mé binh quan xin nhËp chiÕn tr­êng!")	
	end;
	SubWorld = nOldSubWorld
	return 
end

----------------------------------------------------------------------
--ÕıÊ½±¨ÃûÊ±µÄÌõ¼şÊÇ£¬
--1¡¢ÒÑ¾­±¨ÁË±¾´ÎµÄÕ½ÒÛ
--2¡¢ÒÑ¾­ÊÇ±¾·½Õ½ÒÛµÄÕóÓªÁË
--3¡¢Óë±¾´ÎÕ½¾ÖµÄÕ½¾ÖµÈ¼¶Ïà·ûÁË

--ÕıÊ½¿ÉÒÔ±¨ÃûÁË

	--Storm ¼ÓÈëÌôÕ½
	say_index = 1
	storm_ask2start(1)
end;

--Õı³£µÄËÎ½ğ´óÕ½¶Ô»°
function storm_goon_start()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	say_index = 1
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		return
	end
	
	local tb_words = {
		"Trèng trËn ®· rÒn vang! Sao ng­¬i ch­a tham gia chiÕn?",
		"Chóc mõng b¹n ®· chİnh thøc trë thµnh t­íng sÜ cña ®¹i Tèng! H·y chøng tá b¶n lÜnh cña m×nh ®i!",
		"Chóc mõng b¹n ®· chİnh thøc trë thµnh t­íng sÜ cña ®¹i Kim! H·y chøng tá b¶n lÜnh cña m×nh ®i!"
	}
	local szMsg = "HiÖn thêi qu©n sè 2 bªn lµ: "..mem_song.." --- "..mem_jin
	Say(szMsg, 2, "H·y cho ta tham gia/bt_enterbattle", "§Ó ta suy nghÜ l¹i!/bt_oncancel");
	if (bt_getgn_awardtimes() ~= 1) then
		Msg2Player("ChiÕn dŞch lÇn nµy lµ <color=yellor>§ªm Huy Hoµng<color>, phÇn th­ëng gÊp ®«i so víi b×nh th­êng! C¬ héi kh«ng nªn bá qua!")
	end
	SubWorld = nOldSubWorld
end

function bt_enterbattle()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end
	local nWeekDay = tonumber(GetLocalDate("%w"))
	
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		if( nHour >= 2045 and nHour < 2300)then
			local nNpcIndex = GetLastDiagNpc()
			local szNpcName = GetNpcName(nNpcIndex)
			local szTong = GetTong()
			if szTong ~= nil and szTong ~= "" then
				if 2 == bt_ncamp then
					if GetCityOwner(4) ~= szTong and GetCityOwner(7) == szTong then--4ÊÇãê¾©£¬7ÊÇÁÙ°², 2ÊÇ½ğ·½
						Msg2Player("Bang héi chiÕm thµnh L©m An chØ ®­îc b¸o danh bªn Tèng!")
						SubWorld = nOldSubWorld
						return
					end
				elseif 1 == bt_ncamp then
					if GetCityOwner(4) == szTong and GetCityOwner(7) ~= szTong then--4ÊÇãê¾©£¬7ÊÇÁÙ°²£¬1ÊÇËÎ·½
						Msg2Player("Bang héi chiÕm thµnh BiÖn Kinh chØ ®­îc b¸o danh bªn Kim!")
						SubWorld = nOldSubWorld
						return
					end
				else
					SubWorld = nOldSubWorld
					return
				end
			end
		end
	end
	
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		SubWorld = nOldSubWorld
		return
	end
	
	if	bt_checkmem_for_guozan() == 0 then
		SubWorld = nOldSubWorld
		return
	end
	
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("Xin lçi, tiÒn tuyÕn ®ang cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng.",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			SubWorld = nOldSubWorld
			return
		end
		--tinhpn20100804: IPBonus
		if (GetTask(TASKID_COUNT_X2TONGKIM) == 1) then
			SetTask(TASKID_COUNT_X2TONGKIM, 0)
			SetTask(TASKID_RECIEVE_BONUS_TK, 1)
		else
			SetTask(TASKID_RECIEVE_BONUS_TK, 0)
		end
		
		--By: NgaVN
		--Kiem tra nguoi choi truoc khi join vao mission
		local nRet = tbVNG2011_ChangeSign:CheckChangeSign();
		local nTimeNow = tbVNG2011_ChangeSign:GetTimeNow()
		if ( nRet ~= 1 ) then
			Say(format("ChiÕn tr­êng cßn <color=red>%d <color=red>phót n÷a cã thÓ b¸o danh", nTimeNow));
			SubWorld = nOldSubWorld
			return
		end

		SubWorld = idx;
		BT_SetData(PL_SERIESKILL, 0)
		SetTask(TV_SERIESKILL_REALY,0)
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
		local SubWorld = OldSubWorld;
		SubWorld = nOldSubWorld
		return
	else
		Say("Xin lçi! TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng", 0);
	end
	SubWorld = nOldSubWorld
end;

function bt_wantjin()
		Say("Ng­¬i x¸c ®Şnh ®Çu qu©n cho Kim quèc? NÕu ®· gia nhËp, néi trong 1 tuÇn ng­¬i sÏ lµ ng­êi cña chóng ta. Muèn thay ®æi, ph¶i ®îi tuÇn sau!",2, "Ta nhÊt ®Şnh gia nhËp Kim quèc/bt_joinjin", "§Ó ta suy nghÜ l¹i ®·!/bt_oncancel");
end;

function bt_wantsong()
		Say("Ng­¬i x¸c ®Şnh ®Çu qu©n cho Tèng quèc? NÕu ®· gia nhËp, néi trong 1 tuÇn ng­¬i sÏ lµ ng­êi cña chóng ta. Muèn thay ®æi, ph¶i ®îi tuÇn sau!",2, "Ta nhÊt ®Şnh gia nhËp Tèng quèc/bt_joinsong", "§Ó ta suy nghÜ l¹i ®·!/bt_oncancel");
end;

function bt_joinsong()
	local nOldSubWorld = SubWorld
		if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("C«ng c¸o:®· b¾t ®Çu chiÕn dŞch míi, ®iÓm tİch ph©n hiÖn giê sÏ lµ 0!")
	Msg2Player("Hoan nghªnh! Hoan nghªnh! Ng­êi Tèng lu«n lµ anh hïng!")

	--Storm ¼ÓÈëÌôÕ½
	say_index = 2
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_joinjin()
	local nOldSubWorld = SubWorld
			if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		SubWorld = SubWorldID2Idx(323)
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		SubWorld = SubWorldID2Idx(324)
		else
			SubWorld = SubWorldID2Idx(325)
	end	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("C«ng c¸o:®· b¾t ®Çu chiÕn dŞch míi, ®iÓm tİch ph©n hiÖn giê sÏ lµ 0!")
	Msg2Player("Hoan nghªnh! Hoan nghªnh! Kim quèc kh«ng thiÕu anh tµi!")

	--Storm ¼ÓÈëÌôÕ½
	say_index = 3
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_oncancel()

end

function bt_checkmemcount_balance()
	local mapid = BT_GetGameData(GAME_MAPID);
	if (mapid > 0) then
		if (SubWorldID2Idx(mapid) >= 0) then
			oldSubWorld = SubWorld
			SubWorld = SubWorldID2Idx(mapid)
			local mem_song = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 1)
			local mem_jin = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 2)
			SubWorld = oldSubWorld
			
			-- ¹úÕ½ËÎ½ğ ÌØÊâµÄÈËÊıÆ½ºâ´¦Àí		
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				if (bt_ncamp == 1 and mem_song >= BALANCE_GUOZHAN_MAXCOUNT) or (bt_ncamp == 2 and mem_jin >= BALANCE_GUOZHAN_MAXCOUNT) then
					 -- ÈËÊı³¬¹ı100ÈËÏŞÖÆ£¬¼ÌĞøÍùÏÂÖ´ĞĞ£¬ÏŞÖÆÈËÊı²î5ÈË
				else
					 -- ÈËÊıÎ´³¬¹ıÏŞÖÆ£¬ºöÂÔ5ÈË²î¶î£¬Ö±½ÓÔÊĞí½øÈë
					return mem_song, mem_jin
				end
			end
			
			if (bt_ncamp == 1 and (mem_song - mem_jin) >= BALANCE_MAMCOUNT ) then
				Say("HiÖn t¹i binh lùc phe ta lµ <color=yellow>"..mem_song.." ng­êi<color>, ®Şch ph­¬ng lµ <color=yellow>"..mem_jin.." ng­êi<color>, c¸ch biÖt <color=red>"..BALANCE_MAMCOUNT.." ng­êi<color>. Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Kim binh! Tr¸ng sÜ xin ®îi trËn sau nhĞ!", 0)
				return
			elseif (bt_ncamp == 2 and (mem_jin - mem_song) >= BALANCE_MAMCOUNT ) then
				Say("HiÖn t¹i binh lùc phe ta lµ <color=yellow>"..mem_jin.." ng­êi<color>, ®Şch ph­¬ng lµ <color=yellow>"..mem_song.." ng­êi<color>, c¸ch biÖt <color=red>"..BALANCE_MAMCOUNT.." ng­êi<color>. Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Tèng qu©n. Tr¸ng sÜ xin ®îi trËn sau nhĞ!", 0)
				return
			else
				return mem_song, mem_jin
			end
		end
	end
	Say("Xin lçi! TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng", 0);
	return nil
end

-- ¹úÕ½ËÎ½ğ¶Ô½øÈëµÄÍæ¼Ò×ö½øÒ»²½µÄ¼ì²é 1:·ÅĞĞ 0:²»ÈÃ½øÈë
function bt_checkmem_for_guozan()
	
	-- ·Ç¹úÕ½ËÎ½ğÖ±½Ó·ÅĞĞ
	if BT_GetGameData(GAME_BATTLEID) ~= 2 then
		return 1;
	end
	
	-- Ö®Ç°ÒÑ¾­Í¨¹ı¼ì²é£¬²Î¼ÓÁËÕ½ÒÛ£¬²»±ØÔÙ¼ì²éÁË
--	if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) == bt_ncamp) then
--		return 1;
--	end
	
	local szCityOwner_LinAn		= GetCityOwner(7);	-- ÁÙ°²µÄÕ¼Áì°ï»á
	local szCityOwner_Bianjin	= GetCityOwner(4);	-- ãê¾©µÄÕ¼Áì°ï»á
	local szMyTong				= GetTongName();	-- ×Ô¼ºµÄ°ï»á
	
	-- Õ¼³Ç°ï»áÊı¾İ´íÎó
	if szCityOwner_LinAn == "" or szCityOwner_Bianjin == "" or szCityOwner_LinAn == szCityOwner_Bianjin then
		Say("LÇn quèc chiÕn Tèng Kim nµy kh«ng ®­îc phĞp më", 0);
		return 0;
	end
	
	-- Í¨¹ı°ï»áµÄÉí·İ½øÈë
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 1) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 2) then
		return 1;
	end

	-- ¼éÏ¸
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 2) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 1) then
		Say("Gian tÕ cña ®Şch ®· chui vµo ®¹i doanh råi, h·y mau mau b¾t!", 0);
		return 0;
	end
	
	-- ¼ì²éÉíÉÏµÄÁîÅÆ
	local nCount_song = CalcItemCount(3, 6, 1, 2057, -1);
	local nCount_jin  = CalcItemCount(3, 6, 1, 2058, -1);
	
	if nCount_song == 0 and nCount_jin == 0 then
		Say("Hai quèc giao tranh, cÇn ph¶i cã quèc chiÕn lÖnh bµi cña mçi bªn míi ®­îc tiÕn vµo.", 0);
		return 0;
	end
	
	-- ÉíÉÏÓĞ±ğ¹úµÄÁîÅÆ
	if (nCount_jin ~= 0 and bt_ncamp == 1) or (nCount_song ~= 0 and bt_ncamp == 2) then
		Say("Gian tÕ cña ®Şch ®· chui vµo ®¹i doanh råi, h·y mau mau b¾t!", 0);
		return 0;
	end
	
	-- ¼ì²é½ğÇ®
	if (GetCash() < 3000) then
		Say("Muèn tham gia chiÕn tr­êng Tèng Kim h·y ñng hé 3000 l­îng", 0)
		return 0;
	end
	
	-- ¿Û³ıÁîÅÆ
	local bPay = 0;
	
	if bt_ncamp == 1 then
		bPay = ConsumeItem(3, 1, 6, 1, 2057, -1); 
	elseif bt_ncamp == 2 then
		bPay = ConsumeItem(3, 1, 6, 1, 2058, -1); 
	end
	
	if bPay ~= 1 then
		Msg2Player("KhÊu trõ lÖnh bµi thÊt b¹i");
		return 0;
	end
	
	-- ÔÊĞíÍ¨¹ı
	return 1;
end