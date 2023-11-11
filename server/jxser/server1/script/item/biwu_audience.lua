--Include("\\script\\missions\\finalmatch\\wl_watchmatch.lua")
--Include("\\script\\missions\\finalmatch\\head.lua")
--GetExtPoint(1) == date(%y%m%d)	--050704
--PayExtPoint(extpoint, count);
GUANFANGRENYUAN = 5555
ZHANDIJIZHE = 4444
function main( nItemIdx )
SetLogoutRV(1);		--¶ÏÏßÓëËÀÍöÎªÒ»¸öÖØÉúµã
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("Sao ng­¬i lÊy quan chóng lÖnh cña ng­êi kh¸c sö dông? ", 0)
		return
	end
	
	local matchtype = GetGlbValue( GLB_CURMATCHTYPE )
	local matchphase = GetGlbValue( GLB_MATCHPHASE )
	if ( matchtype == 0 ) then
		Say("HiÖn t¹i ch­a thi ®Êu, muèn quan s¸t cÇn ph¶i ®îi ®Õn lóc b¾t ®Çu thi ®Êu. Muèn t×m hiÓu c¸ch sö dông quan chóng lÖnh kh«ng?", 3, "Sö dông quan chóng lÖnh nh­ thÕ nµo/#wl_onaudiencehelp(1)", "T×m hiÓu thêi gian sö dông quan chóng lÖnh/wl_getdeadline", "KÕt thóc ®èi tho¹i/OnCancel")
		return 1
	end

	local messages = {
		"Vµo n¬i xem ®Êu/#want2audience("..matchtype..")",
		"ChØ ®Þnh tªn nh©n vËt/watch_role",
		"ChØ ®Þnh tªn ®éi thi ®Êu/watch_league",
		"Theo sù ph©n chia khu vùc t×m hiÓu ®éi thi ®Êu/watch_zone",
		"Sö dông quan chóng lÖnh nh­ thÕ nµo/#wl_onaudiencehelp(1)",
		"T×m hiÓu thêi gian sö dông quan chóng lÖnh/wl_getdeadline",
		"Kh«ng lµm g× hÕt/OnCancel"
	};
	local curmapid = SubWorldIdx2ID( SubWorld )
	local flag = wl_mapid2watchnum( curmapid )
	if ( flag ) then
		tinsert( messages, 1, "T×m hiÓu ngÉu nhiªn tuyÓn thñ ®ang thi ®Êu/watch_rand_currently" )
	end
	Say("B¹n cã thÓ c¨n cø vµo ph­¬ng ph¸p sau ®Ó t×m hiÓu thi ®Êu ®ång thêi tiÕn hµnh quan s¸t.", getn( messages ), messages )
	return 1
end

-- ¹Û¿´Ä³¸ö½ÇÉ«±ÈÈü
function watch_role()
	-- ÅÐ¶ÏÊÇ·ñÒÑ¾­ÔÚ¹ÛÕ½Ä£Ê½
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_role", "", 1, 20, "Xin nhËp tªn nh©n vËt ng­êi ch¬i vµo");
	end
end


function wl_sure2watch_role(rolename,position,matchtype)
oldSubWorld = SubWorld
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	
	local bpassed = 0
	bpassed = wl_findroleinmatchmap( rolename,tab_matchmap )
	if ( bpassed == 0 ) then
		Say("B¹n t×m hiÓu tªn tuyÓn thñ nh©n vËt lµ '"..rolename.."', hiÖn t¹i kh«ng cã trong ®Êu tr­êng thi ®Êu, xin chän c¸c tuyÓn thñ kh¸c xem thi ®Êu.", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_league()
	-- ÅÐ¶ÏÊÇ·ñÒÑ¾­ÔÚ¹ÛÕ½Ä£Ê½
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_league", "", 1, 20, "Xin nhËp tªn ®éi thi ®Êu");
	end
end

function wl_sure2watch_lgname(leaguename,position,leaguetype)
oldSubWorld = SubWorld
	local matchtype = leaguetype - 10
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	local lid = LG_GetLeagueObj( leaguetype, leaguename )
	local lgcount = LG_GetMemberCount(lid)
	local lgmem = {}
	local rolename = ""
	local bpassed = 0
	for i = 0, lgcount - 1 do
		lgmem[ getn(lgmem)+1 ] = LG_GetMemberInfo( lid, i )
	end
	for i = 1, getn( lgmem ) do
		bpassed = wl_findroleinmatchmap( lgmem[i],tab_matchmap )
		if ( bpassed == 1 ) then
			rolename = lgmem[i]
			break
		end
	end
	if ( bpassed == 0 ) then
		Say("B¹n t×m hiÓu tªn ®éi thi ®Êu lµ '"..leaguename.."', hiÖn t¹i kh«ng cã trong ®Êu tr­êng thi ®Êu, kh«ng thÓ quan s¸t ®éi thi ®Êu ®ã, xin chän ®éi thi ®Êu kh¸c quan s¸t.", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_zone()
	local opp = {}
	opp = get_zone(0)
	Say("B¹n muèn t×m hiÓu khu vùc nµo cã ®éi thi ®Êu h«m nay?", getn(opp), opp)
end

function wl_sure2go_seat(rolesignmap, name, flag)
	local str = ""
	local position = wl_getwatchmap( rolesignmap )
	if( not position ) then
		print("the signmap of role who the play want to watch is not exist!!!!mapid =="..rolesignmap)
		return
	end
	local num = random(1, 2)
	local watchmap = WL_TABWATCHMAPS[position][num]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	if ( flag == 1 ) then
		str = "B¹n võa t×m hiÓu tªn ®éi thi ®Êu lµ "..name..", xin h·y sö dông quan chóng lÖnh hoÆc qua bªn Quan viªn t×m hiÓu l¹i."
	else
		str = "B¹n võa t×m hiÓu tªn tuyÓn thñ lµ "..name..", xin h·y sö dông quan chóng lÖnh hoÆc qua bªn Quan viªn t×m hiÓu l¹i."
	end
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player(str)
	Say(str, 0)
end

function wl_mapideqmapid( mapid1, mapid2 )
	local flag = 0
	for i = 1, getn( WL_TABWATCHMAPS ) do
		for j = 1, getn( WL_TABWATCHMAPS[i] ) do
			if ( WL_TABWATCHMAPS[i][j] == mapid1 ) then
				flag = i
				break
			end
		end
	end
	if ( flag == 0 ) then
		return
	end
	for i = 1, getn( WL_TABWATCHMAPS[ flag ] ) do
		if( WL_TABWATCHMAPS[ flag ][ i ] == mapid2 ) then
			return i
		end
	end
	return nil
end


OnAudience = {
"Cã thÓ sö dông 4 h×nh thøc sau ®Ó t×m hiÓu thi ®Êu ®ång thêi quan s¸t: 1, chØ ®Þnh tªn nh©n vËt; 2, chØ ®Þnh tªn ®éi thi ®Êu; 3, c¨n cø theo sù ph©n chia khu vùc t×m hiÓu ®éi thi ®Êu; 4, t×m hiÓu ngÉu nhiªn vÒ tuyÓn thñ ®ang thi ®Êu. T×m hiÓu nh©n vËt hoÆc ®éi thi ®Êu cÇn ph¶i lµ ®éi thi ®Êu ngµy h«m ®ã ®ång thêi ®éi thi ®Êu ®ã ®ang tiÕn hµnh thi ®Êu.",
"Trong vai trß kh¸n gi¶, nÕu ta ®­îc phÐp t×m hiÓu nh©n vËt hoÆc ®­îc phÐp quan s¸t ®éi thi ®Êu, cã nghÜa lµ tªn nh©n vËt hoÆc ®éi thi ®Êu ®ang tiÕn hµnh thi ®Êu. Khi nh©n vËt thi ®Êu rêi m¹ng hoÆc tö vong th× lËp tøc kÕt thóc",
"Trong m« thøc quan s¸t, nÕu ta muèn quan s¸t nh©n vËt hoÆc ®éi thi ®Êu kh«ng cã trªn b¶n ®å hiÖn t¹i, hÖ thèng sÏ ®­a b¹n ®Õn n¬i quan s¸t t­¬ng øng, sau ®ã ng­êi ch¬i t×m hiÓu l¹i tªn nh©n vËt hoÆc ®éi thi ®Êu",
}
function wl_onaudiencehelp(count)
	if ( count >= getn( OnAudience ) ) then
		Say(OnAudience[getn( OnAudience )], 1, "§ãng/OnCancel")
	else
		local ncount = count + 1
		Say(OnAudience[count], 2, "Trang kÕ /#wl_onaudiencehelp("..ncount..")", "§ãng/OnCancel")
	end
end


function wl_getdeadline()
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("Sao ng­¬i lÊy quan chóng lÖnh cña ng­êi kh¸c sö dông? ", 0)
		return 1
	end

	Say("Trong thêi gian diÔn ra ®¹i héi vâ l©m kh¸n gi¶ cã thÓ vµo hÖ thèng vâ l©m ®¹i héi, sÏ kh«ng bÞ h¹n chÕ vÒ thêi gian sö dông quan chóng lÖnh.", 0)
end
function want2audience( matchtype )
	if ( matchtype == 9999 ) then
		Say("Buæi thi ®Êu h«m nay lµ ®¬n ®Êu m«n ph¸i, ®Êu tr­êng vµ m«n ph¸i thi ®Êu t­¬ng øng:", 6, "§Êu tr­êng 1 (ThiÕu L©m, Thiªn V­¬ng) /#want2watchseat(1)", "§Êu tr­êng 2 (§­êng M«n, Ngò §éc) /#want2watchseat(2)","§Êu tr­êng 3 (Thóy Yªn, Nga My) /#want2watchseat(3)","§Êu tr­êng 4 (C¸i Bang, Thiªn NhÉn) /#want2watchseat(4)","§Êu tr­êng 5 (Vâ §ang, C«n L«n) /#want2watchseat(5)", "Kh«ng cÇn ®©u/OnCancel")
	elseif( matchtype == 11 ) then
		Say("Buæi thi ®Êu h«m nay lµ song ®Êu, sau ®©y më ra 3 ®Êu tr­êng, b¹n muèn ®i:", 4, "§Êu tr­êng 1/#want2watchseat(1)", "§Êu tr­êng 2/#want2watchseat(2)","§Êu tr­êng 3/#want2watchseat(3)", "Kh«ng cÇn ®©u/OnCancel")
	elseif( matchtype == 12 ) then
		Say("Buæi thi ®Êu h«m nay lµ Ngò hµnh ®Êu, sau ®©y më ra 6 ®Êu tr­êng, b¹n muèn ®i:", 7, "§Êu tr­êng 1/#want2watchseat(1)", "§Êu tr­êng 2/#want2watchseat(2)","§Êu tr­êng 3/#want2watchseat(3)","§Êu tr­êng 4 /#want2watchseat(4)","§Êu tr­êng 5/#want2watchseat(5)", "§Êu tr­êng 6/#want2watchseat(6)","Kh«ng cÇn ®©u/OnCancel")
	elseif( matchtype == 13 or matchtype == 14 ) then
		Say("Buæi thi ®Êu h«m nay lµ thi ®Êu ®éi nhãm, sau ®©y më ra 4 ®Êu tr­êng, b¹n muèn ®i:", 5, "§Êu tr­êng 1/#want2watchseat(1)", "§Êu tr­êng 2/#want2watchseat(2)","§Êu tr­êng 4 /#want2watchseat(4)","§Êu tr­êng 5/#want2watchseat(5)","Kh«ng cÇn ®©u/OnCancel")
	elseif( matchtype == 15 ) then
		Say("Buæi thi ®Êu h«m nµy lµ ®Êu khu vùc, sau ®©y më ra 6 ®Êu tr­êng, b¹n muèn ®i:", 7, "§Êu tr­êng 1/#want2watchseat(1)", "§Êu tr­êng 2/#want2watchseat(2)","§Êu tr­êng 3/#want2watchseat(3)","§Êu tr­êng 4 /#want2watchseat(4)","§Êu tr­êng 5/#want2watchseat(5)", "§Êu tr­êng 6/#want2watchseat(6)","Kh«ng cÇn ®©u/OnCancel")
	else
		Say("§Êu tr­êng hiÖn ®ang söa ch÷a, xin ®îi gi©y l¸t quay l¹i sau.", 0)
	end
end
function want2watchseat(position)
	local watchmap = WL_TABWATCHMAPS[position][1]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player("B¹n ®· ®Õn ®Êu tr­êng, xin h·y sö dông quan chóng lÖnh hoÆc qua bªn Quan viªn §Êu tr­êng t×m hiÓu thi ®Êu")
end