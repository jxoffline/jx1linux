--ÓÃ»§Ñ¡ÔñÀëÏßÍĞ¹ÜÊ±µÄ½Å±¾
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua");
Include("\\script\\global\\judgeoffline_limit.lua");		-- 2006Äê10ÔÂ30ÈÕ¼ÓÈëÏŞÖÆÔÚËùÓĞ³ÇÊĞ³µ·òÅÔºÍÌìÍõ°ïÍĞ¹ÜµÄ½Å±¾  by peres
Include("\\script\\item\\ib\\zimudai.lua");
Include("\\script\\lib\\player.lua")
Include("\\script\\trip\\define.lua")

arraymap = 
	{
		["1"] = "Ph­îng T­êng",
		["11"] = "Thµnh §«",
		["37"] = "BiÖn Kinh",
		["80"] = "D­¬ng Ch©u",
		["78"] = "T­¬ng D­¬ng",
		["162"] = "§¹i Lı",
		["176"] = "L©m An",
		["20"] = "Giang T©n Th«n",
		["53"] = "Ba L¨ng huyÖn",
		["54"] = "Nam Nh¹c trÊn",
		["99"] = "VÜnh L¹c trÊn",
		["100"] = "Chu Tiªn trÊn",
		["101"] = "§¹o H­¬ng th«n",
		["121"] = "Long M«n trÊn",
		["153"] = "Th¹ch Cæ trÊn",
		["174"] = "Long TuyÒn th«n",
		["13"] = "Nga Mi",
		["25"] = "§­êng M«n",
		["49"] = "Thiªn NhÉn",
--		["59"] = "ÌìÍõ",
		["81"] = "Vâ §ang",
		["103"] = "ThiÕu L©m",
		["115"] = "C¸i Bang",
		["131"] = "C«n L«n",
		["154"] = "Thóy Yªn",
		["183"] = "Ngò §éc",
--		["208"]	= "´óÀÎ",	--by ×Ó·ÇÓã 2007/11/13 ½ûÖ¹´óÀÎÍĞ¹Ü
		-- LLG_ALLINONE_TODO_20070802
		["235"] = "§µo Hoa ®¶o (1) ",
		["236"] = "§µo Hoa ®¶o (2) ",
		["237"] = "§µo Hoa ®¶o (3) ",
		["238"] = "§µo Hoa ®¶o (4) ",
		["239"] = "§µo Hoa ®¶o (5) ",
		["240"] = "§µo Hoa ®¶o (6) ",
		["241"] = "§µo Hoa ®¶o (7) ",
		["835"] = "V« Danh Cèc (1)",
		["836"] = "V« Danh Cèc (2)",
		["837"] = "V« Danh Cèc (3)",
		["838"] = "V« Danh Cèc (4)",
		["839"] = "V« Danh Cèc (5)",
		["840"] = "V« Danh Cèc (6)",
		["586"] = "Khu vùc bang héi chung",
		["587"] = "Khu vùc bang - Thµnh §«",
		["588"] = "Khu vùc bang - §¹i Lı",
		["589"] = "Khu vùc bang - Ph­îng T­êng",
		["590"] = "Khu vùc bang - L©m An",
		["591"] = "Khu vùc bang - T­¬ng D­¬ng",
		["593"] = "Khu vùc bang - D­¬ng Ch©u",
		["594"] = "Khu vùc bang - BiÖn Kinh",
		["595"] = "Khu vùc bang héi chung",
		["596"] = "Khu vùc bang héi chung",
		["597"] = "Khu vùc bang héi chung",
	};

function judgeoffline(player_count, offline_count)
		
	-- szHour = date("%H");
	-- nHour = tonumber(szHour);
	
	-- sparetime = GetTask(AEXP_TASKID);	
	-- if (nHour >= AEXP_INVALIDTIMEBEGIN and nHour < AEXP_INVALIDTIMEEND) then 
	-- 		Say("<#>ÄãÔÚ<color=red>"..AEXP_INVALIDTIMEBEGIN..":00<color>-<color=red>"..AEXP_INVALIDTIMEEND..":00<color>Ê±¼ä¶ÎÄÚÑ¡ÔñÀëÏßÍĞ¹Ü£¬¿ÉÒÔ¼ÌĞø°ÚÌ¯½»Ò×£¬µ«ÊÇ²»»á»ñµÃ¾­ÑéÖµ£¬²»»á×Ô¶¯ÁìÈ¡¸£Ôµ¡£Õâ¸öÊ±¼ä¶ÎÏµÍ³²»»á¿Û³ıÄãµÄÀëÏßÍĞ¹ÜÊ±¼ä£¬¶øÄãµÄ¿É½øĞĞÓÎÏ·Ê±¼äÔò»á¼ÌĞø¼ÆËã¡£", 2, "ÄãÈ·¶¨Òª½øÈëÀëÏßÍĞ¹ÜÂğ?/judgecontion", "ÔİÊ±²»ÒªÁË¡£/donothing");
	-- 		return 5
	-- else
	--     judgecontion();
	-- end 	
	judgecontion();
	
	return 0
end

function judgecontion()
	--nmapsize = getn(arraymap);
	--blnin = 0;
	--for i=1,nmapsize do
		--if(arraymap[i] == mapid) then
			--blnin = 1;
			--break;
		--end
	--end

	--Èç¹ûµ½´ïÕâÒ»²½ÄÇÃ´³É¹¦¿ªÊ¼ÀëÏßÍĞ¹Ü
	local tbSpareTime = {};
										--ÌØĞ§´ó°×¾ÔÍè	ÆÕÍ¨´ó°×¾ÔÍè	°×¾ÔÍè
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--ÌØĞ§¼¼ÄÜ´ó°×¾ÔÍè	¼¼ÄÜ´ó°×¾ÔÍè	¼¼ÄÜ°×¾ÔÍè
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local btime = 0;
	for i = 1, getn(tbAexpTask) do
		tbSpareTime[i] = {};
		tbSpareTime[i][1] = GetTask(tbAexpTask[i]);
		tbSpareTime[i][2], tbSpareTime[i][3] = getFrame2MinAndSec(tbSpareTime[i][1]);	--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
		if (tbSpareTime[i][1] >= FRAME2TIME * 60 and btime ~= 1) then
			btime = 1;
		end;
	end;
	
	
	if (btime == 1 and IsCharged() == 1) then
		local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
		local szSkillExpName = "";
		if (nSkillExpID ~= 0) then
			szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
		else
			szSkillExpName = "<color=blue>Ch­a chän kü n¨ng<color>";
		end
		
		local szmsg = format("Thêi gian ñy th¸c rêi m¹ng cßn: Thiªn tinh b¹ch c©u hoµn <color=red>%d<color>tiÕng <color=red>%d<color> phót"..
	"<enter>§¹i B¹ch CÇu Hoµn §Æc BiÖt<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>§¹i B¹ch CÇu Hoµn ñy th¸c<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>B¹ch CÇu Hoµn ñy th¸c<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>§é thuÇn thôc kü n¨ng(%s): §ai B¹ch CÇu Hoµn kü n¨ng ®Æc hiÖu<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>§¹i B¹ch CÇu Hoµn Kü N¨ng<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>Bach CÇu Hoµn Kü N¨ng<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>Khi ñy th¸c nÕu nh­ cã hiÖu qu¶ cu¶ Thiªn Tinh B¹ch CÇu Hoµn, ­u tiªn hiÖu qu¶ cña lo¹i B¹ch cÇu Hoµn nµy vµ kinh nghiÖm vµ sÏ trõ ®i thêi gian hiÖu qu¶ t­¬ng øng.", 
					tbSpareTime[1][2],tbSpareTime[1][3],
					tbSpareTime[2][2],tbSpareTime[2][3],
					tbSpareTime[3][2],tbSpareTime[3][3],
					tbSpareTime[4][2],tbSpareTime[4][3],
					szSkillExpName, tbSpareTime[5][2],tbSpareTime[5][3],
					tbSpareTime[6][2],tbSpareTime[6][3],
					tbSpareTime[7][2],tbSpareTime[7][3]);
		local szSay =
		{	"B¾t ®Çu rêi m¹ng vÉn t¨ng kinh nghiÖm/beginoffline",
			"Chän kü n¨ng rêi m¹ng vÉn t¨ng kinh nghiÖm/#selectofflineskill('judgecontion')",
			"B¾t ®Çu ñy th¸c trªn m¹ng/begin_onlinecommission",
			"Dõng ñy th¸c trªn m¹ng/end_onlinecommission",
			"Rêi m¹ng nhËn th­ëng/offlineaward",
			"§Ó ta suy nghÜ l¹i/donothing"
		};
		Describe(szmsg, getn(szSay), szSay[1], szSay[2], szSay[3], szSay[4], szSay[5], szSay[6]);
	else
		if (IsCharged() ~= 1) then
			Talk(1, "", "<#>V× ng­¬i kh«ng ph¶i lµ tµi kho¶n n¹p thÎ, cho nªn kh«ng thÓ sö dông tİnh n¨ng rêi m¹ng ñy th¸c, xin h·y n¹p thÎ råi sau ®ã sö dông tİnh n¨ng nµy nhĞ.");
			return
		end;
		--beginoffline();
		--ÓÃ»§Ê£ÓàµÄÊ±¼ä
		Say("<#>Thêi gian cßn l¹i ñy th¸c kinh nghiÖm B¹ch CÇu Hoµn cña b¹n lµ<color=red>0<color>phót. Ng­¬i cã thÓ sö dông §¹i B¹ch CÇu Hoµn §Æc BiÖt hoÆc lµ §¹i B¹ch CÇu Hoµn ®Ó t¨ng thêi gian ñy th¸c cña m×nh. <enter>hoÆc lµ chän<color=yellow> ñy th¸c rêi m¹ng miÔn phİ<color>, c¸i nµy chØ cã thÓ nhËn ®­îc mét chót İt kinh nghiÖm.",
			3,
			"ñy th¸c miÔn phİ/beginoffline",
			"Rêi m¹ng nhËn th­ëng/offlineaward",
			"§Ó ta suy nghÜ l¹i/donothing");
	end
end

-- ¿ªÊ¼ÔÚÏßÍĞ¹Ü
function begin_onlinecommission()
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	
	--ÅĞ¶ÏÓÃ»§Ê£ÓàµÄÊ±¼ä
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<#>Thêi gian ñy th¸c kinh nghiÖm cña ng­¬i cßn l¹i lµ 0 phót, hoÆc ch­a lùa chän rêi m¹ng ñy th¸c kü n¨ng, xin h·y x¸c nhËn l¹i råi sö dông tİnh n¨ng nµy nhĞ.", 0);
		return 3
	end

	if (GetOnlineCommissionStatus() ~= 0) then
		Msg2Player("<#>HiÖn t¹i ng­¬i ®· ñy th¸c trªn m¹ng råi")
	else
		Msg2Player("B¹n ®· trong tr¹ng th¸i ñy th¸c trªn m¹ng")
		SetOnlineCommissionStatus(1)
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tbegin_onlinecommission, last online time:%s",
						GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
		--EnableClientInput(0)
	end
end

-- ½áÊøÔÚÏßÍĞ¹Ü
function end_onlinecommission()
	if (GetOnlineCommissionStatus() == 0) then
		Msg2Player("<#>HiÖn t¹i ng­¬i kh«ng ñy th¸c trªn m¹ng")
	else
		SetOnlineCommissionStatus(0)
		--EnableClientInput(1)
		Msg2Player("<#>Ng­¬i ®· hñy ñy th¸c trªn m¹ng")
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tend_onlinecommission, last online time:%s",
							GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
	end
end

function check_if_can_offline()
	
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		Talk(1, "", "Xin ®¹i hiÖp l­îng thø kh«ng thÓ sö dông t×nh n¨ng ñy th¸c t¹i server c«ng céng")
		return 1
	end
	--Ê×ÏÈÅĞ¶ÏÓÃ»§ËùÔÚµÄÇøÓò
	mapid = SubWorldIdx2MapCopy(SubWorld);
	strmapid = ""..mapid.."";
	--Ã»ÓĞÔÚµ±Ç°µØÍ¼ÉÏ
	if (arraymap[strmapid] == nil) then
		Say("<#>Ng­¬i kh«ng thÓ thùc hiÖn tİnh n¨ng ñy th¸c t¹i khu vùc nµy, xin h·y ®Õn mét khu vùc t­¬ng øng ( bao gåm tÊt c¶ c¸c thµnh thŞ th«n trÊn ) thùc hiÖn ñy th¸c rêi m¹ng.", 0);
		return 1
	end
	
	-- ÅĞ¶ÏÊÇ·ñÔÚÄ³Ğ©ÏŞÖÆÇøÓò£¬±ÈÈçËµ³µ·ò¡¢ÌìÍõ°ïµÈ
	if offlineCheckPermitRegion()~=1 then
		Say("<#>§Ó ®õng lµm c¶n trë nh÷ng b­íc ®­êng giang hå hµnh hiÖp cña c¸c anh hïng hµo kiÖt, tèt nhÊt ng­¬i nªn tr¸nh xa nh÷ng n¬i nh­ <color=yellow> Xa Phu, D­îc §iÕm,TiÖm T¹p Hãa hoÆc lµ nh÷ng con ®­êng nhá <color> ®Ó mµ rêi m¹ng ñy th¸c nhĞ!", 0);
		return 1;
	end;
	
	--ÅĞ¶ÏÓÃ»§µÄÕ½¶·×´Ì¬
	if (GetFightState() ~= 0) then 
		Say("<#>HiÖn t¹i ng­¬i ®ang trong tr¹ng th¸i chiÕn ®Êu, kh«ng thÓ ®i vµo tr¹ng th¸i rêi m¹ng ñy th¸c ®­îc, xin h·y trë l¹i tr¹ng th¸i phi chiÕn ®Êu sau ®ã h·y tiÕn hµnh rêi m¹ng ñy th¸c nhĞ.", 0);
		return 2
	end
	
	--ÅĞ¶ÏÓÃ»§Ê£ÓàµÄÊ±¼ä
--	local sparetime = getsparetime();
--	if (sparetime <= 0) then
--		Say("<#>ÄãÊ£ÓàµÄÀëÏßÍĞ¹Ü¾­ÑéÊ±¼äÎª0·ÖÖÓ£¬»òÕß²¢Î´Ñ¡ÔñÀëÏßÍĞ¹ÜµÄ¼¼ÄÜ£¬ÇëÖØĞÂÈ·ÈÏºóÔÙÊ¹ÓÃ¸Ã¹¦ÄÜ¡£", 0);
--		return 3
--	end
	
	-- µ±Ò»Ì¨·şÎñÆ÷µÄÈËÊı³¬¹ı800ÈË£¬Ôò²»ÔÊĞíÍæ¼ÒÔÚÕâÌ¨·şÎñÆ÷ÄÚ½øĞĞÀëÏßÍĞ¹Ü
	player_count = GetPlayerCount();
	local nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_LIMIT;
	if (mapid >= 835 and mapid <= 840) then
		nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_SPECIAL;--750
	end;
	if (player_count > nmax_count_limit) then
		Say("<#>HiÖn t¹i chç nµy ng­êi thËt lµ ®«ng ®óc, hay lµ ng­¬i ®Õn chç kh¸c nh­ c¸c th«n trÊn hay c¸c m«n ph¸i råi tiÕn hµnh ñy th¸c nhĞ.",0);
		return 4
	end
	
	
end

function beginoffline()	
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	-- ÅĞ¶ÏÊÇ·ñÔÚÔÚÏßÍĞ¹Ü
	if (GetOnlineCommissionStatus() ~= 0) then
		Say("<#>Xin h·y t¹m ng­ng ñy th¸c trªn m¹ng råi sau ®ã tiÕn hµnh ñy th¸c rêi m¹ng.", 0)
		return 1
	end
	-- ¿ªÊ¼ÀëÏß¹Ò»ú
	OfflineLive(PlayerIndex);
end

--Ê²Ã´¶¼²»×öµÄº¯Êı£¬¿ÉÄÜ¶à¸öµØ·½µ÷ÓÃµ½£¬ĞŞ¸ÄµÃÊ±ºòÇë×¢Òâ
function donothing()
	
end

TASKID_OFFLINELIVE_EXP = {
	AEXP_SMALL_TIME_TASKID,
	AEXP_TASKID,
	AEXP_SPECIAL_TIME_TASKID,
	AEXP_TIANXING_TIME_TASKID
}

TASKID_OFFLINELIVE_SKILL = {
	AEXP_SMALL_SKILL_TASKID,
	AEXP_SKILL_TIME_TASKID,
	AEXP_SPECIAL_SKILL_TASKID
}

function getsparetime()
	--ÅĞ¶ÏÓÃ»§Ê£ÓàµÄÊ±¼ä
	local nLeftTime = 0
	for i = 1, getn(TASKID_OFFLINELIVE_EXP) do
		nLeftTime = nLeftTime + GetTask(TASKID_OFFLINELIVE_EXP[i])
	end
	if (GetTask(AEXP_SKILL_ID_TASKID) ~= 0) then
		local nTime = 0
		for i = 1, getn(TASKID_OFFLINELIVE_SKILL) do
			nTime = nTime + GetTask(TASKID_OFFLINELIVE_SKILL[i])
		end
		if (nLeftTime < nTime) then
			nLeftTime = nTime
		end
	end
	return nLeftTime
end

-- Ñ¡ÔñÀëÏßÍĞ¹Ü¼¼ÄÜ
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "Xin lùa chän chøc n¨ng ñy th¸c:";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Trë l¹i/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- ÉèÖÃÀëÏßÍĞ¹Ü¼¼ÄÜ
function onSetUpgradeSkill(nUpgradeSkillID)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	judgecontion();
end

function offlineaward()
	local player = Player:New(PlayerIndex)
	DynamicExecute(
		"\\script\\global\\offlineaward.lua",
		"dlg_offlineaward",
		player)
end
