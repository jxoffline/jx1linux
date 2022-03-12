-- Ñ×µÛ±¦²Ø
-- by Ð¡ÀË¶à¶à
-- 2007.10.24
-- ÎÒ..
-- ÕýÔÚ³¢ÊÔ×Å..
-- Ñ°ÕÒ×ÅÊôÓÚÎÒµÄÌìµØ..
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc\\golditem.lua")
Include("\\script\\missions\\yandibaozang\\npc\\yandituteng.lua")
Include("\\script\\missions\\yandibaozang\\yandiduihuan.lua")

--YDBZ_DATE_START = 13	--	¿ªÊ¼Ê±¼ä
--YDBZ_DATE_END = 23		--	½áÊøÊ±¼ä
ID_PRISONMAN = 96; 		-- ÅÐ¶ÏÊÇ·ñÔÚ×øÀÎµÄ ID
function main()
--	Say("Chøc n¨ng ®ang ®­îc t¹m ®ãng",0)
--	do return end
--	if gb_GetModule("YANDIBAOZANG_TALK") ~= 1 then
--		Say("¶Ô²»Æð£¬´Ë¹¦ÄÜÔÝÊ±¹Ø±Õ£¬¿ª·ÅÊ±¼ä¾´Çë¹Ø×¢¹Ù·½¹«¸æ¡£",0)
--		return
--	end
	local tbarytalk = {
	"<dec><npc>C¸ch ch¬i v­ît ¶i míi, néi dung míi, boss míi, b¶n ®å míi, v« vµn kú tr©n dÞ b¶o, rÊt thÝch hîp c¸c trang bÞ hoµng kim cña m«n ph¸i chØ cã t¹i b¶o tµng viªm ®Õ. C¸c h¹ ®· chuÈn bÞ ch­a?",
	"Xem t×nh h×nh tæ ®éi/YDBZ_view_player",
--	"Ñ×µÛ»Æ½ðÍ¼Æ×¶Ò»»/YDBZ_golditem",
--	"Ñ×µÛÍ¼ÌÚ¶Ò»»/YDBZ_tradeYandiTuTeng",
--	"Ta muèn ®æi viªm ®Õ lÖnh kú/YDBZ_tradeYandiLingQi",
--	"Ta muèn ®æi huyÒn viªn lÖnh/YDBZ_tradeXuanYuanLing",
--	"ÎÒÒªÖØÖýÑ×µÛ»Æ½ð×°±¸/yandiduihuan_main",
--	"ÖØÖýÑ×µÛ»Æ½ð×°±¸ËµÃ÷/yandiduihuan_shuoming",
	"Nguån gèc b¶o tµng viªm ®Õ/YDBZ_about",
	"Ta chØ muèn d¹o ch¬i/NoChoice",
	}
	if YDBZ_check_ready_state() == 1 then
		tinsert(tbarytalk,2,"B¸o danh tham gia/YDBZ_want_play")
		tinsert(tbarytalk,3,"Thµnh viªn tham chiÕn/YDBZ_member_play")
	end
	CreateTaskSay(tbarytalk)
end

function YDBZ_check_ready_state()
	OldSubWorld = SubWorld
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if state == 1 then
				SubWorld = OldSubWorld
				return 1
			end
		end
	end
	SubWorld = OldSubWorld
	return 0
end
function YDBZ_member_play()
	if YDBZ_checkLimit2() == 1 then
		return
	end
	YDBZ_dragon_mem_join()
end
function YDBZ_view_player()
	if YDBZ_checkLimit() == 1 then
		return
	end
	Say("Tæ ®éi cña c¸c h¹ phï hîp víi ®iÒu kiÖn tiÕn vµo b¶o tµng viªm ®Õ",0)
end

function YDBZ_checkLimit2()
	if GetCamp() == 0 then
			Say("Thµnh viªn trong tæ ®éi cã ng­êi ch­a gia nhËp m«n ph¸i, kh«ng thÓ tham gia ho¹t ®éng.",0)
			return 1
	end 
	if GetTeamSize() ~= 0 then
		Say("CÇn ph¶i trë vÒ ë cöa vµo b¶o tµng viªm ®Õ cña tæ ®éi, hiÖn giê kh«ng thÓ tæ ®éi ®­îc",0)
		return 1
	end
	if (GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then
		Say("CÊp bËc kh«ng ®ñ ®Ó tham gia ho¹t ®éng",0)
		return 1
	end
		
	--¼ì²éÐÅÎï
	local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--ÎïÆ·
	local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
	local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

	local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
	local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)	
	
	local g = YDBZ_LIMIT_ITEM[1][1]									--ÎïÆ·
	local d = YDBZ_LIMIT_ITEM[1][2]
	local p = YDBZ_LIMIT_ITEM[1][3]

	local numzimu = CalcItemCount(3,g,d,p,-1)
	local numbeibao = CalcItemCount(23,g,d,p,-1)
	if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
		Say("C¸c h¹ kh«ng ®em theo anh hïng thiÕp, kh«ng thÓ tham gia tranh ®o¹t viªm ®Õ.",0)
		return 1
	end
	
	--¼ì²â²Î¼ÓÉÏÏÞ
	local nweek = tonumber(GetLocalDate("%W"))			--´ÎÊý
	local nday = tonumber(GetLocalDate("%d"))
	local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
	local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
	local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
	local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

	if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
			Say("TuÇn nµy c¸c h¹ ®· tham gia ®ñ sè ®ît cÇn thiÕt.",0)
			return 1
	elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
			Say("Sè lÇn tham gia trong ngµy ®· ®¹t ®Õn møc cao nhÊt.",0)
			return 1
	end
	if nweek ~= noldweek then
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
	end
	if nday ~= noldday then
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
	end

	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
	
end

-- KiÓm tra Anh Hïng ThiÕp hoÆc Viªm §Õ LÖnh tham gia tÝnh n¨ng Viªm §Õ - Modified - by AnhHH 20110725
function YDBZ_checkLimit()
	local oldplayer = PlayerIndex
	if (IsCaptain() ~= 1) then
		local tbarytalk ={
			"<dec><npc>Tham gia ho¹t ®éng v­ît ¶i viªm ®Õ b¶o tµng cÇn ph¶i do ®éi tr­ëng b¸o danh míi vµo ®­îc.",
			"BiÕt råi/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	if (GetTeamSize() < YDBZ_TEAM_COUNT_LIMIT or GetTeamSize() > YDBZ_TEAM_COUNT_MAXLIMIT) then
		local tbarytalk ={
			"<dec><npc>Tæ ®éi tham gia b¶o tang viªm ®Õ cÇn Ýt nhÊt <color=red>"..YDBZ_TEAM_COUNT_LIMIT.."<color> ng­êi vµ kh«ng thÓ v­ît qu¸ <color=red>"..YDBZ_TEAM_COUNT_MAXLIMIT.."<color>. Tr­íc m¾t sè ng­êi trong tæ ®éi kh«ng phï hîp yªu cÇu.",
			"BiÕt råi/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	local tbplay = {}
	local noplaylv = 0
	local noitem = 0
	local nocount = 0
	local nsignweekday = 0
	local tbstr = {{},{},{},{}}
	local szstr = ""
	local	nAcc = 0
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local nFlag1 = DynamicExecuteByPlayer(PlayerIndex,"\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", {nTaskID = 3071,nStartBit = 25,nBitCount = 1,nMaxValue = 1})
		if nFlag1 ~= 0 then
			local szNamePlayer = GetName()
			PlayerIndex = oldplayer
			Say("Xin lçi! Trong ®éi b¹n cã thµnh viªn <color=yellow>".. szNamePlayer.."<color> kh«ng tháa ®iÒu kiÖn ®Ó tham gia tÝnh n¨ng nµy")
			return 1
		end
		if GetCamp() == 0 then
			PlayerIndex = oldplayer
			Say("Thµnh viªn trong tæ ®éi cã ng­êi ch­a gia nhËp m«n ph¸i, kh«ng thÓ tham gia ho¹t ®éng.",0)
			return 1
		end 
		--¼ì²éµÈ¼¶
		if(GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then		--µÈ¼¶
			noplaylv = noplaylv + 1
			tbstr[1][noplaylv] = "<color=yellow>"..GetName().."<color>"
		end
		
		--¼ì²éÐÅÎï
		local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--ÎïÆ·
		local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
		local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

		local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
		local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)		
		
		local g = YDBZ_LIMIT_ITEM[1][1]									--ÎïÆ·
		local d = YDBZ_LIMIT_ITEM[1][2]
		local p = YDBZ_LIMIT_ITEM[1][3]

		local numzimu = CalcItemCount(3,g,d,p,-1)
		local numbeibao = CalcItemCount(23,g,d,p,-1)
		--print(ndnumzimu + ndnumbeibao)
--		if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
--			noitem = noitem + 1
--			tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
--		end
		
		--¼ì²â²Î¼ÓÉÏÏÞ
		local nweek = tonumber(GetLocalDate("%W"))			--´ÎÊý
		local nday = tonumber(GetLocalDate("%d"))
		local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
		local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
		local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
		local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

		if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 1
		elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 2
		end
		if nweek ~= noldweek then
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
		end
		if nday ~= noldday then
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
		end

		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
		
		if (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) == 0) then
		--Thay ®æi c¸ch b¸o danh viªm ®Õ, lÇn ®Çu tiªn cã thÓ dïng anh hïng thiÕp hoÆc viªm ®Õ lÖnh - Modified By DinhHQ - 20120206
			if ((numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2]) then
				noitem = noitem + 1
				tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
			end
		elseif (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) >= 1 and YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) <= 3) then
			if ((ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2])then
				nAcc = nAcc + 1
				tbstr[4][nAcc] = "<color=yellow>"..GetName().."<color>"
			end
		end
	end
	
	PlayerIndex = oldplayer
	if noplaylv > 0 then
		local szstr1 = tbstr[1][1]
		for i=2,noplaylv do 
			szstr1 = szstr1 .. ", " .. tbstr[1][i]
		end
		szstr = szstr .. format("Ng­êi ch¬i %s trong ®éi vÉn ch­a ®¹t cÊp %s.",szstr1,YDBZ_LIMIT_PLAYER_LEVEL)
	end
	if noitem > 0 then
		local szstr1 = tbstr[2][1]
		for i=2,noitem do 
			szstr1 = szstr1 .. ", " .. tbstr[2][i]
		end
		szstr = szstr .. format("Ng­êi ch¬i %s kh«ng mang theo %s.",szstr1,YDBZ_LIMIT_ITEM[3])
	end
	if nocount > 0 then
		local szstr1 = tbstr[3][1]
		for i=2,nocount do 
			szstr1 = szstr1 .. ", " .. tbstr[3][i]
		end
		if nsignweekday == 1 then
			szstr = szstr .. format("Ng­êi ch¬i %s trong tuÇn nµy cã sè lÇn tham gia ®· ®¹t ®Õn <color=yellow>%s lÇn<color>, kh«ng thÓ tham gia ho¹t ®éng v­ît ¶i",szstr1,YDBZ_LIMIT_WEEK_COUNT)	
		elseif nsignweekday == 2 then
			szstr = szstr .. format("Ng­êi ch¬i %s trong ngµy cã sè lÇn tham gia ®· ®¹t ®Õn <color=yellow>%s lÇn<color>, kh«ng thÓ tham gia ho¹t ®éng lÇn nµy.",szstr1,YDBZ_LIMIT_DAY_COUNT)	
		end
	end
	if (nAcc > 0) then
		local szstr1 = tbstr[4][1]
		for i = 2, nAcc do 
			szstr1 = szstr1 .. ", " .. tbstr[4][i]
		end
		szstr = szstr .. format("Ng­êi ch¬i %s kh«ng mang theo %s.",szstr1,YDBZ_LIMIT_DOUBEL_ITEM[3])
	end
	
	if noplaylv + noitem + nAcc +nocount > 0 then
		Msg2Team(szstr);
		Say(szstr,0)
		return 1 	
	end
	return 0
end
function YDBZ_want_play()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	--if YDBZ_checkLimit2() == 1 then
		--return		
	--end
	--Mod 20130108 -> Fobit
	if YDBZ_checkLimit() == 1  then
		return
	end
	PlayerIndex = OldPlayer
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			--print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			--print(sub)
			local state = GetMissionV(YDBZ_READY_STATE)
			--print(state)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1) then
				if GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT and GetMissionV(YDBZ_READY_TEAM_MAX) < 100 then
					freeboat = freeboat + 1
				end
			end
			--if (state > 1) then
				--Say("¹ÃÄï£º±¾³ÇÇøÑ×µÛ±¦²ØÒÑ¾­¿ªÊ¼£¬ÒªÏë²Î¼ÓÇëÁôÒâÏÂ´Î¿ªÊ¼Ê±¼ä¡£",0)
				--return
			--end
		end
	end
	--print("total"..totalboat.."free"..freeboat)
	local	strlevel = "V­ît ¶i b¶o tµng viªm ®Õ"
	if (startboat == 1) then
		if (freeboat == 0) then
			local tbarytalk ={
			"<dec><npc>Khu vùc thµnh nµy"..strlevel.." ®·  b¾t ®Çu, kh«ng cßn vÞ trÝ trèng nµo.",
			"BiÕt råi/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		else
			local tbarytalk ={
			-- Thay ®æi hiÓn thÞ dßng th«ng b¸o - Modified - by AnhHH 20110725
			"<dec><npc>Khu vùc thµnh nµy"..strlevel.." tiÕn vµo giai ®oan b¸o danh, LÇn ®Çu mçi thµnh viªn cÇn ph¶i nép <color=red>"..YDBZ_LIMIT_ITEM[2].." c¸i "..YDBZ_LIMIT_ITEM[3].."<color>. Tõ lÇn thø 2 mçi thµnh viªn cÇn ph¶i nép  <color=red>"..YDBZ_LIMIT_DOUBEL_ITEM[2].." c¸i "..YDBZ_LIMIT_DOUBEL_ITEM[3].."<color>, ®¹i hiÖp cã muèn tham gia?",
			"Ph¶i! Ta muèn dÉn d¾t ®éi cña ta tham gia./YDBZ_dragon_join",
			"Kh«ng cÇn/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		end
	else
		local tbarytalk ={
			"<dec><npc>Xin lçi, khu vùc thµnh nµy"..strlevel.."HiÖn t¹i kh«ng cã nhiÖm vô b¶o tµng viªm ®Õ nµo cã thÓ tham gia. B¾t ®Çu tõ <color=red>14:00 ®Õn 24:00<color>, xin h·y chó ý th«ng b¸o vµ ®Õn tr­íc 5 phót ®Ó b¸o danh.",
			"BiÕt råi/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return
	end

end

function YDBZ_dragon_join()
	if YDBZ_checkLimit() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			 
			if ( state == 1 and GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT ) then
					
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					--print("plal"..tabplayer[i])
				end

				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(YDBZ_READY_SIGNUP_WORLD, w)
				SetMissionV(YDBZ_READY_SIGNUP_POSX, x)
				SetMissionV(YDBZ_READY_SIGNUP_POSY, y)
				local nteammax = GetMissionV(YDBZ_READY_TEAM_MAX)
				--print(nteammax)
				SetMissionV(YDBZ_READY_TEAM,GetMissionV(YDBZ_READY_TEAM) + 1)
				SetMissionV(YDBZ_READY_TEAM_MAX,(nteammax + 1))
				local szteamname = GetName()
				SetMissionS((nteammax + 1),szteamname)
				
							
				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					--print("player"..PlayerIndex)
					
					-- ÔÚÕâÀïÅÐ¶ÏÊÇ·ñÓÐÔ½ÓüÆóÍ¼
					w,x,y = GetWorldPos();
					if GetTask(ID_PRISONMAN)>100 or w==208 then
						SetPK(10);
						Msg2Player("<color=red>Ng­¬i v× cã ý ®å v­ît ngôc vµ bÞ t¨ng khung h×nh ph¹t nÆng thªm, <color><color=yellow>PK biÕn thµnh 10!<color>");
						for i=1, 3 do
							Msg2SubWorld("<color=yellow>Ng­êi ch¬i: <color><color=green>"..GetName().."<color><color=yellow> cã ý ®å v­ît ngôc, bÞ nha dÞch b¾t ngay t¹i hiÖn tr­êng, ®ång thêi t¨ng møc h×nh ph¹t! Th«ng b¸o cho toµn thiªn h¹ biÕt tin<color>!");
						end;
					else
						SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
						YDBZ_ready_joinmap(PlayerIndex)				
					end;
				end
				BuildATeam(1,0,tabplayer)
				SubWorld = sub
				Msg2MSAll(YDBZ_READY_MISSION,format("<color=blue>§éi %s <color> tiÕn vµo cæng b¶o tµng viªm ®Õ",szteamname))
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "V­ît ¶i b¶o tµng viªm ®Õ"
	Say(format("HiÖn t¹i <color=red>%s<color> kh«ng cßn vÞ trÝ trèng nµo. H·y ®îi ®ît sau", strlevel),0);
end


function YDBZ_dragon_mem_join()
	if YDBZ_checkLimit2() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if ( state == 1 ) then
				if GetTask(YDBZ_MISSIOM_PLAYER_KEY) ~=  GetMissionV(YDBZ_MISSION_KEY) then
					Say("Tæ ®éi cña ®¹i hiÖp kh«ng ë t¹i ®ît v­ît ¶i lÇn nµy.",0)
					return
				end
				local ngroup = GetTask(YDBZ_TEAMS_TASKID)
				--SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
				if GetMSPlayerCount(YDBZ_READY_MISSION,ngroup) == 0 then
					Say("Cæng vµo b¶o tµng viªm ®Õ kh«ng cã tæ ®éi cña ®¹i hiÖp, h·y tæ ®éi l¹i b¸o danh tham gia",0)
					return
				end
				YDBZ_ready_joinmap(PlayerIndex)
				SubWorld = sub
				local idx = 0;
				local ncapter = 0;
				local pidx;
				local tbplayer = {}
				for nj = 1, 10 do
					idx , pidx = GetNextPlayer(YDBZ_READY_MISSION, idx, ngroup);
					if (pidx > 0) then
							tbplayer[nj] = pidx
							PlayerIndex = pidx
							if GetName() == GetMissionS(ngroup) then
									ncapter = nj
							end
					end;
					if (idx <= 0) then
						break;
					end;
				end
				if ncapter > 0 then
					tbplayer[1],tbplayer[ncapter] = tbplayer[ncapter],tbplayer[1]
				end
				BuildATeam(1,0,tbplayer)
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "V­ît ¶i b¶o tµng viªm ®Õ"
	Say(format("HiÖn t¹i <color=red>%s<color> kh«ng cßn vÞ trÝ trèng nµo. H·y ®îi ®ît sau", strlevel),0);
	
end

function YDBZ_about()
	-- Thay ®æi th«ng b¸o b¸o danh tham gia  tÝnh n¨ng Viªm §Õ -Modifiled by AnhHH - 20110802
	Say(format("C¸ch ch¬i v­ît ¶i míi, néi dung míi, boss míi, b¶n ®å míi, v« vµn kú tr©n dÞ b¶o, rÊt thÝch hîp c¸c trang bÞ hoµng kim cña m«n ph¸i chØ cã t¹i b¶o tµng viªm ®Õ! <enter>Mçi ngµy %s, h·y ®Õn tr­íc 5 phót ®Ó b¸o danh ë B×nh B×nh c« n­¬ng.", "8:25, 9:25, 10:25, 12:25, 14:25, 16:25, 18:25, 20:25, 22:25"),0)
	
end